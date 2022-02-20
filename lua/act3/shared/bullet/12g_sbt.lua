local bullet = table.Copy(ACT3.BulletBase)

bullet.Name = "12g_sbt" -- the bullet's code name
bullet.PrintName = "12 Gauge SBT" -- the displayed bullet name
bullet.Type = "SBT"

bullet.Description = ACT3.Descriptions.SBT

bullet.Calibre = "12g" -- determines what types of magazines this bullet can fit in

bullet.CaseEffect = "act3_case_12g_flec" -- the visual shell ejection effect of the bullet

bullet.BaseDamage = 40
bullet.HalfwayDist = 8000

bullet.Num = 1

bullet.Projectile = false -- name of projectile entity
bullet.ProjectileForce = 0 -- force at which projectile will be fired
bullet.ProjectileAngles = Vector(0, 0, 0) -- angle offset of projectile

bullet.AccuracyMult = 0.15 -- weapon accuracy multiplier
bullet.RecoilMult = 1 -- weapon recoil multiplier

-- these damage multipliers are for if you 
bullet.DamageMult_Headshot = 1.5 -- default: 1
bullet.DamageMult_Torso = 1 -- default: 1
bullet.DamageMult_Limbs = 1 -- default: 1
bullet.DamageMult_Materiel = 0.75 -- default: 0.75
-- damage multiplier for materiel targets, i.e. props, vehicles, robots, machines
bullet.DamageMult_AP = 0.65 -- damage multiplier to help defeat armoured targets

bullet.IncendiaryFactor = 0 -- incendiary factor is used either to determine the size of the fireball created on impact or the chance of igniting a materiel target.

bullet.MuzzleVelocityMult = 2
bullet.AirDrag = 1
bullet.WaterDrag = 2.75

bullet.PitchMod = 1 -- multiplies the pitch of the gun
bullet.VolMod = 1 -- multiplies the vol of the gun (sound distance)

bullet.DamageType = DMG_BULLET -- damage type of bullet



ACT3_LoadBullet(bullet)