local att = {}

att.PrintName = "M3-CS90 Conversion"
att.Name = "m3_tube_magwell"
att.Slot = "m3_tube"
att.Description = {"Converts shotgun to use magazines.", "Accepts Lior-12 magazines.", "Adds slamfire capability."}
att.Icon = Material("attachments/m3_tube_4.png")

att.BodygroupMods = {"m3_tube_short"}

att.AttachFunc = function(wep)
    wep:Unload()
    wep.Magazine = nil
    wep.InternalMag = false
    wep.DefaultMagazine = {Type = "lior_6", Rounds = {}}
    wep.DefaultLoad = "12g_buck"
    wep:RecalculateDefaultRounds()
    wep.MagazineType = "lior"
    wep.Calibre = "12g"
    wep.MagazineVisible = true
    wep.PrintCalibre = "12 Gauge"
    wep.MagazineOffsetPos = Vector(-2.628, -0.055, 6.364)
    wep.AnimReload = ACT_HL2MP_GESTURE_RELOAD_AR2
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
            path = "weapons/m3/m3_pump.wav",
            comp = ACT3_STPART_EMPTYRACK
        },
    }
    wep.Firemodes = {
        {
            Automatic = true,
            CustomFiremode = "SLAM"
        },
        {
            Automatic = false,
            Safe = true
        }
    }
    wep:ChangeFiremodeTo(1)
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
    wep.MagazineOffsetPos = orig.MagazineOffsetPos
    wep.AnimReload = orig.AnimReload
    wep.ReloadSoundsTable = orig.ReloadSoundsTable
    wep.Firemodes = orig.Firemodes
    wep:ChangeFiremodeTo(1)
end

ACT3_LoadAttachment(att)