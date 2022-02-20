local bullet = table.Copy(ACT3.BulletBase)

bullet.Name = "338lm_api" -- the bullet's code name
bullet.PrintName = ".338 Lapua Magnum API" -- the displayed bullet name
bullet.Type = "API"

bullet.Description = ACT3.Descriptions.API -- {"line1", "line2"...}

bullet.Calibre = "338lm" -- determines what types of magazines this bullet can fit in

bullet.CaseEffect = "act3_case_338lm" -- the visual shell ejection effect of the bullet

bullet.BaseDamage = 95
bullet.HalfwayDist = 75000

bullet.Num = 1 -- how many bullets are fired

bullet.DamageMult_Head = 3
bullet.DamageMult_Materiel = 3 -- default: 0.75
-- damage multiplier for materiel targets, i.e. props, vehicles, robots, machines
bullet.DamageMult_AP = 2.5 -- damage multiplier to help defeat armoured targets

bullet.TracerBody = Material("particle/fire")
bullet.TracerTail = Material("effects/laser_tracer")
bullet.TracerHeadSize = 32
bullet.TracerLength = 256
bullet.TracerWidth = 12
bullet.TracerColor = Color(255, 242, 206)
bullet.Glow = true
bullet.TracerTPoint1 = 0.25
bullet.TracerTPoint2 = 1

bullet.IncendiaryFactor = 5

bullet.Decal = "FadingScorch"

bullet.AirDrag = 1.25
bullet.WaterDrag = 3

bullet.DamageType = DMG_BLAST

ACT3_LoadBullet(bullet)