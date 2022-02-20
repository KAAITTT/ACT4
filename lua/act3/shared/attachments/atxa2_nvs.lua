local att = {}

att.PrintName = "ATX-A2 NV Scope"
att.Name = "atxa2_nvs"
att.Slot = "atxa2_sight"
att.Description = {"Night vision combat scope.", "Provides 3x magnification."}
att.Icon = Material("null")

att.IsSight = false
att.SightOffsetPos = Vector(0, 0, 0)
att.SightOffsetAng = Angle(0, 0, 0)


att.AttachFunc = function(wep)
    wep.TrueScopeImage = Material("scopes/act3/rocketeer.png")
    wep.ScrollFunc = ACT3_FUNC_NIGHTSCOPE
    wep.Magnification = 3
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
    wep.NightScope = orig.NightScope
    wep.NightScopeStrength = orig.NightScopeStrength
    wep.NightScopeMaxStrength = orig.NightScopeMaxStrength
    wep.NightScopeContrast = orig.NightScopeContrast
    wep.NightScopeMaxContrast = orig.NightScopeMaxContrast
    wep.NightScopeIncrements = orig.NightScopeIncrements
    wep.Magnification = orig.Magnification
end

ACT3_LoadAttachment(att)