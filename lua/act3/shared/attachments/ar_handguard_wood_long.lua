local att = {}

att.PrintName = "AR Wooden Handguard"
att.Name = "ar_handguard_wood_long"
att.Slot = "ar_handguard"
att.Description = {"Wooden AR-15 handguard."}
att.Icon = Material("attachments/ar_handguard_wood_long.png")

att.BodygroupMods = {"ar_handguard_wood_long"}
att.ExcludeFlags = {"shortbarrel"}

att.AttachFunc = function(wep)
end

att.DetachFunc = function(wep)
end

ACT3_LoadAttachment(att)