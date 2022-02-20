local att = {}

att.PrintName = "Model 602 Handguard"
att.Name = "ar_handguard_602"
att.Slot = "ar_handguard"
att.Description = {"Allows short barrels to be installed."}
att.Icon = Material("attachments/ar_handguard_602.png")

att.BodygroupMods = {"ar_handguard_602"}
att.GivesFlags = {"shorthandguard"}

att.AttachFunc = function(wep)
end

att.DetachFunc = function(wep)
end

ACT3_LoadAttachment(att)