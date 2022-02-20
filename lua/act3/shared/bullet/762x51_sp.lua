local bullet = table.Copy(ACT3.BulletBase)

bullet.Name = "762x51_sp" -- the bullet's code name
bullet.PrintName = "7.62x51mm SP" -- the displayed bullet name
bullet.Type = "SP"

bullet.Description = ACT3.Descriptions.SP -- {"line1", "line2"...}

bullet.Calibre = "762x51" -- determines what types of magazines this bullet can fit in

bullet.CaseEffect = "act3_case_762x51" -- the visual shell ejection effect of the bullet

bullet.BaseDamage = 70
bullet.HalfwayDist = 25000

bullet.Num = 1 -- how many bullets are fired

bullet.DamageMult_Head = 1.5
bullet.DamageMult_Materiel = 0.5 -- default: 0.75
-- damage multiplier for materiel targets, i.e. props, vehicles, robots, machines
bullet.DamageMult_AP = 0.7 -- damage multiplier to help defeat armoured targets

bullet.AirDrag = 1.4
bullet.WaterDrag = 4



ACT3_LoadBullet(bullet)