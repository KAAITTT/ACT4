local bullet = table.Copy(ACT3.BulletBase)

bullet.Name = "44spc" -- the bullet's code name
bullet.PrintName = ".44 Special" -- the displayed bullet name
bullet.Type = "SPC"

bullet.Description = {"Shortened 'Special' round.", "Reduced recoil, but also less power."} -- {"line1", "line2"...}

bullet.Calibre = "44mag" -- determines what types of magazines this bullet can fit in

bullet.CaseEffect = "act3_case_44mag" -- the visual shell ejection effect of the bullet

bullet.BaseDamage = 40
bullet.HalfwayDist = 4500

bullet.RecoilMult = 0.75
bullet.Num = 1 -- how many bullets are fired

bullet.DamageMult_Materiel = 0.9 -- default: 0.75
-- damage multiplier for materiel targets, i.e. props, vehicles, robots, machines
bullet.DamageMult_AP = 0.75 -- damage multiplier to help defeat armoured targets

bullet.MuzzleVelocityMult = 0.85
bullet.AirDrag = 1.1
bullet.WaterDrag = 2.85

bullet.PitchMod = 1.1

ACT3_LoadBullet(bullet)