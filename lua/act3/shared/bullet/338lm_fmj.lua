local bullet = table.Copy(ACT3.BulletBase)

bullet.Name = "338lm_fmj" -- the bullet's code name
bullet.PrintName = ".338 Lapua Magnum FMJ" -- the displayed bullet name
bullet.Type = "FMJ"

bullet.Description = ACT3.Descriptions.FMJ -- {"line1", "line2"...}

bullet.Calibre = "338lm" -- determines what types of magazines this bullet can fit in

bullet.CaseEffect = "act3_case_338lm" -- the visual shell ejection effect of the bullet

bullet.BaseDamage = 105
bullet.HalfwayDist = 75000

bullet.Num = 1 -- how many bullets are fired

bullet.DamageMult_Head = 1.5
bullet.DamageMult_Materiel = 1 -- default: 0.75
-- damage multiplier for materiel targets, i.e. props, vehicles, robots, machines
bullet.DamageMult_AP = 1.1 -- damage multiplier to help defeat armoured targets

bullet.AirDrag = 1.25
bullet.WaterDrag = 3



ACT3_LoadBullet(bullet)