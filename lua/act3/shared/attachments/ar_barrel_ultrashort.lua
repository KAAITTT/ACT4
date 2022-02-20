local att = {}

att.PrintName = "AR Commando Barrel"
att.Name = "ar_barrel_ultrashort"
att.Slot = "ar_barrel"
att.Description = {"+35% Fire Rate", "+35% Accuracy Recovery", "-45% Precision", "-35% Muzzle Velocity"}
att.Icon = Material("attachments/ar_barrel_ultrashort.png")
att.DescColors = {ACT3.BulletColors.Positive, ACT3.BulletColors.Positive, ACT3.BulletColors.Negative, ACT3.BulletColors.Negative}

att.GivesSlots = {
    ["muzzle"] = {
        Type = "rifle_muzzle",
        PrintName = "Muzzle",
        Installed = nil,
        Required = false,
        Scale = 1,
        Pos = Vector(12.359, 0, 7.706),
        Ang = Angle(0, 0, 0)
    }
}

att.BodygroupMods = {"ar_barrel_ultrashort"}
att.RequiredFlags = {"shorthandguard"}
att.GivesFlags = {"shortbarrel"}

att.AttachFunc = function(wep)
    wep.MuzzleOffset = Vector(23.283, 0.603, -6.363)
    wep.TrueIronsPos = Vector(-0.049, 18.132, -11.818)
    wep.TrueIronsAng = Vector(2.371, -0.191, 0)

    wep.Precision = wep.Precision / 0.55
    wep.MuzzleVelocity = wep.MuzzleVelocity / 1.35
    wep.ShootingDelay = wep.ShootingDelay / 1.35
    wep.HeatDissipation = wep.HeatDissipation / 0.65
end

att.DetachFunc = function(wep)
    local orig = weapons.Get(wep:GetClass())
    wep.MuzzleOffset = orig.MuzzleOffset
    wep.TrueIronsPos = orig.TrueIronsPos
    wep.TrueIronsAng = orig.TrueIronsAng

    wep.Precision = wep.Precision * 0.55
    wep.MuzzleVelocity = wep.MuzzleVelocity * 1.35
    wep.ShootingDelay = wep.ShootingDelay * 1.35
    wep.HeatDissipation = wep.HeatDissipation * 0.65
end

ACT3_LoadAttachment(att)