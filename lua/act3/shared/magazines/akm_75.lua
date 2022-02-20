local mag = {}

mag.Name = "akm_75"
mag.PrintName = "AKM Mag 75-Round"

mag.Type = "akm"
mag.MagSize = 75
mag.Disposable = false
mag.Model = "models/weapons/act3/mag_ak_75.mdl"
mag.Slots = 5
mag.Calibre = "762x39"
mag.DefaultLoad = "762x39_fmj"

mag.SwayMult = 2
mag.AimTimeMult = 2
mag.SightedSpeedMult = 0.5

ACT3_LoadMagazineType(mag)