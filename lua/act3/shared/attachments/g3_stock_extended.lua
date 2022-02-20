local att = {}

att.PrintName = "Extended"
att.Name = "g3_stock_extended"
att.Slot = "g3_foldstock"
att.Description = {"-25% Recoil", "-50% Sway", "-10% Sighted Speed"}
att.Icon = Material("attachments/g3_stock_extended.png")

att.DescColors = {ACT3.BulletColors.Positive, ACT3.BulletColors.Positive, ACT3.BulletColors.Negative}

att.BodygroupMods = {"g3_stock_extended"}

att.Free = true

att.AttachFunc = function(wep)
    wep.Recoil = wep.Recoil * 0.75
    wep.Sway = wep.Sway * 0.5
    wep.SightedSpeedMult = wep.SightedSpeedMult * 0.9
end

att.DetachFunc = function(wep)
    wep.Recoil = wep.Recoil / 0.75
    wep.Sway = wep.Sway / 0.5
    wep.SightedSpeedMult = wep.SightedSpeedMult / 0.9
end

ACT3_LoadAttachment(att)