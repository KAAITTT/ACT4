local att = {}

att.PrintName = "RPK Heavy Stock"
att.Name = "ak_stock_heavy"
att.Slot = "ak_stock"
att.Description = {"-75% Recoil", "-10% Sway", "-25% Less Straight Recoil", "-20% Sighted Speed"}
att.Icon = Material("attachments/ak_stock_heavy.png")
att.DescColors = {ACT3.BulletColors.Positive, ACT3.BulletColors.Positive, ACT3.BulletColors.Negative, ACT3.BulletColors.Negative}

att.BodygroupMods = {"ak_stock_heavy"}
att.GivesFlags = {"stock"}
att.ExcludeFlags = {"gripstock"}

att.AttachFunc = function(wep)
    wep.Recoil = wep.Recoil * 0.25
    wep.RecoilAngles = wep.RecoilAngles * 1.25
    wep.Sway = wep.Sway * 0.9
    wep.SightedSpeedMult = wep.SightedSpeedMult * 0.8
end

att.DetachFunc = function(wep)
    wep.Recoil = wep.Recoil / 0.25
    wep.RecoilAngles = wep.RecoilAngles / 1.25
    wep.Sway = wep.Sway / 0.9
    wep.SightedSpeedMult = wep.SightedSpeedMult / 0.8
end

ACT3_LoadAttachment(att)