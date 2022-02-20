local att = {}

att.PrintName = "StG 44 x3.6 Short Scope"
att.Name = "stg_shortscope"
att.Slot = "stg_mount"
att.Description = {"WW2-era single-magnification scope.", "3.6x magnification."}
att.Icon = Material("attachments/stg_shortscope.png")

att.BodygroupMods = {"stg44_shortscope"}

att.AttachFunc = function(wep)
    wep.TrueScopeImage = Material("scopes/act3/classic.png")
    wep.ScrollFunc = ACT3_FUNC_NONE
    wep.ScrollPos = 0
    wep.Magnification = 3.6
    wep.MaxZoom = 3.6
    wep.MinZoom = 3.6
    wep.ZoomIncrements = 1
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