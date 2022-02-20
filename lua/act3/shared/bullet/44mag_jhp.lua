local bullet = table.Copy(ACT3.BulletBase)

bullet.Name = "44mag_jhp" -- the bullet's code name
bullet.PrintName = ".44 Magnum JHP" -- the displayed bullet name
bullet.Type = "JHP"

bullet.Description = ACT3.Descriptions.JHP -- {"line1", "line2"...}

bullet.Calibre = "44mag" -- determines what types of magazines this bullet can fit in

bullet.CaseEffect = "act3_case_44mag" -- the visual shell ejection effect of the bullet

bullet.BaseDamage = 60
bullet.HalfwayDist = 2500

bullet.Num = 1 -- how many bullets are fired

bullet.DamageMult_Materiel = 0.65 -- default: 0.75
-- damage multiplier for materiel targets, i.e. props, vehicles, robots, machines
bullet.DamageMult_AP = 0.65 -- damage multiplier to help defeat armoured targets

bullet.MuzzleVelocityMult = 1
bullet.AirDrag = 1.2
bullet.WaterDrag = 3

ACT3_LoadBullet(bullet)