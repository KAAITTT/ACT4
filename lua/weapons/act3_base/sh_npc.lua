-- thank you, Dragoteryx, very cool

function math.DrG_ParabolicTrajectory(start, endpos, vel, options)
  options = options or {}
  if options.maxmagnitude ~= nil and
  vel > options.maxmagnitude then vel = options.maxmagnitude end
  local g = options.gravity or physenv.GetGravity():Length()
  local vec = Vector(endpos.x - start.x, endpos.y - start.y, 0)
  local x = options._length or vec:Length()
  local y = endpos.z - start.z
  if not options.pitch then
    local res = math.sqrt(math.pow(vel, 4) - g*(g*x*x + 2*y*vel*vel))
    if res ~= res then
      if not options.incrmagnitude or
      options.incrmagnitude < 0 then
        return Vector(0, 0, 0)
      elseif options.maxmagnitude ~= nil and
      vel == options.maxmagnitude then
        return Vector(0, 0, 0)
      else
        options.gravity = g
        options._length = x
        return math.DrG_ParabolicTrajectory(start, endpos, vel + 100, options)
      end
    else
      local pitch
      local s1 = math.atan((vel*vel + res)/(g*x))
      local s2 = math.atan((vel*vel - res)/(g*x))
      if options.highest then
        pitch = s1 < s2 and s2 or s1
      else pitch = s1 > s2 and s2 or s1 end
      vec.z = math.tan(pitch)*x
      vec:Normalize()
      return vec*vel
    end
  else
    return Vector(0, 0, 0)
  end
end

function SWEP:NPC_ThrowGrenade()
    local target = self.Owner:GetEnemy()

    if !target then return end

    self:SetNextPrimaryFire( CurTime() + self.ShootingDelay + 1.5 )

    local dir = math.DrG_ParabolicTrajectory(self:GetGrenadeSrcPos(), target:WorldSpaceCenter(), self.ProjectileForce, {maxmagnitude = self.ProjectileForceMax})

    self:PreThrowGrenade()

    for i = 1, self.ProjectileNum do

        if SERVER then
            local proj = ents.Create( self.Projectile )
            if ( !IsValid( proj ) ) then print("!!!FAILED TO CREATE PROJECTILE") return end
            proj:SetPos( self:GetGrenadeSrcPos() )
            proj:SetAngles( self.Owner:EyeAngles() + self.ProjectileAngles )
            proj:SetOwner( self.Owner )
            proj.Weapon = self
            proj.DataForProjectiles = table.Copy(self.DataForProjectiles)
            proj:Spawn()
            local phys = proj:GetPhysicsObject()
            phys:ApplyForceCenter(dir)
            phys:EnableDrag(false)
            phys:SetMass(1)

            if self.ProjectileTumble then
                phys:AddAngleVelocity( Vector(0, 750, 0) )
            end
        end
    end

    self:EmitSound(self.SoundThrow, 75, 100, 1, CHAN_WEAPON)
end

