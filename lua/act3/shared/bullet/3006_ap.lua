local bullet = table.Copy(ACT3.BulletBase)

bullet.Name = "3006_ap" -- the bullet's code name
bullet.PrintName = ".30-06 Winchester AP" -- the displayed bullet name
bullet.Type = "AP"

bullet.Description = ACT3.Descriptions.AP -- {"line1", "line2"...}

bullet.Calibre = "3006" -- determines what types of magazines this bullet can fit in

bullet.CaseEffect = "act3_case_3006" -- the visual shell ejection effect of the bullet

bullet.BaseDamage = 45
bullet.HalfwayDist = 90000

bullet.Num = 1 -- how many bullets are fired

bullet.DamageMult_Head = 2
bullet.DamageMult_Materiel = 1.5 -- default: 0.75
-- damage multiplier for materiel targets, i.e. props, vehicles, robots, machines
bullet.DamageMult_AP = 1.65 -- damage multiplier to help defeat armoured targets

bullet.AirDrag = 0.85
bullet.WaterDrag = 2.25



ACT3_LoadBullet(bullet)