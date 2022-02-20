local att = {}

att.PrintName = "Micron T-I"
att.Name = "att_sight_micron_p"
att.Slot = "sight_pistol"
att.Description = {"Micro holographic sight.", "Red dot sight."}
att.Icon = Material("attachments/att_sight_micron.png")

att.ExcludeFlags = {"prailinstalled"}
att.GivesFlags = {"rdsinstalled"}

att.InvAtt = "att_sight_micron"

att.WMParts = {
    {
    model = "models/weapons/act3/atts/att_sight_micron.mdl",
    bgs = "",
    skin = 0,
    scale = 1,
    pos = Vector(1, 0, 0),
    ang = Angle(0, 0, 0),
    }
}

att.IsSight = true
att.SightOffsetPos = Vector(-0.008, 11.692, -1.359)
att.SightOffsetAng = Angle(0, 0, 0)

att.AttachFunc = function(wep)
    wep.Magnification = 1.0
    wep.HolosightImage = Material("reticles/act3_dot.png")
    wep.HolosightSize = 64
    wep.HolosightColor = Color(225, 10, 10)

    wep.ScrollFunc = ACT3_FUNC_HOLOSIGHT
    wep.ScrollPos = 1

    wep.HolosightTable = {
        {
        Image = Material("reticles/act3_dot.png"),
        Color = Color(225, 10, 10),
        Size = 64
        },
        {
        Image = Material("reticles/act3_dot.png"),
        Color = Color(10, 225, 10),
        Size = 64
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