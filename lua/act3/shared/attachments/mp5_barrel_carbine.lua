local att = {}

att.PrintName = "HK94 Carbine Barrel"
att.Name = "mp5_barrel_carbine"
att.Slot = "mp5_barrel"
att.Description = {"+25% Precision", "+25% Muzzle Velocity", "-25% Fire Rate", "-25% Accuracy Recovery"}
att.Icon = Material("attachments/mp5_barrel_carbine.png")

att.DescColors = {ACT3.BulletColors.Positive, ACT3.BulletColors.Positive, ACT3.BulletColors.Negative, ACT3.BulletColors.Negative}

att.BodygroupMods = {"mp5_barrel_carbine"}

att.GivesSlots = {
    ["muzzle"] = {
        Type = "rifle_muzzle",
        PrintName = "Muzzle",
        Installed = nil,
        Required = false,
        Scale = 1,
        Pos = Vector(23.627, 0.145, 9.409),
        Ang = Angle(0, 0, 0),
        Randomize = true,
        RandomizeChance = 15,
    }
}

att.AttachFunc = function(wep)
    wep.MuzzleOffset = wep.MuzzleOffset + Vector(9, 0, 0)

    wep.Precision = wep.Precision * 0.75
    wep.MuzzleVelocity = wep.MuzzleVelocity * 1.25
    wep.ShootingDelay = wep.ShootingDelay * 1.25
    wep.HeatDissipation = wep.HeatDissipation * 0.75
end

att.DetachFunc = function(wep)
    local orig = weapons.Get(wep:GetClass())
    wep.MuzzleOffset = orig.MuzzleOffset

    wep.Precision = wep.Precision / 0.75
    wep.MuzzleVelocity = wep.MuzzleVelocity / 1.25
    wep.ShootingDelay = wep.ShootingDelay / 1.25
    wep.HeatDissipation = wep.HeatDissipation / 0.75
end

ACT3_LoadAttachment(att)