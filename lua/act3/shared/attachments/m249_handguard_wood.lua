local att = {}

att.PrintName = "M249 Wooden Handguard"
att.Name = "m249_handguard_wood"
att.Slot = "m249_handguard"
att.Description = {"Wooden M249 handguard."}
att.Icon = Material("attachments/m249_handguard_wood.png")

att.BodygroupMods = {"m249_handguard_wood"}

att.AttachFunc = function(wep)
end

att.DetachFunc = function(wep)
end

ACT3_LoadAttachment(att)