local att = {}

att.PrintName = "Vampir NVS-P"
att.Name = "att_sight_vampir"
att.Slot = "sight"
att.Description = {"Night vision combat scope.", "Provides 3x magnification."}
att.Icon = Material("attachments/att_sight_vampir.png")

att.WMParts = {
    {
    model = "models/weapons/act3/atts/att_vampirscope.mdl",
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
    wep.TrueScopeImage = Material("scopes/act3/pso_style.png")
    wep.ScrollFunc = ACT3_FUNC_NIGHTSCOPE
    wep.Magnification = 3
    wep.ZoomIncrements = 9
    wep.NightScope = true
    wep.NightScopeStrength = 3000
    wep.NightScopeMaxStrength = 3000
    wep.NightScopeContrast = 3
    wep.NightScopeMaxContrast = 3
    wep.NightScopeIncrements = 16
    wep.ScrollPos = 15
end

att.DetachFunc = function(wep)
    local orig = weapons.Get(wep:GetClass())
    wep.TrueScopeImage = orig.TrueScopeImage
    wep.ScrollFunc = orig.ScrollFunc
    wep.MaxZoom = orig.MaxZoom
    wep.MinZoom = orig.MinZoom
    wep.ZoomIncrements = orig.ZoomIncrements
    wep.NightScope = orig.NightScope
    wep.NightScopeStrength = orig.NightScopeStrength
    wep.NightScopeMaxStrength = orig.NightScopeMaxStrength
    wep.NightScopeContrast = orig.NightScopeContrast
    wep.NightScopeMaxContrast = orig.NightScopeMaxContrast
    wep.NightScopeIncrements = orig.NightScopeIncrements
    wep.Magnification = orig.Magnification
end

ACT3_LoadAttachment(att)