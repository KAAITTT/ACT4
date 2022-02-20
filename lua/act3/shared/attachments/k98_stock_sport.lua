local att = {}

att.PrintName = "K98 Sporting Stock"
att.Name = "k98_stock_sport"
att.Slot = "k98_stock"
att.Description = {"Polymer K98 stock.", "-5% Sighted Speed"}
att.Icon = Material("attachments/k98_stock_sport.png")

att.DescColors = {ACT3.BulletColors.Neutral, ACT3.BulletColors.Negative}

att.BodygroupMods = {"k98_stock_sport"}

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
    wep.SightedSpeedMult = wep.SightedSpeedMult * 0.9
end

att.DetachFunc = function(wep)
    wep.SightedSpeedMult = wep.SightedSpeedMult / 0.9
end

ACT3_LoadAttachment(att)