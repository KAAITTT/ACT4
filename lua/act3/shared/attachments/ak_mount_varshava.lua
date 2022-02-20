local att = {}

att.PrintName = "AK Varshava Scope (x3-4)"
att.Name = "ak_mount_varshava"
att.Slot = "ak_mount"
att.Description = {"Soviet 3-4x magnification scope."}
att.Icon = Material("attachments/ak_mount_scope.png")

att.BodygroupMods = {"ak_mount_scope"}

att.IsSight = false
att.SightOffsetPos = Vector(0, 0, 0)
att.SightOffsetAng = Angle(0, 0, 0)

att.AttachFunc = function(wep)
    wep.TrueScopeImage = Material("scopes/act3/pso_style.png")
    wep.ScrollFunc = ACT3_FUNC_ZOOM
    wep.ScrollPos = 0
    wep.Magnification = 4
    wep.MaxZoom = 4
    wep.MinZoom = 3
    wep.ZoomIncrements = 5
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