local att = {}

att.PrintName = "Hunter Compact (x3)"
att.Name = "att_sight_pscope"
att.Slot = "sight_pistol"
att.Description = {"Compact pistol scope.", "Provides 2-3x magnification."}
att.Icon = Material("attachments/att_sight_hunter.png")

att.ExcludeFlags = {"prailinstalled"}
att.GivesFlags = {"rdsinstalled"}

att.WMParts = {
    {
    model = "models/weapons/act3/atts/att_hunterscope.mdl",
    bgs = "",
    skin = 0,
    pos = Vector(0, 0.3, 0),
    ang = Angle(0, 0, 0),
    }
}

att.IsSight = true
att.SightOffsetPos = Vector(0, 0, 0)
att.SightOffsetAng = Angle(0, 0, 0)

att.RandomizeBlacklist = true -- Prohibit this attachment from being randomly given out

att.AttachFunc = function(wep)
    wep.TrueScopeImage = Material("scopes/act3/mildot.png")
    wep.ScrollFunc = ACT3_FUNC_ZOOM
    wep.ScrollPos = 0
    wep.Magnification = 3
    wep.MaxZoom = 3
    wep.MinZoom = 2
    wep.ZoomIncrements = 4
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