function SWEP:NPC_SetupRandomAtts(rec)
    if self.ACT3_DoNotSpawnWithAtts then return end

    rec = rec or 0
    -- set ourselves up with some sweet random attachments

    local nothingtoattach = true

    for i, k in pairs(self.Attachments) do
    -- go over each attachment slot

        if (GetConVar("act3_npc_rall"):GetBool()) then
            -- crazy mode!
            -- ALWAYS randomize with 75% chance to pick something
            -- choose ANY attachment
            if k.AlreadyRandomized then continue end

            k.AlreadyRandomized = true

            if (math.random(0, 100) < (k.RandomizeChance or 75)) then
                local atts = ACT3_GetAttachmentsForSlot(k.Type)

                for _, j in pairs(k.ExtraTypes or {}) do
                    table.Add(atts, ACT3_GetAttachmentsForSlot(j))
                end

                local newatts = {}

                for _, blatt in pairs(atts) do
                    local att = ACT3_GetAttachment(blatt)

                    if !self:AttachFlagsOkay(att) then continue end

                    table.insert(newatts, blatt)
                end

                -- if there's at least one to choose from
                if table.Count(newatts) > 0 then
                    -- let's pick one, and use it!

                    local newatt = table.Random(newatts)

                    -- we've already touched this slot.
                    k.AlreadyRandomized = true

                    if self.Attachments[i] then
                        self:Attach(newatt, i, true)
                        nothingtoattach = false
                    end
                end
            end
        else
            -- normal mode
            -- if it can be randomized...
            if !k.Randomize then continue end
            if k.AlreadyRandomized then continue end
            -- will it?

            if (math.random(0, 100) < (k.RandomizeChance or 25)) then
                -- ok - now get a list of all the attachments that can go in this slot
                local atts = ACT3_GetAttachmentsForSlot(k.Type)
                for _, j in pairs(k.ExtraTypes or {}) do
                    table.Add(atts, ACT3_GetAttachmentsForSlot(j))
                end
                local newatts = {}

                -- don't choose the existing attachment...
                if k.Installed then
                    table.RemoveByValue(atts, k.Installed)
                end

                -- and don't choose any that are blacklisted
                for _, blatt in pairs(atts) do
                    local att = ACT3_GetAttachment(blatt)

                    if !self:AttachFlagsOkay(att) then continue end

                    if k.RandomizeWhitelist then
                        if table.HasValue(k.RandomizeWhitelist, blatt) then
                            table.insert(newatts, blatt)
                        end
                    else
                        if !att.RandomizeBlacklist then
                            table.insert(newatts, blatt)
                        end
                    end
                end

                -- do we have at least one attachment to choose from?
                if table.Count(newatts) > 0 then
                    -- if so - let's pick one, and use it!
                    local att = table.Random(newatts)

                    if self.Attachments[i] then
                        self:Attach(att, i, true)

                        -- we've already touched this slot.
                        k.AlreadyRandomized = true

                        nothingtoattach = false
                    end
                end
            end
        end
    end

    if !nothingtoattach then
        if rec < 5 then
            self:NPC_SetupRandomAtts(rec + 1)
        end
    end
end

