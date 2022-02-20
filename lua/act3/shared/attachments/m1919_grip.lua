local att = {}

att.PrintName = "M1919 Grip"
att.Name = "m1919_grip"
att.Slot = "m1919_grip"
att.Description = {"-10% Recoil", "-10% Sway", "+25% Straighter Recoil", "-25% Accuracy Recovery"}
att.Icon = Material("attachments/m1919_grip.png")
att.DescColors = {ACT3.BulletColors.Positive, ACT3.BulletColors.Positive, ACT3.BulletColors.Positive, ACT3.BulletColors.Negative}

att.BodygroupMods = {"m1919_grip"}

att.AttachFunc = function(wep)
    wep.Recoil = wep.Recoil * 0.9
    wep.Sway = wep.Sway * 0.9
    wep.RecoilAngles = wep.RecoilAngles * 0.75
    wep.HeatDissipation = wep.HeatDissipation * 0.75
end

att.DetachFunc = function(wep)
    wep.Recoil = wep.Recoil / 0.9
    wep.Sway = wep.Sway / 0.9
    wep.RecoilAngles = wep.RecoilAngles / 0.75
    wep.HeatDissipation = wep.HeatDissipation / 0.75
end

ACT3_LoadAttachment(att)