local att = {}

att.PrintName = "MP5K Fore"
att.Name = "mp5_fore_kurz"
att.Slot = "mp5_fore"
att.Description = {"+25% Fire Rate", "-25% Precision", "-25% Muzzle Velocity", "-25% Heat Dissipation"}
att.Icon = Material("attachments/mp5_fore_kurz.png")

att.DescColors = {ACT3.BulletColors.Positive, ACT3.BulletColors.Negative, ACT3.BulletColors.Negative, ACT3.BulletColors.Negative}

att.ExcludeFlags = {"bipinstalled"}
att.GivesFlags = {"nobipod"}

att.BodygroupMods = {"mp5_handguard_k", "mp5_barrel_k"}

att.GivesSlots = {
    ["muzzle"] = {
        Type = "rifle_muzzle",
        PrintName = "Muzzle",
        Installed = nil,
        Required = false,
        Scale = 1,
        Pos = Vector(11.627, 0.145, 9.409),
        Ang = Angle(0, 0, 0),
        Randomize = true,
        RandomizeChance = 15,
    }
}

att.AttachFunc = function(wep)
    wep.TrueIronsPos = Vector(-0.274, 11.35, -12.905)
    wep.TrueIronsAng = Vector(4.189, -0.315, 0)

    wep.MuzzleOffset = wep.MuzzleOffset - Vector(3, 0, 0)

    wep.Precision = wep.Precision * 1.25
    wep.HeatDissipation = wep.HeatDissipation * 0.75
    wep.ShootingDelay = wep.ShootingDelay * 0.75
    wep.MuzzleVelocity = wep.MuzzleVelocity * 0.75
end

att.DetachFunc = function(wep)
    local orig = weapons.Get(wep:GetClass())
    wep.TrueIronsPos = orig.TrueIronsPos
    wep.TrueIronsAng = orig.TrueIronsAng
    wep.MuzzleOffset = wep.MuzzleOffset + Vector(3, 0, 0)

    wep.Precision = wep.Precision / 1.25
    wep.HeatDissipation = wep.HeatDissipation / 0.75
    wep.ShootingDelay = wep.ShootingDelay / 0.75
    wep.MuzzleVelocity = wep.MuzzleVelocity / 0.75
end

ACT3_LoadAttachment(att)