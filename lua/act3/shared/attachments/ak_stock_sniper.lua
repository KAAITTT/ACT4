local att = {}

att.PrintName = "AK Sniper Stock"
att.Name = "ak_stock_sniper"
att.Slot = "ak_stock"
att.Description = {"-80% Sway", "-50% Sighted Speed", "+10% Recoil", "-10% Less Straight Recoil"}
att.Icon = Material("attachments/ak_stock_sniper.png")
att.DescColors = {ACT3.BulletColors.Positive, ACT3.BulletColors.Negative, ACT3.BulletColors.Negative, ACT3.BulletColors.Negative}

att.BodygroupMods = {"ak_stock_sniper"}
att.GivesFlags = {"stock"}
att.ExcludeFlags = {"gripstock"}

att.AttachFunc = function(wep)
    wep.Sway = wep.Sway * 0.2
    wep.SightedSpeedMult = wep.SightedSpeedMult * 0.5
    wep.Recoil = wep.Recoil * 1.1
    wep.RecoilAngles = wep.RecoilAngles * 1.1
end

att.DetachFunc = function(wep)
    wep.Sway = wep.Sway / 0.2
    wep.SightedSpeedMult = wep.SightedSpeedMult / 0.5
    wep.Recoil = wep.Recoil / 1.1
    wep.RecoilAngles = wep.RecoilAngles / 1.1
end

ACT3_LoadAttachment(att)