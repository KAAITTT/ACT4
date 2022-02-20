local att = {}

att.PrintName = "Garand Factory Foreend"
att.Name = "garand_fore"
att.Slot = "garand_fore"
att.Description = {"Standard Garand foreend."}
att.Icon = Material("attachments/garand_fore.png")

att.AttachFunc = function(wep)
end

att.DetachFunc = function(wep)
end

ACT3_LoadAttachment(att)