local att = {}

att.PrintName = "StG 44 x7 Sniper Scope"
att.Name = "stg_sniperscope"
att.Slot = "stg_mount"
att.Description = {"WW2-era single-magnification scope.", "7x magnification."}
att.Icon = Material("attachments/stg_sniperscope.png")

att.BodygroupMods = {"stg44_sniperscope"}

att.AttachFunc = function(wep)
    wep.TrueScopeImage = Material("scopes/act3/simple.png")
    wep.ScrollFunc = ACT3_FUNC_NONE
    wep.ScrollPos = 0
    wep.Magnification = 7
    wep.MaxZoom = 7
    wep.MinZoom = 7
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