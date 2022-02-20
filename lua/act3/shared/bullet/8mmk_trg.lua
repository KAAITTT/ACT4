local bullet = table.Copy(ACT3.BulletBase)

bullet.Name = "8mmk_trg" -- the bullet's code name
bullet.PrintName = "8mm Kurz TR-G" -- the displayed bullet name
bullet.Type = "TR-G"

bullet.Description = ACT3.Descriptions.TRG -- {"line1", "line2"...}

bullet.Calibre = "8mmk" -- determines what types of magazines this bullet can fit in

bullet.CaseEffect = "act3_case_762x39" -- the visual shell ejection effect of the bullet

bullet.BaseDamage = 33
bullet.HalfwayDist = 20000

bullet.Num = 1 -- how many bullets are fired

bullet.DamageMult_Head = 1.25
bullet.DamageMult_Materiel = 0.75 -- default: 0.75
-- damage multiplier for materiel targets, i.e. props, vehicles, robots, machines
bullet.DamageMult_AP = 1.05 -- damage multiplier to help defeat armoured targets

bullet.AirDrag = 1.4
bullet.WaterDrag = 3

bullet.TracerBody = Material("particle/fire")
bullet.TracerTail = Material("effects/laser_tracer")
bullet.TracerHeadSize = 20
bullet.TracerLength = 100
bullet.TracerWidth = 10
bullet.TracerColor = Color(50, 255, 50)
bullet.Glow = true
bullet.TracerTPoint1 = 0.25
bullet.TracerTPoint2 = 1

ACT3_LoadBullet(bullet)