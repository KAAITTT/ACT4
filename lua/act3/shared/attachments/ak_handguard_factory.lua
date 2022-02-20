local att = {}

att.PrintName = "AKM Handguard"
att.Name = "ak_handguard_factory"
att.Slot = "ak_handguard"
att.Description = {"Standard AK handguard."}
att.Icon = Material("attachments/ak_handguard_factory.png")

att.AttachFunc = function(wep)
end

att.DetachFunc = function(wep)
end

ACT3_LoadAttachment(att)