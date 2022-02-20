local att = {}

att.PrintName = "C96 Carbine Barrel"
att.Name = "c96_barrel_carbine"
att.Slot = "c96_barrel"
att.Description = {"+25% Precision", "+25% Muzzle Velocity", "-25% Fire Rate", "-25% Accuracy Recovery"}
att.Icon = Material("attachments/c96_barrel_carbine.png")

att.DescColors = {ACT3.BulletColors.Positive, ACT3.BulletColors.Positive, ACT3.BulletColors.Negative, ACT3.BulletColors.Negative}

att.BodygroupMods = {"c96_barrel_carbine"}

att.AttachFunc = function(wep)
    wep.MuzzleOffset = Vector(17.902, 0.939, -5.146)
    wep.TrueIronsPos = Vector(1.22, 0, -5.2)
    wep.TrueIronsAng = Vector(0.852, 0.841, 0)

    wep.HoldtypeSights = "ar2"
    wep.HoldtypeHip = "pistol"
    wep.HoldtypePassive = "passive"

    wep.Precision = wep.Precision * 0.75
    wep.MuzzleVelocity = wep.MuzzleVelocity * 1.25
    wep.ShootingDelay = wep.ShootingDelay * 1.25
    wep.HeatDissipation = wep.HeatDissipation * 0.75
    wep.Sway = wep.Sway * 0.5
    wep.Recoil = wep.Recoil * 0.5
end

att.DetachFunc = function(wep)
    local orig = weapons.Get(wep:GetClass())
    wep.MuzzleOffset = orig.MuzzleOffset
    wep.TrueIronsPos = orig.TrueIronsPos
    wep.TrueIronsAng = orig.TrueIronsAng

    wep.HoldtypeSights = "revolver"
    wep.HoldtypeHip = "pistol"
    wep.HoldtypePassive = "normal"

    wep.Precision = wep.Precision / 0.75
    wep.MuzzleVelocity = wep.MuzzleVelocity / 1.25
    wep.ShootingDelay = wep.ShootingDelay / 1.25
    wep.HeatDissipation = wep.HeatDissipation / 0.75
    wep.Sway = wep.Sway / 0.5
    wep.Recoil = wep.Recoil / 0.5
end

ACT3_LoadAttachment(att)