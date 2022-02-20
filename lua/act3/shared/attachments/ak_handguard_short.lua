local att = {}

att.PrintName = "AK-U Handguard"
att.Name = "ak_handguard_short"
att.Slot = "ak_handguard"
att.Description = {"+25% Straighter Recoil", "+10% Recoil", "-25% Hipfire Accuracy"}
att.DescColors = {ACT3.BulletColors.Positive, ACT3.BulletColors.Negative, ACT3.BulletColors.Negative}
att.Icon = Material("attachments/ak_handguard_short.png")

att.BodygroupMods = {"ak_handguard_short"}

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