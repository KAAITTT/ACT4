local att = {}

att.PrintName = "AK-S Light Stock"
att.Name = "ak_stock_light"
att.Slot = "ak_stock"
att.Description = {"-10% Recoil", "-10% Sway", "+25% Straighter Recoil", "-5% Sighted Speed"}
att.Icon = Material("attachments/ak_stock_light.png")
att.DescColors = {ACT3.BulletColors.Positive, ACT3.BulletColors.Positive, ACT3.BulletColors.Positive, ACT3.BulletColors.Negative}

att.BodygroupMods = {"ak_stock_light"}
att.GivesFlags = {"stock"}
att.ExcludeFlags = {"gripstock"}

att.AttachFunc = function(wep)
    wep.Recoil = wep.Recoil * 0.9
    wep.Sway = wep.Sway * 0.9
    wep.RecoilAngles = wep.RecoilAngles * 0.75
    wep.SightedSpeedMult = wep.SightedSpeedMult * 0.95
end

att.DetachFunc = function(wep)
    wep.Recoil = wep.Recoil / 0.9
    wep.Sway = wep.Sway / 0.9
    wep.RecoilAngles = wep.RecoilAngles / 0.75
    wep.SightedSpeedMult = wep.SightedSpeedMult / 0.95
end

ACT3_LoadAttachment(att)