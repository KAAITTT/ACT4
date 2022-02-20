local att = {}

att.PrintName = "Vepr Grip/Stock"
att.Name = "ak_grip_woodstock"
att.Slot = "ak_grip"
att.Description = {"-25% Recoil", "-50% Sway", "-20% Sighted Speed"}
att.DescColors = {ACT3.BulletColors.Positive, ACT3.BulletColors.Positive, ACT3.BulletColors.Negative}
att.Icon = Material("attachments/ak_grip_rifle.png")

att.BodygroupMods = {"ak_grip_rifle"}
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