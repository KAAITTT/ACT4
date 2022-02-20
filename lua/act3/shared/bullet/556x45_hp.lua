local bullet = table.Copy(ACT3.BulletBase)

bullet.Name = "556x45_hp" -- the bullet's code name
bullet.PrintName = "5.56x45mm HP" -- the displayed bullet name
bullet.Type = "HP"

bullet.Description = ACT3.Descriptions.JHP -- {"line1", "line2"...}

bullet.Calibre = "556x45" -- determines what types of magazines this bullet can fit in

bullet.CaseEffect = "act3_case_556x45" -- the visual shell ejection effect of the bullet

bullet.BaseDamage = 53 -- 5.56 tumbles in the body n shit so it does more damage
-- it isn't just about power
-- I mean just look at those ballistics gel tests
bullet.HalfwayDist = 9000

bullet.Num = 1 -- how many bullets are fired

bullet.DamageMult_Head = 1.5
bullet.DamageMult_Materiel = 0.35 -- default: 0.75
-- damage multiplier for materiel targets, i.e. props, vehicles, robots, machines
bullet.DamageMult_AP = 0.75 -- damage multiplier to help defeat armoured targets

bullet.AirDrag = 1.2
bullet.WaterDrag = 3.0



ACT3_LoadBullet(bullet)