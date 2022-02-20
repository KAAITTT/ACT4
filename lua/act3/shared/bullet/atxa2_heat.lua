local bullet = table.Copy(ACT3.BulletBase)

bullet.Name = "atxa2_heat" -- the bullet's code name
bullet.PrintName = "ATXA2 HEAT Rocket" -- the displayed bullet name
bullet.Type = "HEAT"

bullet.Description = ACT3.Descriptions.HEAT -- {"line1", "line2"...}

bullet.Calibre = "atxa2" -- determines what types of magazines this bullet can fit in

bullet.CaseEffect = "" -- the visual shell ejection effect of the bullet

bullet.Num = 1 -- how many bullets are fired

bullet.Projectile = "act3_proj_atx_heat" -- name of projectile entity
bullet.ProjectileForce = 1000 -- force at which projectile will be fired
bullet.ProjectileAngles = Angle(0, 0, 0) -- angle offset of projectile

bullet.GiveCount = 1

ACT3_LoadBullet(bullet)