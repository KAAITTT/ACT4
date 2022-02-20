local bullet = table.Copy(ACT3.BulletBase)

bullet.Name = "45acp_blank" -- the bullet's code name
bullet.PrintName = ".45 ACP Blank" -- the displayed bullet name
bullet.Type = "BLK"

bullet.Description = ACT3.Descriptions.BLK -- {"line1", "line2"...}

bullet.Calibre = "45acp" -- determines what types of magazines this bullet can fit in

bullet.CaseEffect = "act3_case_45acp" -- the visual shell ejection effect of the bullet

bullet.Num = 0 -- how many bullets are fired

bullet.SubSonic = true -- .45 ACP is a stock subsonic round

bullet.RandomizeBlacklist = true

ACT3_LoadBullet(bullet)