local att = {}

att.PrintName = "AR Short Wood Handguard"
att.Name = "ar_handguard_wood_short"
att.Slot = "ar_handguard"
att.Description = {"Allows short barrels to be installed.", "+25% Straighter Recoil", "+10% Recoil", "-25% Hipfire Accuracy"}
att.Icon = Material("attachments/ar_handguard_wood_short.png")

att.DescColors = {nil, ACT3.BulletColors.Positive, ACT3.BulletColors.Negative}

att.BodygroupMods = {"ar_handguard_wood_short"}
att.GivesFlags = {"shorthandguard"}

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