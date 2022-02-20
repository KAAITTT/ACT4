local att = {}

att.PrintName = "AK Short Barrel"
att.Name = "ak_barrel_short"
att.Slot = "ak_barrel"
att.Description = {"+25% Fire Rate", "+25% Accuracy Recovery", "-25% Precision", "-25% Muzzle Velocity"}
att.DescColors = {ACT3.BulletColors.Positive, ACT3.BulletColors.Positive, ACT3.BulletColors.Negative, ACT3.BulletColors.Negative}
att.Icon = Material("attachments/ak_barrel_short.png")

att.BodygroupMods = {"ak_barrel_short"}

att.GivesSlots = {
    ["muzzle"] = { -- needs unique ID
        Pos = Vector(14.012, 0, 7.052), -- position offset for attachments in this slot
        Ang = Angle(0, 0, 0), -- angle offset
        Type = "rifle_muzzle", -- type of attachments this slot can take
        PrintName = "Muzzle", -- name this slot shows
        Installed = nil, -- which attachment is actually installed in this slot
        Required = false, -- whether something MUST be attached in this slot; weapon MUST come with default attachments with this slot filled in
        Scale = 1, -- scale applied to attachments in this slot
    }
}

att.AttachFunc = function(wep)
    wep.MuzzleOffset = wep.MuzzleOffset - Vector(9, 0, 0)
    wep.TrueIronsPos = Vector(-0.04, 9.77, -10.19)
    wep.TrueIronsAng = Vector(2.806, 0, 0)

    wep.Precision = wep.Precision / 0.75
    wep.MuzzleVelocity = wep.MuzzleVelocity / 1.25
    wep.ShootingDelay = wep.ShootingDelay / 1.25
    wep.HeatDissipation = wep.HeatDissipation / 0.75
end

att.DetachFunc = function(wep)
    local orig = weapons.Get(wep:GetClass())

    wep.MuzzleOffset = wep.MuzzleOffset + Vector(9, 0, 0)
    wep.TrueIronsPos = orig.TrueIronsPos
    wep.TrueIronsAng = orig.TrueIronsAng

    wep.Precision = wep.Precision * 0.75
    wep.MuzzleVelocity = wep.MuzzleVelocity * 1.25
    wep.ShootingDelay = wep.ShootingDelay * 1.25
    wep.HeatDissipation = wep.HeatDissipation * 0.75
end

ACT3_LoadAttachment(att)