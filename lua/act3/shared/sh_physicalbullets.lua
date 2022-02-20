ACT3.PhysicalBullets = {}

local airattackents = {
    ["npc_helicopter"] = true,
    ["npc_combinegunship"] = true
}

function ACT3_BulletHit(att, tr, dmg)

end

function ACT3_ProcessPBullets()
    local gravity = GetConVar("act3_bullets_gravity"):GetFloat()

    gravity = Vector(0, 0, -gravity * FrameTime())

    for i, k in pairs(ACT3.PhysicalBullets) do
        local bullet = ACT3_GetBullet(k.bulletid)
        local vel = k.velocity:Length()
        local dir = k.velocity:GetNormalized()
        local playerowned = true
        local newpos = k.pos + (k.velocity * FrameTime())
        local vec = Vector(1, 1, 1)

        vec = vec * 128

        if k.owner then
            if !k.owner:IsPlayer() then
                playerowned = false
            end
        else
            playerowned = false
        end

        if playerowned and !k.owner:IsValid() then
            k.owner:LagCompensation(true)
        else
        end

        if !k.purelyvisual then
            local tr = util.TraceLine({
                start = k.pos,
                endpos = newpos,
                filter = k.owner,
                mask = MASK_SHOT
            })

            debugoverlay.Line(k.pos, tr.HitPos, 5, Color(255,0,0), true)

            if bit.band( util.PointContents( newpos ), CONTENTS_WATER ) == CONTENTS_WATER and !k.underwater then
                -- bullet entered water
                local wtr = util.TraceLine({
                    start = k.pos,
                    endpos = newpos,
                    mask = MASK_WATER
                })

                if wtr.Hit then
                    local fx = EffectData()
                    fx:SetOrigin(wtr.HitPos)
                    fx:SetScale(vel / 2000)
                    util.Effect("gunshotsplash", fx)

                    k.underwater = true
                end
            elseif k.underwater then
                -- bullet exited water

                local wtr = util.TraceLine({
                    start = newpos,
                    endpos = k.pos,
                    mask = MASK_WATER
                })

                if !wtr.Hit then
                    local fx = EffectData()
                    fx:SetOrigin(wtr.HitPos)
                    fx:SetScale(vel / 2000)
                    util.Effect("gunshotsplash", fx)

                    k.underwater = false
                end
            end

            if playerowned then
                k.owner:LagCompensation(false)
            end

            if tr.Hit then

                if SERVER then
                    local firebullet = {
                        Attacker = k.owner,
                        Damage = 0,
                        Force = bullet.BaseDamage / 3,
                        Num = 1,
                        Tracer = 0,
                        AmmoType = k.bulletid,
                        Dir = dir * 8,
                        Spread = Vector(0, 0, 0),
                        Src = k.pos,
                        Distance = 100000,
                        Callback = function(att, btr, dmg)
                            local wpn = wpn or weapons.GetStored(k.inflictorclass)
                            if !IsValid(wpn) or !wpn then
                                wpn = weapons.GetStored(k.inflictorclass)
                            end
                            local scale = 1
                            local dist = k.disttravelled + (btr.Fraction * 100000)
                            local halfway = bullet.HalfwayDist or 25000
                            if wpn then
                                halfway = halfway * (wpn.DistanceMult or 1)
                            end
                            local damage = 0
                            local ent = btr.Entity
                            local group = btr.HitGroup
                            local critlevel = ACT3_HIT_NORMAL

                            damage = bullet.BaseDamage * GetConVar("act3_mult_damage"):GetFloat()

                            damage = damage / ((dist / halfway) + 1)

                            if k.penleft then
                                damage = damage * (k.penleft / ACT3_GetBulletPen(k.bulletid, k.disttravelled))
                            end

                            if !IsValid(k.owner) then return end

                            if IsValid(wpn) and IsEntity(wpn) then
                                dmg:SetInflictor(wpn)
                            end

                            damage = damage * k.dmgmult

                            dmg:SetDamageType(bullet.DamageType)

                            if k.npc then
                                damage = damage * GetConVar("act3_mult_npcdamage"):GetFloat()
                            end

                            dmg:SetAttacker(k.owner)

                            if (bullet.DamageType == DMG_BLAST or bullet.DamageType == DMG_BLAST_SURFACE) and airattackents[btr.Entity:GetClass()] then
                                dmg:SetDamageType(DMG_AIRBOAT)
                                damage = damage * 0.25
                            end

                            dmg:SetDamage(damage)

                            if GetConVar("act3_server_debug"):GetBool() then
                                print(damage)
                            end

                            if bullet.Decal then
                                util.Decal(bullet.Decal, btr.StartPos, btr.HitPos - (btr.HitNormal * 16))
                            end

                            if bullet.IncendiaryFactor > 0 and SERVER then
                                if vFireInstalled then
                                    CreateVFire(btr.Entity, btr.HitPos, btr.HitNormal, bullet.IncendiaryFactor)
                                else
                                    if math.random(0, 100) < bullet.IncendiaryFactor then
                                        btr.Entity:Ignite(bullet.IncendiaryFactor / 10, 4)
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

                            if btr.Entity:IsPlayer() then
                                scale = scale * (bullet.DamageMult_Player or 1)
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
                                    ACT3_SendHitmarker(k.owner, critlevel, btr.HitPos)
                                end
                            end

                            if bullet.OnImpact then
                                bullet.OnImpact(att, tr, dmg)
                            end

                            if !bullet.ChemicalEffect then
                                ACT3_DoPenetration(att, tr, dist, k.owner, k.inflictor, k.bulletid, k.velocity:Length(), k.penleft or nil, k.subsonic, k.dmgmult)
                            end
                        end
                    }

                    if IsValid(k.owner) then
                        k.owner:FireBullets(firebullet)
                    end
                end

                if tr.HitSky and CLIENT and (bullet.TracerTail or bullet.TracerBody) then
                    k.purelyvisual = true
                    k.starttime = CurTime() - ACT3.BulletDespawnTime + 2
                else
                    table.remove(ACT3.PhysicalBullets, i)
                end

            end

        end

        local drag = -dir * vel * vel * (1 / 15000) * GetConVar("act3_bullets_dragmult"):GetFloat() * FrameTime()

        if k.underwater then
            drag = drag * bullet.WaterDrag
        else
            drag = drag * bullet.AirDrag
        end

        k.velocity = k.velocity + drag
        k.velocity = k.velocity + (gravity * bullet.DropMult)

        vel = k.velocity:Length()

        k.disttravelled = k.disttravelled + (vel * FrameTime())
        k.pos = newpos

        if k.starttime + ACT3.BulletDespawnTime <= CurTime() then
            table.remove(ACT3.PhysicalBullets, i)
        elseif math.abs(k.pos.x) > ACT3.MaxDimensions or math.abs(k.pos.y) > ACT3.MaxDimensions or math.abs(k.pos.z) > ACT3.MaxDimensions then
            table.remove(ACT3.PhysicalBullets, i)
        end
    end
