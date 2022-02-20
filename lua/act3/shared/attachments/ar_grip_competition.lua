local att = {}

att.PrintName = "AR Competition Grip/Stock"
att.Name = "ar_grip_competition"
att.Slot = "ar_grip"
att.Description = {"-50% Sway", "+10% Accuracy Recovery", "+10% Recoil", "-10% Less Straight Recoil"}
att.Icon = Material("attachments/ar_grip_competition.png")
att.DescColors = {ACT3.BulletColors.Positive, ACT3.BulletColors.Positive, ACT3.BulletColors.Negative, ACT3.BulletColors.Negative}

att.BodygroupMods = {"ar_grip_competition"}
att.ExcludeFlags = {"stock"}
att.GivesFlags = {"gripstock"}

att.AttachFunc = function(wep)
    wep.Sway = wep.Sway * 0.5
    wep.HeatDissipation = wep.HeatDissipation * 1.1
    wep.Recoil = wep.Recoil * 1.1
    wep.RecoilAngles = wep.RecoilAngles * 1.1
end

att.DetachFunc = function(wep)
    wep.Sway = wep.Sway / 0.5
    wep.HeatDissipation = wep.HeatDissipation / 1.1
    wep.Recoil = wep.Recoil / 1.1
    wep.RecoilAngles = wep.RecoilAngles / 1.1
end

ACT3_LoadAttachment(att)