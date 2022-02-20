local att = {}

att.PrintName = "MP5SD Fore"
att.Name = "mp5_fore_sd"
att.Slot = "mp5_fore"
att.Description = {"-25% Firing Volume" , "-25% Muzzle Velocity", "-5% Fire Rate"}
att.Icon = Material("attachments/mp5_fore_sd.png")

att.DescColors = {ACT3.BulletColors.Positive, ACT3.BulletColors.Negative, ACT3.BulletColors.Negative}

att.BodygroupMods = {"mp5_handguard_sd", "mp5_barrel_sd"}

att.AttachFunc = function(wep)
    wep.Suppressed = true
    wep.Subsonic = true
    wep.MuzzleVelocity = wep.MuzzleVelocity * 0.75
    wep.SoundShootVol = wep.SoundShootVol * 0.75
    wep.ShootingDelay = wep.ShootingDelay * 1.05
    wep.MuzzleOffset = wep.MuzzleOffset + Vector(6, 0, 0)
end

att.DetachFunc = function(wep)
    wep.Suppressed = false
    wep.Subsonic = false
    wep.MuzzleVelocity = wep.MuzzleVelocity / 0.75
    wep.SoundShootVol = wep.SoundShootVol / 0.75
    wep.ShootingDelay = wep.ShootingDelay / 1.05
    wep.MuzzleOffset = wep.MuzzleOffset - Vector(6, 0, 0)
end

ACT3_LoadAttachment(att)