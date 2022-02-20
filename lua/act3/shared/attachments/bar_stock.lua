local att = {}

att.PrintName = "BAR Stock"
att.Name = "bar_stock"
att.Slot = "bar_stock"
att.Description = {"-25% Recoil", "-10% Sway", "-25% Less Straight Recoil", "-10% Sighted Speed"}
att.Icon = Material("attachments/bar_stock.png")
att.DescColors = {ACT3.BulletColors.Positive, ACT3.BulletColors.Positive, ACT3.BulletColors.Negative, ACT3.BulletColors.Negative}

att.BodygroupMods = {"bar_stock"}

att.AttachFunc = function(wep)
    wep.Recoil = wep.Recoil * 0.75
    wep.RecoilAngles = wep.RecoilAngles * 1.25
    wep.Sway = wep.Sway * 0.9
    wep.SightedSpeedMult = wep.SightedSpeedMult * 0.9
end

att.DetachFunc = function(wep)
    wep.Recoil = wep.Recoil / 0.75
    wep.RecoilAngles = wep.RecoilAngles / 1.25
    wep.Sway = wep.Sway / 0.9
    wep.SightedSpeedMult = wep.SightedSpeedMult / 0.9
end

ACT3_LoadAttachment(att)