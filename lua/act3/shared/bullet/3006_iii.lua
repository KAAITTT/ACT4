local bullet = table.Copy(ACT3.BulletBase)

bullet.Name = "3006_iii" -- the bullet's code name
bullet.PrintName = ".30-06 Winchester III" -- the displayed bullet name
bullet.Type = "III"

bullet.Description = ACT3.Descriptions.III -- {"line1", "line2"...}

bullet.Calibre = "3006" -- determines what types of magazines this bullet can fit in

bullet.CaseEffect = "act3_case_3006" -- the visual shell ejection effect of the bullet

bullet.BaseDamage = 80
bullet.HalfwayDist = 12000

bullet.Num = 1 -- how many bullets are fired

bullet.DamageMult_Materiel = 1.15 -- default: 0.75
-- damage multiplier for materiel targets, i.e. props, vehicles, robots, machines
bullet.DamageMult_AP = 1.25 -- damage multiplier to help defeat armoured targets

bullet.AirDrag = 1.5
bullet.WaterDrag = 4.25

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

bullet.IncendiaryFactor = 5

bullet.DamageType = DMG_BURN + DMG_BULLET + DMG_BUCKSHOT

ACT3_LoadBullet(bullet)