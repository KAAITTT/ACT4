local att = {}

att.PrintName = "Megaton Bolt"
att.Name = "att_bolt_megaton"
att.Slot = "bolt_heavy"
--att.Description = {"Like a 88mm cannon firing nerf darts.", "-90% Fire Rate", "+200% Muzzle Velocity", "+200% Recoil", "Kicks you around like a football"}
att.Description = {"Like a 88mm cannon firing sewing needles.", "Extremely slow and high velocity", "Uncontrollable and inaccurate", "Kicks you around like a football"}
att.DescColors = {ACT3.BulletColors.Neutral, ACT3.BulletColors.Positive, ACT3.BulletColors.Negative, Color(255, 0, 255)}
att.Icon = Material("attachments/bolt_megaton.png")


att.AttachFunc = function(wep)
    wep.ShootingDelay = wep.ShootingDelay / 0.1
    wep.Precision = wep.Precision * 2
    wep.Recoil = wep.Recoil * 3
    wep.MuzzleVelocity = wep.MuzzleVelocity * 3

    wep.SoundShootPitch = wep.SoundShootPitch * 0.8

    wep.PostShootRound = function()
        local ply = wep.Owner
        if ply:IsNPC() then return end
        local velocity = (ply:GetForward() * (-40) + ply:GetUp() * 30 + ply:GetRight() * math.random(-5,5)) * wep.Recoil
        if !ply:OnGround() then velocity = velocity / 4 end
        ply:ViewPunch(Angle(math.random(wep.Recoil * -2, wep.Recoil * 2), math.random(wep.Recoil * -2, wep.Recoil * 2), math.random(wep.Recoil * -1, wep.Recoil * 1)))
        ply:SetVelocity(velocity)
    end
end

att.DetachFunc = function(wep)
    local orig = weapons.Get(wep:GetClass())

    wep.SoundShootPitch = wep.SoundShootPitch / 0.8

    wep.ShootingDelay = wep.ShootingDelay * 0.1
    wep.Precision = wep.Precision / 2
    wep.Recoil = wep.Recoil / 3
    wep.MuzzleVelocity = wep.MuzzleVelocity / 3
    wep.PostShootRound = orig.PostShootRound
end

ACT3_LoadAttachment(att)