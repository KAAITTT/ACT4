local att = {}

att.PrintName = "K98 5.56 Varmint Magwell"
att.Name = "k98_magwell"
att.Slot = "k98_magwell"
att.Description = {"Converts rifle to a 5.56mm Varmint Rifle.", "Accepts STANAG magazines."}
att.Icon = Material("attachments/k98_magwell.png")

att.BodygroupMods = {"k98_magwell"}

att.AttachFunc = function(wep)
    wep:Unload()
    wep.Magazine = nil
    wep.InternalMag = false
    wep.DefaultMagazine = {Type = "stanag_10", Rounds = {}}
    wep.DefaultLoad = "556x45_fmj"
    wep:RecalculateDefaultRounds()
    wep.MagazineType = "stanag"
    wep.Calibre = "556x45"
    wep.MagazineVisible = true
    wep.PrintCalibre = "5.56x45mm"
    wep.SoundShoot = "weapons/fiveseven/fiveseven-1.wav"
    wep.SoundShootVol = wep.SoundShootVol / 1.1
    wep.SoundShootPitch = wep.SoundShootPitch * 0.9
    wep.Recoil = wep.Recoil / 2
    wep.MagazineOffsetPos = Vector(-4.158, -0.63, 7.406)
    wep.MuzzleVelocity = wep.MuzzleVelocity * (25000 / 40000)
    wep.ReloadSoundsTable = {
    {
        time = 0.1,
        path = "weapons/m4a1/m4a1_clipout.wav",
        comp = ACT3_STPART_MAGEJECT
    },
    {
        time = 1.0,
        path = "weapons/famas/famas_clipin.wav",
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