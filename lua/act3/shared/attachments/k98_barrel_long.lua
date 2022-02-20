local att = {}

att.PrintName = "K98 Long Barrel"
att.Name = "k98_barrel_long"
att.Slot = "k98_barrel"
att.Description = {"+25% Precision", "+25% Muzzle Velocity", "-25% Fire Rate", "-25% Accuracy Recovery"}
att.Icon = Material("attachments/k98_barrel_long.png")

att.DescColors = {ACT3.BulletColors.Positive, ACT3.BulletColors.Positive, ACT3.BulletColors.Negative, ACT3.BulletColors.Negative}

att.BodygroupMods = {"k98_barrel_long"}

att.GivesSlots = {
    ["muzzle"] = {
        Type = "rifle_muzzle",
        PrintName = "Muzzle",
        Installed = nil,
        Required = false,
        Pos = Vector(33.667, -0.566, 7.789),
        Ang = Angle(0, 0, 0),
        Randomize = true,
        RandomizeChance = 15,
    }
}

att.AttachFunc = function(wep)
    wep.MuzzleOffset = wep.MuzzleOffset + Vector(9, 0, 0)
    wep.TrueIronsPos = Vector(0.639, 15.911, -9.08)
    wep.TrueIronsAng = Vector(0.607, 0.014, 0)

    wep.Precision = wep.Precision * 0.75
    wep.MuzzleVelocity = wep.MuzzleVelocity * 1.25
    wep.ShootingDelay = wep.ShootingDelay * 1.25
    wep.HeatDissipation = wep.HeatDissipation * 0.75
end

att.DetachFunc = function(wep)
    local orig = weapons.Get(wep:GetClass())
    wep.MuzzleOffset = wep.MuzzleOffset - Vector(9, 0, 0)
    wep.TrueIronsPos = orig.TrueIronsPos
    wep.TrueIronsAng = orig.TrueIronsAng

    wep.Precision = wep.Precision / 0.75
    wep.MuzzleVelocity = wep.MuzzleVelocity / 1.25
    wep.ShootingDelay = wep.ShootingDelay / 1.25
    wep.HeatDissipation = wep.HeatDissipation / 0.75
end

ACT3_LoadAttachment(att)