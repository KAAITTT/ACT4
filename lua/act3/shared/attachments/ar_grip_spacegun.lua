local att = {}

att.PrintName = "AR Spacegun Grip/Stock"
att.Name = "ar_grip_spacegun"
att.Slot = "ar_grip"
att.Description = {"-10% Recoil", "-40% Sway", "-15% Accuracy Recovery", "-10% Less Straight Recoil"}
att.Icon = Material("attachments/ar_grip_spacegun.png")
att.DescColors = {ACT3.BulletColors.Positive, ACT3.BulletColors.Positive, ACT3.BulletColors.Negative, ACT3.BulletColors.Negative}

att.BodygroupMods = {"ar_grip_spacegun"}
att.ExcludeFlags = {"stock"}
att.GivesFlags = {"gripstock"}

att.AttachFunc = function(wep)
    wep.Sway = wep.Sway * 0.6
    wep.HeatDissipation = wep.HeatDissipation * 0.85
    wep.Recoil = wep.Recoil * 0.9
    wep.RecoilAngles = wep.RecoilAngles * 1.1
end

att.DetachFunc = function(wep)
    wep.Sway = wep.Sway / 0.6
    wep.HeatDissipation = wep.HeatDissipation / 0.85
    wep.Recoil = wep.Recoil / 0.9
    wep.RecoilAngles = wep.RecoilAngles / 1.1
end

ACT3_LoadAttachment(att)