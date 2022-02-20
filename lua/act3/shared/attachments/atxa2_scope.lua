local att = {}

att.PrintName = "ATX-A2 Integrated Scope"
att.Name = "atxa2_scope"
att.Slot = "atxa2_sight"
att.Description = {"Provides 2-12x magnification."}
att.Icon = Material("null")

att.IsSight = false
att.SightOffsetPos = Vector(0, 0, 0)
att.SightOffsetAng = Vector(0, 0, 0)


att.AttachFunc = function(wep)
    wep.TrueScopeImage = Material("scopes/act3/rocketeer.png")
    wep.ScrollFunc = ACT3_FUNC_ZOOM
    wep.ScrollPos = 0
    wep.Magnification = 12
    wep.MaxZoom = 12
    wep.MinZoom = 2
    wep.ZoomIncrements = 9
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