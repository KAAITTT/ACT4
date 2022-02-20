local mag = {}

mag.Name = "thompson_50"
mag.PrintName = "Thompson Mag 50-Round"

mag.Type = "thompson"
mag.MagSize = 50
mag.Disposable = false
mag.Model = "models/weapons/act3/mag_thompson_50.mdl"
mag.Slots = 4
mag.Calibre = "45acp"
mag.DefaultLoad = "45acp_fmj"

mag.SwayMult = 1.25
mag.AimTimeMult = 1.25
mag.SightedSpeedMult = 0.75

ACT3_LoadMagazineType(mag)