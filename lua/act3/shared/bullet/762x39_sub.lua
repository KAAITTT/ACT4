local bullet = table.Copy(ACT3.BulletBase)

bullet.Name = "762x39_sub" -- the bullet's code name
bullet.PrintName = "7.62x39mm SUB" -- the displayed bullet name
bullet.Type = "SUB"

bullet.Description = ACT3.Descriptions.SUB -- {"line1", "line2"...}

bullet.Calibre = "762x39" -- determines what types of magazines this bullet can fit in

bullet.CaseEffect = "act3_case_762x39" -- the visual shell ejection effect of the bullet

bullet.BaseDamage = 40
bullet.HalfwayDist = 12000

bullet.MuzzleVelocityMult = 0.65

bullet.Num = 1 -- how many bullets are fired

bullet.DamageMult_Head = 1.5
bullet.DamageMult_Materiel = 0.6 -- default: 0.75
-- damage multiplier for materiel targets, i.e. props, vehicles, robots, machines
bullet.DamageMult_AP = 0.9 -- damage multiplier to help defeat armoured targets

bullet.AirDrag = 1.25
bullet.WaterDrag = 3

bullet.VolMod = 0.75 -- multiplies the vol of the gun (sound distance)
bullet.SubSonic = true



ACT3_LoadBullet(bullet)