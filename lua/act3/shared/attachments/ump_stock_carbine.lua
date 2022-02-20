local att = {}

att.PrintName = "USC Carbine Stock"
att.Name = "ump_stock_carbine"
att.Slot = "ump_stock"
att.Description = {"-50% Sway", "+10% Sighted Speed", "+10% Recoil", "-10% Less Straight Recoil"}
att.Icon = Material("attachments/ump_stock_carbine.png")

att.DescColors = {ACT3.BulletColors.Positive, ACT3.BulletColors.Positive, ACT3.BulletColors.Negative, ACT3.BulletColors.Negative}

att.BodygroupMods = {"ump_stock_carbine"}

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