local att = {}

att.PrintName = "Folded"
att.Name = "aug_grip_folded"
att.Slot = "aug_grip"
att.Description = {"Folded integrated foregrip."}
att.Icon = Material("attachments/aug_grip_folded.png")

att.Free = true

att.BodygroupMods = {"aug_grip_folded"}

att.AttachFunc = function(wep)
    wep.HoldtypeSights = "ar2"
end

att.DetachFunc = function(wep)
    local orig = weapons.Get(wep:GetClass())
    wep.HoldtypeSights = orig.HoldtypeSights
end

ACT3_LoadAttachment(att)