function SWEP:NPC_PrimaryAttack()
    if self:GetNextPrimaryFire() > CurTime() then return false end
    if !IsValid(self.Owner:GetEnemy()) then return false end

    if self.PrimaryMelee then
        return
    end

    if self.Throwable then
        self:NPC_ThrowGrenade()
        return
    end

    if self.Safe then
        return
    end

    if self:Clip1() <= 0 and !self.InfiniteAmmo then
        self:AI_Reload()
        return
    end

    local burstcount = 1
    local delaymin, delaymax = 1, 1.5

    if self.Automatic then
        burstcount = math.random(3, 1 / self.ShootingDelay)

        if self.DispersionInSights then
            burstcount = burstcount * 3
        end
    else
        delaymin = 0.02
        delaymax = 0.05
    end

    if self.BurstLength > 1 then
        burstcount = self.BurstLength
    end


    local nextfire = CurTime() + math.Rand( (burstcount * self.ShootingDelay) + delaymin * (1 / (self.Owner:GetCurrentWeaponProficiency() + 1)), (burstcount * self.ShootingDelay) + delaymax * (1 / (self.Owner:GetCurrentWeaponProficiency() + 1)) )
    self:SetNextPrimaryFire( nextfire )

    local enemy = self.Owner:GetEnemy()

    for i = 1, burstcount do
        timer.Simple(i * self.ShootingDelay, function()

            if !IsValid(self) or !IsValid(self.Owner) or !IsValid(enemy) then
                return
            end

            if self.Owner:GetCurrentSchedule() == SCHED_RELOAD then return end

            if self:Clip1() <= 0 then
                self:AI_Reload()
                return
            end

            local bulletid = ACT3_GetBulletID(self.DefaultLoad)

            if self.Magazine then
                bulletid = self.Magazine.Rounds[1]
            end

            if self.ChamberedRound then
                bulletid = self.ChamberedRound
            end

            if !bulletid then
                bulletid = ACT3_GetBulletID(self.DefaultLoad)
            end

            self:ShootRound(bulletid, false, i, burstcount)

            local bullet = ACT3_GetBullet(bulletid)

            local pitch = self.SoundShootPitch * bullet.PitchMod * math.Rand(0.97, 1.03)
            local vol = self.SoundShootVol * bullet.VolMod

            local shootsound = self.SoundShoot

            if self.SoundLastShoot and self.SoundLastShoot != "" and self:Clip1() == 1 then
                shootsound = self.SoundLastShoot
            end

            if self.Suppressed then
                shootsound = self.SoundShootSuppressed
            end

            local anim = "gesture_shoot_ar2"
            local speed = 0.5
            local ht = self:GetHoldType()

            if ht == "pistol" then
                anim = ""

                if self.Owner:GetClass() == "metrocop" then
                    anim = "gesture_shoot_pistol"
                    speed = 1
                end
            else
                if ht == "rpg" then
                    if self.Owner:GetClass() == "npc_citizen" then
                        anim = "gesture_shoot_rpg"
                        speed = 1
                    else
                        anim = "gesture_shoot_shotgun"
                        speed = 1
                    end
                elseif self.AnimShoot == ACT_HL2MP_GESTURE_RANGE_ATTACK_RPG then
                    anim = "gesture_shoot_shotgun"
                    speed = 3
                elseif self.AnimShoot == ACT_HL2MP_GESTURE_RANGE_ATTACK_SHOTGUN then
                    anim = "gesture_shoot_shotgun"
                    speed = 1.25
                elseif self.AnimShoot == ACT_HL2MP_GESTURE_RANGE_ATTACK_CROSSBOW then
                    anim = "gesture_shoot_shotgun"
                    speed = 1
                end

                if self.Owner:GetClass() == "metrocop" then
                    anim = "gesture_shoot_smg1"
                    speed = 1
                end
            end

            if anim != "" then
                local gest = self.Owner:AddGestureSequence(self.Owner:LookupSequence(anim))
                self.Owner:SetLayerPriority(gest, 1)
                self.Owner:SetLayerPlaybackRate(gest, speed)
            end

            self:EmitSound(shootsound, vol, pitch, 1, CHAN_WEAPON)

            //self.NextRealFire = CurTime() + self.ShootingDelay

            net.Start("ACT3_SendMoveBolt", true)
            net.WriteEntity(self)
            net.SendPVS(self:GetPos())

            if self.SoundBoltAction then
                timer.Simple(self.SoundBoltActionDelay, function()
                    if !IsValid(self) or !IsValid(self.Owner) then return end

                    self:EmitSound(self.SoundBoltAction, self.SoundBoltActionVol, self.SoundBoltActionPitch, 1, CHAN_STATIC)
                end)
            end

            if self.ShellDelay > 0 then
                timer.Simple(self.ShellDelay, function()
                    if !IsValid(self) or !IsValid(self.Owner) then return end

                    self:ShellEject(bullet.CaseEffect)
                end)
            else
                self:ShellEject(bullet.CaseEffect)
            end

            if !self.InfiniteAmmo then
                self:SetClip1(self:Clip1() - 1)
            end

            self:CycleRound()

            self:FiringEffects()

        end)
    end
end

