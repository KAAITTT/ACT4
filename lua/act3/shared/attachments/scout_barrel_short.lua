local att = {}

att.PrintName = "Scout Short Barrel"
att.Name = "scout_barrel_short"
att.Slot = "scout_barrel"
att.Description = {"+5% Fire Rate", "+20% Recoil", "-25% Precision", "-25% Muzzle Velocity"}
att.DescColors = {ACT3.BulletColors.Positive, ACT3.BulletColors.Negative, ACT3.BulletColors.Negative, ACT3.BulletColors.Negative}
att.Icon = Material("attachments/scout_barrel_short.png")

att.BodygroupMods = {"scout_barrel_short"}

att.GivesSlots = {
    ["muzzle"] = {
        Pos = Vector(29.575, 0, 4.026),
        Ang = Angle(0, 0, 0),
        Type = "rifle_muzzle",
        PrintName = "Muzzle",
        Installed = nil,
        Required = false,
        Scale = 1,
    }
}

att.AttachFunc = function(wep)
    wep.MuzzleOffset = wep.MuzzleOffset - Vector(7, 0, 0)

    wep.Precision = wep.Precision / 0.75
    wep.MuzzleVelocity = wep.MuzzleVelocity / 1.25
    wep.ShootingDelay = wep.ShootingDelay / 1.05
    wep.Recoil = wep.Recoil * 1.2
end

att.DetachFunc = function(wep)
    wep.MuzzleOffset = wep.MuzzleOffset + Vector(7, 0, 0)

    wep.Precision = wep.Precision * 0.75
    wep.MuzzleVelocity = wep.MuzzleVelocity * 1.25
    wep.ShootingDelay = wep.ShootingDelay * 1.05
    wep.Recoil = wep.Recoil / 1.2
end

ACT3_LoadAttachment(att)