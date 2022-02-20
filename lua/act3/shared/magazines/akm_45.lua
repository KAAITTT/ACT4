local mag = {}

mag.Name = "akm_45"
mag.PrintName = "AKM Mag 45-Round"

mag.Type = "akm"
mag.MagSize = 45
mag.Disposable = false
mag.Model = "models/weapons/act3/mag_ak_45.mdl"
mag.Slots = 3
mag.Calibre = "762x39"
mag.DefaultLoad = "762x39_fmj"

mag.SwayMult = 1.4
mag.AimTimeMult = 1.4
mag.SightedSpeedMult = 0.8

ACT3_LoadMagazineType(mag)