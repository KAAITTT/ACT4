local att = {}

att.PrintName = "M249 Light Stock"
att.Name = "m249_stock_poly"
att.Slot = "m249_stock"
att.Description = {"-10% Recoil", "-10% Sway", "+25% Straighter Recoil", "-5% Sighted Speed"}
att.Icon = Material("attachments/m249_stock_poly.png")

att.DescColors = {ACT3.BulletColors.Positive, ACT3.BulletColors.Positive, ACT3.BulletColors.Positive, ACT3.BulletColors.Negative}

att.BodygroupMods = {"m249_stock_poly"}

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