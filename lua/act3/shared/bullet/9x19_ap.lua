local bullet = table.Copy(ACT3.BulletBase)

bullet.Name = "9x19_ap" -- the bullet's code name
bullet.PrintName = "9x19mm AP" -- the displayed bullet name
bullet.Type = "AP"

bullet.Description = ACT3.Descriptions.AP -- {"line1", "line2"...}

bullet.Calibre = "9x19" -- determines what types of magazines this bullet can fit in

bullet.CaseEffect = "act3_case_9x19" -- the visual shell ejection effect of the bullet

bullet.BaseDamage = 22
bullet.HalfwayDist = 21000

bullet.Num = 1 -- how many bullets are fired

bullet.DamageMult_Head = 1.5
bullet.DamageMult_Materiel = 0.4 -- default: 0.75
-- damage multiplier for materiel targets, i.e. props, vehicles, robots, machines
bullet.DamageMult_AP = 0.75 -- damage multiplier to help defeat armoured targets

bullet.MuzzleVelocityMult = 1.1
bullet.AirDrag = 0.9
bullet.WaterDrag = 2.5



ACT3_LoadBullet(bullet)