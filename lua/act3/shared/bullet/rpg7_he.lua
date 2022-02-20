local bullet = table.Copy(ACT3.BulletBase)

bullet.Name = "rpg7_he" -- the bullet's code name
bullet.PrintName = "RPG-7 HE Rocket" -- the displayed bullet name
bullet.Type = "HE"

bullet.Description = ACT3.Descriptions.HE -- {"line1", "line2"...}

bullet.Calibre = "rpg7" -- determines what types of magazines this bullet can fit in

bullet.CaseEffect = "" -- the visual shell ejection effect of the bullet

bullet.Num = 1 -- how many bullets are fired

bullet.Projectile = "act3_proj_rpg7_he" -- name of projectile entity
bullet.ProjectileForce = 50000 -- force at which projectile will be fired
bullet.ProjectileAngles = Angle(0, 90, 0) -- angle offset of projectile

bullet.GiveCount = 2

ACT3_LoadBullet(bullet)