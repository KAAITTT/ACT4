local att = {}

att.PrintName = "K98K Obrez Conversion"
att.Name = "k98_stock_obrez"
att.Slot = "k98_stock"
att.Description = {"+35% Fire Rate", "+150% Recoil", "+100% Sway", "-60% Precision"}
att.Icon = Material("attachments/k98_stock_obrez.png")

att.DescColors = {ACT3.BulletColors.Positive, ACT3.BulletColors.Negative, ACT3.BulletColors.Negative, ACT3.BulletColors.Negative}

att.BodygroupMods = {"k98_stock_obrez", "k98_barrel_obrez"}

att.ExcludeFlags = {"bipinstalled"}
att.GivesFlags = {"nobipod"}

att.GivesSlots = {
    ["muzzle"] = {
        Type = "rifle_muzzle",
        PrintName = "Muzzle",
        Installed = nil,
        Required = false,
        Pos = Vector(9.425, -0.566, 7.789),
        Ang = Angle(0, 0, 0),
        Randomize = true,
        RandomizeChance = 10,
    }
}

att.AttachFunc = function(wep)
    wep.Precision = wep.Precision * 2.5
    wep.Sway = wep.Sway * 2
    wep.Recoil = wep.Recoil * 2.5
    wep.MuzzleOffset = wep.MuzzleOffset - Vector(16, 0, 0)
    wep.ShootingDelay = wep.ShootingDelay / 1.35
end

att.DetachFunc = function(wep)
    wep.Precision = wep.Precision / 2.5
    wep.Sway = wep.Sway / 2
    wep.Recoil = wep.Recoil / 2.5
    wep.MuzzleOffset = wep.MuzzleOffset + Vector(16, 0, 0)
    wep.ShootingDelay = wep.ShootingDelay * 1.35
end

ACT3_LoadAttachment(att)