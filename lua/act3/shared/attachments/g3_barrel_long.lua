local att = {}

att.PrintName = "G3 Factory Barrel"
att.Name = "g3_barrel_long"
att.Slot = "g3_barrel"
att.Description = {"Standard G3 barrel."}
att.Icon = Material("attachments/g3_barrel_long.png")

att.BodygroupMods = {"g3_barrel_long"}

att.GivesSlots = {
    ["muzzle"] = {
        Type = "rifle_muzzle",
        PrintName = "Muzzle",
        Installed = nil,
        Required = false,
        Scale = 1,
        Pos = Vector(17.882, 0, 8.496),
        Ang = Angle(0, 0, 0)
    }
}

att.AttachFunc = function(wep)
end

att.DetachFunc = function(wep)
end

ACT3_LoadAttachment(att)