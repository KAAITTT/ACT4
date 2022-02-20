local mag = {}

mag.Name = "aug_36"
mag.PrintName = "AUG Mag 36-Round"

mag.Type = "stanag"
mag.MagSize = 36
mag.Disposable = false
mag.Model = "models/weapons/act3/mag_aug_36.mdl"
mag.Slots = 3
mag.Calibre = "556x45"
mag.DefaultLoad = "556x45_fmj"

mag.SwayMult = 1.1
mag.AimTimeMult = 0.9
mag.SightedSpeedMult = 0.95

ACT3_LoadMagazineType(mag)