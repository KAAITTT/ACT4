local att = {}

att.PrintName = "AK Polymer Grip"
att.Name = "ak_grip_poly"
att.Slot = "ak_grip"
att.Description = {"-10% Recoil", "+10% Sway"}
att.DescColors = {ACT3.BulletColors.Positive, ACT3.BulletColors.Negative}
att.Icon = Material("attachments/ak_grip_poly.png")

att.BodygroupMods = {"ak_grip_poly"}

att.AttachFunc = function(wep)
    wep.Recoil = wep.Recoil * 1.1
    wep.Sway = wep.Sway * 1.1
end

att.DetachFunc = function(wep)
    wep.Recoil = wep.Recoil / 1.1
    wep.Sway = wep.Sway / 1.1
end

ACT3_LoadAttachment(att)