function SWEP:AI_Reload()

    if !IsValid(self) or !IsValid(self.Owner) then
        return
    end

    if self:Clip1() > 0 then return end

    if self.InfiniteAmmo then return end

    if self.CannotReload then return end

    if self.Magazine then
        local mag = ACT3_GetMagazineType(self.Magazine.Type)

        self.Primary.ClipSize = mag.MagSize
    else
        self.Primary.ClipSize = 1
    end

    local owner = self.Owner

    if owner:IsNPC() and !owner:IsCurrentSchedule(SCHED_HIDE_AND_RELOAD) and !owner:IsCurrentSchedule(SCHED_RELOAD) and (owner:GetActivity() != ACT_RELOAD) then
        owner:SetSchedule(SCHED_RELOAD)

        if self.AnimReload == ACT_HL2MP_GESTURE_RELOAD_SHOTGUN then
            self:PlaySoundTable({
                {
                    time = 0.1,
                    path = "weapons/shotgun/shotgun_reload3.wav",
                },
                {
                    time = 0.5,
                    path = "weapons/shotgun/shotgun_reload3.wav",
                },
                {
                    time = 1.45,
                    path = "weapons/shotgun/shotgun_cock.wav",
                },
            })
        elseif self.AnimReload == ACT_HL2MP_GESTURE_RELOAD_REVOLVER then
            self:PlaySoundTable({
                {
                    time = 0.1,
                    path = "weapons/357/357_reload3.wav",
                },
                {
                    time = 1.0,
                    path = "weapons/357/357_reload1.wav",
                },
            })
        else
            if self.ShotgunReload and self.InternalMag then
                local soundtable = {}

                for num = 1, 3 do
                    for i, k in pairs(self.ReloadSoundsTable) do
                        local add = false
                        if !k.time then continue end

                        v = table.Copy(k)

                        v.time = v.time + ((num - 1) * (self.AnimReloadEndTime or 0.5))

                        if k.comp != ACT3_STPART_EMPTYRACK or num == 3 then
                            add = true
                        end

                        if add then
                            table.insert(soundtable, v)
                        end
                    end
                end

                --self:KillTimer("reloadsounds")
                self:PlaySoundTable(soundtable)
            else
                self:PlaySoundTable(self.ReloadSoundsTable)
            end
        end

        self:SetClip1(self.Primary.ClipSize)
    end

    return true

end

function SWEP:OnNPC_Initialize()

end

function SWEP:NPC_Initialize()

    if CLIENT then
        net.Start("ACT3_RequestWeaponData")
        net.WriteEntity(self)
        net.SendToServer()
        return
    end

    if self.Owner:IsPlayer() then self:DoInitialize() return end

    self:InitTimers()
    self:ChangeFiremodeTo(self.CurrentFiremode)

    if self.Attachments then
        self.Attachments["BaseClass"] = nil
        self.Attachments[""] = nil
    end

    if self.GivenAttachments then

        for i, k in pairs(self.GivenAttachments) do
            self:Attach(k.Att, k.Slot, true)
        end

    else

        if self.DefaultAttachments then
            for i, k in pairs(self.DefaultAttachments) do
                if i == "BaseClass" then continue end
                self:Attach(k, i, true)
            end
        end

        if GetConVar("act3_npc_ratts"):GetBool() then
            self:NPC_SetupRandomAtts()
        end

    end

    self.FirstLoad = false

    -- set up for NPCs...

    self.UsedByNPC = true

    self:SetupHoldtype()

    self:BuildShield()

    if !self.Magazine then

        if (GetConVar("act3_npc_rmag"):GetBool()) then
            local mags = {}

            for i, mag in pairs(ACT3.MagazineTable) do
                if mag.Type == self.MagazineType then
                    table.insert(mags, i)
                end
            end

            self.Magazine = {Type = table.Random(mags), Rounds = {}}
        else
            self.Magazine = table.Copy(self.DefaultMagazine)
        end
    end

    if GetConVar("act3_npc_rbullets"):GetBool() then
        local bullets = {}

        for id, k in pairs(ACT3.BulletTable) do
            if k.Calibre == self.Calibre and !k.RandomizeBlacklist then
                table.insert(bullets, k.Name)
            end
        end

        if table.Count(bullets) > 0 then
            self.DefaultLoad = table.Random(bullets)
        end
    end

    if self.Magazine then

        local mag = ACT3_GetMagazineType(self.Magazine.Type)

        self.Primary.ClipSize = mag.MagSize

        self:SetClip1(self.Primary.ClipSize)

        if !self.ChamberedRound and !self.OpenBolt then
            self:CycleRound()
        end

        if self.Magazine then
            local magtype = ACT3_GetMagazineType(self.Magazine.Type)

            self.Magazine.Rounds = {}

            local size = magtype.MagSize

            for i = 0, size do
                if i == 0 then continue end

                self.Magazine.Rounds[i] = ACT3_GetBulletID(self.DefaultLoad)
            end

            self:CycleRound()

        end

    else
        self:SetClip1(-1)
    end

    self.NPCSetUp = true

    if GetConVar("act3_npc_rmag"):GetBool() then
        self.DefaultMagazine = table.Copy(self.Magazine)
    end

    self:RecalculateDefaultRounds()

    self:OnNPC_Initialize()

