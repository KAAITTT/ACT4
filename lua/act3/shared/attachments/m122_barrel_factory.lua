local att = {}

att.PrintName = "M1-22 Factory Barrel"
att.Name = "m122_barrel_factory"
att.Slot = "m122_barrel"
att.Description = {"Standard M1-22 barrel."}
att.Icon = Material("attachments/m122_barrel_long.png")

att.GivesSlots = {
    ["muzzle"] = { -- needs unique ID
        Pos = Vector(16.958, -0.602, 7.636),
        Ang = Angle(0, 0, 0),
        Type = "rifle_muzzle",
        PrintName = "Muzzle",
        Installed = nil,
        Required = false,
        Randomize = true,
        RandomizeChance = 15,
    }
}

att.AttachFunc = function(wep)
end

att.DetachFunc = function(wep)
end

ACT3_LoadAttachment(att)