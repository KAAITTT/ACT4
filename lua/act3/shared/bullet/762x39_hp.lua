local bullet = table.Copy(ACT3.BulletBase)

bullet.Name = "762x39_hp" -- the bullet's code name
bullet.PrintName = "7.62x39mm HP" -- the displayed bullet name
bullet.Type = "HP"

bullet.Description = ACT3.Descriptions.JHP -- {"line1", "line2"...}

bullet.Calibre = "762x39" -- determines what types of magazines this bullet can fit in

bullet.CaseEffect = "act3_case_762x39" -- the visual shell ejection effect of the bullet

bullet.BaseDamage = 51
bullet.HalfwayDist = 8000

bullet.Num = 1 -- how many bullets are fired

bullet.DamageMult_Head = 1.5
bullet.DamageMult_Materiel = 0.35 -- default: 0.75
-- damage multiplier for materiel targets, i.e. props, vehicles, robots, machines
bullet.DamageMult_AP = 0.75 -- damage multiplier to help defeat armoured targets

bullet.AirDrag = 1.4
bullet.WaterDrag = 3.5



ACT3_LoadBullet(bullet)