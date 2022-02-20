local mag = {}

mag.Name = "stanag_100"
mag.PrintName = "STANAG Mag 100-Round"

mag.Type = "stanag"
mag.MagSize = 100
mag.Disposable = false
mag.Model = "models/weapons/act3/mag_ar_100.mdl"
mag.Slots = 6
mag.Calibre = "556x45"
mag.DefaultLoad = "556x45_fmj"

mag.SwayMult = 2
mag.AimTimeMult = 2
mag.SightedSpeedMult = 0.5

ACT3_LoadMagazineType(mag)