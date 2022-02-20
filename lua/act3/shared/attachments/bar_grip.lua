local att = {}

att.PrintName = "BAR Grip"
att.Name = "bar_grip"
att.Slot = "bar_grip"
att.Description = {"-10% Sway", "+10% Recoil"}
att.Icon = Material("attachments/bar_grip.png")
att.DescColors = {ACT3.BulletColors.Positive, ACT3.BulletColors.Negative}

att.BodygroupMods = {"bar_grip"}

att.AttachFunc = function(wep)
    wep.Recoil = wep.Recoil * 1.1
    wep.Sway = wep.Sway * 0.9
end

att.DetachFunc = function(wep)
    wep.Recoil = wep.Recoil / 1.1
    wep.Sway = wep.Sway / 0.9
end

ACT3_LoadAttachment(att)