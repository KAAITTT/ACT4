local bullet = table.Copy(ACT3.BulletBase)

bullet.Name = "12g_blank" -- the bullet's code name
bullet.PrintName = "12 Gauge Blank" -- the displayed bullet name
bullet.Type = "BLK"

bullet.Description = ACT3.Descriptions.BLK

bullet.Calibre = "12g" -- determines what types of magazines this bullet can fit in

bullet.CaseEffect = "act3_case_12g_buck" -- the visual shell ejection effect of the bullet

bullet.Num = 0

bullet.RandomizeBlacklist = true

ACT3_LoadBullet(bullet)