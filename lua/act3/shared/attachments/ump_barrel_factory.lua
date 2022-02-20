local att = {}

att.PrintName = "UMP Standard Barrel"
att.Name = "ump_barrel_factory"
att.Slot = "ump_barrel"
att.Description = {"Standard UMP barrel."}
att.Icon = Material("attachments/ump_barrel_factory.png")

att.GivesSlots = {
    ["muzzle"] = {
        Type = "rifle_muzzle",
        PrintName = "Muzzle",
        Installed = nil,
        Required = false,
        Scale = 1,
        Pos = Vector(8.22, 0, 8.177),
        Ang = Angle(0, 0, 0)
    }
}

att.AttachFunc = function(wep)
end

att.DetachFunc = function(wep)
end

ACT3_LoadAttachment(att)