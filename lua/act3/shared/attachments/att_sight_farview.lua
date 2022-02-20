local att = {}

att.PrintName = "Farview LRO"
att.Name = "att_sight_farview"
att.Slot = "sight"
att.Description = {"Long-range sniper optic.", "Provides 6-24x magnification."}
att.Icon = Material("attachments/att_sight_farview.png")

att.WMParts = {
    {
    model = "models/weapons/act3/atts/att_farviewscope.mdl",
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
    wep.TrueScopeImage = Material("scopes/act3/mildot_illum.png")
    wep.ScrollFunc = ACT3_FUNC_ZOOM
    wep.ScrollPos = 0
    wep.Magnification = 24
    wep.MaxZoom = 24
    wep.MinZoom = 6
    wep.ZoomIncrements = 16
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