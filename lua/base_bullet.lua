-- this default bullet can be based off of to just get common elements
local bullet = table.Copy(ACT3.BulletBase)

bullet.Name = "" -- the bullet's code name e.g. "9x19"
bullet.PrintName = "" -- the displayed bullet name e.g. "9x19mm FMJ"
bullet.Type = "" -- bullet displayed type e.g. "FMJ"

bullet.Description = {"", ""} -- {"line1", "line2"...}

bullet.Calibre = "" -- determines what types of guns this bullet can fit in
bullet.MagazineCalibre = "" -- determines the types of magazines the bullet fits in if set.
-- if MagazineCalibre is set, that is what will determine the round that fits.
-- useful for mags that can take multiple types of bullet, but which will not always fit in every gun that will take it.

bullet.CaseEffect = "" -- the visual shell ejection effect of the bullet

bullet.BaseDamage = 26 -- base damage of bullet
bullet.HalfwayDist = 14000 -- bullet will do 50% DMG at this range. Uses inverse damage dropoff curve, i.e. it isn't linear.

bullet.Projectile = "" -- name of projectile entity. Overrides bullet
bullet.ProjectileForce = 1000 -- force at which projectile will be fired
bullet.ProjectileAngles = Angle(0, 0, 0) -- angle offset of projectile

bullet.GiveCount = 24 -- how many bullets are given in a box

bullet.Num = 1 -- how many bullets are fired. 0 = blank.
bullet.DamageMult_Headshot = 1 -- extra headshot damage mult
bullet.DamageMult_Torso = 1 -- default: 1
bullet.DamageMult_Limbs = 1 -- default: 1
bullet.DamageMult_Materiel = 0.4 -- default: 0.75
-- damage multiplier for materiel targets, i.e. props, vehicles, robots, machines
bullet.DamageMult_AP = 0.75 -- damage multiplier to help defeat armoured targets

bullet.MuzzleVelocityMult = 1 -- this should be pretty obvious

bullet.AirDrag = 1 -- multipliers for air drag and water drag
bullet.WaterDrag = 2.75

bullet.DropMult = 1 -- multiplies how much the proj. is affected by drop

bullet.WindMult = 1 -- multiplies how much the projectile is affected by wind

bullet.TracerBody = Material("particle/fire") -- the "head" of the tracer
bullet.TracerTail = Material("effects/laser_tracer") -- the "tail" trail of the tracer
bullet.TracerHeadSize = 24
bullet.TracerLength = 128
bullet.TracerWidth = 12
bullet.TracerColor = Color(255, 242, 206)
bullet.Glow = true -- tracer gets bigger viewed through NVGs
bullet.TracerTPoint1 = 0.25
bullet.TracerTPoint2 = 1

bullet.Decal = nil -- decal to apply on bullet hit or nil

bullet.IncendiaryFactor = 1 -- size of vfire fireball OR chance to ignite entity

bullet.DamageType = DMG_BULLET -- damage type of bullet. DMG_BLAST kills Striders.

bullet.VolMod = 0.75 -- multiplies the vol of the gun (sound distance)
bullet.SubSonic = true -- bullet creates no sonic boom when it passes by

bullet.Tracer = "" -- custom effect tracer to use when applicable

bullet.AlwaysPhysicalBullet = false
bullet.NeverPhysicalBullet = false

bullet.RandomizeBlacklist = false -- this bullet can never be given out randomly.

bullet.OnImpact = function(att, tr, dmg)

end

bullet.OnShoot = function(dir, pos, ent)

end


ACT3_LoadBullet(bullet)