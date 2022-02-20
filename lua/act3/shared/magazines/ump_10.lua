local mag = {}

mag.Name = "ump_10"
mag.PrintName = "UMP-45 Mag 10-Round"

mag.Type = "ump"
mag.MagSize = 10
mag.Disposable = false
mag.Model = "models/weapons/act3/mag_ump_10.mdl"
mag.Slots = 1
mag.Calibre = "45acp"
mag.DefaultLoad = "45acp_fmj"

mag.SwayMult = 0.8
mag.AimTimeMult = 0.8

ACT3_LoadMagazineType(mag)