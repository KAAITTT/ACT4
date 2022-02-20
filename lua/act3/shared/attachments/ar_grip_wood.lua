local att = {}

att.PrintName = "AR Wood Grip"
att.Name = "ar_grip_wood"
att.Slot = "ar_grip"
att.Description = {"-10% Sway", "+10% Recoil"}
att.Icon = Material("attachments/ar_grip_wood.png")
att.DescColors = {ACT3.BulletColors.Positive, ACT3.BulletColors.Negative}

att.BodygroupMods = {"ar_grip_wood"}

att.AttachFunc = function(wep)
    wep.Recoil = wep.Recoil * 1.1
    wep.Sway = wep.Sway * 0.9
end

att.DetachFunc = function(wep)
    wep.Recoil = wep.Recoil / 1.1
    wep.Sway = wep.Sway / 0.9
end

ACT3_LoadAttachment(att)