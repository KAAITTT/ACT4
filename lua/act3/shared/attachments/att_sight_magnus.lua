local att = {}

att.PrintName = "Magnus 5v10"
att.Name = "att_sight_magnus"
att.Slot = "sight"
att.Description = {"Mid-long range DMR optic.", "Provides 5-10x magnification."}
att.Icon = Material("attachments/att_sight_magnus.png")

att.WMParts = {
    {
    model = "models/weapons/act3/atts/att_magnusscope.mdl",
    bgs = "",
    skin = 0,
    pos = Vector(0, 0, 0),
    ang = Angle(0, 0, 0),
    }
}

att.IsSight = true
att.SightOffsetPos = Vector(0, 0, 0)
att.SightOffsetAng = Angle(0, 0, 0)


att.AttachFunc = function(wep)
    wep.TrueScopeImage = Material("scopes/act3/g36.png")
    wep.ScrollFunc = ACT3_FUNC_ZOOM
    wep.ScrollPos = 0
    wep.Magnification = 10
    wep.MaxZoom = 10
    wep.MinZoom = 5
    wep.ZoomIncrements = 10
end

att.DetachFunc = function(wep)
    local orig = weapons.Get(wep:GetClass())
    wep.TrueScopeImage = orig.TrueScopeImage
    wep.ScrollFunc = orig.ScrollFunc
    wep.MaxZoom = orig.MaxZoom
    wep.MinZoom = orig.MinZoom
    wep.ZoomIncrements = orig.ZoomIncrements
    wep.Magnification = orig.Magnification
end

ACT3_LoadAttachment(att)