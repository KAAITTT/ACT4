function SWEP:GetRecoilAmount()
    local rec = self.Recoil

    rec = rec * GetConVar("act3_mult_recoil"):GetFloat()

    if self.State == ACT3_STATE_INHIPFIRE then
        rec = rec * 0.75
    end

    if self.InBipod then
        rec = rec * 0.25
    end

    if self.LastShotBullet then
        local bullet = ACT3_GetBullet(self.LastShotBullet)

        rec = rec * (bullet.RecoilMult or 1)
    end

    return rec
end

function SWEP:AdvanceBullets()
    if self.Owner:IsNPC() then return end
    if game.SinglePlayer() then self:CallOnClient( "CycleRound" ) end
    if !IsFirstTimePredicted() then return end
    self:CycleRound()
end

function SWEP:SyncChamberedRound()
    if SERVER then
        net.Start("ACT3_SyncChamberedRound")
        net.WriteUInt(self.ChamberedRound or 0, 32)
        net.WriteEntity(self)
        net.Send(self.Owner)
    end
end

function SWEP:CycleRound()
    if self.Magazine then
        local infinite = GetConVar("act3_mags_infinite_bottomless"):GetBool() or self.InfiniteAmmo or self.UsedByNPC

        local lastbullet = nil

        lastbullet = table.remove(self.Magazine.Rounds, 1)

        if !self.OpenBolt then
            self.ChamberedRound = lastbullet
        end

        if infinite then
            table.insert(self.Magazine.Rounds, lastbullet)
        end
    else
        self.ChamberedRound = nil
    end

    if self:RealClip1() <= 0 and self.MagazineDisintegrates then
        self:Unload()
    end

    if self.BulletAffectsBodygroups and CLIENT then
        if self.BulletAffectsBodygroups[self:RealClip1()] or self:RealClip1() == 0 then
            self:RebuildModels()
        end
    end
end

function SWEP:GetDispersion()
    if self.State == ACT3_STATE_INSIGHTS and !self.DispersionInSights then
        return 0
    end

    if self.UBGL_Enabled then
        return 0
    end

    local disp = Lerp( self.Heat / 100, self.HipfirePenalty, self.MaxHeatHipfirePenalty )

    local speed = math.Clamp( self.Owner:GetVelocity():Length(), 0, 300 )

    disp = disp + Lerp( speed / 300, 0, self.MaxMovePenalty )

    if self.InBipod then
        disp = 0
    end

    if self.Owner:IsNPC() then
        disp = math.Rand(self.HipfirePenalty, self.MaxHeatHipfirePenalty)

        if self.Owner:GetTarget() and self.Owner:GetTarget():IsPlayer() then
            disp = disp / (1 / (self.Owner:GetCurrentWeaponProficiency() + 1))
        end

        disp = disp * GetConVar("act3_mult_npcdispersion"):GetFloat()
    else
        disp = disp * GetConVar("act3_mult_dispersion"):GetFloat()
    end

    if self:HasHipfireHelper() then
        disp = disp * 0.5
    end

    return disp
end

function SWEP:FiringRecoil()
    if game.SinglePlayer() then self:CallOnClient( "FiringRecoil" ) end

    self.Heat = math.Clamp(self.Heat + self.HeatAccumulation, 0, 100)

    if self.ManualAction then
        self:SetTimer(self.ManualActionDelay, function() self.NextRealFire = CurTime() + self.ShootingDelay - self.ManualActionDelay end)
    else
        self.NextRealFire = CurTime() + self.ShootingDelay
    end

    local rec = self:GetRecoilAmount() / 2
    local ycomp = math.cos(math.rad(self.RecoilAngles)) * rec
    local xcomp = math.sin(math.rad(self.RecoilAngles)) * rec

    local rxc = math.Rand(-xcomp, xcomp)

    if !(IsFirstTimePredicted() or game.SinglePlayer()) then return end

    if self.State == ACT3_STATE_INHIPFIRE then
        rxc = -rxc
    end

    if CLIENT or game.SinglePlayer() then
        self.RemainingRecoil = self:GetRecoilAmount()
        self.RecoilDir = math.Rand(-self.RecoilAngles, self.RecoilAngles) + 90

        local xcomp_roll = math.sin(math.rad(self.RecoilDir)) * math.Rand(-self.RollBlowbackAmount, self.RollBlowbackAmount)

        self.Blowback = math.Clamp(self.Blowback + self.BlowbackAmount, 0, self.BlowbackMax)
        self.RollBlowback = math.Clamp(self.RollBlowback + xcomp_roll, -self.RollBlowbackMax, self.RollBlowbackMax)

        if self.Magazine then
            if self.OpenBolt and #self.Magazine.Rounds == 1 then
                self.BoltLockedBack = true
            elseif !self.OpenBolt and #self.Magazine.Rounds == 0 then
                self.BoltLockedBack = true
            end
        else
            self.BoltLockedBack = true
        end
    end

    if IsValid(self.Owner) then
        self.Owner:ViewPunch( Angle(ycomp, rxc, 0) )
    end
