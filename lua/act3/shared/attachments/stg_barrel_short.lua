local att = {}

att.PrintName = "StG 44 Short Barrel"
att.Name = "stg_barrel_short"
att.Slot = "stg_barrel"
att.Description = {"+5% Fire Rate", "+25% Accuracy Recovery", "-25% Precision", "-25% Muzzle Velocity"}
att.DescColors = {ACT3.BulletColors.Positive, ACT3.BulletColors.Positive, ACT3.BulletColors.Negative, ACT3.BulletColors.Negative}
att.Icon = Material("attachments/stg_barrel_short.png")

att.BodygroupMods = {"stg44_barrel_short"}

att.AttachFunc = function(wep)
    wep.MuzzleOffset = wep.MuzzleOffset - Vector(4, 0, 0)

    wep.Precision = wep.Precision / 0.75
    wep.MuzzleVelocity = wep.MuzzleVelocity / 1.25
    wep.ShootingDelay = wep.ShootingDelay / 1.05
    wep.HeatDissipation = wep.HeatDissipation / 0.75
end

att.DetachFunc = function(wep)
    wep.MuzzleOffset = wep.MuzzleOffset + Vector(4, 0, 0)

    wep.Precision = wep.Precision * 0.75
    wep.MuzzleVelocity = wep.MuzzleVelocity * 1.25
    wep.ShootingDelay = wep.ShootingDelay * 1.05
    wep.HeatDissipation = wep.HeatDissipation * 0.75
end

ACT3_LoadAttachment(att)