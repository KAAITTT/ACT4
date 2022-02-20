local att = {}

att.PrintName = "Model 29 Snub Barrel"
att.Name = "m29_barrel_snub"
att.Slot = "m29_barrel"
att.Description = {"Standard snubnosed M29 barrel."}
att.Icon = Material("attachments/m29_barrel_snub.png")

att.BodygroupMods = {"m29_barrel_snub"}

att.AttachFunc = function(wep)
end

att.DetachFunc = function(wep)
end

ACT3_LoadAttachment(att)