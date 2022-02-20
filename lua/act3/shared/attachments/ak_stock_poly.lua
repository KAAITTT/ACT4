local att = {}

att.PrintName = "AK Polymer Stock"
att.Name = "ak_stock_poly"
att.Slot = "ak_stock"
att.Description = {"-25% Recoil", "-50% Sway", "-5% Sighted Speed"}
att.Icon = Material("attachments/ak_stock_poly.png")
att.DescColors = {ACT3.BulletColors.Positive, ACT3.BulletColors.Positive, ACT3.BulletColors.Negative}

att.BodygroupMods = {"ak_stock_poly"}
att.GivesFlags = {"stock"}
att.ExcludeFlags = {"gripstock"}

att.AttachFunc = function(wep)
    wep.Recoil = wep.Recoil * 0.75
    wep.Sway = wep.Sway * 0.5
    wep.SightedSpeedMult = wep.SightedSpeedMult * 0.95
end

att.DetachFunc = function(wep)
    wep.Recoil = wep.Recoil / 0.75
    wep.Sway = wep.Sway / 0.5
    wep.SightedSpeedMult = wep.SightedSpeedMult / 0.95
end

ACT3_LoadAttachment(att)