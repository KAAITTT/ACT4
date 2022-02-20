local att = {}

att.PrintName = "StG 44 Compact Barrel"
att.Name = "stg_barrel_compact"
att.Slot = "stg_barrel"
att.Description = {"+15% Fire Rate", "+35% Accuracy Recovery", "-45% Precision", "-35% Muzzle Velocity"}
att.DescColors = {ACT3.BulletColors.Positive, ACT3.BulletColors.Positive, ACT3.BulletColors.Negative, ACT3.BulletColors.Negative}
att.Icon = Material("attachments/stg_barrel_compact.png")

att.BodygroupMods = {"stg44_barrel_compact"}

att.AttachFunc = function(wep)
    wep.MuzzleOffset = wep.MuzzleOffset - Vector(9, 0, 0)

    wep.Precision = wep.Precision / 0.55
    wep.MuzzleVelocity = wep.MuzzleVelocity / 1.35
    wep.ShootingDelay = wep.ShootingDelay / 1.15
    wep.HeatDissipation = wep.HeatDissipation / 0.65
end

att.DetachFunc = function(wep)
    wep.MuzzleOffset = wep.MuzzleOffset + Vector(9, 0, 0)

    wep.Precision = wep.Precision * 0.55
    wep.MuzzleVelocity = wep.MuzzleVelocity * 1.35
    wep.ShootingDelay = wep.ShootingDelay * 1.15
    wep.HeatDissipation = wep.HeatDissipation * 0.65
end

ACT3_LoadAttachment(att)