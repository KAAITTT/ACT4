local att = {}

att.PrintName = "AUG Short Barrel"
att.Name = "aug_barrel_short"
att.Slot = "aug_barrel"
att.Description = {"+25% Fire Rate", "+25% Accuracy Recovery", "-25% Precision", "-25% Muzzle Velocity"}
att.Icon = Material("attachments/aug_barrel_short.png")

att.DescColors = {ACT3.BulletColors.Positive, ACT3.BulletColors.Positive, ACT3.BulletColors.Negative, ACT3.BulletColors.Negative}

att.BodygroupMods = {"aug_barrel_short"}

att.GivesSlots = {
    ["muzzle"] = { -- needs unique ID
        Pos = Vector(7.326, -0.332, 7.743), -- position offset for attachments in this slot
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
    wep.MuzzleOffset = wep.MuzzleOffset - Vector(10, 0, 0)

    wep.Precision = wep.Precision / 0.75
    wep.MuzzleVelocity = wep.MuzzleVelocity / 1.25
    wep.ShootingDelay = wep.ShootingDelay / 1.25
    wep.HeatDissipation = wep.HeatDissipation / 0.75
end

att.DetachFunc = function(wep)
    wep.MuzzleOffset = wep.MuzzleOffset + Vector(10, 0, 0)

    wep.Precision = wep.Precision * 0.75
    wep.MuzzleVelocity = wep.MuzzleVelocity * 1.25
    wep.ShootingDelay = wep.ShootingDelay * 1.25
    wep.HeatDissipation = wep.HeatDissipation * 0.75
end

ACT3_LoadAttachment(att)