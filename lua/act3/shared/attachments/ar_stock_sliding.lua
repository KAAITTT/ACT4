local att = {}

att.PrintName = "AR Sliding Stock"
att.Name = "ar_stock_sliding"
att.Slot = "ar_stock"
att.Description = {"-10% Recoil", "-10% Sway", "+25% Straighter Recoil", "-5% Sighted Speed"}
att.Icon = Material("attachments/ar_stock_sliding.png")

att.DescColors = {ACT3.BulletColors.Positive, ACT3.BulletColors.Positive, ACT3.BulletColors.Positive, ACT3.BulletColors.Negative}

att.BodygroupMods = {"ar_stock_sliding"}
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