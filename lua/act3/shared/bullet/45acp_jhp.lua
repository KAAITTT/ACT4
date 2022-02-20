local bullet = table.Copy(ACT3.BulletBase)

bullet.Name = "45acp_jhp" -- the bullet's code name
bullet.PrintName = ".45 ACP JHP" -- the displayed bullet name
bullet.Type = "JHP"

bullet.Description = ACT3.Descriptions.JHP -- {"line1", "line2"...}

bullet.Calibre = "45acp" -- determines what types of magazines this bullet can fit in

bullet.CaseEffect = "act3_case_45acp" -- the visual shell ejection effect of the bullet

bullet.BaseDamage = 35
bullet.HalfwayDist = 8000

bullet.Num = 1 -- how many bullets are fired

bullet.DamageMult_Head = 1.25
bullet.DamageMult_Materiel = 0.25 -- default: 0.75
-- damage multiplier for materiel targets, i.e. props, vehicles, robots, machines
bullet.DamageMult_AP = 0.45 -- damage multiplier to help defeat armoured targets

bullet.MuzzleVelocityMult = 1
bullet.AirDrag = 1.6
bullet.WaterDrag = 2.75

bullet.SubSonic = true

ACT3_LoadBullet(bullet)