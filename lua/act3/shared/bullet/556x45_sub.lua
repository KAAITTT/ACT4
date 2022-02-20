local bullet = table.Copy(ACT3.BulletBase)

bullet.Name = "556x45_sub" -- the bullet's code name
bullet.PrintName = "5.56x45mm SUB" -- the displayed bullet name
bullet.Type = "SUB"

bullet.Description = ACT3.Descriptions.SUB -- {"line1", "line2"...}

bullet.Calibre = "556x45" -- determines what types of magazines this bullet can fit in

bullet.CaseEffect = "act3_case_556x45" -- the visual shell ejection effect of the bullet

bullet.BaseDamage = 42 -- 5.56 tumbles in the body n shit so it does more damage
-- it isn't just about power
-- I mean just look at those ballistics gel tests
bullet.HalfwayDist = 14000

bullet.MuzzleVelocityMult = 0.65

bullet.Num = 1 -- how many bullets are fired

bullet.DamageMult_Head = 1.5
bullet.DamageMult_Materiel = 0.6 -- default: 0.75
-- damage multiplier for materiel targets, i.e. props, vehicles, robots, machines
bullet.DamageMult_AP = 0.9 -- damage multiplier to help defeat armoured targets

bullet.AirDrag = 1
bullet.WaterDrag = 2.75

bullet.VolMod = 0.75 -- multiplies the vol of the gun (sound distance)
bullet.SubSonic = true



ACT3_LoadBullet(bullet)