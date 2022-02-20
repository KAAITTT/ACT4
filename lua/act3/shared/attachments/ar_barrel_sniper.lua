local att = {}

att.PrintName = "AR Sniper Barrel"
att.Name = "ar_barrel_sniper"
att.Slot = "ar_barrel"
att.Description = {"+25% Precision", "+25% Muzzle Velocity", "-15% Fire Rate", "-25% Accuracy Recovery"}
att.Icon = Material("attachments/ar_barrel_sniper.png")
att.DescColors = {ACT3.BulletColors.Positive, ACT3.BulletColors.Positive, ACT3.BulletColors.Negative, ACT3.BulletColors.Negative}

att.GivesSlots = {
    ["muzzle"] = {
        Type = "rifle_muzzle",
        PrintName = "Muzzle",
        Installed = nil,
        Required = false,
        Scale = 1,
        Pos = Vector(27.443, 0, 7.706),
        Ang = Angle(0, 0, 0)
    }
}

att.BodygroupMods = {"ar_barrel_sniper"}

att.AttachFunc = function(wep)
    wep.MuzzleOffset = Vector(37.695, 0.603, -8.53)
    wep.TrueIronsPos = Vector(-0.009, 15.887, -11.528)
    wep.TrueIronsAng = Vector(1.506, -0.076, -0.63)

    wep.Precision = wep.Precision * 0.75
    wep.MuzzleVelocity = wep.MuzzleVelocity * 1.25
    wep.ShootingDelay = wep.ShootingDelay * 1.15
    wep.HeatDissipation = wep.HeatDissipation * 0.75
end

att.DetachFunc = function(wep)
    local orig = weapons.Get(wep:GetClass())
    wep.MuzzleOffset = orig.MuzzleOffset
    wep.TrueIronsPos = orig.TrueIronsPos
    wep.TrueIronsAng = orig.TrueIronsAng

    wep.Precision = wep.Precision / 0.75
    wep.MuzzleVelocity = wep.MuzzleVelocity / 1.25
    wep.ShootingDelay = wep.ShootingDelay / 1.15
    wep.HeatDissipation = wep.HeatDissipation / 0.75
end

ACT3_LoadAttachment(att)