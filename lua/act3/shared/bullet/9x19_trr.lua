local bullet = table.Copy(ACT3.BulletBase)

bullet.Name = "9x19_trr" -- the bullet's code name
bullet.PrintName = "9x19mm TR-R" -- the displayed bullet name
bullet.Type = "TR-R"

bullet.Description = ACT3.Descriptions.TRR -- {"line1", "line2"...}

bullet.Calibre = "9x19" -- determines what types of magazines this bullet can fit in

bullet.CaseEffect = "act3_case_9x19" -- the visual shell ejection effect of the bullet

bullet.BaseDamage = 26
bullet.HalfwayDist = 14000

bullet.Num = 1 -- how many bullets are fired

bullet.DamageMult_Head = 1.25
bullet.DamageMult_Materiel = 0.4 -- default: 0.75
-- damage multiplier for materiel targets, i.e. props, vehicles, robots, machines
bullet.DamageMult_AP = 0.75 -- damage multiplier to help defeat armoured targets

bullet.MuzzleVelocityMult = 1
bullet.AirDrag = 1
bullet.WaterDrag = 2.75

bullet.TracerBody = Material("particle/fire")
bullet.TracerTail = Material("effects/laser_tracer")
bullet.TracerHeadSize = 20
bullet.TracerLength = 100
bullet.TracerWidth = 10
bullet.TracerColor = Color(255, 50, 50)
bullet.Glow = true
bullet.TracerTPoint1 = 0.25
bullet.TracerTPoint2 = 1

ACT3_LoadBullet(bullet)