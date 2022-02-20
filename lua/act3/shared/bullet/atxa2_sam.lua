local bullet = table.Copy(ACT3.BulletBase)

bullet.Name = "atxa2_sam" -- the bullet's code name
bullet.PrintName = "ATXA2 Surface-Air Rocket" -- the displayed bullet name
bullet.Type = "SAM"

bullet.Description = {"Lighter missile with more powerful motor.", "Compatible with F&F Heatseeker kit."} -- {"line1", "line2"...}

bullet.Calibre = "atxa2" -- determines what types of magazines this bullet can fit in

bullet.CaseEffect = "" -- the visual shell ejection effect of the bullet

bullet.Num = 1 -- how many bullets are fired

bullet.Projectile = "act3_proj_atx_sam" -- name of projectile entity
bullet.ProjectileForce = 1000 -- force at which projectile will be fired
bullet.ProjectileAngles = Angle(0, 0, 0) -- angle offset of projectile

bullet.GiveCount = 1

bullet.RandomizeBlacklist = true

ACT3_LoadBullet(bullet)