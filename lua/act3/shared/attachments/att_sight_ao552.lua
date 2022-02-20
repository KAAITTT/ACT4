local att = {}

att.PrintName = "AO-552"
att.Name = "att_sight_ao552"
att.Slot = "sight"
att.Description = {"Boxy holographic sight.", "American classic sight. One reticle.", "Provides up to 2x magnification."}
att.Icon = Material("attachments/att_sight_ao552.png")

att.WMParts = {
    {
    model = "models/weapons/act3/atts/att_sight_eo552.mdl",
    bgs = "",
    skin = 0,
    scale = 0.75,
    pos = Vector(0, -0.35, 0),
    ang = Angle(0, 180, 0),
    }
}

att.IsSight = true
att.SightOffsetPos =  Vector(0.35, 9.8, -1)
att.SightOffsetAng = Angle(0, 0, 0)

att.AttachFunc = function(wep)
    wep.Magnification = 1.25
    wep.HolosightImage = Material("reticles/act3_eotech.png")
    wep.HolosightSize = 48
    wep.HolosightColor = Color(225, 10, 10)
    wep.ScrollFunc = ACT3_FUNC_ZOOM
    wep.ScrollPos = 1
    wep.MaxZoom = 2
    wep.MinZoom = 1.25
    wep.ZoomIncrements = 2
end

att.DetachFunc = function(wep)
    local orig = weapons.Get(wep:GetClass())
    wep.Magnification = orig.Magnification
    wep.HolosightImage = orig.HolosightImage
    wep.HolosightSize = orig.HolosightSize
    wep.HolosightColor = orig.HolosightColor
    wep.ScrollFunc = orig.ScrollFunc
    wep.MaxZoom = orig.MaxZoom
    wep.MinZoom = orig.MinZoom
    wep.ZoomIncrements = orig.ZoomIncrements
    wep.Magnification = orig.Magnification
end

ACT3_LoadAttachment(att)