local att = {}

att.PrintName = "M1919 \"Stinger\" Barrel"
att.Name = "m1919_barrel_stinger"
att.Slot = "m1919_barrel"
att.Description = {"+25% Fire Rate", "+25% Accuracy Recovery", "-25% Precision", "-25% Muzzle Velocity"}
att.DescColors = {ACT3.BulletColors.Positive, ACT3.BulletColors.Positive, ACT3.BulletColors.Negative, ACT3.BulletColors.Negative}
att.Icon = Material("attachments/m1919_barrel_stinger.png")

att.BodygroupMods = {"m1919_barrel_stinger"}

att.AttachFunc = function(wep)
    wep.MuzzleOffset = wep.MuzzleOffset - Vector(8, 0, 0)

    wep.Precision = wep.Precision / 0.75
    wep.MuzzleVelocity = wep.MuzzleVelocity / 1.25
    wep.ShootingDelay = wep.ShootingDelay / 1.25
    wep.HeatDissipation = wep.HeatDissipation / 0.75
end

att.DetachFunc = function(wep)
    wep.MuzzleOffset = wep.MuzzleOffset + Vector(8, 0, 0)

    wep.Precision = wep.Precision * 0.75
    wep.MuzzleVelocity = wep.MuzzleVelocity * 1.25
    wep.ShootingDelay = wep.ShootingDelay * 1.25
    wep.HeatDissipation = wep.HeatDissipation * 0.75
end

ACT3_LoadAttachment(att)