end

function SWEP:UpdateLastBullet()
    if self.Owner:IsNPC() then
        self.LastShotBullet = ACT3_GetBulletID(self.DefaultLoad)
        return
    end

    if game.SinglePlayer() then self:CallOnClient( "UpdateLastBullet" ) end

    local bulletid = nil

    if self.OpenBolt then
        if self.Magazine then
            bulletid = self.Magazine.Rounds[1]
        end
    else
        bulletid = self.ChamberedRound
    end

    self.LastShotBullet = bulletid
end

function SWEP:FiringEffects()
    if !IsFirstTimePredicted() then return end

    local fx = EffectData()

    fx:SetEntity(self)
    util.Effect(self.MuzzleEffect, fx)
end

function SWEP:ShellEject(effect)
    if !IsFirstTimePredicted() then return end
    if self.ShellCatcher then return end

    local fx = EffectData()
    fx:SetEntity(self)
    fx:SetMagnitude(150)
    util.Effect(effect, fx)
end

local airattackents = {
    ["npc_helicopter"] = true,
    ["npc_combinegunship"] = true
}

function SWEP:PrimaryAttack()
    if !self.Owner:IsNPC() and self.Owner:KeyDown(IN_USE) then
        self:QuickMeleeAttack()
    end
    if self.Owner and self.Owner:IsNPC() then
        self:NPC_PrimaryAttack()
        return
    end
    if !self:SanityCheck() then return end
    if self:GetNextPrimaryFire() > CurTime() then return end
    if !self.CanShootStates[self.State] then return end
    if self.TriggerDown then return end
    if self.StartEnterHipfireTime + self.AimTime > CurTime() then return end

    if self.UBGL_Enabled then
        self:UBGL_Shoot()
        return
    end

    if self.Safe then return end

    if self.PrimaryMelee then
        self:MeleeAttack()
        self.TriggerDown = true
        return
    end

    if self.Throwable then
        if game.SinglePlayer() then self:CallOnClient( "PrimeAttack" ) end
        self:PrimeAttack()
        self.TriggerDown = true
        return
    end

    if self.BurstLength > 0 and self.BurstCount >= self.BurstLength then return end

    self.TriggerDown = true

    -- do we have a bullet to shoot?

    local bulletid = nil

    if self.OpenBolt then
        if self.Magazine then
            bulletid = self.Magazine.Rounds[1]
        end
    else
        bulletid = self.ChamberedRound
    end

    if self.InternalWeapon then
        bulletid = self.CustomBullet
    end

    local bullet = ACT3_GetBullet(bulletid)

    if !bulletid or bullet.Calibre != self.Calibre then
        self:DryFire()
        return
    end

    for i, k in pairs(bullet.RequireFlags or {}) do
        if !self.AttachmentFlags[k] then
            self:DryFire()
            return
        end
    end

    for i, k in pairs(bullet.ExcludeFlags or {}) do
        if self.AttachmentFlags[k] then
            self:DryFire()
            return
        end
    end

    if IsFirstTimePredicted() then
        self.BurstCount = self.BurstCount + 1
    end

    if self.Automatic then
        self.TriggerDown = false
    end

    self:ShootRound(bulletid)

    self:SetNextPrimaryFire(CurTime() + self.ShootingDelay)

    if self.RunAwayBurst then
        self.RunningAway = true -- arrghhhhhh
    end
end

function SWEP:PreShootRound(bulletid)
end
function SWEP:PostShootRound(bulletid)
end