end

hook.Add("Think", "ACT3_ProcessPBullets", ACT3_ProcessPBullets)

function ACT3_DrawPBullets()
    local quality = GetConVar("act3_effect_quality"):GetInt()
    for i, k in pairs(ACT3.PhysicalBullets) do
        local bullet = ACT3_GetBullet(k.bulletid)
        local vec = Vector(1, 1, 1)

        vec = vec * 128

        if !k.subsonic and !k.playedsound then
            local entsalongray = ents.FindAlongRay( k.pos, k.pos + k.velocity, -vec, vec )

            if table.HasValue(entsalongray, LocalPlayer()) then
                surface.PlaySound(ACT3.SNAPSOUNDSTABLE[math.random(#ACT3.SNAPSOUNDSTABLE)])

                k.playedsound = true
            end
        end

        if bullet.HQTracer and quality < 3 then
            continue
        end

        local startpos = k.pos
        local dir = k.velocity:GetNormalized()
        local endpos = k.pos - (dir * bullet.TracerLength)

        local width = bullet.TracerWidth
        local headsize = bullet.TracerHeadSize

        if ACT3_InNightScope and bullet.Glow then
            width = width * 3
            headsize = headsize * 3
        end

        if bullet.TracerTail then
            render.SetMaterial(bullet.TracerTail)
            render.DrawBeam(startpos, endpos, width, bullet.TracerTPoint1, bullet.TracerTPoint2, bullet.TracerColor)
        end

        if bullet.TracerBody then
            render.SetMaterial(bullet.TracerBody)
            render.DrawSprite(startpos, headsize, headsize, bullet.TracerColor)
        end
    end
end

hook.Add("PreDrawEffects", "ACT3_DrawPBullets", ACT3_DrawPBullets)

hook.Add("PostCleanupMap", "ACT3_CleanUpMap", function()
    ACT3.PhysicalBullets = {}
end)

function ACT3_ShootPBullet(pos, vel, owner, inflictor, bulletid, subsonic, vmult, dmgmult, penleft, dist)
    subsonic = subsonic or false
    local bullet = ACT3_GetBullet(bulletid)

    if (inflictor and inflictor.Subsonic) or bullet.Subsonic then
        subsonic = true
    end

    local playedsound = false

    if CLIENT and owner == LocalPlayer() then
        playedsound = true
    end

    local pbullet = {
        owner = nil, -- player
        inflictor = nil, -- weapon
        bulletid = 0, -- int
        pos = Vector(0, 0, 0), -- vector
        velocity = Vector(0, 0, 0), -- vector
        disttravelled = dist or 0, -- float
        underwater = false, -- bool
        subsonic = subsonic,
        playedsound = playedsound,
        playedsoundto = {},
        starttime = CurTime(),
        purelyvisual = false,
        npc = false,
        dmgmult = 1,
    }

    if owner then
        pbullet.npc = owner:IsNPC()
    end

    pbullet.pos = pos
    pbullet.velocity = vel * GetConVar("act3_bullets_velmult"):GetFloat() * (vmult or 1)
    pbullet.owner = owner
    pbullet.inflictor = inflictor
    if inflictor and inflictor:IsValid() then
        pbullet.inflictorclass = inflictor:GetClass()
    end
    pbullet.dmgmult = dmgmult or 1
    pbullet.bulletid = bulletid
    pbullet.penleft = penleft

    if bit.band( util.PointContents( pos ), CONTENTS_WATER ) == CONTENTS_WATER then
        pbullet.underwater = true
    end

    table.insert(ACT3.PhysicalBullets, pbullet)

    --print("shooting bullet 1 of " .. table.Count(ACT3.PhysicalBullets))

    if SERVER then
        local mv = vel:Length()
        local ang = vel:Angle()

        if owner:IsPlayer() then
            net.Start("ACT3_SendBullet")

            net.WriteVector(pos)
            net.WriteFloat(mv)
            net.WriteAngle(ang)
            net.WriteBool(subsonic)
            net.WriteUInt(bulletid, ACT3.NeededBits)
            net.WriteBool(false)

            net.SendOmit(owner)

            net.Start("ACT3_SendBullet")

            net.WriteVector(pos)
            net.WriteFloat(mv)
            net.WriteAngle(ang)
            net.WriteBool(subsonic)
            net.WriteUInt(bulletid, ACT3.NeededBits)
            net.WriteBool(true)

            net.Send(owner)
        else
            net.Start("ACT3_SendBullet")

            net.WriteVector(pos)
            net.WriteFloat(mv)
            net.WriteAngle(ang)
            net.WriteBool(subsonic)
            net.WriteUInt(bulletid, ACT3.NeededBits)
            net.WriteBool(false)

            net.Broadcast()
        end
    end
end

if CLIENT then

net.Receive("ACT3_SendBullet", function()
    local pos = net.ReadVector()
    local mv = net.ReadFloat()
    local dir = net.ReadAngle():Forward()
    local subsonic = net.ReadBool()
    local bulletid = net.ReadUInt(ACT3.NeededBits)
    local hmmm = net.ReadBool()

    if !hmmm then
        ACT3_ShootPBullet(pos, dir * mv, nil, nil, bulletid, subsonic)
    else
        ACT3_ShootPBullet(pos, dir * mv, LocalPlayer(), nil, bulletid, subsonic)
    end
end)

end