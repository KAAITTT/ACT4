local att = {}

att.PrintName = "Rifle Compensator"
att.Name = "att_muzz_compensator"
att.Slot = "rifle_muzzle"
att.Description = {"-25% Recoil", "-10% Less Straight Recoil", "-10% Muzzle Velocity"}
att.Icon = Material("attachments/att_muzz_compensator.png")

att.DescColors = {ACT3.BulletColors.Positive, ACT3.BulletColors.Negative, ACT3.BulletColors.Negative}

att.WMParts = {
    {
    model = "models/weapons/act3/atts/att_compensator.mdl",
    bgs = "",
    skin = 0,
    pos = Vector(0, 0, 0),
    ang = Angle(0, 0, 0),
    }
}

att.AttachFunc = function(wep)
    wep.MuzzleVelocity = wep.MuzzleVelocity * 0.9
    wep.Recoil = wep.Recoil * 0.75
    wep.RecoilAngles = wep.RecoilAngles * 1.1
    wep.MuzzleOffset = wep.MuzzleOffset + Vector(2, 0, 0)
    wep.SoundShootPitch = wep.SoundShootPitch + 4
end

att.DetachFunc = function(wep)
    wep.MuzzleVelocity = wep.MuzzleVelocity / 0.9
    wep.Recoil = wep.Recoil / 0.75
    wep.RecoilAngles = wep.RecoilAngles / 1.1
    wep.MuzzleOffset = wep.MuzzleOffset - Vector(2, 0, 0)
    wep.SoundShootPitch = wep.SoundShootPitch - 4
end

ACT3_LoadAttachment(att)