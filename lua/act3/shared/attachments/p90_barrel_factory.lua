local att = {}

att.PrintName = "P90 Standard Barrel"
att.Name = "p90_barrel_factory"
att.Slot = "p90_barrel"
att.Description = {"Standard P90 barrel."}
att.Icon = Material("attachments/p90_barrel_factory.png")

att.GivesSlots = {
    ["muzzle"] = {
        Type = "rifle_muzzle",
        PrintName = "Muzzle",
        Installed = nil,
        Required = false,
        Scale = 1,
        Pos = Vector(17.627, 0.145, 9.409),
        Ang = Angle(0, 0, 0)
    }
}

att.AttachFunc = function(wep)
end

att.DetachFunc = function(wep)
end

ACT3_LoadAttachment(att)