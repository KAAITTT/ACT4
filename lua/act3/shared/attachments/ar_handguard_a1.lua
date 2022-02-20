local att = {}

att.PrintName = "AR A1 Handguard"
att.Name = "ar_handguard_a1"
att.Slot = "ar_handguard"
att.Description = {"M16A1 style handguard."}
att.Icon = Material("attachments/ar_handguard_a1.png")

att.ExcludeFlags = {"shortbarrel"}

att.AttachFunc = function(wep)
end

att.DetachFunc = function(wep)
end

ACT3_LoadAttachment(att)