local bullet = table.Copy(ACT3.BulletBase)

bullet.Name = "musketball" -- the bullet's code name
bullet.PrintName = "Musket Ball" -- the displayed bullet name
bullet.Type = "BALL"

bullet.Description = {"Lead ball with powder charge.", "Generally poor round."} -- {"line1", "line2"...}

bullet.Calibre = "musketball" -- determines what types of magazines this bullet can fit in

bullet.CaseEffect = "" -- the visual shell ejection effect of the bullet

bullet.BaseDamage = 85
bullet.HalfwayDist = 5000

bullet.Num = 1 -- how many bullets are fired

bullet.DamageMult_Materiel = 1 -- default: 0.75
-- damage multiplier for materiel targets, i.e. props, vehicles, robots, machines
bullet.DamageMult_AP = 0.5 -- damage multiplier to help defeat armoured targets

bullet.MuzzleVelocityMult = 1
bullet.AirDrag = 3
bullet.WaterDrag = 6



ACT3_LoadBullet(bullet)