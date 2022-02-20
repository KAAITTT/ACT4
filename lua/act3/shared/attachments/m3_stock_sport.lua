local att = {}

att.PrintName = "M3 Sport Stock"
att.Name = "m3_stock_sport"
att.Slot = "m3_stock"
att.Description = {"-50% Sway", "+10% Sighted Speed", "+10% Recoil", "-10% Less Straight Recoil"}
att.Icon = Material("attachments/m3_stock_sport.png")

att.DescColors = {ACT3.BulletColors.Positive, ACT3.BulletColors.Positive, ACT3.BulletColors.Negative, ACT3.BulletColors.Negative}

att.BodygroupMods = {"m3_stock_sport"}

att.AttachFunc = function(wep)
    wep.Sway = wep.Sway * 0.5
    wep.SightedSpeedMult = wep.SightedSpeedMult * 1.1
    wep.Recoil = wep.Recoil * 1.1
    wep.RecoilAngles = wep.RecoilAngles * 1.1
end

att.DetachFunc = function(wep)
    wep.Sway = wep.Sway / 0.5
    wep.SightedSpeedMult = wep.SightedSpeedMult / 1.1
    wep.Recoil = wep.Recoil / 1.1
    wep.RecoilAngles = wep.RecoilAngles / 1.1
end

ACT3_LoadAttachment(att)