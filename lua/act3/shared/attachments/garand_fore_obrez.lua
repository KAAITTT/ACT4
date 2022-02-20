local att = {}

att.PrintName = "Garand Foreend \"Super Obrez\""
att.Name = "garand_fore_obrez"
att.Slot = "garand_fore"
att.Description = {"Improvised cut-down Garand fore end.", "Probably makes the gun worse.", "???"}
att.Icon = Material("attachments/garand_fore_obrez.png")

att.BodygroupMods = {"garand_fore_obrez"}

att.AttachFunc = function(wep)
    wep.MuzzleOffset = wep.MuzzleOffset - Vector(13, 0, 0)

    wep.Precision = wep.Precision / 0.5
    wep.MuzzleVelocity = wep.MuzzleVelocity / 2
    wep.ShootingDelay = wep.ShootingDelay / 1.35
    wep.HeatDissipation = wep.HeatDissipation / 0.65
end

att.DetachFunc = function(wep)
    wep.MuzzleOffset = wep.MuzzleOffset + Vector(13, 0, 0)

    wep.Precision = wep.Precision * 0.5
    wep.MuzzleVelocity = wep.MuzzleVelocity * 2
    wep.ShootingDelay = wep.ShootingDelay * 1.35
    wep.HeatDissipation = wep.HeatDissipation * 0.65
end

ACT3_LoadAttachment(att)