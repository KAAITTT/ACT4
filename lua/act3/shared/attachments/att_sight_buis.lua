local att = {}

att.PrintName = "BUIS Rear"
att.Name = "att_sight_buis"
att.Slot = "sight"
att.Description = {"Backup Iron Sight.", "Provides a backup set of simple irons."}
att.Icon = Material("attachments/att_sight_buis.png")

att.WMParts = {
    {
    model = "models/weapons/act3/atts/att_sight_buis_rear.mdl",
    bgs = "",
    skin = 0,
    pos = Vector(-3, -0.35, -0.25),
    ang = Angle(0, 0, 0),
    scale = 0.75
    }
}

att.GivesSlots = {
    ["b"] = {
        Type = "buis_fr",
        PrintName = "BUIS Front Sight",
        Installed = "att_sight_buis_front_near",
        Required = true,
        Scale = 1,
        Pos = Vector(0, 0, 0),
        Ang = Angle(0, 0, 0),
    }
}

att.IsSight = true
att.SightOffsetPos = Vector(-0.008 + 0.35, 4.842, -0.42 + 0.25)
att.SightOffsetAng = Angle(0, 0, 0)

att.AttachFunc = function(wep)
    wep.Magnification = 1.0
end

att.DetachFunc = function(wep)
    local orig = weapons.Get(wep:GetClass())
    wep.Magnification = orig.Magnification
end

ACT3_LoadAttachment(att)