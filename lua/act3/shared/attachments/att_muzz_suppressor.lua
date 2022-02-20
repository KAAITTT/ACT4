local att = {}

att.PrintName = "Rifle Suppressor"
att.Name = "att_muzz_suppressor"
att.Slot = "rifle_muzzle"
att.Description = {"-25% Firing Volume", "+5% Muzzle Velocity", "-10% Fire Rate", "+10% Recoil"}
att.Icon = Material("attachments/att_muzz_suppressor.png")

att.DescColors = {ACT3.BulletColors.Positive, ACT3.BulletColors.Positive, ACT3.BulletColors.Negative, ACT3.BulletColors.Negative}

att.WMParts = {
    {
    model = "models/weapons/act3/atts/att_suppressor.mdl",
    bgs = "",
    skin = 0,
    pos = Vector(0, 0, 0),
    ang = Angle(0, 0, 0),
    }
}

att.AttachFunc = function(wep)
    wep.Suppressed = true
    wep.SoundShootVol = wep.SoundShootVol * 0.75
    wep.ShootingDelay = wep.ShootingDelay * 1.1
    wep.MuzzleVelocity = wep.MuzzleVelocity * 1.05
    wep.Recoil = wep.Recoil * 1.1
    wep.MuzzleOffset = wep.MuzzleOffset + Vector(6, 0, 0)
end

att.DetachFunc = function(wep)
    wep.Suppressed = false
    wep.SoundShootVol = wep.SoundShootVol / 0.75
    wep.ShootingDelay = wep.ShootingDelay / 1.1
    wep.MuzzleVelocity = wep.MuzzleVelocity / 1.05
    wep.Recoil = wep.Recoil / 1.1
    wep.MuzzleOffset = wep.MuzzleOffset - Vector(6, 0, 0)
end

ACT3_LoadAttachment(att)