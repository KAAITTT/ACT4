local att = {}

att.PrintName = "ATX-A2 FLIR Scope"
att.Name = "atxa2_flir"
att.Slot = "atxa2_sight"
att.Description = {"Infrared imaging scope.", "Provides 2-6x magnification."}
att.Icon = Material("null")

att.IsSight = false
att.SightOffsetPos = Vector(0, 0, 0)
att.SightOffsetAng = Angle(0, 0, 0)


att.AttachFunc = function(wep)
    wep.TrueScopeImage = Material("scopes/act3/rocketeer.png")
    wep.ScrollFunc = ACT3_FUNC_ZOOM
    wep.ScrollPos = 0
    wep.Magnification = 6
    wep.MaxZoom = 6
    wep.MinZoom = 2
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