local bullet = table.Copy(ACT3.BulletBase)

bullet.Name = "cangun_sodacan" -- the bullet's code name
bullet.PrintName = "Soda Can" -- the displayed bullet name
bullet.Type = "CAN"

bullet.Description = {"Soda can, stuffed into a 40mm shell."} -- {"line1", "line2"...}

bullet.Calibre = "40mm" -- determines what types of magazines this bullet can fit in

bullet.CaseEffect = "act3_case_40mm" -- the visual shell ejection effect of the bullet

bullet.Num = 1 -- how many bullets are fired

bullet.Projectile = "act3_proj_cangun_sodacan" -- name of projectile entity
bullet.ProjectileForce = 4000 -- force at which projectile will be fired
bullet.ProjectileAngles = Angle(90, 0, 0) -- angle offset of projectile

bullet.RandomizeBlacklist = true

ACT3_LoadBullet(bullet)