local att = {}

att.PrintName = "AR Wooden Stock"
att.Name = "ar_stock_wood"
att.Slot = "ar_stock"
att.Description = {"-20% Recoil", "-10% Sway", "+25% Straighter Recoil", "-20% Sighted Speed"}
att.Icon = Material("attachments/ar_stock_wood.png")

att.DescColors = {ACT3.BulletColors.Positive, ACT3.BulletColors.Positive, ACT3.BulletColors.Positive, ACT3.BulletColors.Negative}

att.BodygroupMods = {"ar_stock_wood"}
att.GivesFlags = {"stock"}
att.ExcludeFlags = {"gripstock"}

att.AttachFunc = function(wep)
    wep.Recoil = wep.Recoil * 0.8
    wep.Sway = wep.Sway * 0.5
    wep.RecoilAngles = wep.RecoilAngles * 0.75
    wep.SightedSpeedMult = wep.SightedSpeedMult * 0.8
end

att.DetachFunc = function(wep)
    wep.Recoil = wep.Recoil / 0.8
    wep.Sway = wep.Sway / 0.5
    wep.RecoilAngles = wep.RecoilAngles / 0.75
    wep.SightedSpeedMult = wep.SightedSpeedMult / 0.8
end

ACT3_LoadAttachment(att)