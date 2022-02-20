local att = {}

att.PrintName = "AK Polymer Handguard"
att.Name = "ak_handguard_poly"
att.Slot = "ak_handguard"
att.Description = {"Polymer AK handguard."}
att.Icon = Material("attachments/ak_handguard_poly.png")

att.BodygroupMods = {"ak_handguard_poly"}

att.AttachFunc = function(wep)
end

att.DetachFunc = function(wep)
end

ACT3_LoadAttachment(att)