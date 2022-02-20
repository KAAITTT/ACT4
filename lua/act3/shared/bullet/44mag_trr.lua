local bullet = table.Copy(ACT3.BulletBase)

bullet.Name = "44mag_trr" -- the bullet's code name
bullet.PrintName = ".44 Magnum TR-R" -- the displayed bullet name
bullet.Type = "TRR"

bullet.Description = ACT3.Descriptions.TRR -- {"line1", "line2"...}

bullet.Calibre = "44mag" -- determines what types of magazines this bullet can fit in

bullet.CaseEffect = "act3_case_44mag" -- the visual shell ejection effect of the bullet

bullet.BaseDamage = 50
bullet.HalfwayDist = 4500

bullet.Num = 1 -- how many bullets are fired

bullet.DamageMult_Materiel = 1.1 -- default: 0.75
-- damage multiplier for materiel targets, i.e. props, vehicles, robots, machines
bullet.DamageMult_AP = 0.9 -- damage multiplier to help defeat armoured targets

bullet.MuzzleVelocityMult = 1
bullet.AirDrag = 1.1
bullet.WaterDrag = 2.85

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