local att = {}

att.PrintName = "Desert Eagle Stock"
att.Name = "deagle_stock"
att.Slot = "deagle_stock"
att.Description = {"-25% Recoil", "-50% Sway", "-10% Sighted Speed"}
att.Icon = Material("attachments/deagle_stock.png")

att.BodygroupMods = {"deagle_stock"}

att.AttachFunc = function(wep)
    wep.Recoil = wep.Recoil * 0.75
    wep.Sway = wep.Sway * 0.5
    wep.SightedSpeedMult = wep.SightedSpeedMult * 0.9
end

att.DetachFunc = function(wep)
    wep.Recoil = wep.Recoil / 0.75
    wep.Sway = wep.Sway / 0.5
    wep.SightedSpeedMult = wep.SightedSpeedMult / 0.9
end

ACT3_LoadAttachment(att)