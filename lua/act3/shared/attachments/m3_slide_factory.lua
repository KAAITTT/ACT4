local att = {}

att.PrintName = "M3 Factory Slide"
att.Name = "m3_slide_factory"
att.Slot = "m3_slide"
att.Description = {"Factory M3 slide."}
att.Icon = Material("attachments/m3_slide_factory.png")

att.AttachFunc = function(wep)
end

att.DetachFunc = function(wep)
end

ACT3_LoadAttachment(att)