function SWEP:ShootRound(bulletid, ubgl, npcrecoilmult, burstlength)
    ubgl = ubgl or false
    npcrecoilmult = npcrecoilmult or 1
    burstlength = burstlength or 1

    self:UpdateLastBullet()

    self:PreShootRound(bulletid)

    local bullet = ACT3_GetBullet(bulletid)

    local acc = Lerp( self.Heat / 100, self.Precision, self.MaxHeatPrecision)

    acc = acc * bullet.AccuracyMult

    if bullet.Num > 1 then
        acc = acc * GetConVar("act3_mult_precision_shotgun"):GetFloat()
    else
        acc = acc * GetConVar("act3_mult_precision"):GetFloat()
    end

    local dir = self.Owner:EyeAngles()

    if !ubgl then

    if !self.Owner:IsNPC() then

        if self.SoundBoltAction then
            self:SetTimer(self.SoundBoltActionDelay, function() self:EmitSound(self.SoundBoltAction, self.SoundBoltActionVol, self.SoundBoltActionPitch, 1, CHAN_STATIC) end)
        end

        if self.RevolverEject then
            table.insert(self.RevolverShellTable, bullet.CaseEffect)
        else
            if self.ShellDelay > 0 then
                self:SetTimer(self.ShellDelay, function() self:ShellEject(bullet.CaseEffect) end)
            else
                self:ShellEject(bullet.CaseEffect)
            end
        end
    end

    if self.Owner:IsNPC() then
        if !self.Owner:GetEnemy() then return end -- nothing to shoot at

        local owner = self.Owner
        local enemy = owner:GetEnemy()
        local targetpos = nil
        targetpos = enemy:WorldSpaceCenter()

        if self.TrueScopeImage and enemy:LookupBone("ValveBiped.Bip01_Head1") then -- try for headshot
            targetpos = enemy:GetBonePosition(enemy:LookupBone("ValveBiped.Bip01_Head1"))
        end

        -- physical bullet target leading... coming soon...

        local muzzlepos = self:GetMuzzlePos()
        dir = (targetpos - muzzlepos):Angle()

        if self.DispersionInSights then
            local v = Angle(0, 1, 0)

            dir = dir + (v * (1 - (npcrecoilmult / burstlength)) * 4 * (5 - self.Owner:GetCurrentWeaponProficiency()))
        else
            dir = dir + ((AngleRand() * (5 - self.Owner:GetCurrentWeaponProficiency()) * 16) / 1000)
        end

        dir = dir + ((AngleRand() * 0.5 * self.Recoil * npcrecoilmult) / 1000)

        if bullet.Projectile then
            dir = math.DrG_ParabolicTrajectory(self:GetSrcPos(), targetpos, bullet.ProjectileForce, {maxmagnitude = math.huge, incrmagnitude = 1}):Angle()
        end
    else
        local pitch = self.SoundShootPitch * bullet.PitchMod * math.Rand(0.97, 1.03)
        local vol = self.SoundShootVol * bullet.VolMod

        local shootsound = self.SoundShoot

        if self.SoundLastShoot and self.SoundLastShoot != "" and #self.Magazine.Rounds == 0 and !self.OpenBolt then
            shootsound = self.SoundLastShoot
        elseif self.SoundLastShoot and self.SoundLastShoot != "" and #self.Magazine.Rounds == 1 then
            shootsound = self.SoundLastShoot
        end

        if self.Suppressed then
            shootsound = self.SoundShootSuppressed
        end

        self:EmitSound(shootsound, vol, pitch, 1, CHAN_WEAPON)

        self.Owner:DoAnimationEvent( self.AnimShoot )
        self:FiringRecoil()

        dir = self:GetShootAng()
    end

    self:FiringEffects()

    end

    dir = dir + (self:GetDispersion() * Angle(math.Rand(-36, 36), math.Rand(-36, 36), math.Rand(-36, 36)))

    if self.UBGL_Enabled then
        acc = self.UBGL_Precision or 0
    end

    local muzzlevelocity = self.MuzzleVelocity

    if ubgl then
        muzzlevelocity = self.UBGL_MuzzleVelocity
    end

    if !bullet.Projectile then

        local firebullet = {
            Attacker = self.Owner,
            Damage = 1,
            Force = bullet.BaseDamage / 3,
            Num = bullet.Num,
            Tracer = 1,
            TracerName = bullet.Tracer or "act3_tracer",
            AmmoType = bulletid,
            Dir = dir:Forward(),
            Spread = Vector(acc, acc, 0),
            Src = self:GetSrcPos(),
            Distance = 100000,
            Callback = function(att, tr, dmg)
                local scale = 1
                local dist = tr.Fraction * 100000
                local halfway = bullet.HalfwayDist or 25000
                local damage = 0
                local ent = tr.Entity
                local group = tr.HitGroup
                local critlevel = ACT3_HIT_NORMAL

                damage = bullet.BaseDamage * self.DamageMult * GetConVar("act3_mult_damage"):GetFloat()

                if self.Owner:IsNPC() then
                    damage = damage * GetConVar("act3_mult_npcdamage"):GetFloat()
                end

                damage = damage / ((dist / halfway) + 1)
                dmg:SetAttacker(self.Owner)
                dmg:SetInflictor(self)
                dmg:SetDamageType(bullet.DamageType)

                if GetConVar("act3_server_debug"):GetBool() then
                    print(damage)
                end

                if (bullet.DamageType == DMG_BLAST or bullet.DamageType == DMG_BLAST_SURFACE) and airattackents[tr.Entity:GetClass()] then
                    dmg:SetDamageType(DMG_AIRBOAT)
                    damage = damage * 0.25
                end

                dmg:SetDamage(damage)

                if bullet.Decal then
                    util.Decal(bullet.Decal, tr.StartPos, tr.HitPos - (tr.HitNormal * 16), self.Owner)
                end

                if bullet.IncendiaryFactor > 0 and SERVER then
                    if vFireInstalled then
                        CreateVFire(tr.Entity, tr.HitPos, tr.HitNormal, bullet.IncendiaryFactor)
                    else
                        if math.random(0, 100) < bullet.IncendiaryFactor then
                            tr.Entity:Ignite(bullet.IncendiaryFactor / 10, 4)
                        end
                    end
                end

                if ACT3.HITGROUPS_HEAD[group] then
                    scale = scale * bullet.DamageMult_Headshot
                    critlevel = ACT3_HIT_CRIT
                elseif ACT3.HITGROUPS_CHEST[group] then
                    scale = scale * bullet.DamageMult_Torso
                elseif ACT3.HITGROUPS_LIMB[group] then
                    scale = scale * bullet.DamageMult_Limbs
                end

                if ACT3.Surfaces_Materiel[tr.MatType] then
                    scale = scale * bullet.DamageMult_Materiel
                end

                dmg:ScaleDamage(scale)

                if ent then
                    if ent:IsPlayer() and ent:Armor() > 0 then
                        scale = scale * bullet.DamageMult_AP
                    end

                    if !ent:IsPlayer() and !ent:IsNPC() then
                        critlevel = ACT3_HIT_DEFLECT
                    end

                    if ent:Health() > 0 and SERVER then
                        ACT3_SendHitmarker(self.Owner, critlevel, tr.HitPos)
                    end
                end

                if !bullet.ChemicalEffect then
                    ACT3_DoPenetration(att, tr, dist, self.Owner, self, bulletid, bullet.MuzzleVelocityMult * muzzlevelocity * GetConVar("act3_bullets_velmult"):GetFloat(), nil, self.SubSonic, self.DamageMult)
                end

                if bullet.OnImpact then
                    bullet.OnImpact(att, tr, dmg)
                end
            end
        }

        if bullet.Num > 0 then
            local enablebullet = true

            if !GetConVar("act3_bullets_enable"):GetBool() then
                enablebullet = false
            end

            if bullet.AlwaysPhysicalBullet then
                enablebullet = true
            end

            if enablebullet and util.QuickTrace(self:GetSrcPos(), dir:Forward() * ((ACT3.BulletsMinDistance * GetConVar("act3_bullets_velmult"):GetFloat()) + self.MuzzleOffset.x), self.Owner).Hit then
                enablebullet = false
                firebullet.Tracer = 0
            end

            if bullet.NeverPhysicalBullet then
                enablebullet = false
                firebullet.Tracer = 1
            end

            if bullet.OnShoot then
                bullet.OnShoot(dir, self:GetSrcPos(), self)
            end

            if enablebullet then
                if SERVER then
                    for i = 1, bullet.Num do
                        dir = dir + (acc * Angle(math.Rand(-36, 36), math.Rand(-36, 36), math.Rand(-36, 36)))
                        local vel = dir:Forward() * bullet.MuzzleVelocityMult * muzzlevelocity
                        vel = vel + self.Owner:GetVelocity()
                        ACT3_ShootPBullet(self:GetSrcPos() + (dir:Forward() * ((ACT3.BulletsMinDistance * GetConVar("act3_bullets_velmult"):GetFloat()) + self.MuzzleOffset.x)), vel, self.Owner, self, bulletid, self.SubSonic, self.DamageMult)
                    end
                end
            else
                self.Owner:FireBullets(firebullet, true)
            end
        end

    else

        for i = 1, bullet.Num do
            dir = dir + (acc * Angle(math.Rand(-36, 36), math.Rand(-36, 36), math.Rand(-36, 36)))

            if SERVER then
                if self.FF_Locked then
                    self.DataForProjectiles = self.DataForProjectiles or {}
                    self.DataForProjectiles.FF_Target = self.FF_Target
                end

                local proj = ents.Create( bullet.Projectile )
                if ( !IsValid( proj ) ) then print("!!!FAILED TO CREATE PROJECTILE") return end
                proj:SetPos( self:GetSrcPos() )
                proj:SetAngles( self.Owner:EyeAngles() + bullet.ProjectileAngles )
                proj:SetOwner( self.Owner )
                proj.Weapon = self
                proj.DataForProjectiles = table.Copy(self.DataForProjectiles)
                proj:Spawn()
                local phys = proj:GetPhysicsObject()
                phys:ApplyForceCenter(dir:Forward() * bullet.ProjectileForce)
            end
        end
    end

    if !ubgl then
        self:AdvanceBullets()
    end

    self:PostShootRound(bulletid)
end

function SWEP:DryFire()
    local ct = CurTime()
    self:EmitSound(self.SoundDryfire, 75, 100, 1, CHAN_ITEM)
    self:SetNextPrimaryFire(ct + 0.25)
end