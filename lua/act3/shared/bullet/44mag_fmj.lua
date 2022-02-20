local bullet = table.Copy(ACT3.BulletBase)

bullet.Name = "44mag_fmj" -- the bullet's code name
bullet.PrintName = ".44 Magnum FMJ" -- the displayed bullet name
bullet.Type = "FMJ"

bullet.Description = ACT3.Descriptions.FMJ -- {"line1", "line2"...}

bullet.Calibre = "44mag" -- determines what types of magazines this bullet can fit in

bullet.CaseEffect = "act3_case_44mag" -- the visual shell ejection effect of the bullet

bullet.BaseDamage = 50
bullet.HalfwayDist = 4500

bullet.Num = 1 -- how many bullets are fired

bullet.DamageMult_Materiel = 1.1 -- default: 0.75
-- damage multiplier for materiel targets, i.e. props, vehicles, robots, machines
bullet.DamageMult_AP = 0.9 -- damage multiplier to help defeat armoured targets

bullet.MuzzleVelocityMult = 1
bullet.AirDrag = 1.1
bullet.WaterDrag = 2.85

ACT3_LoadBullet(bullet)