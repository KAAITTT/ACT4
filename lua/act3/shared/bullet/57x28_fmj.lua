local bullet = table.Copy(ACT3.BulletBase)

bullet.Name = "57x28_fmj" -- the bullet's code name
bullet.PrintName = "5.7x28mm FMJ" -- the displayed bullet name
bullet.Type = "FMJ"

bullet.Description = ACT3.Descriptions.FMJ -- {"line1", "line2"...}

bullet.Calibre = "57x28" -- determines what types of magazines this bullet can fit in

bullet.CaseEffect = "act3_case_57x28" -- the visual shell ejection effect of the bullet

bullet.BaseDamage = 24
bullet.HalfwayDist = 21000

bullet.Num = 1 -- how many bullets are fired

bullet.DamageMult_Head = 1.25
bullet.DamageMult_Materiel = 0.6 -- default: 0.75
-- damage multiplier for materiel targets, i.e. props, vehicles, robots, machines
bullet.DamageMult_AP = 0.9 -- damage multiplier to help defeat armoured targets

bullet.AirDrag = 1
bullet.WaterDrag = 2.75



ACT3_LoadBullet(bullet)