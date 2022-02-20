local bullet = table.Copy(ACT3.BulletBase)

bullet.Name = "45acp_trw" -- the bullet's code name
bullet.PrintName = ".45 ACP TR-W" -- the displayed bullet name
bullet.Type = "TR-W"

bullet.Description = ACT3.Descriptions.TRW -- {"line1", "line2"...}

bullet.Calibre = "45acp" -- determines what types of magazines this bullet can fit in

bullet.CaseEffect = "act3_case_45acp" -- the visual shell ejection effect of the bullet

bullet.BaseDamage = 29
bullet.HalfwayDist = 12500

bullet.Num = 1 -- how many bullets are fired

bullet.DamageMult_Head = 1.25
bullet.DamageMult_Materiel = 0.55 -- default: 0.75
-- damage multiplier for materiel targets, i.e. props, vehicles, robots, machines
bullet.DamageMult_AP = 0.8 -- damage multiplier to help defeat armoured targets

bullet.MuzzleVelocityMult = 1
bullet.AirDrag = 1.3
bullet.WaterDrag = 2.75

bullet.TracerBody = Material("particle/fire")
bullet.TracerTail = Material("effects/laser_tracer")
bullet.TracerHeadSize = 20
bullet.TracerLength = 100
bullet.TracerWidth = 10
bullet.TracerColor = Color(255, 242, 206)
bullet.Glow = true
bullet.TracerTPoint1 = 0.25
bullet.TracerTPoint2 = 1

bullet.SubSonic = true

ACT3_LoadBullet(bullet)