local att = {}

att.PrintName = "Lior Heavy Stock"
att.Name = "lior_stock_heavy"
att.Slot = "lior_stock"
att.Description = {"-25% Recoil", "-10% Sway", "-25% Less Straight Recoil", "-20% Sighted Speed"}
att.Icon = Material("attachments/lior_stock_heavy.png")

att.DescColors = {ACT3.BulletColors.Positive, ACT3.BulletColors.Positive, ACT3.BulletColors.Negative}

att.BodygroupMods = {"lior_stock_heavy"}

att.ExcludeFlags = {"gripstock"}
att.GivesFlags = {"stock"}

att.AttachFunc = function(wep)
    wep.Recoil = wep.Recoil * 0.75
    wep.RecoilAngles = wep.RecoilAngles * 1.25
    wep.Sway = wep.Sway * 0.9
    wep.SightedSpeedMult = wep.SightedSpeedMult * 0.8
end

att.DetachFunc = function(wep)
    wep.Recoil = wep.Recoil / 0.75
    wep.RecoilAngles = wep.RecoilAngles / 1.25
    wep.Sway = wep.Sway / 0.9
    wep.SightedSpeedMult = wep.SightedSpeedMult / 0.8
end

ACT3_LoadAttachment(att)