local att = {}

att.PrintName = "M3 Short Barrel"
att.Name = "m3_barrel_short"
att.Slot = "m3_barrel"
att.Description = {"-25% Dispersion", "-25% Precision"}
att.Icon = Material("attachments/m3_barrel_short.png")

att.DescColors = {ACT3.BulletColors.Positive, ACT3.BulletColors.Negative}

att.BodygroupMods = {"m3_barrel_short"}

att.AttachFunc = function(wep)
    wep.MuzzleOffset = wep.MuzzleOffset + Vector(2, 0, 0)

    wep.Precision = wep.Precision / 0.75
    wep.HipfirePenalty = wep.HipfirePenalty / 1.25
    wep.MaxHeatHipfirePenalty = wep.MaxHeatHipfirePenalty / 1.25
end

att.DetachFunc = function(wep)
    wep.MuzzleOffset = wep.MuzzleOffset - Vector(2, 0, 0)

    wep.Precision = wep.Precision * 0.75
    wep.HipfirePenalty = wep.HipfirePenalty * 1.25
    wep.MaxHeatHipfirePenalty = wep.MaxHeatHipfirePenalty * 1.25
end

ACT3_LoadAttachment(att)