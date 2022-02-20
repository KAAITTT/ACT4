local att = {}

att.PrintName = "M249 Wood Stock"
att.Name = "m249_stock_wood"
att.Slot = "m249_stock"
att.Description = {"-25% Recoil", "-50% Sway", "-20% Sighted Speed"}
att.Icon = Material("attachments/m249_stock_wood.png")

att.DescColors = {ACT3.BulletColors.Positive, ACT3.BulletColors.Positive, ACT3.BulletColors.Negative}

att.BodygroupMods = {"m249_stock_wood"}

att.AttachFunc = function(wep)
    wep.Recoil = wep.Recoil * 0.75
    wep.Sway = wep.Sway * 0.5
    wep.SightedSpeedMult = wep.SightedSpeedMult * 0.8
end

att.DetachFunc = function(wep)
    wep.Recoil = wep.Recoil / 0.75
    wep.Sway = wep.Sway / 0.5
    wep.SightedSpeedMult = wep.SightedSpeedMult / 0.8
end

ACT3_LoadAttachment(att)