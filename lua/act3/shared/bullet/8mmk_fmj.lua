local bullet = table.Copy(ACT3.BulletBase)

bullet.Name = "8mmk_fmj" -- the bullet's code name
bullet.PrintName = "8mm Kurz FMJ" -- the displayed bullet name
bullet.Type = "FMJ"

bullet.Description = ACT3.Descriptions.FMJ -- {"line1", "line2"...}

bullet.Calibre = "8mmk" -- determines what types of magazines this bullet can fit in

bullet.CaseEffect = "act3_case_762x39" -- the visual shell ejection effect of the bullet

bullet.BaseDamage = 33
bullet.HalfwayDist = 20000

bullet.Num = 1 -- how many bullets are fired

bullet.DamageMult_Head = 1.25
bullet.DamageMult_Materiel = 0.75 -- default: 0.75
-- damage multiplier for materiel targets, i.e. props, vehicles, robots, machines
bullet.DamageMult_AP = 1.05 -- damage multiplier to help defeat armoured targets

bullet.AirDrag = 1.4
bullet.WaterDrag = 3



ACT3_LoadBullet(bullet)