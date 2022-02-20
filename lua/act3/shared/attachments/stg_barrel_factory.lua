local att = {}

att.PrintName = "StG 44 Factory Barrel"
att.Name = "stg_barrel_factory"
att.Slot = "stg_barrel"
att.Description = {"Standard StG 44 barrel."}
att.Icon = Material("attachments/stg_barrel_factory.png")

att.BodygroupMods = {"stg44_barrel_factory"}

att.AttachFunc = function(wep)
end

att.DetachFunc = function(wep)
end

ACT3_LoadAttachment(att)