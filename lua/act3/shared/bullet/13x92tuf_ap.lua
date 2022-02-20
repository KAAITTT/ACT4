local bullet = table.Copy(ACT3.BulletBase)

bullet.Name = "13x92tuf_ap" -- the bullet's code name
bullet.PrintName = "13.2x92mm TuF AP" -- the displayed bullet name
bullet.Type = "AP"

bullet.Description = ACT3.Descriptions.AP -- {"line1", "line2"...}

bullet.Calibre = "13x92tuf" -- determines what types of magazines this bullet can fit in

bullet.CaseEffect = "act3_case_13x92tuf" -- the visual shell ejection effect of the bullet

bullet.BaseDamage = 250
bullet.HalfwayDist = 50000

bullet.Num = 1 -- how many bullets are fired

bullet.DamageMult_Headshot = 4
bullet.DamageMult_Materiel = 1.5 -- default: 0.75
-- damage multiplier for materiel targets, i.e. props, vehicles, robots, machines
bullet.DamageMult_AP = 1.5 -- damage multiplier to help defeat armoured targets

bullet.AirDrag = 2
bullet.WaterDrag = 4

bullet.Pen_RHAe = 25

bullet.DamageType = DMG_BLAST

ACT3_LoadBullet(bullet)