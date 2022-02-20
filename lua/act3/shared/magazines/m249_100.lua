local mag = {}

mag.Name = "m249_100"
mag.PrintName = "M249 Belt 100-Round"

mag.Type = "m249"
mag.MagSize = 100
mag.Disposable = false
mag.Model = "models/weapons/act3/mag_m249_100.mdl"
mag.Slots = 5
mag.Calibre = "556x45"
mag.DefaultLoad = "556x45_fmj"

mag.SwayMult = 1.0
mag.AimTimeMult = 1.0
mag.SightedSpeedMult = 0.75

ACT3_LoadMagazineType(mag)