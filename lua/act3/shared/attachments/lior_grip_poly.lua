local att = {}

att.PrintName = "Lior Polymer Grip"
att.Name = "lior_grip_poly"
att.Slot = "lior_grip"
att.Description = {"Lior standard polymer grip."}
att.Icon = Material("attachments/lior_grip_poly.png")

att.AttachFunc = function(wep)
end

att.DetachFunc = function(wep)
end

ACT3_LoadAttachment(att)