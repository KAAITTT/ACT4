local att = {}

att.PrintName = "M3 Long Barrel"
att.Name = "m3_barrel_long"
att.Slot = "m3_barrel"
att.Description = {"+25% Precision", "+25% Dispersion"}
att.Icon = Material("attachments/m3_barrel_long.png")

att.DescColors = {ACT3.BulletColors.Positive, ACT3.BulletColors.Negative}

att.BodygroupMods = {"m3_barrel_long"}

att.AttachFunc = function(wep)
    wep.MuzzleOffset = wep.MuzzleOffset + Vector(4, 0, 0)

    wep.Precision = wep.Precision * 0.75
    wep.HipfirePenalty = wep.HipfirePenalty * 1.25
    wep.MaxHeatHipfirePenalty = wep.MaxHeatHipfirePenalty * 1.25
end

att.DetachFunc = function(wep)
    wep.MuzzleOffset = wep.MuzzleOffset - Vector(4, 0, 0)

    wep.Precision = wep.Precision / 0.75
    wep.HipfirePenalty = wep.HipfirePenalty / 1.25
    wep.MaxHeatHipfirePenalty = wep.MaxHeatHipfirePenalty / 1.25
end

ACT3_LoadAttachment(att)