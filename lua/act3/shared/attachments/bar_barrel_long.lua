local att = {}

att.PrintName = "BAR Long Barrel"
att.Name = "bar_barrel_long"
att.Slot = "bar_barrel"
att.Description = {"+25% Precision", "+25% Muzzle Velocity", "-5% Fire Rate", "-25% Accuracy Recovery"}
att.DescColors = {ACT3.BulletColors.Positive, ACT3.BulletColors.Positive, ACT3.BulletColors.Negative, ACT3.BulletColors.Negative}
att.Icon = Material("attachments/bar_barrel_long.png")

att.BodygroupMods = {"bar_barrel_long"}

att.AttachFunc = function(wep)
    wep.Precision = wep.Precision * 0.75
    wep.MuzzleVelocity = wep.MuzzleVelocity * 1.05
    wep.ShootingDelay = wep.ShootingDelay * 1.25
    wep.HeatDissipation = wep.HeatDissipation * 0.75
end

att.DetachFunc = function(wep)
    wep.Precision = wep.Precision / 0.75
    wep.MuzzleVelocity = wep.MuzzleVelocity / 1.05
    wep.ShootingDelay = wep.ShootingDelay / 1.25
    wep.HeatDissipation = wep.HeatDissipation / 0.75
end

ACT3_LoadAttachment(att)