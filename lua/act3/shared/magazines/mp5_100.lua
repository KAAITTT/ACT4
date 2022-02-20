local mag = {}

mag.Name = "mp5_100"
mag.PrintName = "MP5 Mag 50-Round"

mag.Type = "mp5"
mag.MagSize = 50
mag.Disposable = false
mag.Model = "models/weapons/act3/mag_mp5_100.mdl"
mag.Slots = 5
mag.Calibre = "9x19"
mag.DefaultLoad = "9x19_fmj"

mag.SwayMult = 1.4
mag.AimTimeMult = 1.4
mag.SightedSpeedMult = 0.6

ACT3_LoadMagazineType(mag)