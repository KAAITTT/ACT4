local att = {}

att.PrintName = "AR Wooden Grip/Stock"
att.Name = "ar_grip_woodstock"
att.Slot = "ar_grip"
att.Description = {"-25% Recoil", "-50% Sway", "-20% Sighted Speed"}
att.Icon = Material("attachments/ar_grip_woodstock.png")

att.DescColors = {ACT3.BulletColors.Positive, ACT3.BulletColors.Positive, ACT3.BulletColors.Negative}

att.BodygroupMods = {"ar_grip_ad2"}
att.ExcludeFlags = {"stock"}
att.GivesFlags = {"gripstock"}

att.AttachFunc = function(wep)
    wep.Recoil = wep.Recoil * 0.75
    wep.Sway = wep.Sway * 0.5
    wep.SightedSpeedMult = wep.SightedSpeedMult * 0.8
end

att.DetachFunc = function(wep)
    wep.Recoil = wep.Recoil / 0.75
    wep.Sway = wep.Sway / 0.5
    wep.SightedSpeedMult = wep.SightedSpeedMult / 0.8
end

ACT3_LoadAttachment(att)