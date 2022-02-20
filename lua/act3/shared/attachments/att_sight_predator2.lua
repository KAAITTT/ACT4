local att = {}

att.PrintName = "Predator \"Cold Fear\""
att.Name = "att_sight_predator2"
att.Slot = "sight"
att.Description = {"Alternate version of the Predator scope.", "Provides 1-3x magnification.", "WHOT version."}
att.Icon = Material("attachments/att_sight_predator.png")

att.WMParts = {
    {
    model = "models/weapons/act3/atts/att_predatorscope.mdl",
    bgs = "",
    skin = 0,
    pos = Vector(-2, 0, 0),
    ang = Angle(0, 0, 0),
    }
}

att.IsSight = true
att.SightOffsetPos = Vector(0, 0, 0)
att.SightOffsetAng = Angle(0, 0, 0)

att.RandomizeBlacklist = true -- Prohibit this attachment from being randomly given out

att.AttachFunc = function(wep)
    wep.TrueScopeImage = Material("scopes/act3/thermal.png")
    wep.ScrollFunc = ACT3_FUNC_ZOOM
    wep.ScrollPos = 0
    wep.Magnification = 3
    wep.MaxZoom = 3
    wep.MinZoom = 1
    wep.ZoomIncrements = 8

    wep.ThermalVision = true
    wep.ThermalVisionTexture = Material("pp/texturize/plain.png")
end

att.DetachFunc = function(wep)
    local orig = weapons.Get(wep:GetClass())
    wep.TrueScopeImage = orig.TrueScopeImage
    wep.ScrollFunc = orig.ScrollFunc
    wep.MaxZoom = orig.MaxZoom
    wep.MinZoom = orig.MinZoom
    wep.ZoomIncrements = orig.ZoomIncrements
    wep.Magnification = orig.Magnification

    wep.ThermalVision = orig.ThermalVision
    wep.ThermalVisionTexture = orig.ThermalVisionTexture
end

ACT3_LoadAttachment(att)