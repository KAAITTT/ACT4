local att = {}

att.PrintName = "Scout Factory Barrel"
att.Name = "scout_barrel_factory"
att.Slot = "scout_barrel"
att.Description = {"Standard Scout barrel."}
att.Icon = Material("attachments/scout_barrel_factory.png")

att.GivesSlots = {
    ["muzzle"] = {
        Pos = Vector(36.806, 0, 4.026),
        Ang = Angle(0, 0, 0),
        Type = "rifle_muzzle",
        PrintName = "Muzzle",
        Installed = nil,
        Required = false,
        Scale = 1,
    }
}

att.AttachFunc = function(wep)
end

att.DetachFunc = function(wep)
end

ACT3_LoadAttachment(att)