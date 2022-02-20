local att = {}

att.PrintName = "MP5 Drum Rearsight"
att.Name = "mp5_top_rearsight"
att.Slot = "mp5_top"
att.Description = {"Rear sight for the MP5."}
att.Icon = Material("attachments/mp5_top_rearsight.png")


att.AttachFunc = function(wep)
end

att.DetachFunc = function(wep)
end

ACT3_LoadAttachment(att)