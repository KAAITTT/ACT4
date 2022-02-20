local att = {}

att.PrintName = "M3SS"
att.Name = "att_ubgl_m3ss"
att.Slot = "foregrip"
att.Description = {"Underbarrel M3 shotgun.", "Uses 12 Gauge Buckshot."}
att.Icon = Material("attachments/att_ubgl_m3ss.png")

att.ExcludeFlags = {"noubgl"}

att.WMParts = {
    {
    model = "models/weapons/act3/atts/att_ubgl_m3ss.mdl",
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
    }
    wep.UBGL_Recoil = 4
    wep.UBGL_BlowbackAmount = 2
    wep.UBGL_Bullet = "12g_buck"
    wep.UBGL_MagazineSize = 4
    wep.UBGL_Automatic = false
    wep.UBGL_SoundShoot = "weapons/m3/m3-1.wav"
    wep.UBGL_AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_SHOTGUN
    wep.UBGL_AnimReload = ACT_HL2MP_GESTURE_RELOAD_SHOTGUN
    wep.UBGL_Rounds = 0
    wep.UBGL_Firemode = "M3SS UBSG"
    wep.UBGL_EquipFunc = nil
    wep.UBGL_ResetFunc = nil
    wep.UBGL_HoldtypeHip = "crossbow"
    wep.UBGL_HoldtypeSights = "ar2"
    wep.UBGL_FireDelay = 60 / 60
    wep.UBGL_Precision = 1 / 40
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