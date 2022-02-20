local att = {}

att.PrintName = "Scout Integral Silencer"
att.Name = "scout_barrel_sd"
att.Slot = "scout_barrel"
att.Description = {"-25% Firing Volume" , "-10% Recoil", "-30% Muzzle Velocity"}
att.DescColors = {ACT3.BulletColors.Positive, ACT3.BulletColors.Negative, ACT3.BulletColors.Negative}
att.Icon = Material("attachments/scout_barrel_sd.png")

att.BodygroupMods = {"scout_barrel_sd"}

att.AttachFunc = function(wep)
    wep.MuzzleOffset = wep.MuzzleOffset - Vector(4, 0, 0)
    wep.Suppressed = true
    wep.Subsonic = true
    wep.MuzzleVelocity = wep.MuzzleVelocity * 0.7
    wep.SoundShootVol = wep.SoundShootVol * 0.75
    wep.Recoil = wep.Recoil * 0.9
end

att.DetachFunc = function(wep)
    wep.MuzzleOffset = wep.MuzzleOffset + Vector(4, 0, 0)
    wep.Suppressed = false
    wep.Subsonic = false
    wep.MuzzleVelocity = wep.MuzzleVelocity / 0.7
    wep.SoundShootVol = wep.SoundShootVol / 0.75
    wep.Recoil = wep.Recoil / 0.9
end

ACT3_LoadAttachment(att)