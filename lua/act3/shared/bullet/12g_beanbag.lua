local bullet = table.Copy(ACT3.BulletBase)

bullet.Name = "12g_bean" -- the bullet's code name
bullet.PrintName = "12 Gauge Beanbag" -- the displayed bullet name
bullet.Type = "BEAN"

bullet.Description = ACT3.Descriptions.BEAN

bullet.Calibre = "12g" -- determines what types of magazines this bullet can fit in

bullet.CaseEffect = "act3_case_12g_bean" -- the visual shell ejection effect of the bullet

bullet.Num = 1

bullet.Projectile = "act3_proj_beanbag" -- name of projectile entity
bullet.ProjectileForce = 2500 -- force at which projectile will be fired
bullet.ProjectileAngles = Angle(0, 0, 0) -- angle offset of projectile

bullet.RandomizeBlacklist = true

ACT3_LoadBullet(bullet)