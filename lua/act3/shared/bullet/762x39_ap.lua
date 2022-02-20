local bullet = table.Copy(ACT3.BulletBase)

bullet.Name = "762x39_ap" -- the bullet's code name
bullet.PrintName = "7.62x39mm AP" -- the displayed bullet name
bullet.Type = "AP"

bullet.Description = ACT3.Descriptions.AP -- {"line1", "line2"...}

bullet.Calibre = "762x39" -- determines what types of magazines this bullet can fit in

bullet.CaseEffect = "act3_case_762x39" -- the visual shell ejection effect of the bullet

bullet.BaseDamage = 35
bullet.HalfwayDist = 40000

bullet.MuzzleVelocityMult = 1.1

bullet.Num = 1 -- how many bullets are fired

bullet.DamageMult_Headshot = 2
bullet.DamageMult_Materiel = 1.25 -- default: 0.75
-- damage multiplier for materiel targets, i.e. props, vehicles, robots, machines
bullet.DamageMult_AP = 1.25 -- damage multiplier to help defeat armoured targets

bullet.AirDrag = 1
bullet.WaterDrag = 2.15



ACT3_LoadBullet(bullet)