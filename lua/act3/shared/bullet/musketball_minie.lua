local bullet = table.Copy(ACT3.BulletBase)

bullet.Name = "musketball_minie" -- the bullet's code name
bullet.PrintName = "Minie Ball" -- the displayed bullet name
bullet.Type = "MNIE"

bullet.Description = {"Mould-shaped lead bullet.", "Superior performance to ball."} -- {"line1", "line2"...}

bullet.Calibre = "musketball" -- determines what types of magazines this bullet can fit in

bullet.CaseEffect = "" -- the visual shell ejection effect of the bullet

bullet.BaseDamage = 85
bullet.HalfwayDist = 6000

bullet.Num = 1 -- how many bullets are fired

bullet.DamageMult_Materiel = 1 -- default: 0.75
-- damage multiplier for materiel targets, i.e. props, vehicles, robots, machines
bullet.DamageMult_AP = 0.65 -- damage multiplier to help defeat armoured targets

bullet.MuzzleVelocityMult = 1.5
bullet.AirDrag = 1.5
bullet.WaterDrag = 3

bullet.AccuracyMult = 0.75 -- weapon accuracy multiplier
bullet.RecoilMult = 1 -- weapon recoil multiplier

ACT3_LoadBullet(bullet)