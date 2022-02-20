local bullet = table.Copy(ACT3.BulletBase)

bullet.Name = "762x51_ap" -- the bullet's code name
bullet.PrintName = "7.62x51mm AP" -- the displayed bullet name
bullet.Type = "AP"

bullet.Description = ACT3.Descriptions.AP -- {"line1", "line2"...}

bullet.Calibre = "762x51" -- determines what types of magazines this bullet can fit in

bullet.CaseEffect = "act3_case_762x51" -- the visual shell ejection effect of the bullet

bullet.BaseDamage = 60
bullet.HalfwayDist = 90000

bullet.Num = 1 -- how many bullets are fired

bullet.DamageMult_Head = 2
bullet.DamageMult_Materiel = 1.5 -- default: 0.75
-- damage multiplier for materiel targets, i.e. props, vehicles, robots, machines
bullet.DamageMult_AP = 1.5 -- damage multiplier to help defeat armoured targets

bullet.AirDrag = 0.8
bullet.WaterDrag = 2.0

bullet.DamageType = DMG_BLAST_SURFACE

ACT3_LoadBullet(bullet)