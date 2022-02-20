local bullet = table.Copy(ACT3.BulletBase)

bullet.Name = "44mag_blank" -- the bullet's code name
bullet.PrintName = ".44 Magnum Blank" -- the displayed bullet name
bullet.Type = "BLK"

bullet.Description = ACT3.Descriptions.BLK -- {"line1", "line2"...}

bullet.Calibre = "44mag" -- determines what types of magazines this bullet can fit in

bullet.CaseEffect = "act3_case_44mag" -- the visual shell ejection effect of the bullet

bullet.Num = 0 -- how many bullets are fired

bullet.RandomizeBlacklist = true

ACT3_LoadBullet(bullet)