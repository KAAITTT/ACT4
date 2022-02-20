local att = {}

att.PrintName = "AK Wooden Grip"
att.Name = "ak_grip_factory"
att.Slot = "ak_grip"
att.Description = {"Standard AK grip."}
att.Icon = Material("attachments/ak_grip_factory.png")


att.AttachFunc = function(wep)
end

att.DetachFunc = function(wep)
end

ACT3_LoadAttachment(att)