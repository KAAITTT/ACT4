local att = {}

att.PrintName = "Barrel Extender"
att.Name = "att_muzz_extender"
att.Slot = "pistol_muzzle"
att.Description = {"+25% Precision", "+25% Muzzle Velocity", "-10% Fire Rate", "-15% Heat Dissipation"}
att.Icon = Material("attachments/att_muzz_extender.png")

att.DescColors = {ACT3.BulletColors.Positive, ACT3.BulletColors.Positive, ACT3.BulletColors.Negative, ACT3.BulletColors.Negative}

att.WMParts = {
    {
    model = "models/weapons/act3/atts/att_barrelextender.mdl",
    bgs = "",
    skin = 0,
    pos = Vector(0, 0, 0),
    ang = Angle(0, 0, 0),
    }
}

att.AttachFunc = function(wep)
    wep.Precision = wep.Precision * 0.75
    wep.HeatDissipation = wep.HeatDissipation * 0.85
    wep.ShootingDelay = wep.ShootingDelay * 1.1
    wep.MuzzleVelocity = wep.MuzzleVelocity * 1.25
    wep.MuzzleOffset = wep.MuzzleOffset + Vector(9, 0, 0)
    wep.SoundShootPitch = wep.SoundShootPitch - 7
end

att.DetachFunc = function(wep)
    local orig = weapons.Get(wep:GetClass())
    wep.MuzzleOffset = orig.MuzzleOffset
    wep.Precision = wep.Precision / 0.75
    wep.HeatDissipation = wep.HeatDissipation / 0.85
    wep.ShootingDelay = wep.ShootingDelay / 1.1
    wep.MuzzleVelocity = wep.MuzzleVelocity / 1.25
    wep.SoundShootPitch = wep.SoundShootPitch + 7
end

ACT3_LoadAttachment(att)