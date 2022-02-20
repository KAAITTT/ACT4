local att = {}

att.PrintName = "Pistol Silencer"
att.Name = "att_muzz_pistol_silencer"
att.Slot = "pistol_muzzle"
att.Description = {"Makes bullets Subsonic", "-35% Firing Volume", "-10% Muzzle Velocity", "+20% Recoil"}
att.Icon = Material("attachments/att_muzz_silencer.png")

att.DescColors = {ACT3.BulletColors.Positive, ACT3.BulletColors.Positive, ACT3.BulletColors.Negative, ACT3.BulletColors.Negative}

att.WMParts = {
    {
    model = "models/weapons/act3/atts/att_silencer.mdl",
    bgs = "",
    skin = 0,
    pos = Vector(0, 0, 0),
    ang = Angle(0, 0, 0),
    }
}

att.AttachFunc = function(wep)
    wep.Suppressed = true
    wep.SubSonic = true
    wep.SoundShootVol = wep.SoundShootVol * 0.65
    wep.MuzzleVelocity = wep.MuzzleVelocity * 0.9
    wep.Recoil = wep.Recoil * 1.2
    wep.MuzzleOffset = wep.MuzzleOffset + Vector(8, 0, 0)
    wep.SoundShootPitch = wep.SoundShootPitch - 9
end

att.DetachFunc = function(wep)
    local orig = weapons.Get(wep:GetClass())
    wep.Suppressed = false
    wep.SubSonic = orig.SubSonic
    wep.SoundShootVol = wep.SoundShootVol / 0.65
    wep.MuzzleVelocity = wep.MuzzleVelocity / 0.9
    wep.Recoil = wep.Recoil / 1.2
    wep.MuzzleOffset = wep.MuzzleOffset - Vector(8, 0, 0)
    wep.SoundShootPitch = wep.SoundShootPitch + 9
end

ACT3_LoadAttachment(att)