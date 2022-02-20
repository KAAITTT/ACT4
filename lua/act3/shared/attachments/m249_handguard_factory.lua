local att = {}

att.PrintName = "M249 Factory Handguard"
att.Name = "m249_handguard_factory"
att.Slot = "m249_handguard"
att.Description = {"Standard M249 handguard."}
att.Icon = Material("attachments/m249_handguard_factory.png")

att.AttachFunc = function(wep)
end

att.DetachFunc = function(wep)
end

ACT3_LoadAttachment(att)