local att = {}

att.PrintName = "C96 Factory Barrel"
att.Name = "c96_barrel_factory"
att.Slot = "c96_barrel"
att.Description = {"Standard C96 barrel."}
att.Icon = Material("attachments/c96_barrel_factory.png")

att.AttachFunc = function(wep)
end

att.DetachFunc = function(wep)
end

ACT3_LoadAttachment(att)