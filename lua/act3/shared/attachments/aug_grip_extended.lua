local att = {}

att.PrintName = "Extended"
att.Name = "aug_grip_extended"
att.Slot = "aug_grip"
att.Description = {"-25% Sway", "-25% Less Straight Recoil"}
att.Icon = Material("attachments/aug_grip_extended.png")

att.DescColors = {ACT3.BulletColors.Positive, ACT3.BulletColors.Negative}

att.Free = true

att.BodygroupMods = {"aug_grip_extended"}

att.AttachFunc = function(wep)
    wep.Sway = wep.Sway * 0.75
    wep.RecoilAngles = wep.RecoilAngles * 1.25
    wep.HoldtypeSights = "smg"
end

att.DetachFunc = function(wep)
    local orig = weapons.Get(wep:GetClass())
    wep.Recoil = wep.Recoil / 0.75
    wep.RecoilAngles = wep.RecoilAngles / 1.25
    wep.HoldtypeSights = orig.HoldtypeSights
end

ACT3_LoadAttachment(att)