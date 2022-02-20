local att = {}

att.PrintName = "Lior Factory Barrel"
att.Name = "lior_barrel_factory"
att.Slot = "lior_barrel"
att.Description = {"Standard Lior barrel."}
att.Icon = Material("attachments/lior_barrel_factory.png")

att.AttachFunc = function(wep)
end

att.DetachFunc = function(wep)
end

ACT3_LoadAttachment(att)