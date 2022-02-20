local att = {}

att.PrintName = "Hunter 4x8"
att.Name = "att_sight_hunter"
att.Slot = "sight"
att.Description = {"Long-range hunting scope.", "Provides 4-8x magnification."}
att.Icon = Material("attachments/att_sight_hunter.png")

att.WMParts = {
    {
    model = "models/weapons/act3/atts/att_hunterscope.mdl",
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
    wep.TrueScopeImage = Material("scopes/act3/mildot.png")
    wep.ScrollFunc = ACT3_FUNC_ZOOM
    wep.ScrollPos = 0
    wep.Magnification = 8
    wep.MaxZoom = 8
    wep.MinZoom = 4
    wep.ZoomIncrements = 8
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