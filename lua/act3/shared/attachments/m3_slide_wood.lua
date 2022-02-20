local att = {}

att.PrintName = "M3 Wooden Slide"
att.Name = "m3_slide_wood"
att.Slot = "m3_slide"
att.Description = {"Wooden M3 slide."}
att.Icon = Material("attachments/m3_slide_wood.png")

att.BodygroupMods = {"m3_slide_wood"}

att.AttachFunc = function(wep)
end

att.DetachFunc = function(wep)
end

ACT3_LoadAttachment(att)