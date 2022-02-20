local att = {}

att.PrintName = "K98K Factory Stock"
att.Name = "k98_stock_kurz"
att.Slot = "k98_stock"
att.Icon = Material("attachments/k98_stock_kurz.png")

att.Description = {"Standard K98K stock.", "-15% Sighted Speed"}
att.DescColors = {ACT3.BulletColors.Neutral, ACT3.BulletColors.Negative}

att.GivesSlots = {
    ["barrel"] = {
        Type = "k98_barrel",
        PrintName = "Barrel",
        Installed = "k98_barrel_factory",
        Required = true,
    },
    ["cheekpad"] = {
        Type = "k98_cheekpad",
        PrintName = "Cheek Pad",
        Installed = nil,
        Required = false,
    },
}

att.AttachFunc = function(wep)
    wep.SightedSpeedMult = wep.SightedSpeedMult * 0.85
end

att.DetachFunc = function(wep)
    wep.SightedSpeedMult = wep.SightedSpeedMult / 0.85
end

ACT3_LoadAttachment(att)