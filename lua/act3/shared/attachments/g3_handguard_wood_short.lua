local att = {}

att.PrintName = "G3 Short Wood Handguard"
att.Name = "g3_handguard_wood_short"
att.Slot = "g3_handguard"
att.Description = {"+25% Straighter Recoil", "+10% Recoil", "-25% Hipfire Accuracy"}
att.Icon = Material("attachments/g3_handguard_wood_short.png")

att.DescColors = {ACT3.BulletColors.Positive, ACT3.BulletColors.Negative, ACT3.BulletColors.Negative}

att.BodygroupMods = {"g3_handguard_wood_short"}

att.GivesFlags = {"shorthg"}

att.AttachFunc = function(wep)
    wep.Recoil = wep.Recoil * 1.1
    wep.RecoilAngles = wep.RecoilAngles * 0.75
    wep.MaxHeatHipfirePenalty = wep.MaxHeatHipfirePenalty * 1.25
end

att.DetachFunc = function(wep)
    wep.Recoil = wep.Recoil / 1.1
    wep.RecoilAngles = wep.RecoilAngles / 0.75
    wep.MaxHeatHipfirePenalty = wep.MaxHeatHipfirePenalty / 1.25
end

ACT3_LoadAttachment(att)