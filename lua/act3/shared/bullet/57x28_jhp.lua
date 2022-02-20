local bullet = table.Copy(ACT3.BulletBase)

bullet.Name = "57x28_jhp" -- the bullet's code name
bullet.PrintName = "5.7x28mm JHP" -- the displayed bullet name
bullet.Type = "JHP"

bullet.Description = ACT3.Descriptions.JHP -- {"line1", "line2"...}

bullet.Calibre = "57x28" -- determines what types of magazines this bullet can fit in

bullet.CaseEffect = "act3_case_57x28" -- the visual shell ejection effect of the bullet

bullet.BaseDamage = 28
bullet.HalfwayDist = 12000

bullet.Num = 1 -- how many bullets are fired

bullet.DamageMult_Materiel = 0.45 -- default: 0.75
-- damage multiplier for materiel targets, i.e. props, vehicles, robots, machines
bullet.DamageMult_AP = 0.45 -- damage multiplier to help defeat armoured targets

bullet.AirDrag = 1
bullet.WaterDrag = 2.75



ACT3_LoadBullet(bullet)