ACT3.Conversions = {}

ACT3_STATE_IDLE = 0
ACT3_STATE_INSPRINT = 1
ACT3_STATE_INSIGHTS = 2
ACT3_STATE_RELOAD = 3
ACT3_STATE_ININVMENU = 4
ACT3_STATE_PRIMED = 5
ACT3_STATE_SWING = 6
ACT3_STATE_INHIPFIRE = 7
ACT3_STATE_DISABLE = 8
ACT3_STATE_PRONETRANSITION = 9
ACT3_STATE_INBIPOD = 10

ACT3_HIT_NORMAL = 0
ACT3_HIT_MINICRIT = 1
ACT3_HIT_CRIT = 2
ACT3_HIT_DEFLECT = 3

ACT3_STPART_EMPTYRACK = 0
ACT3_STPART_MAGLOAD = 1
ACT3_STPART_MAGEJECT = 2
ACT3_STPART_BASE = 3

ACT3_FUNC_NOTHING = 0
ACT3_FUNC_ZOOM = 1
ACT3_FUNC_ZERO = 2
ACT3_FUNC_SIGHTS = 3
ACT3_FUNC_HOLOSIGHT = 4
ACT3_FUNC_NIGHTSCOPE = 5
ACT3_FUNC_CUSTOM = 6

ACT3_TRACK_TYPE_NONE = 0
ACT3_TRACK_TYPE_SACLOS = 1
ACT3_TRACK_TYPE_FF = 2

ACT3_PAGE_MAGS = 0
ACT3_PAGE_CUSTOMIZE = 1
ACT3_PAGE_STATS = 2
ACT3_PAGE_SAVES = 3

ACT3_CAT_SPECIAL = 0
ACT3_CAT_PISTOL = 1
ACT3_CAT_MACHINEPISTOL = 2
ACT3_CAT_SMG = 3
ACT3_CAT_CARBINE = 4
ACT3_CAT_ASSAULT = 5
ACT3_CAT_BATTLE = 6
ACT3_CAT_DMR = 7
ACT3_CAT_SNIPER = 8
ACT3_CAT_ANTITANK = 9
ACT3_CAT_GRENADE = 10
ACT3_CAT_SHIELD = 11
ACT3_CAT_ANTIMATERIEL = 12
ACT3_CAT_EXPLOSIVE = 13
ACT3_CAT_LMG = 14
ACT3_CAT_GPMG = 15
ACT3_CAT_HMG = 16
ACT3_CAT_CANNON = 17
ACT3_CAT_SHOTGUN = 18
ACT3_CAT_MELEE = 19
ACT3_CAT_SAM = 20

ACT3.Conversions.HutoM = (1 / 16) * 0.3048
ACT3.Conversions.GMBP_To_MOA = 10 * 60
ACT3.Conversions.RecoilToLBFPS = 10.4

ACT3.MaxDimensions = 16384 * 8

ACT3.Surfaces_Materiel = {
    [MAT_METAL] = true,
    [MAT_COMPUTER] = true,
    [MAT_CONCRETE] = true,
    [MAT_DEFAULT] = true,
    [MAT_GRATE] = true,
    [MAT_VENT] = true,
    [MAT_TILE] = true,
    [MAT_PLASTIC] = true,
    [MAT_WARPSHIELD] = true,
    [MAT_WOOD] = true,
}

ACT3.SHELLSOUNDSTABLE = {
    "act3/shell/shell_1.wav",
    "act3/shell/shell_2.wav",
    "act3/shell/shell_3.wav",
    "act3/shell/shell_4.wav",
    "act3/shell/shell_5.wav",
    "act3/shell/shell_6.wav",
    "act3/shell/shell_7.wav",
    "act3/shell/shell_8.wav",
    "act3/shell/shell_9.wav",
    "act3/shell/shell_10.wav",
    "act3/shell/shell_11.wav",
}

ACT3.SNAPSOUNDSTABLE = {
    "act3/snap/supersonic_snap_01.wav",
    "act3/snap/supersonic_snap_02.wav",
    "act3/snap/supersonic_snap_03.wav",
    "act3/snap/supersonic_snap_04.wav",
    "act3/snap/supersonic_snap_05.wav",
    "act3/snap/supersonic_snap_06.wav",
    "act3/snap/supersonic_snap_07.wav",
    "act3/snap/supersonic_snap_08.wav",
    "act3/snap/supersonic_snap_09.wav",
    "act3/snap/supersonic_snap_10.wav",
    "act3/snap/supersonic_snap_11.wav",
    "act3/snap/supersonic_snap_12.wav",
}

ACT3.SHELLSOUNDSTABLE_SHOTGUN = {
    "weapons/fx/tink/shotgun_shell1.wav",
    "weapons/fx/tink/shotgun_shell2.wav",
    "weapons/fx/tink/shotgun_shell3.wav"
}

ACT3.HITGROUPS_HEAD = {
    [HITGROUP_HEAD] = true
}

ACT3.HITGROUPS_CHEST = {
    [HITGROUP_STOMACH] = true,
    [HITGROUP_CHEST] = true
}

ACT3.HITGROUPS_LIMB = {
    [HITGROUP_LEFTARM] = true,
    [HITGROUP_LEFTLEG] = true,
    [HITGROUP_RIGHTARM] = true,
    [HITGROUP_RIGHTLEG] = true
}

ACT3.Inv_PageNames = {
    [ACT3_PAGE_MAGS] = "Magazines",
    [ACT3_PAGE_CUSTOMIZE] = "Customization",
    [ACT3_PAGE_STATS] = "Stats",
    [ACT3_PAGE_SAVES] = "Saves"
}

ACT3.NeededBits = 32

ACT3.EnableMenuAtAll = true
ACT3.EnableHints = true
ACT3.EnableCustomizeMenu = true
ACT3.EnableFiremodeSwitching = true

ACT3.MagazineEntity = "act3_magazine"

ACT3.SwayPeriodX = 0.77
ACT3.SwayPeriodY = 0.56

ACT3.MaxNameLength = 25

ACT3.EyeAtt = "eyes"
ACT3.HandAtt = "anim_attachment_RH"
ACT3.HandBone = "ValveBiped.Bip01_R_Hand"

ACT3.BulletsMinDistance = 200
ACT3.BulletDespawnTime = 15