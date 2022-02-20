local bullet = table.Copy(ACT3.BulletBase)

bullet.Name = "3006_fmj" -- the bullet's code name
bullet.PrintName = ".30-06 Winchester FMJ" -- the displayed bullet name
bullet.Type = "FMJ"

bullet.Description = ACT3.Descriptions.FMJ -- {"line1", "line2"...}

bullet.Calibre = "3006" -- determines what types of magazines this bullet can fit in

bullet.CaseEffect = "act3_case_3006" -- the visual shell ejection effect of the bullet

bullet.BaseDamage = 60
bullet.HalfwayDist = 48000

bullet.Num = 1 -- how many bullets are fired

bullet.DamageMult_Head = 1.5
bullet.DamageMult_Materiel = 1.15 -- default: 0.75
-- damage multiplier for materiel targets, i.e. props, vehicles, robots, machines
bullet.DamageMult_AP = 1.25 -- damage multiplier to help defeat armoured targets

bullet.AirDrag = 1
bullet.WaterDrag = 3



ACT3_LoadBullet(bullet)