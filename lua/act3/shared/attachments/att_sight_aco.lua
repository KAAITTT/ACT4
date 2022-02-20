local att = {}

att.PrintName = "ACO 2-4x"
att.Name = "att_sight_aco"
att.Slot = "sight"
att.Description = {"'Advanced Combat Optic'.", "Provides 2-4x magnification."}
att.Icon = Material("attachments/att_sight_acog.png")

att.WMParts = {
    {
    model = "models/weapons/act3/atts/att_acog.mdl",
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
    wep.TrueScopeImage = Material("scopes/act3/acog.png")
    wep.ScrollFunc = ACT3_FUNC_ZOOM
    wep.ScrollPos = 0
    wep.Magnification = 4
    wep.MaxZoom = 4
    wep.MinZoom = 2
    wep.ZoomIncrements = 6
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