local att = {}

att.PrintName = "AK Factory Barrel"
att.Name = "ak_barrel_factory"
att.Slot = "ak_barrel"
att.Description = {"Standard AK barrel."}
att.Icon = Material("attachments/ak_barrel_factory.png")

att.GivesSlots = {
    ["muzzle"] = { -- needs unique ID
        Pos = Vector(22.405, 0, 7.052), -- position offset for attachments in this slot
        Ang = Angle(0, 0, 0), -- angle offset
        Type = "rifle_muzzle", -- type of attachments this slot can take
        PrintName = "Muzzle", -- name this slot shows
        Installed = nil, -- which attachment is actually installed in this slot
        Required = false, -- whether something MUST be attached in this slot; weapon MUST come with default attachments with this slot filled in
        Scale = 1, -- scale applied to attachments in this slot
    }
}

att.AttachFunc = function(wep)
end

att.DetachFunc = function(wep)
end

ACT3_LoadAttachment(att)