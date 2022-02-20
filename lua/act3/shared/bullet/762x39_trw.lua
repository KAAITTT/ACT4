local bullet = table.Copy(ACT3.BulletBase)

bullet.Name = "762x39_trw" -- the bullet's code name
bullet.PrintName = "7.62x39mm TR-W" -- the displayed bullet name
bullet.Type = "TR-W"

bullet.Description = ACT3.Descriptions.TRW -- {"line1", "line2"...}

bullet.Calibre = "762x39" -- determines what types of magazines this bullet can fit in

bullet.CaseEffect = "act3_case_762x39" -- the visual shell ejection effect of the bullet

bullet.BaseDamage = 40
bullet.HalfwayDist = 24000

bullet.Num = 1 -- how many bullets are fired

bullet.DamageMult_Head = 1.5
bullet.DamageMult_Materiel = 0.75 -- default: 0.75
-- damage multiplier for materiel targets, i.e. props, vehicles, robots, machines
bullet.DamageMult_AP = 1.05 -- damage multiplier to help defeat armoured targets

bullet.AirDrag = 1.25
bullet.WaterDrag = 3

bullet.TracerBody = Material("particle/fire")
bullet.TracerTail = Material("effects/laser_tracer")
bullet.TracerHeadSize = 24
bullet.TracerLength = 128
bullet.TracerWidth = 12
bullet.TracerColor = Color(255, 242, 206)
bullet.Glow = true
bullet.TracerTPoint1 = 0.25
bullet.TracerTPoint2 = 1

ACT3_LoadBullet(bullet)