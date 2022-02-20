local bullet = table.Copy(ACT3.BulletBase)

bullet.Name = "40mm_flash" -- the bullet's code name
bullet.PrintName = "40mm Stun" -- the displayed bullet name
bullet.Type = "STUN"

bullet.Description = ACT3.Descriptions.STUN -- {"line1", "line2"...}

bullet.Calibre = "40mm" -- determines what types of magazines this bullet can fit in

bullet.CaseEffect = "act3_case_40mm" -- the visual shell ejection effect of the bullet

bullet.Num = 1 -- how many bullets are fired

bullet.Projectile = "act3_proj_40mm_flash" -- name of projectile entity
bullet.ProjectileForce = 8000 -- force at which projectile will be fired
bullet.ProjectileAngles = Angle(0, 90, 0) -- angle offset of projectile

bullet.GiveCount = 4

bullet.RandomizeBlacklist = true

ACT3_LoadBullet(bullet)