local att = {}

att.PrintName = "C96 SRT Scope (3-4x)"
att.Name = "c96_scope"
att.Slot = "c96_scope"
att.Description = {"Short-range tactical C96 scope."}
att.Icon = Material("attachments/c96_scope.png")

att.BodygroupMods = {"c96_scope"}

att.AttachFunc = function(wep)
    wep.TrueScopeImage = Material("scopes/act3/simple.png")
    wep.ScrollFunc = ACT3_FUNC_ZOOM
    wep.ScrollPos = 0
    wep.Magnification = 4
    wep.MaxZoom = 4
    wep.MinZoom = 3
    wep.ZoomIncrements = 3
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