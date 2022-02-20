local bullet = table.Copy(ACT3.BulletBase)

bullet.Name = "22lr_lrn" -- the bullet's code name
bullet.PrintName = ".22LR LRN" -- the displayed bullet name
bullet.Type = "LRN"

bullet.Description = ACT3.Descriptions.LRN -- {"line1", "line2"...}

bullet.Calibre = "22lr" -- determines what types of magazines this bullet can fit in

bullet.CaseEffect = "act3_case_22lr" -- the visual shell ejection effect of the bullet

bullet.BaseDamage = 10
bullet.HalfwayDist = 4000

bullet.Num = 1 -- how many bullets are fired

bullet.DamageMult_Head = 3

bullet.DamageMult_Materiel = 0.35 -- default: 0.75
-- damage multiplier for materiel targets, i.e. props, vehicles, robots, machines
bullet.DamageMult_AP = 0.15 -- damage multiplier to help defeat armoured targets

bullet.AirDrag = 1.5
bullet.WaterDrag = 3

bullet.SubSonic = true

ACT3_LoadBullet(bullet)