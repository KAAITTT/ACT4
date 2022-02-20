local att = {}

att.PrintName = "Light Bolt"
att.Name = "att_bolt_light"
att.Slot = "bolt_light"
att.Description = {"A lightweight bolt to increase cyclic rate.", "+20% Fire Rate", "+20% Recoil", "-20% Precision", "-10% Muzzle Velocity"}
att.DescColors = {ACT3.BulletColors.Neutral, ACT3.BulletColors.Neutral, ACT3.BulletColors.Negative, ACT3.BulletColors.Negative, ACT3.BulletColors.Negative}
att.Icon = Material("attachments/bolt_light.png")


att.AttachFunc = function(wep)
    wep.ShootingDelay = wep.ShootingDelay / 1.2
    wep.Precision = wep.Precision * 1.2
    wep.Recoil = wep.Recoil * 1.2
    wep.MuzzleVelocity = wep.MuzzleVelocity * 0.9
end

att.DetachFunc = function(wep)
    local orig = weapons.Get(wep:GetClass())

    wep.ShootingDelay = wep.ShootingDelay * 1.2
    wep.Precision = wep.Precision / 1.2
    wep.Recoil = wep.Recoil / 1.2
    wep.MuzzleVelocity = wep.MuzzleVelocity / 0.9
end

ACT3_LoadAttachment(att)