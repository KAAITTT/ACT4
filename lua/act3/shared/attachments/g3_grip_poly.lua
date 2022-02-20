local att = {}

att.PrintName = "G3 Polymer Grip"
att.Name = "g3_grip_poly"
att.Slot = "g3_grip"
att.Description = {"Standard polymer grip."}
att.Icon = Material("attachments/g3_grip_poly.png")

att.AttachFunc = function(wep)
end

att.DetachFunc = function(wep)
end

ACT3_LoadAttachment(att)