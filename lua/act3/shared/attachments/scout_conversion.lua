local att = {}

att.PrintName = "5.56 Conversion"
att.Name = "scout_conversion"
att.Slot = "scout_conversion"
att.Description = {"Converts rifle to 5.56mm.", "Accepts SIG SG magazines."}
att.Icon = nil

att.AttachFunc = function(wep)
    wep:Unload()
    wep.Magazine = nil
    wep.InternalMag = false
    wep.DefaultMagazine = {Type = "sig_25", Rounds = {}}
    wep.DefaultLoad = "556x45_fmj"
    wep:RecalculateDefaultRounds()
    wep.MagazineType = "sig"
    wep.Calibre = "556x45"
    wep.MagazineVisible = true
    wep.PrintCalibre = "5.56x45mm"
    wep.SoundShoot = "weapons/fiveseven/fiveseven-1.wav"
    wep.SoundShootVol = wep.SoundShootVol / 1.1
    wep.SoundShootPitch = wep.SoundShootPitch * 0.8
    wep.Recoil = wep.Recoil / 2
    wep.MuzzleVelocity = wep.MuzzleVelocity * (25000 / 40000)
    wep.MagazineOffsetPos = Vector(8.845, 0.095, 2.668)
    wep.ReloadSoundsTable = {
    {
        time = 0.1,
        path = "weapons/sg550/sg550_clipout.wav",
        comp = ACT3_STPART_MAGEJECT
    },
    {
        time = 1.0,
        path = "weapons/sg552/sg552_clipin.wav",
        comp = ACT3_STPART_MAGLOAD
    },
    {
        time = 1.45,
        path = "weapons/scout/scout_bolt.wav",
        comp = ACT3_STPART_EMPTYRACK
    },
}
end

att.DetachFunc = function(wep)
    local orig = weapons.Get(wep:GetClass())
    wep:Unload()
    wep.Magazine = orig.Magazine
    wep.InternalMag = orig.InternalMag
    wep.DefaultMagazine = orig.DefaultMagazine
    wep.DefaultLoad = orig.DefaultLoad
    wep:RecalculateDefaultRounds()
    wep.MagazineType = orig.MagazineType
    wep.Calibre = orig.Calibre
    wep.MagazineVisible = orig.MagazineVisible
    wep.PrintCalibre = orig.PrintCalibre
    wep.SoundShoot = orig.SoundShoot
    wep.SoundShootVol = wep.SoundShootVol * 1.1
    wep.SoundShootPitch = wep.SoundShootPitch / 0.9
    wep.MagazineOffsetPos = orig.MagazineOffsetPos
    wep.Recoil = wep.Recoil * 2
    wep.MuzzleVelocity = wep.MuzzleVelocity / (25000 / 40000)
    wep.ReloadSoundsTable = orig.ReloadSoundsTable
end

ACT3_LoadAttachment(att)