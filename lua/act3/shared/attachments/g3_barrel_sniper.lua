local att = {}

att.PrintName = "G3 Sniper Barrel"
att.Name = "g3_barrel_sniper"
att.Slot = "g3_barrel"
att.Description = {"+25% Precision", "+25% Muzzle Velocity", "-25% Fire Rate", "-25% Accuracy Recovery"}
att.Icon = Material("attachments/g3_barrel_sniper.png")

att.DescColors = {ACT3.BulletColors.Positive, ACT3.BulletColors.Positive, ACT3.BulletColors.Negative, ACT3.BulletColors.Negative}

att.BodygroupMods = {"g3_barrel_sniper"}

att.GivesSlots = {
    ["muzzle"] = {
        Type = "rifle_muzzle",
        PrintName = "Muzzle",
        Installed = nil,
        Required = false,
        Scale = 1,
        Pos = Vector(26.232, 0, 8.496),
        Ang = Angle(0, 0, 0)
    }
}

att.AttachFunc = function(wep)
    wep.MuzzleOffset = wep.MuzzleOffset + Vector(10, 0, 0)

    wep.Precision = wep.Precision * 0.75
    wep.MuzzleVelocity = wep.MuzzleVelocity * 1.25
    wep.ShootingDelay = wep.ShootingDelay * 1.25
    wep.HeatDissipation = wep.HeatDissipation * 0.75
end

att.DetachFunc = function(wep)
    wep.MuzzleOffset = wep.MuzzleOffset - Vector(10, 0, 0)

    wep.Precision = wep.Precision / 0.75
    wep.MuzzleVelocity = wep.MuzzleVelocity / 1.25
    wep.ShootingDelay = wep.ShootingDelay / 1.25
    wep.HeatDissipation = wep.HeatDissipation / 0.75
end

ACT3_LoadAttachment(att)