local att = {}

att.PrintName = "UMPC .45"
att.Name = "att_ubgl_umpc"
att.Slot = "foregrip"
att.Description = {"Underbarrel UMP Carbine.", "Uses .45 ACP FMJ."}
att.Icon = Material("attachments/att_ubgl_umpc.png")

att.ExcludeFlags = {"noubgl"}

att.WMParts = {
    {
    model = "models/weapons/act3/atts/att_ubgl_umpc.mdl",
    bgs = "",
    skin = 0,
    pos = Vector(2, 0, 0),
    ang = Angle(0, 0, 0),
    }
}

att.RandomizeBlacklist = true -- Prohibit this attachment from being randomly given out

att.AttachFunc = function(wep)
    wep.UBGL = true
    wep.UBGL_ReloadSoundsTable = {
        {
            time = 0.1,
            path = "weapons/ump45/ump45_clipout.wav",
            comp = ACT3_STPART_MAGEJECT
        },
        {
            time = 1.0,
            path = "weapons/ump45/ump45_clipin.wav",
            comp = ACT3_STPART_MAGLOAD
        },
        {
            time = 1.45,
            path = "weapons/ump45/ump45_boltslap.wav",
            comp = ACT3_STPART_EMPTYRACK
        },
    }
    wep.UBGL_Recoil = 1.5
    wep.UBGL_BlowbackAmount = 1
    wep.UBGL_Bullet = "45acp_fmj"
    wep.UBGL_MagazineSize = 10
    wep.UBGL_Automatic = false
    wep.UBGL_SoundShoot = "weapons/ump45/ump45-1.wav"
    wep.UBGL_AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2
    wep.UBGL_AnimReload = ACT_HL2MP_GESTURE_RELOAD_SMG1
    wep.UBGL_Rounds = 0
    wep.UBGL_Firemode = "UMPC .45 UBPC"
    wep.UBGL_EquipFunc = nil
    wep.UBGL_ResetFunc = nil
    wep.UBGL_HoldtypeHip = "crossbow"
    wep.UBGL_HoldtypeSights = "ar2"
    wep.UBGL_FireDelay = 60 / 600
    wep.UBGL_Precision = 1 / 150
    wep.UBGL_MuzzleVelocity = 15000
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