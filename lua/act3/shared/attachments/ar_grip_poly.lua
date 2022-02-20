local att = {}

att.PrintName = "AR Polymer Grip"
att.Name = "ar_grip_poly"
att.Slot = "ar_grip"
att.Description = {"Standard AR grip."}
att.Icon = Material("attachments/ar_grip_poly.png")


att.AttachFunc = function(wep)
end

att.DetachFunc = function(wep)
end

ACT3_LoadAttachment(att)