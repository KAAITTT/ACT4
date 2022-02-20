local att = {}

att.PrintName = "Lior Grip Stock"
att.Name = "lior_grip_rifle"
att.Slot = "lior_grip"
att.Description = {"-25% Recoil", "-50% Sway", "-10% Accuracy Recovery"}
att.Icon = Material("attachments/lior_grip_rifle.png")

att.DescColors = {ACT3.BulletColors.Positive, ACT3.BulletColors.Positive, ACT3.BulletColors.Negative}

att.BodygroupMods = {"lior_grip_rifle"}

att.GivesFlags = {"gripstock"}
att.ExcludeFlags = {"stock"}

att.AttachFunc = function(wep)
    wep.Recoil = wep.Recoil * 0.75
    wep.Sway = wep.Sway * 0.5
    wep.HeatDissipation = wep.HeatDissipation * 0.9
end

att.DetachFunc = function(wep)
    wep.Recoil = wep.Recoil / 0.75
    wep.Sway = wep.Sway / 0.5
    wep.HeatDissipation = wep.HeatDissipation / 0.9
end

ACT3_LoadAttachment(att)