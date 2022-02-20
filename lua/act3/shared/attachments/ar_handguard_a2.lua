local att = {}

att.PrintName = "AR A2 Handguard"
att.Name = "ar_handguard_a2"
att.Slot = "ar_handguard"
att.Description = {"M16A2 style handguard."}
att.Icon = Material("attachments/ar_handguard_a2.png")

att.BodygroupMods = {"ar_handguard_a2"}
att.ExcludeFlags = {"shortbarrel"}

att.AttachFunc = function(wep)
end

att.DetachFunc = function(wep)
end

ACT3_LoadAttachment(att)