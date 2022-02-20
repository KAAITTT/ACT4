local att = {}

att.PrintName = "MP5 Wood Stock"
att.Name = "mp5_stock_wood"
att.Slot = "mp5_stock"
att.Description = {"-25% Recoil", "-50% Sway", "-15% Sighted Speed"}
att.Icon = Material("attachments/mp5_stock_wood.png")

att.DescColors = {ACT3.BulletColors.Positive, ACT3.BulletColors.Positive, ACT3.BulletColors.Negative}

att.BodygroupMods = {"mp5_stock_wood"}

att.AttachFunc = function(wep)
    wep.Recoil = wep.Recoil * 0.75
    wep.Sway = wep.Sway * 0.5
    wep.SightedSpeedMult = wep.SightedSpeedMult * 0.85
end

att.DetachFunc = function(wep)
    wep.Recoil = wep.Recoil / 0.75
    wep.Sway = wep.Sway / 0.5
    wep.SightedSpeedMult = wep.SightedSpeedMult / 0.85
end

ACT3_LoadAttachment(att)