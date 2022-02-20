local att = {}

att.PrintName = "G3 Polymer Stock"
att.Name = "g3_stock_poly"
att.Slot = "g3_stock"
att.Description = {"-15% Recoil", "-50% Sway", "-10% Sighted Speed"}
att.Icon = Material("attachments/g3_stock_poly.png")

att.DescColors = {ACT3.BulletColors.Positive, ACT3.BulletColors.Positive, ACT3.BulletColors.Negative}

att.BodygroupMods = {"g3_stock_poly"}

att.AttachFunc = function(wep)
    wep.Recoil = wep.Recoil * 0.85
    wep.Sway = wep.Sway * 0.5
    wep.SightedSpeedMult = wep.SightedSpeedMult * 0.9
end

att.DetachFunc = function(wep)
    wep.Recoil = wep.Recoil / 0.85
    wep.Sway = wep.Sway / 0.5
    wep.SightedSpeedMult = wep.SightedSpeedMult / 0.9
end

ACT3_LoadAttachment(att)