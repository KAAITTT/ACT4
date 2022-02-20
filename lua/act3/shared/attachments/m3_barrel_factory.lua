local att = {}

att.PrintName = "M3 Factory Barrel"
att.Name = "m3_barrel_factory"
att.Slot = "m3_barrel"
att.Description = {"Standard M3 shotgun barrel."}
att.Icon = Material("attachments/m3_barrel_factory.png")

att.AttachFunc = function(wep)
end

att.DetachFunc = function(wep)
end

ACT3_LoadAttachment(att)