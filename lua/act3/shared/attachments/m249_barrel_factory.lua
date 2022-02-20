local att = {}

att.PrintName = "M249 Factory Barrel"
att.Name = "m249_barrel_factory"
att.Slot = "m249_barrel"
att.Description = {"Standard M249 barrel."}
att.Icon = Material("attachments/m249_barrel_factory.png")

att.AttachFunc = function(wep)
end

att.DetachFunc = function(wep)
end

ACT3_LoadAttachment(att)