local bullet = table.Copy(ACT3.BulletBase)

bullet.Name = "556x45_tmj" -- the bullet's code name
bullet.PrintName = "5.56x45mm TMJ" -- the displayed bullet name
bullet.Type = "TMJ"

bullet.Description = ACT3.Descriptions.TMJ -- {"line1", "line2"...}

bullet.Calibre = "556x45" -- determines what types of magazines this bullet can fit in

bullet.CaseEffect = "act3_case_556x45" -- the visual shell ejection effect of the bullet

bullet.BaseDamage = 38 -- 5.56 tumbles in the body n shit so it does more damage
-- it isn't just about power
-- I mean just look at those ballistics gel tests
bullet.HalfwayDist = 35000

bullet.Num = 1 -- how many bullets are fired

bullet.DamageMult_Head = 1.75
bullet.DamageMult_Materiel = 0.85 -- default: 0.75
-- damage multiplier for materiel targets, i.e. props, vehicles, robots, machines
bullet.DamageMult_AP = 1.1 -- damage multiplier to help defeat armoured targets

bullet.AirDrag = 0.85
bullet.WaterDrag = 2.0



ACT3_LoadBullet(bullet)