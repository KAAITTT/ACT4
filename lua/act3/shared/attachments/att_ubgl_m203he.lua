local att = {}

att.PrintName = "M203 HE"
att.Name = "att_ubgl_m203he"
att.Slot = "foregrip"
att.Description = {"Underbarrel grenade launcher.", "Fires HE grenades."}
att.Icon = Material("attachments/att_ubgl_m203.png")

att.ExcludeFlags = {"noubgl"}

att.WMParts = {
    {
    model = "models/weapons/act3/atts/att_ubgl_m203.mdl",
    bgs = "",
    skin = 0,
    pos = Vector(2, 0, 0),
    ang = Angle(0, 90, 0),
    }
}

att.RandomizeBlacklist = true -- Prohibit this attachment from being randomly given out

att.AttachFunc = function(wep)
    wep.UBGL = true
    wep.UBGL_ReloadSoundsTable = {
        {
            time = 0.1,
            path = "act3/m203-open.wav",
        },
        {
            time = 1.0,
            path = "act3/m203-load.wav",
            comp = ACT3_STPART_MAGLOAD,
        },
        {
            time = 1.45,
            path = "act3/m203-close.wav",
        },
    }
    wep.UBGL_Recoil = 5
    wep.UBGL_BlowbackAmount = 3
    wep.UBGL_Bullet = "40mm_he"
    wep.UBGL_MagazineSize = 1
    wep.UBGL_Automatic = false
    wep.UBGL_SoundShoot = "weapons/grenade_launcher1.wav"
    wep.UBGL_AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_RPG
    wep.UBGL_AnimReload = ACT_HL2MP_GESTURE_RELOAD_AR2
    wep.UBGL_Rounds = 0
    wep.UBGL_Firemode = "M203HE UBGL"
    wep.UBGL_EquipFunc = nil
    wep.UBGL_ResetFunc = nil
    wep.UBGL_HoldtypeHip = "crossbow"
    wep.UBGL_HoldtypeSights = "rpg"
    wep.UBGL_FireDelay = 60 / 100
    wep.UBGL_Precision = 0
end

att.DetachFunc = function(wep)
    wep.UBGL = false
    wep.UBGL_Enabled = false
    -- fuck it if the thing already had a UBGL it isn't like we're ever going to put another one on. I assume. Fuck. These stats'll get overwritten next time.
    if wep.Owner:IsPlayer() then
        wep.Owner:ACT3_GiveBullets(ACT3_GetBulletID(wep.UBGL_Bullet), wep.UBGL_Rounds)
    end
    wep.UBGL_Rounds = 0
end

ACT3_LoadAttachment(att)