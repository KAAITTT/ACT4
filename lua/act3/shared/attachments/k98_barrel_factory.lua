local att = {}

att.PrintName = "K98 Factory Barrel"
att.Name = "k98_barrel_factory"
att.Slot = "k98_barrel"
att.Description = {"Standard K98K barrel."}
att.Icon = Material("attachments/k98_barrel_kurz.png")

att.GivesSlots = {
    ["muzzle"] = {
        Type = "rifle_muzzle",
        PrintName = "Muzzle",
        Installed = nil,
        Required = false,
        Pos = Vector(24.993, -0.566, 7.789),
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