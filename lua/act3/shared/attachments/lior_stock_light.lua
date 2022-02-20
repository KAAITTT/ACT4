local att = {}

att.PrintName = "Lior Factory Stock"
att.Name = "lior_stock_light"
att.Slot = "lior_stock"
att.Description = {"-25% Recoil", "-50% Sway", "-5% Sighted Speed"}
att.Icon = Material("attachments/lior_stock_light.png")

att.DescColors = {ACT3.BulletColors.Positive, ACT3.BulletColors.Positive, ACT3.BulletColors.Negative}

att.BodygroupMods = {"lior_stock_light"}

att.ExcludeFlags = {"gripstock"}
att.GivesFlags = {"stock"}

att.AttachFunc = function(wep)
    wep.Recoil = wep.Recoil * 0.75
    wep.Sway = wep.Sway * 0.5
    wep.SightedSpeedMult = wep.SightedSpeedMult * 0.95
end

att.DetachFunc = function(wep)
    wep.Recoil = wep.Recoil / 0.75
    wep.Sway = wep.Sway / 0.5
    wep.SightedSpeedMult = wep.SightedSpeedMult / 0.95
end

ACT3_LoadAttachment(att)