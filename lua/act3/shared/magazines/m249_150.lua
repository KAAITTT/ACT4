local mag = {}

mag.Name = "m249_150"
mag.PrintName = "M249 Belt 150-Round"

mag.Type = "m249"
mag.MagSize = 150
mag.Disposable = false
mag.Model = "models/weapons/act3/mag_m249_150.mdl"
mag.Slots = 6
mag.Calibre = "556x45"
mag.DefaultLoad = "556x45_fmj"

mag.SwayMult = 1.25
mag.AimTimeMult = 1.25
mag.SightedSpeedMult = 0.5

ACT3_LoadMagazineType(mag)