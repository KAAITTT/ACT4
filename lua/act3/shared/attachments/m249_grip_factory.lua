local att = {}

att.PrintName = "M249 Factory Grip"
att.Name = "m249_grip_factory"
att.Slot = "m249_grip"
att.Description = {"Standard M249 grip."}
att.Icon = Material("attachments/m249_grip_factory.png")

att.AttachFunc = function(wep)
end

att.DetachFunc = function(wep)
end

ACT3_LoadAttachment(att)