local bullet = table.Copy(ACT3.BulletBase)

bullet.Name = "44mag_rat" -- the bullet's code name
bullet.PrintName = ".44 Magnum Ratshot" -- the displayed bullet name
bullet.Type = "RAT"

bullet.Description = ACT3.Descriptions.RAT -- {"line1", "line2"...}

bullet.Calibre = "44mag" -- determines what types of magazines this bullet can fit in

bullet.CaseEffect = "act3_case_44mag" -- the visual shell ejection effect of the bullet

bullet.BaseDamage = 2
bullet.HalfwayDist = 1000

bullet.Num = 24 -- how many bullets are fired

bullet.DamageMult_Materiel = 0.1 -- default: 0.75
-- damage multiplier for materiel targets, i.e. props, vehicles, robots, machines
bullet.DamageMult_AP = 0.1 -- damage multiplier to help defeat armoured targets

bullet.MuzzleVelocityMult = 0.25
bullet.AirDrag = 1.85
bullet.WaterDrag = 3

bullet.AccuracyMult = 25

bullet.SubSonic = true

bullet.RandomizeBlacklist = true

ACT3_LoadBullet(bullet)