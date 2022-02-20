local att = {}

att.PrintName = "Rifle Muzzle Brake"
att.Name = "att_muzz_brake"
att.Slot = "rifle_muzzle"
att.Description = {"-10% Recoil", "-5% Less Straight Recoil", "-5% Muzzle Velocity", "+20% Volume"}
att.Icon = Material("attachments/att_muzz_brake.png")

att.DescColors = {ACT3.BulletColors.Positive, ACT3.BulletColors.Negative, ACT3.BulletColors.Negative, ACT3.BulletColors.Negative}

att.WMParts = {
    {
    model = "models/weapons/act3/atts/att_muzzlebrake.mdl",
    bgs = "",
    skin = 0,
    scale = 1.5,
    pos = Vector(2, 0, 0),
    ang = Angle(0, 0, 0),
    }
}

att.AttachFunc = function(wep)
    wep.MuzzleVelocity = wep.MuzzleVelocity * 0.95
    wep.Recoil = wep.Recoil * 0.9
    wep.HiddenSoundShootVol = wep.SoundShootVol * 1.2
    wep.SoundShootVol = math.Clamp(wep.HiddenSoundShootVol, 0, 150)
    wep.RecoilAngles = wep.RecoilAngles * 1.05
    wep.MuzzleOffset = wep.MuzzleOffset + Vector(2, 0, 0)
    wep.SoundShootPitch = wep.SoundShootPitch - 8
end

att.DetachFunc = function(wep)
    wep.MuzzleVelocity = wep.MuzzleVelocity / 0.95
    wep.Recoil = wep.Recoil / 0.9
    wep.SoundShootVol = (wep.HiddenSoundShootVol or wep.SoundShootVol) / 1.2
    wep.HiddenSoundShootVol = (wep.HiddenSoundShootVol or wep.SoundShootVol) / 1.2
    wep.RecoilAngles = wep.RecoilAngles / 1.05
    wep.MuzzleOffset = wep.MuzzleOffset - Vector(2, 0, 0)
    wep.SoundShootPitch = wep.SoundShootPitch + 8
end

ACT3_LoadAttachment(att)