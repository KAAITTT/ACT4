local att = {}

att.PrintName = "AUG Factory Barrel"
att.Name = "aug_barrel_long"
att.Slot = "aug_barrel"
att.Description = {"Standard AUG barrel."}
att.Icon = Material("attachments/aug_barrel_long.png")

att.BodygroupMods = {"aug_barrel_long"}

att.GivesSlots = {
    ["muzzle"] = { -- needs unique ID
        Pos = Vector(17.497, -0.332, 7.743), -- position offset for attachments in this slot
        Ang = Angle(0, 0, 0), -- angle offset
        Type = "rifle_muzzle", -- type of attachments this slot can take
        PrintName = "Muzzle", -- name this slot shows
        Installed = nil, -- which attachment is actually installed in this slot
        Required = false, -- whether something MUST be attached in this slot; weapon MUST come with default attachments with this slot filled in
        Scale = 1, -- scale applied to attachments in this slot
        Randomize = true,
        RandomizeChance = 15,
    }
}

att.AttachFunc = function(wep)
end

att.DetachFunc = function(wep)
end

ACT3_LoadAttachment(att)