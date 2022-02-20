local att = {}

att.PrintName = "G3 Polymer Handguard"
att.Name = "g3_handguard_poly"
att.Slot = "g3_handguard"
att.Description = {"Standard polymer handguard."}
att.Icon = Material("attachments/g3_handguard_poly.png")

att.ExcludeFlags = {"shortbarrel"}

att.AttachFunc = function(wep)
end

att.DetachFunc = function(wep)
end

ACT3_LoadAttachment(att)