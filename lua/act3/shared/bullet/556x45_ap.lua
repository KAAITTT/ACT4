local bullet = table.Copy(ACT3.BulletBase)

bullet.Name = "556x45_ap" -- the bullet's code name
bullet.PrintName = "5.56x45mm AP" -- the displayed bullet name
bullet.Type = "AP"

bullet.Description = ACT3.Descriptions.AP -- {"line1", "line2"...}

bullet.Calibre = "556x45" -- determines what types of magazines this bullet can fit in

bullet.CaseEffect = "act3_case_556x45" -- the visual shell ejection effect of the bullet

bullet.BaseDamage = 34 -- 5.56 tumbles in the body n shit so it does more damage
-- it isn't just about power
-- I mean just look at those ballistics gel tests
bullet.HalfwayDist = 50000

bullet.DamageMult_Head = 2
bullet.MuzzleVelocityMult = 1.1

bullet.Num = 1 -- how many bullets are fired

bullet.DamageMult_Materiel = 1.25 -- default: 0.75
-- damage multiplier for materiel targets, i.e. props, vehicles, robots, machines
bullet.DamageMult_AP = 1.25 -- damage multiplier to help defeat armoured targets

bullet.AirDrag = 0.75
bullet.WaterDrag = 1.75



ACT3_LoadBullet(bullet)