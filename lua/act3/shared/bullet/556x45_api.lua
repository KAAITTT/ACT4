local bullet = table.Copy(ACT3.BulletBase)

bullet.Name = "556x45_api" -- the bullet's code name
bullet.PrintName = "5.56x45mm API" -- the displayed bullet name
bullet.Type = "API"

bullet.Description = ACT3.Descriptions.API -- {"line1", "line2"...}

bullet.Calibre = "556x45" -- determines what types of magazines this bullet can fit in

bullet.CaseEffect = "act3_case_556x45" -- the visual shell ejection effect of the bullet

bullet.BaseDamage = 34 -- 5.56 tumbles in the body n shit so it does more damage
-- it isn't just about power
-- I mean just look at those ballistics gel tests
bullet.HalfwayDist = 50000

bullet.DamageMult_Head = 2
bullet.MuzzleVelocityMult = 1.1

bullet.Num = 1 -- how many bullets are fired

bullet.DamageMult_Materiel = 1.75 -- default: 0.75
-- damage multiplier for materiel targets, i.e. props, vehicles, robots, machines
bullet.DamageMult_AP = 1.25 -- damage multiplier to help defeat armoured targets

bullet.AirDrag = 0.9
bullet.WaterDrag = 2

bullet.TracerBody = Material("particle/fire")
bullet.TracerTail = Material("effects/laser_tracer")
bullet.TracerHeadSize = 24
bullet.TracerLength = 128
bullet.TracerWidth = 12
bullet.TracerColor = Color(255, 242, 206)
bullet.Glow = true
bullet.TracerTPoint1 = 0.25
bullet.TracerTPoint2 = 1

bullet.Decal = "FadingScorch"

bullet.IncendiaryFactor = 1

bullet.DamageType = DMG_BLAST_SURFACE


ACT3_LoadBullet(bullet)