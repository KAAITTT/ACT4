local att = {}

att.PrintName = "C96 DL-44 Barrel"
att.Name = "c96_barrel_dl44"
att.Slot = "c96_barrel"
att.Description = {"+200% Muzzle Velocity", "+50% Precision", "-75% Fire Rate", "Cool sound."}
att.Icon = Material("attachments/c96_barrel_dl44.png")

att.DescColors = {ACT3.BulletColors.Positive, ACT3.BulletColors.Positive, ACT3.BulletColors.Negative, ACT3.BulletColors.Neutral}

att.BodygroupMods = {"c96_barrel_dl44"}

att.AttachFunc = function(wep)
    wep.MuzzleOffset = Vector(10.993, 0, -4.387)
    wep.TrueIronsPos = Vector(1.338, 0, -5.361)
    wep.TrueIronsAng = Vector(2.299, 2.065, 0)

    wep.Precision = wep.Precision / 0.5
    wep.MuzzleVelocity = wep.MuzzleVelocity * 2
    wep.ShootingDelay = wep.ShootingDelay / 0.25
    wep.SoundShoot = "act3/weapons/dl44/fire.wav"
end

att.DetachFunc = function(wep)
    local orig = weapons.Get(wep:GetClass())
    wep.MuzzleOffset = orig.MuzzleOffset
    wep.TrueIronsPos = orig.TrueIronsPos
    wep.TrueIronsAng = orig.TrueIronsAng

    wep.Precision = wep.Precision * 0.5
    wep.MuzzleVelocity = wep.MuzzleVelocity / 2
    wep.ShootingDelay = wep.ShootingDelay * 0.25
    wep.SoundShoot = orig.SoundShoot
end

ACT3_LoadAttachment(att)