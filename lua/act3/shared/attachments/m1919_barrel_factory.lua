local att = {}

att.PrintName = "M1919 Factory Barrel"
att.Name = "m1919_barrel_factory"
att.Slot = "m1919_barrel"
att.Description = {"Standard M1919 barrel."}
att.Icon = Material("attachments/m1919_barrel_factory.png")

att.AttachFunc = function(wep)
end

att.DetachFunc = function(wep)
end

ACT3_LoadAttachment(att)