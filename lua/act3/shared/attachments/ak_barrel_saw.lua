local att = {}

att.PrintName = "AK SAW Barrel"
att.Name = "ak_barrel_saw"
att.Slot = "ak_barrel"
att.Description = {"Installs bipod.", "+10% Precision", "-10% Fire Rate"}
att.DescColors = {ACT3.BulletColors.Positive, ACT3.BulletColors.Positive, ACT3.BulletColors.Negative}
att.Icon = Material("attachments/ak_barrel_saw.png")

att.ExcludeFlags = {"bipinstalled"}
att.GivesFlags = {"nobipod"}

att.BodygroupMods = {"ak_barrel_long"}

att.GivesSlots = {
    ["muzzle"] = { -- needs unique ID
        Pos = Vector(28.005, 0, 7.052), -- position offset for attachments in this slot
        Ang = Angle(0, 0, 0), -- angle offset
        Type = "rifle_muzzle", -- type of attachments this slot can take
        PrintName = "Muzzle", -- name this slot shows
        Installed = nil, -- which attachment is actually installed in this slot
        Required = false, -- whether something MUST be attached in this slot; weapon MUST come with default attachments with this slot filled in
        Scale = 1, -- scale applied to attachments in this slot
    }
}

att.WMParts = {
    {
    model = "models/weapons/act3/atts/att_bipod.mdl",
    bgs = "",
    skin = 0,
    pos = Vector(23.505, 0, 7.052),
    ang = Angle(0, 90, 0),
    }
}

att.AttachFunc = function(wep)
    wep.MuzzleOffset = wep.MuzzleOffset + Vector(5, 0, 0)
    wep.TrueIronsPos = Vector(-0.04, 9.77, -9.851)
    wep.TrueIronsAng = Vector(1.129, 0, 0)

    wep.BipodInstalled = true

    wep.Precision = wep.Precision * 0.9
    wep.MuzzleVelocity = wep.MuzzleVelocity * 1.1
    wep.ShootingDelay = wep.ShootingDelay * 1.1
    wep.Recoil = wep.Recoil * 1.1
end

att.DetachFunc = function(wep)
    local orig = weapons.Get(wep:GetClass())

    wep.MuzzleOffset = wep.MuzzleOffset - Vector(5, 0, 0)
    wep.TrueIronsPos = orig.TrueIronsPos
    wep.TrueIronsAng = orig.TrueIronsAng

    wep.BipodInstalled = orig.bipodInstalled

    wep.Precision = wep.Precision / 0.9
    wep.MuzzleVelocity = wep.MuzzleVelocity / 1.1
    wep.ShootingDelay = wep.ShootingDelay / 1.1
    wep.Recoil = wep.Recoil / 1.1
end

ACT3_LoadAttachment(att)