local att = {}

att.PrintName = "Bipod Up"
att.Name = "scout_bipod_up"
att.Slot = "scout_bipod"
att.Description = {"Stowed bipod."}
att.Icon = Material("attachments/scout_bipod_up.png")

att.Free = true

att.BodygroupMods = {"scout_bipod_up"}

att.AttachFunc = function(wep)
end

att.DetachFunc = function(wep)
end

ACT3_LoadAttachment(att)