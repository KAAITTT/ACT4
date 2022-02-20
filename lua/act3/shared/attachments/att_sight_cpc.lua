local att = {}

att.PrintName = "CPC x0"
att.Name = "att_sight_cpc"
att.Slot = "sight"
att.Description = {"'Compact Pistol Collimator'.", "Slim red triangle holo sight."}
att.Icon = Material("attachments/att_sight_cpc.png")

att.WMParts = {
    {
    model = "models/weapons/act3/atts/att_sight_cpc.mdl",
    bgs = "",
    skin = 0,
    scale = 1,
    pos = Vector(0, -0.3, -0.1),
    ang = Angle(0, 0, 0),
    }
}

att.RandomizeBlacklist = true -- Prohibit this attachment from being randomly given out

att.IsSight = true
att.SightOffsetPos = Vector(0.3, 4.543, -0.403)
att.SightOffsetAng = Angle(0, 0, 0)

att.AttachFunc = function(wep)
    wep.Magnification = 1.0
    wep.HolosightImage = Material("reticles/act3_tri.png")
    wep.HolosightSize = 48
    wep.HolosightColor = Color(255, 0, 0)
end

att.DetachFunc = function(wep)
    local orig = weapons.Get(wep:GetClass())
    wep.Magnification = orig.Magnification
    wep.HolosightImage = orig.HolosightImage
    wep.HolosightSize = orig.HolosightSize
    wep.HolosightColor = orig.HolosightColor
end

ACT3_LoadAttachment(att)