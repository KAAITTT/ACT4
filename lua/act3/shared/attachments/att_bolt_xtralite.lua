local att = {}

att.PrintName = "Xtra-Lite Bolt"
att.Name = "att_bolt_xtralite"
att.Slot = "bolt_light"
--att.Description = {"This thing's made of feathers!", "+80% Fire Rate", "+50% Recoil", "-50% Precision", "Will probably fly out of your hands"}
att.Description = {"Like a nest of very, very angry wasps.", "Ridiculously fast firing", "Uncontrollable and inaccurate", "Will probably fly out of your hands"}
att.DescColors = {ACT3.BulletColors.Neutral, ACT3.BulletColors.Positive, ACT3.BulletColors.Negative, Color(255, 0, 255)}
att.Icon = Material("attachments/bolt_xtralite.png")


att.AttachFunc = function(wep)
    wep.ShootingDelay = wep.ShootingDelay / 2
    wep.Precision = wep.Precision * 1.5
    wep.Recoil = wep.Recoil * 1.5

    wep.SoundShootPitch = wep.SoundShootPitch * 1.8

    wep.PostShootRound = function()
        if math.random() <= math.max(wep.ShootingDelay * wep.Heat / 100, 0.025) then
            timer.Simple(0, function()
                local ply = wep.Owner
                if ply:IsNPC() then return end
                -- NEXT UPDATE. NPC WEAPON DROP. GET HYPED.
                local velocity = ply:GetForward() * math.random(-600, -300) + ply:GetUp() * math.random(400, 600) + ply:GetRight() * math.random(-150, 150)
                wep.Owner:DropWeapon(wep) -- ZOOM
                wep:GetPhysicsObject():SetVelocity(velocity)
                ply:EmitSound("npc/zombie/claw_miss2.wav")
                ply:ViewPunch(Angle(20, 20, math.random(-20, 20)))
            end)
        end
    end
end

att.DetachFunc = function(wep)
    local orig = weapons.Get(wep:GetClass())

    wep.SoundShootPitch = wep.SoundShootPitch / 1.8

    wep.ShootingDelay = wep.ShootingDelay * 2
    wep.Precision = wep.Precision / 1.5
    wep.Recoil = wep.Recoil / 1.5
    wep.PostShootRound = orig.PostShootRound
end



ACT3_LoadAttachment(att)