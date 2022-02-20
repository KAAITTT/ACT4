local mag = {}

mag.Name = "g3_50"
mag.PrintName = "G3 Mag 50-Round"

mag.Type = "g3"
mag.MagSize = 50
mag.Disposable = false
mag.Model = "models/weapons/act3/mag_g3_50.mdl"
mag.Slots = 5
mag.Calibre = "762x51"
mag.DefaultLoad = "762x51_fmj"

mag.SwayMult = 1.5
mag.AimTimeMult = 1.5
mag.SightedSpeedMult = 0.5

ACT3_LoadMagazineType(mag)