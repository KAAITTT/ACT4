local att = {}

att.PrintName = "MP5 Standard Barrel"
att.Name = "mp5_barrel_factory"
att.Slot = "mp5_barrel"
att.Description = {"Standard MP5 barrel."}
att.Icon = Material("attachments/mp5_barrel_factory.png")

att.GivesSlots = {
    ["muzzle"] = {
        Type = "rifle_muzzle",
        PrintName = "Muzzle",
        Installed = nil,
        Required = false,
        Scale = 1,
        Pos = Vector(17.627, 0.145, 9.409),
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