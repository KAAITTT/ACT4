local bullet = table.Copy(ACT3.BulletBase)

bullet.Name = "22lr_hv" -- the bullet's code name
bullet.PrintName = ".22LR HV" -- the displayed bullet name
bullet.Type = "HV"

bullet.Description = {"High velocity round.", "Slight advantage at range and against armor."} -- {"line1", "line2"...}

bullet.Calibre = "22lr" -- determines what types of magazines this bullet can fit in

bullet.CaseEffect = "act3_case_22lr" -- the visual shell ejection effect of the bullet

bullet.BaseDamage = 9
bullet.HalfwayDist = 6000

bullet.Num = 1 -- how many bullets are fired

bullet.MuzzleVelocityMult = 1.5

bullet.DamageMult_Head = 3

bullet.DamageMult_Materiel = 0.4 -- default: 0.75
-- damage multiplier for materiel targets, i.e. props, vehicles, robots, machines
bullet.DamageMult_AP = 0.2 -- damage multiplier to help defeat armoured targets

bullet.AirDrag = 1.5
bullet.WaterDrag = 3

bullet.VolumeMod = 1.25

ACT3_LoadBullet(bullet)