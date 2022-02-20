local bullet = table.Copy(ACT3.BulletBase)

bullet.Name = "57x28_ap" -- the bullet's code name
bullet.PrintName = "5.7x28mm AP" -- the displayed bullet name
bullet.Type = "AP"

bullet.Description = ACT3.Descriptions.AP -- {"line1", "line2"...}

bullet.Calibre = "57x28" -- determines what types of magazines this bullet can fit in

bullet.CaseEffect = "act3_case_57x28" -- the visual shell ejection effect of the bullet

bullet.BaseDamage = 22
bullet.HalfwayDist = 28000

bullet.Num = 1 -- how many bullets are fired

bullet.DamageMult_Head = 1.5
bullet.DamageMult_Materiel = 1 -- default: 0.75
-- damage multiplier for materiel targets, i.e. props, vehicles, robots, machines
bullet.DamageMult_AP = 1.25 -- damage multiplier to help defeat armoured targets

bullet.AirDrag = 1
bullet.WaterDrag = 2.75



ACT3_LoadBullet(bullet)