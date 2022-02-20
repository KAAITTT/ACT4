local att = {}

att.PrintName = "G3 Wood Grip"
att.Name = "g3_grip_wood"
att.Slot = "g3_grip"
att.Description = {"Standard polymer wood."}
att.Icon = Material("attachments/g3_grip_wood.png")

att.BodygroupMods = {"g3_grip_wood"}

att.AttachFunc = function(wep)
end

att.DetachFunc = function(wep)
end

ACT3_LoadAttachment(att)