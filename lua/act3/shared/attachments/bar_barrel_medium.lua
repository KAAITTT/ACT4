local att = {}

att.PrintName = "BAR Medium Barrel"
att.Name = "bar_barrel_medium"
att.Slot = "bar_barrel"
att.Description = {"No particular advantages."}
att.Icon = Material("attachments/bar_barrel_medium.png")

att.BodygroupMods = {"bar_barrel_medium"}

att.AttachFunc = function(wep)
    wep.MuzzleOffset = wep.MuzzleOffset - Vector(5, 0, 0)
end

att.DetachFunc = function(wep)
    wep.MuzzleOffset = wep.MuzzleOffset + Vector(5, 0, 0)
end

ACT3_LoadAttachment(att)