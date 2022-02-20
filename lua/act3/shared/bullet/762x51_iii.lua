local bullet = table.Copy(ACT3.BulletBase)

bullet.Name = "762x51_iii" -- the bullet's code name
bullet.PrintName = "7.62x51mm III" -- the displayed bullet name
bullet.Type = "III"

bullet.Description = ACT3.Descriptions.III -- {"line1", "line2"...}

bullet.Calibre = "762x51" -- determines what types of magazines this bullet can fit in

bullet.CaseEffect = "act3_case_762x51" -- the visual shell ejection effect of the bullet

bullet.BaseDamage = 75
bullet.HalfwayDist = 10000

bullet.Num = 1 -- how many bullets are fired

bullet.DamageMult_Materiel = 0.5 -- default: 0.75
-- damage multiplier for materiel targets, i.e. props, vehicles, robots, machines
bullet.DamageMult_AP = 0.7 -- damage multiplier to help defeat armoured targets

bullet.AirDrag = 1.4
bullet.WaterDrag = 4

bullet.TracerBody = Material("particle/fire")
bullet.TracerTail = Material("effects/laser_tracer")
bullet.TracerHeadSize = 24
bullet.TracerLength = 64
bullet.TracerWidth = 10
bullet.TracerColor = Color(255, 77, 0)
bullet.Glow = true
bullet.TracerTPoint1 = 0.25
bullet.TracerTPoint2 = 1

bullet.Decal = "FadingScorch"

bullet.IncendiaryFactor = 4

bullet.DamageType = DMG_BURN + DMG_BULLET + DMG_BUCKSHOT


ACT3_LoadBullet(bullet)