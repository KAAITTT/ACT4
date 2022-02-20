local mag = {}

mag.Name = "stanag_10"
mag.PrintName = "STANAG Mag 10-Round"

mag.Type = "stanag"
mag.MagSize = 10
mag.Disposable = false
mag.Model = "models/weapons/act3/mag_ar_10.mdl"
mag.Slots = 1
mag.Calibre = "556x45"
mag.DefaultLoad = "556x45_fmj"

mag.SwayMult = 0.7
mag.AimTimeMult = 0.7

ACT3_LoadMagazineType(mag)