end

function SWEP:SetupHoldtype()
    local primeholdtype = self.HoldtypeNPC or self.HoldtypeSights

    if !self.Owner or !IsValid(self.Owner) or !self.Owner:IsNPC() then
        self.Owner = nil
    end

    if IsValid(self.Owner) then
        if self.Owner:GetClass() == "npc_metropolice" then
            if primeholdtype == "revolver" or primeholdtype == "pistol" or primeholdtype == "melee2" then
                self:SetHoldType( "pistol" )
            else
                self:SetHoldType( "smg" )
            end
        else
            if primeholdtype == "revolver" or primeholdtype == "pistol" then
                if self.Owner:GetClass() == "npc_combine_s" then
                    self:SetHoldType( "smg" )
                else
                    self:SetHoldType( "pistol" )
                end
            elseif primeholdtype == "rpg" then
                self:SetHoldType( "rpg" )
            elseif primeholdtype == "shotgun" or self.AnimReload == ACT_HL2MP_GESTURE_RELOAD_SHOTGUN then
                self:SetHoldType( "shotgun" )
            elseif primeholdtype == "smg" then
                self:SetHoldType( "smg" )
            else
                self:SetHoldType( "ar2" )
            end

            if self.HoldtypeNPC then
                self:SetHoldType(self.HoldtypeNPC)
            end
        end
    end
end

function SWEP:OwnerChanged()

    self:SetupHoldtype()

    if !self.Owner:IsPlayer() then return end

    if self.UsedByNPC then
        self.UsedByNPC = false
    end

    if SERVER then

        if self.ChamberedRound then
            net.Start("ACT3_SyncChamberedRound")
            net.WriteUInt(self.ChamberedRound, 32)
            net.WriteEntity(self)
            net.Send(self.Owner)
        end

        ACT3_SendMagazine(self.Owner, self.Magazine, 0, self)
        ACT3_SendDefaultMagazine(self.Owner, self.DefaultMagazine, self)

    else

        for i, k in pairs(self.Attachments) do
            if k.ProcGenAtt then
                self.Attachments[i] = nil
            end
        end

        net.Start("ACT3_RequestWeaponData")
        net.WriteEntity(self)
        net.SendToServer()

    end
end

function SWEP:OnDrop(eternal)
    eternal = eternal or false
    if self.UsedByNPC then
        self.UsedByNPC = false

        if !self.NPCSetUp then
            self:Remove()
            return
        end

        ACT3_UpdateWeaponData(self, nil, true)

        if eternal then return end

        timer.Simple(GetConVar("act3_weapon_time"):GetFloat(), function()
            if self:IsValid() and !self.Owner:IsValid() then
                self:Remove()
            end
        end)
    end
end

function SWEP:GetCapabilities()

    return bit.bor( CAP_WEAPON_RANGE_ATTACK1, CAP_TURN_HEAD, CAP_DUCK, CAP_AIM_GUN, CAP_USE, CAP_AUTO_DOORS, CAP_OPEN_DOORS, CAP_USE_SHOT_REGULATOR, CAP_USE_WEAPONS )

end

function SWEP:CanBePickedUpByNPCs()
    return !self.NPCUnusable
end