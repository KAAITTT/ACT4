local att = {}

att.PrintName = "Mainpoint CCO"
att.Name = "att_sight_mainpoint"
att.Slot = "sight"
att.Description = {"'Close Combat Optic'.", "Provides unmagnified red/green dot with or without ring."}
att.Icon = Material("attachments/att_sight_mainpoint.png")

att.WMParts = {
    {
    model = "models/weapons/act3/atts/att_sight_mainpoint.mdl",
    bgs = "",
    skin = 0,
    pos = Vector(0, -0.35, -0.5),
    ang = Angle(0, 0, 0),
    }
}

att.IsSight = true
att.SightOffsetPos = Vector(0.35, 6.138, -1.224 + 0.5)
att.SightOffsetAng = Angle(0, 0, 0)

att.AttachFunc = function(wep)
    wep.Magnification = 1.25
    wep.HolosightImage = Material("reticles/act3_dot.png")
    wep.HolosightSize = 32
    wep.HolosightColor = Color(255, 50, 50)
    wep.ScrollFunc = ACT3_FUNC_HOLOSIGHT
    wep.ScrollPos = 1

    wep.HolosightTable = {
        {
        Image = Material("reticles/act3_dot.png"),
        Color = Color(255, 50, 50),
        Size = 32
        },
        {
        Image = Material("reticles/act3_dot.png"),
        Color = Color(50, 255, 50),
        Size = 32
        },
        {
        Image = Material("reticles/act3_ring.png"),
        Color = Color(255, 50, 50),
        Size = 32
        },
        {
        Image = Material("reticles/act3_ring.png"),
        Color = Color(50, 255, 50),
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