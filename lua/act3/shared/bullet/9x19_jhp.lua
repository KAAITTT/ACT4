local bullet = table.Copy(ACT3.BulletBase)

bullet.Name = "9x19_jhp" -- the bullet's code name
bullet.PrintName = "9x19mm JHP" -- the displayed bullet name
bullet.Type = "JHP"

bullet.Description = ACT3.Descriptions.JHP -- {"line1", "line2"...}

bullet.Calibre = "9x19" -- determines what types of magazines this bullet can fit in

bullet.CaseEffect = "act3_case_9x19" -- the visual shell ejection effect of the bullet

bullet.BaseDamage = 33
bullet.HalfwayDist = 6000

bullet.Num = 1 -- how many bullets are fired

bullet.DamageMult_Head = 1.25
bullet.DamageMult_Materiel = 0.25 -- default: 0.75
-- damage multiplier for materiel targets, i.e. props, vehicles, robots, machines
bullet.DamageMult_AP = 0.45 -- damage multiplier to help defeat armoured targets

bullet.MuzzleVelocityMult = 1
bullet.AirDrag = 1.25
bullet.WaterDrag = 3.25

bullet.DamageType = DMG_BULLET -- damage type of bullet



ACT3_LoadBullet(bullet)