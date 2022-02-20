local att = {}

att.PrintName = "K98 .22 Varmint Magwell"
att.Name = "k98_magwell_22"
att.Slot = "k98_magwell"
att.Description = {"Converts rifle to a .22 LR Varmint Rifle.", "Accepts 10/22 magazines."}
att.Icon = Material("attachments/k98_magwell.png")

att.BodygroupMods = {"k98_magwell"}

att.AttachFunc = function(wep)
    wep:Unload()
    wep.Magazine = nil
    wep.InternalMag = false
    wep.DefaultMagazine = {Type = "1022_10", Rounds = {}}
    wep.DefaultLoad = "22lr_lrn"
    wep:RecalculateDefaultRounds()
    wep.MagazineType = "1022"
    wep.Calibre = "22lr"
    wep.MagazineVisible = true
    wep.PrintCalibre = ".22 Long Rifle"
    wep.SoundShoot = "weapons/fiveseven/fiveseven-1.wav"
    wep.SoundShootVol = wep.SoundShootVol / 1.2
    wep.SoundShootPitch = wep.SoundShootPitch * 1.1
    wep.Recoil = wep.Recoil / 5
    wep.MagazineOffsetPos = Vector(-4.158, -0.63, 7.406)
    wep.MuzzleVelocity = wep.MuzzleVelocity * (17312 / 40000)
    wep.ReloadSoundsTable = {
    {
        time = 0.1,
        path = "weapons/mac10/mac10_clipout.wav",
        comp = ACT3_STPART_MAGEJECT
    },
    {
        time = 1.0,
        path = "weapons/scout/scout_clipin.wav",
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
    wep.SoundShootVol = wep.SoundShootVol * 1.2
    wep.SoundShootPitch = wep.SoundShootPitch / 1.1
    wep.MagazineOffsetPos = orig.MagazineOffsetPos
    wep.Recoil = wep.Recoil * 5
    wep.MuzzleVelocity = wep.MuzzleVelocity * (17312 / 40000)
    wep.ReloadSoundsTable = orig.ReloadSoundsTable
end

ACT3_LoadAttachment(att)