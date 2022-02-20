local mag = {}

mag.Name = "thompson_20"
mag.PrintName = "Thompson Mag 20-Round"

mag.Type = "thompson"
mag.MagSize = 20
mag.Disposable = false
mag.Model = "models/weapons/act3/mag_thompson_20.mdl"
mag.Slots = 1
mag.Calibre = "45acp"
mag.DefaultLoad = "45acp_fmj"

mag.SwayMult = 0.8
mag.AimTimeMult = 0.8

ACT3_LoadMagazineType(mag)