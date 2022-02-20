local att = {}

att.PrintName = "ATX-A2 Heatseeking Sensor Kit"
att.Name = "atxa2_hs"
att.Slot = "atxa2_sight"
att.Description = {"Provides 1.25-2.5x magnification.", "Allows the use of Heatseeker missiles."}
att.Icon = Material("null")

att.IsSight = false
att.SightOffsetPos = Vector(0, 0, 0)
att.SightOffsetAng = Vector(0, 0, 0)


att.AttachFunc = function(wep)
    wep.TrueScopeImage = Material("scopes/act3/rocketeer.png")
    wep.ScrollFunc = ACT3_FUNC_ZOOM
    wep.ScrollPos = 0
    wep.Magnification = 2.5
    wep.MaxZoom = 2.5
    wep.MinZoom = 1.25
    wep.ZoomIncrements = 4
    wep.TrackingType = ACT3_TRACK_TYPE_FF
end

att.DetachFunc = function(wep)
    local orig = weapons.Get(wep:GetClass())
    wep.TrueScopeImage = orig.TrueScopeImage
    wep.ScrollFunc = orig.ScrollFunc
    wep.MaxZoom = orig.MaxZoom
    wep.MinZoom = orig.MinZoom
    wep.ZoomIncrements = orig.ZoomIncrements
    wep.Magnification = orig.Magnification
    wep.TrackingType = orig.TrackingType
end

ACT3_LoadAttachment(att)