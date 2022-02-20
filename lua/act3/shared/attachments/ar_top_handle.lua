local att = {}

att.PrintName = "AR Carry Handle"
att.Name = "ar_top_handle"
att.Slot = "ar_top"
att.Description = {"Standard M16 style carry handle."}
att.Icon = Material("attachments/ar_top_handle.png")


att.AttachFunc = function(wep)
end

att.DetachFunc = function(wep)
end

ACT3_LoadAttachment(att)