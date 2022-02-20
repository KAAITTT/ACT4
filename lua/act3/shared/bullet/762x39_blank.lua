local bullet = table.Copy(ACT3.BulletBase)

bullet.Name = "762x39_blank" -- the bullet's code name
bullet.PrintName = "7.62x39mm Blank" -- the displayed bullet name
bullet.Type = "BLK"

bullet.Description = ACT3.Descriptions.BLK -- {"line1", "line2"...}

bullet.Calibre = "762x39" -- determines what types of magazines this bullet can fit in

bullet.CaseEffect = "act3_case_762x39" -- the visual shell ejection effect of the bullet

bullet.Num = 0

bullet.RandomizeBlacklist = true

ACT3_LoadBullet(bullet)