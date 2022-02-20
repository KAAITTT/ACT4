local bullet = table.Copy(ACT3.BulletBase)

bullet.Name = "22lr_trr" -- the bullet's code name
bullet.PrintName = ".22LR TR-R" -- the displayed bullet name
bullet.Type = "TR-R"

bullet.Description = ACT3.Descriptions.TRR -- {"line1", "line2"...}

bullet.Calibre = "22lr" -- determines what types of magazines this bullet can fit in

bullet.CaseEffect = "act3_case_22lr" -- the visual shell ejection effect of the bullet

bullet.BaseDamage = 9
bullet.HalfwayDist = 6000

bullet.Num = 1 -- how many bullets are fired

bullet.MuzzleVelocityMult = 1.5

bullet.DamageMult_Head = 3

bullet.DamageMult_Materiel = 0.4 -- default: 0.75
-- damage multiplier for materiel targets, i.e. props, vehicles, robots, machines
bullet.DamageMult_AP = 0.2 -- damage multiplier to help defeat armoured targets

bullet.AirDrag = 1.5
bullet.WaterDrag = 3

bullet.VolumeMod = 1.25

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