local att = {}

att.PrintName = "G3 Wood Handguard"
att.Name = "g3_handguard_wood_long"
att.Slot = "g3_handguard"
att.Description = {"Wooden G3 handguard."}
att.Icon = Material("attachments/g3_handguard_wood_long.png")

att.ExcludeFlags = {"shortbarrel"}

att.BodygroupMods = {"g3_handguard_wood_long"}

att.AttachFunc = function(wep)
end

att.DetachFunc = function(wep)
end

ACT3_LoadAttachment(att)