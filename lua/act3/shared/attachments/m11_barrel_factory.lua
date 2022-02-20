local att = {}

att.PrintName = "M11 Factory Barrel"
att.Name = "m11_barrel_factory"
att.Slot = "m11_barrel"
att.Description = {"Standard M11 barrel."}
att.Icon = Material("attachments/m11_barrel_factory.png")

att.GivesSlots = {
    ["muzzle"] = {
        Type = "rifle_muzzle",
        PrintName = "Muzzle",
        Installed = nil,
        Required = false,
        Scale = 1.1,
        Pos = Vector(9.387, -0.132, 7.367),
        Ang = Angle(0, 0, 0),
        Randomize = true,
        RandomizeChance = 15,
    }
}

att.AttachFunc = function(wep)
end

att.DetachFunc = function(wep)
end

ACT3_LoadAttachment(att)