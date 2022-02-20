local mag = {}

mag.Name = "stanag_40"
mag.PrintName = "STANAG Mag 40-Round"

mag.Type = "stanag"
mag.MagSize = 40
mag.Disposable = false
mag.Model = "models/weapons/act3/mag_ar_40.mdl"
mag.Slots = 3
mag.Calibre = "556x45"
mag.DefaultLoad = "556x45_fmj"

mag.SwayMult = 1.1
mag.AimTimeMult = 1.1
mag.SightedSpeedMult = 0.85

ACT3_LoadMagazineType(mag)