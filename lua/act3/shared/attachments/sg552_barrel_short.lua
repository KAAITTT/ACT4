local att = {}

att.PrintName = "SIG SG552 Barrel"
att.Name = "sg552_barrel_short"
att.Slot = "sg552_barrel"
att.Description = {"Standard SIG SG552 barrel."}
att.Icon = Material("attachments/sg552_barrel_short.png")

att.GivesSlots = {
    ["muzzle"] = { -- needs unique ID
        Pos = Vector(25.833, -0.098, 3.558), -- position offset for attachments in this slot
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