local bullet = table.Copy(ACT3.BulletBase)

bullet.Name = "25mm_cdte_heab" -- the bullet's code name
bullet.PrintName = "25mm HEAB" -- the displayed bullet name
bullet.Type = "HEAB"

bullet.Description = {"Computerized delay fuze round.", "Explodes on impact or after variable delay."} -- {"line1", "line2"...}

bullet.Calibre = "25mm_cdte" -- determines what types of magazines this bullet can fit in

bullet.CaseEffect = "act3_case_25mm" -- the visual shell ejection effect of the bullet

bullet.Num = 1 -- how many bullets are fired

bullet.Projectile = "act3_proj_25mm_cdte_heab" -- name of projectile entity
bullet.ProjectileForce = 10000 -- force at which projectile will be fired
bullet.ProjectileAngles = Angle(0, 90, 0) -- angle offset of projectile

bullet.GiveCount = 5

ACT3_LoadBullet(bullet)