local mag = {}

mag.Name = "stanag_20"
mag.PrintName = "STANAG Mag 20-Round"

mag.Type = "stanag"
mag.MagSize = 20
mag.Disposable = false
mag.Model = "models/weapons/act3/mag_ar_20.mdl"
mag.Slots = 2
mag.Calibre = "556x45"
mag.DefaultLoad = "556x45_fmj"

mag.SwayMult = 0.85
mag.AimTimeMult = 0.85

ACT3_LoadMagazineType(mag)