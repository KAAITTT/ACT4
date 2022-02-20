local att = {}

att.PrintName = "Model 29 Long Barrel"
att.Name = "m29_barrel_long"
att.Slot = "m29_barrel"
att.Description = {"+25% Precision", "+25% Muzzle Velocity", "-25% Fire Rate", "+25% Sway"}
att.Icon = Material("attachments/m29_barrel_long.png")

att.DescColors = {ACT3.BulletColors.Positive, ACT3.BulletColors.Positive, ACT3.BulletColors.Negative, ACT3.BulletColors.Negative}

att.BodygroupMods = {"m29_barrel_long"}

att.AttachFunc = function(wep)
    wep.MuzzleOffset = wep.MuzzleOffset + Vector(6, 0, 0)

    wep.Precision = wep.Precision * 0.75
    wep.MuzzleVelocity = wep.MuzzleVelocity * 1.25
    wep.ShootingDelay = wep.ShootingDelay * 1.25
    wep.Sway = wep.Sway * 1.25
end

att.DetachFunc = function(wep)
    local orig = weapons.Get(wep:GetClass())

    wep.MuzzleOffset = wep.MuzzleOffset - Vector(6, 0, 0)

    wep.Precision = wep.Precision / 0.75
    wep.MuzzleVelocity = wep.MuzzleVelocity / 1.25
    wep.ShootingDelay = wep.ShootingDelay / 1.25
    wep.Sway = wep.Sway / 1.25
end

ACT3_LoadAttachment(att)