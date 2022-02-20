local bullet = table.Copy(ACT3.BulletBase)

bullet.Name = "45acp_tmj" -- the bullet's code name
bullet.PrintName = ".45 ACP TMJ" -- the displayed bullet name
bullet.Type = "TMJ"

bullet.Description = ACT3.Descriptions.TMJ -- {"line1", "line2"...}

bullet.Calibre = "45acp" -- determines what types of magazines this bullet can fit in

bullet.CaseEffect = "act3_case_45acp" -- the visual shell ejection effect of the bullet

bullet.BaseDamage = 28
bullet.HalfwayDist = 15000

bullet.Num = 1 -- how many bullets are fired

bullet.DamageMult_Head = 1.25
bullet.DamageMult_Materiel = 0.65 -- default: 0.75
-- damage multiplier for materiel targets, i.e. props, vehicles, robots, machines
bullet.DamageMult_AP = 0.85 -- damage multiplier to help defeat armoured targets

bullet.MuzzleVelocityMult = 1
bullet.AirDrag = 1.3
bullet.WaterDrag = 2.75

bullet.SubSonic = true

ACT3_LoadBullet(bullet)