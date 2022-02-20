local att = {}

att.PrintName = "Lior Light Handguard"
att.Name = "lior_handguard_light"
att.Slot = "lior_handguard"
att.Description = {"+25% Straighter Recoil", "+10% Recoil", "-25% Hipfire Accuracy"}
att.Icon = Material("attachments/lior_handguard_light.png")

att.DescColors = {ACT3.BulletColors.Positive, ACT3.BulletColors.Negative, ACT3.BulletColors.Negative}

att.BodygroupMods = {"lior_handguard_light"}

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