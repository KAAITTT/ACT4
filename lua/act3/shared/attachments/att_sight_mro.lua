local att = {}

att.PrintName = "TacticsPoint MRO"
att.Name = "att_sight_mro"
att.Slot = "sight"
att.Description = {"Multi-reticle reflex sight.", "Provides five reticles to choose from."}
att.Icon = Material("attachments/att_sight_mro.png")

att.WMParts = {
    {
    model = "models/weapons/act3/atts/att_sight_mrs.mdl",
    bgs = "",
    skin = 0,
    pos = Vector(0, -0.25, 0),
    ang = Angle(0, 0, 0),
    }
}

att.IsSight = true
att.SightOffsetPos = Vector(0.325, 8.687, -1.614)
att.SightOffsetAng = Angle(0, 0, 0)

att.AttachFunc = function(wep)
    wep.Magnification = 1.25
    wep.HolosightImage = Material("reticles/act3_dot.png")
    wep.HolosightSize = 24
    wep.HolosightColor = Color(255, 50, 50)
    wep.ScrollFunc = ACT3_FUNC_HOLOSIGHT
    wep.ScrollPos = 1

    wep.HolosightTable = {
        {
        Image = Material("reticles/act3_dot.png"),
        Color = Color(255, 50, 50),
        Size = 24
        },
        {
        Image = Material("reticles/act3_dot.png"),
        Color = Color(255, 50, 50),
        Size = 32
        },
        {
        Image = Material("reticles/act3_dot.png"),
        Color = Color(255, 50, 50),
        Size = 64
        },
        {
        Image = Material("reticles/act3_ecross.png"),
        Color = Color(255, 50, 50),
        Size = 32
        },
        {
        Image = Material("reticles/act3_cross.png"),
        Color = Color(255, 50, 50),
        Size = 32
        },
    }
end

att.DetachFunc = function(wep)
    local orig = weapons.Get(wep:GetClass())
    wep.Magnification = orig.Magnification
    wep.HolosightImage = orig.HolosightImage
    wep.HolosightSize = orig.HolosightSize
    wep.HolosightColor = orig.HolosightColor
    wep.ScrollFunc = orig.ScrollFunc
    wep.ScrollPos = orig.ScrollPos

    wep.HolosightTable = orig.HolosightTable
end

ACT3_LoadAttachment(att)