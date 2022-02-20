local bullet = table.Copy(ACT3.BulletBase)

bullet.Name = "musketball_shrap" -- the bullet's code name
bullet.PrintName = "Shrapnel Round" -- the displayed bullet name
bullet.Type = "SHRP"

bullet.Description = {"Metal shrapnel stuffed down barrel.", "Functions like shotgun."} -- {"line1", "line2"...}

bullet.Calibre = "musketball" -- determines what types of magazines this bullet can fit in

bullet.CaseEffect = "" -- the visual shell ejection effect of the bullet

bullet.BaseDamage = 13
bullet.HalfwayDist = 5000

bullet.Num = 8 -- how many bullets are fired

bullet.DamageMult_Materiel = 0.5 -- default: 0.75
-- damage multiplier for materiel targets, i.e. props, vehicles, robots, machines
bullet.DamageMult_AP = 0.25 -- damage multiplier to help defeat armoured targets

bullet.MuzzleVelocityMult = 0.65
bullet.AirDrag = 4
bullet.WaterDrag = 6

bullet.AccuracyMult = 3 -- weapon accuracy multiplier
bullet.RecoilMult = 1 -- weapon recoil multiplier

ACT3_LoadBullet(bullet)