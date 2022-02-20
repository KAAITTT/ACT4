local att = {}

att.PrintName = "K98 Gerat Scope x7"
att.Name = "k98_mount_scope"
att.Slot = "k98_mount"
att.Description = {"WW2-era single-magnification scope."}
att.Icon = Material("attachments/k98_mount_scope.png")

att.BodygroupMods = {"k98_mount_scope"}

att.AttachFunc = function(wep)
    wep.TrueScopeImage = Material("scopes/act3/simple.png")
    wep.ScrollFunc = ACT3_FUNC_NONE
    wep.ScrollPos = 0
    wep.Magnification = 6
    wep.MaxZoom = 6
    wep.MinZoom = 6
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