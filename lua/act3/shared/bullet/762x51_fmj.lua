local bullet = table.Copy(ACT3.BulletBase)

bullet.Name = "762x51_fmj" -- the bullet's code name
bullet.PrintName = "7.62x51mm FMJ" -- the displayed bullet name
bullet.Type = "FMJ"

bullet.Description = ACT3.Descriptions.FMJ -- {"line1", "line2"...}

bullet.Calibre = "762x51" -- determines what types of magazines this bullet can fit in

bullet.CaseEffect = "act3_case_762x51" -- the visual shell ejection effect of the bullet

bullet.BaseDamage = 65
bullet.HalfwayDist = 45000

bullet.Num = 1 -- how many bullets are fired

bullet.DamageMult_Head = 1.5
bullet.DamageMult_Materiel = 1.15 -- default: 0.75
-- damage multiplier for materiel targets, i.e. props, vehicles, robots, machines
bullet.DamageMult_AP = 1.25 -- damage multiplier to help defeat armoured targets

bullet.AirDrag = 0.85
bullet.WaterDrag = 2.25



ACT3_LoadBullet(bullet)