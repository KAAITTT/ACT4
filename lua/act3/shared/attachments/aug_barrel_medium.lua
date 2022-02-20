local att = {}

att.PrintName = "AUG Medium Barrel"
att.Name = "aug_barrel_medium"
att.Slot = "aug_barrel"
att.Description = {"+15% Fire Rate", "+15% Accuracy Recovery", "-15% Precision", "-15% Muzzle Velocity"}
att.Icon = Material("attachments/aug_barrel_medium.png")

att.DescColors = {ACT3.BulletColors.Positive, ACT3.BulletColors.Positive, ACT3.BulletColors.Negative, ACT3.BulletColors.Negative}

att.BodygroupMods = {"aug_barrel_med"}

att.GivesSlots = {
    ["muzzle"] = { -- needs unique ID
        Pos = Vector(12.326, -0.332, 7.743), -- position offset for attachments in this slot
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
    wep.MuzzleOffset = wep.MuzzleOffset - Vector(5, 0, 0)

    wep.Precision = wep.Precision / 0.85
    wep.MuzzleVelocity = wep.MuzzleVelocity / 1.15
    wep.ShootingDelay = wep.ShootingDelay / 1.15
    wep.HeatDissipation = wep.HeatDissipation / 0.85
end

att.DetachFunc = function(wep)
    wep.MuzzleOffset = wep.MuzzleOffset + Vector(5, 0, 0)

    wep.Precision = wep.Precision * 0.85
    wep.MuzzleVelocity = wep.MuzzleVelocity * 1.15
    wep.ShootingDelay = wep.ShootingDelay * 1.15
    wep.HeatDissipation = wep.HeatDissipation * 0.85
end

ACT3_LoadAttachment(att)