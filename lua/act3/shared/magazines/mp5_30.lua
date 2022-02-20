local mag = {}

mag.Name = "mp5_30"
mag.PrintName = "MP5 Mag 30-Round"

mag.Type = "mp5"
mag.MagSize = 30
mag.Disposable = false
mag.Model = "models/weapons/act3/mag_mp5_30.mdl"
mag.Slots = 2
mag.Calibre = "9x19"
mag.DefaultLoad = "9x19_fmj"

mag.SwayMult = 1.0
mag.AimTimeMult = 1.0

mag.AttachFunc = function(wep)
   wep.Sway = wep.Sway * mag.SwayMult
   wep.AimTime = wep.AimTime * mag.AimTimeMult
end
mag.DetachFunc = function(wep)
   wep.Sway = wep.Sway / mag.SwayMult
   wep.AimTime = wep.AimTime / mag.AimTimeMult
end

ACT3_LoadMagazineType(mag)