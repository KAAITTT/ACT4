local att = {}

att.PrintName = "Garand 4x Scope"
att.Name = "garand_scope"
att.Slot = "garand_scope"
att.Description = {"WW2-era single-magnification scope."}
att.Icon = Material("attachments/garand_scope.png")

att.BodygroupMods = {"garand_scope"}

att.AttachFunc = function(wep)
    wep.TrueScopeImage = Material("scopes/act3/garand.png")
    wep.ScrollFunc = ACT3_FUNC_NONE
    wep.ScrollPos = 0
    wep.Magnification = 4
    wep.MaxZoom = 4
    wep.MinZoom = 4
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