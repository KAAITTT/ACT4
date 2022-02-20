SWEP.Base = "act3_base"

SWEP.Spawnable = true
SWEP.AdminSpawnable = false
SWEP.PrintName = "AR-15"
SWEP.Category = "ACT3 - Firearms"

SWEP.Desc_Country = "USA"
SWEP.Desc_Manufacturer = "Colt"
SWEP.Desc_Mechanism = "Direct Impingement"
SWEP.Desc_Year = 1964
SWEP.Desc_Weight = 3.3 -- kg
SWEP.ACT3Cat = ACT3_CAT_ASSAULT
SWEP.Sidearm = false

--SWEP.Purpose = "America's favorite. The AR platform is loved by as many as it is hated. Poor logistics choices in the Vietnam War resulted in it gaining a reputation for being unreliable, though it is an undeserved reputation. As the most popular gun in the USA, owing in part to the federal Assault Weapons Ban, this rifle has more aftermarket support than you can shake a suppressor at. Its action is the basis for many modern assault rifles."

SWEP.Slot = 3

SWEP.WorldModel = "models/weapons/act3/rifle_ar.mdl"
SWEP.WorldModelBase = "models/weapons/act3/rifle_ar.mdl" -- Worldmodel base of the weapon world model.
SWEP.WorldModelPos = Vector(13.536, 0.609, 2.471)
SWEP.WorldModelAng = Angle(-7.132, 0, 180)

SWEP.DefaultAttachments = {
    ["stock"] = "ar_stock_m16",
    ["fcg"] = "ar_fcg_ar15",
    ["handguard"] = "ar_handguard_a1",
    ["barrel"] = "ar_barrel_long",
    ["grip"] = "ar_grip_poly",
    ["top"] = "ar_top_handle"
}

SWEP.AttachmentBodygroups = {
    ["ar_handguard_a2"] = {ind = 1, bg = 1},
    ["ar_handguard_wood_long"] = {ind = 1, bg = 2},
    ["ar_handguard_602"] = {ind = 1, bg = 3},
    ["ar_handguard_m4"] = {ind = 1, bg = 4},
    ["ar_handguard_wood_short"] = {ind = 1, bg = 5},
    ["ar_handguard_heavy"] = {ind = 1, bg = 6},
    ["ar_barrel_compact"] = {ind = 2, bg = 1},
    ["ar_barrel_short_ssight"] = {ind = 2, bg = 2},
    ["ar_barrel_ultrashort"] = {ind = 2, bg = 3},
    ["ar_barrel_sniper"] = {ind = 2, bg = 4},
    ["ar_barrel_long_lp"] = {ind = 2, bg = 5},
    ["ar_barrel_short_lp"] = {ind = 2, bg = 6},
    ["ar_barrel_ultrashort_lp"] = {ind = 2, bg = 7},
    ["ar_grip_wood"] = {ind = 3, bg = 1},
    ["ar_grip_competition"] = {ind = 3, bg = 2},
    ["ar_grip_spacegun"] = {ind = 3, bg = 3},
    ["ar_grip_ad2"] = {ind = 3, bg = 4},
    ["ar_stock_m16"] = {ind = 4, bg = 1},
    ["ar_stock_m4"] = {ind = 4, bg = 2},
    ["ar_stock_sliding"] = {ind = 4, bg = 3},
    ["ar_stock_wood"] = {ind = 4, bg = 4},
    ["ar_top_handle_railed"] = {ind = 5, bg = 1},
    ["ar_top_rail"] = {ind = 5, bg = 2},
    ["ar_top_rearsight"] = {ind = 5, bg = 3},
}

SWEP.Attachment_Flags = {
    "556x45",
    "ar",
}

SWEP.Attachments = {
    ["stock"] = {
        Type = "ar_stock",
        PrintName = "Stock",
        Installed = nil,
        Required = false,
        Scale = 1,
    },
    ["barrel"] = {
        Type = "ar_barrel", -- type of attachments this slot can take
        PrintName = "Barrel", -- name this slot shows
        Installed = nil, -- which attachment is actually installed in this slot
        Required = true,
        Scale = 1, -- scale applied to attachments in this slot
    },
    ["fcg"] = {
        Type = "ar_fcg",
        PrintName = "Fire Group",
        Installed = nil,
        Required = true,
        Scale = 1,
    },
    ["handguard"] = {
        Type = "ar_handguard",
        PrintName = "Handguard",
        Installed = nil,
        Required = true,
        Scale = 1,
    },
    ["grip"] = {
        Type = "ar_grip",
        PrintName = "Grip",
        Installed = nil,
        Required = true,
        Scale = 1,
    },
    ["foregrip"] = {
        Type = "foregrip",
        PrintName = "Foregrip",
        Installed = nil,
        Required = false,
        Pos = Vector(1.661, 0, 6.973),
        Ang = Angle(0, 0, 0),
        Randomize = true,
        RandomizeChance = 30,
    },
    ["top"] = {
        Type = "ar_top",
        PrintName = "Upper",
        Installed = nil,
        Required = true,
        Scale = 1,
    },
    ["accessory_right"] = {
        Type = "accessory",
        PrintName = "Accessory",
        Installed = nil,
        Required = false,
        Scale = 1,
        Pos = Vector(-0.939, 1.282, 7.5),
        Ang = Angle(0, 0, 0),
        Randomize = true,
        RandomizeChance = 10,
    },
    ["accessory_left"] = {
        Type = "accessory",
        PrintName = "Accessory",
        Installed = nil,
        Required = false,
        Scale = 1,
        Pos = Vector(-0.939, -1.293, 7.5),
        Ang =  Angle(0, 0, 180),
        Randomize = true,
        RandomizeChance = 10,
    },
    ["conversion"] = {
        Type = "ar_conversion",
        PrintName = "Conversion",
        Installed = nil,
        Required = false,
        Scale = 1,
    },
}

SWEP.MuzzleOffset = Vector(33.784, 0.669, -7.856)
SWEP.MuzzleAngle = Angle(-7, 0, 0)
SWEP.EjectPos = Vector(-4.018, 0, 7.772)
SWEP.EjectAng = Angle(0, 0, 0)
SWEP.MagazineOffsetPos = Vector(-3.655, 0, 6.15)
SWEP.MagazineOffsetAng = Angle(0, 0, 0)

SWEP.ReloadSoundsTable = {
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
        path = "weapons/m4a1/m4a1_boltpull.wav",
        comp = ACT3_STPART_EMPTYRACK
    },
}

SWEP.TrueIronsPos = Vector(-0.009, 15.887, -11.528)
SWEP.TrueIronsAng = Vector(1.506, -0.076, -0.63)

SWEP.SightedAimPos = Vector(-0.051, -7.658, -11.5)
SWEP.SightedAimAng = Vector(2.371, -0.191, 0)


SWEP.LowPos = Vector(4.623, 18.693, -13.266)
SWEP.LowAng = Vector(-25.327, -11.256, 14.069)



SWEP.DamageMult = 1 -- the weapon's main stats are just taken from the bullet
SWEP.ShootingDelay = 60 / 650
SWEP.TriggerDelay = 0

SWEP.Recoil = 4
SWEP.RecoilAngles = 25

SWEP.BlowbackAmount = 1
SWEP.BlowbackRecovery = 5
SWEP.BlowbackMax = 2.5
SWEP.RollBlowbackAmount = 3
SWEP.RollBlowbackRecovery = 10
SWEP.RollBlowbackMax = 45

SWEP.HeatAccumulation = 20 -- Out of 100, the amount of heat each shot adds to the weapon
SWEP.HeatDissipation = 200 -- Amount of heat dissipated per second

SWEP.Precision = 1 / 750
SWEP.MaxHeatPrecision = 1 / 50
SWEP.HipfirePenalty = 0 -- Deviation applied on hip fire
SWEP.MaxHeatHipfirePenalty = 0.075
SWEP.MaxMovePenalty = 0.05
SWEP.DispersionInSights = false

SWEP.Sway = 2



SWEP.SpeedMult = 1
SWEP.SightedSpeedMult = 0.9



SWEP.OpenBolt = false -- this weapon will not chamber a round to fire. Instead, it will take rounds directly from the magazine. Examples of such weapons include revolvers and open bolt guns.
SWEP.InternalMag = false -- whether this weapon uses detachable magazines or loads rounds directly into the weapon

SWEP.DefaultLoad = "556x45_fmj" -- the round that this gun will be loaded with by default
SWEP.DefaultMagazine = { -- this is the weapon's default magazine, this will be automatically given if the setting act3_instantaction is enabled
    Type = "stanag_30",
    Rounds = {}
}

SWEP.MagazineType = "stanag"

SWEP.Calibre = "556x45"
SWEP.PrintCalibre = "5.56x45mm"

SWEP.MuzzleVelocity = 25000

SWEP.MuzzleEffect = "act3_muzzleeffect"
SWEP.Suppressed = false

SWEP.SoundShoot = "weapons/m4a1/m4a1_unsil-1.wav"
SWEP.SoundShootSuppressed = "weapons/m4a1/m4a1-1.wav"
SWEP.SoundShootVol = 110
SWEP.SoundShootPitch = 100

SWEP.SoundCycle = "weapons/m4a1/m4a1_boltpull.wav"
SWEP.SoundDryfire = "weapons/ar2/ar2_empty.wav"



SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2
SWEP.AnimReload = ACT_HL2MP_GESTURE_RELOAD_AR2
SWEP.ShotgunReload = true
SWEP.AnimReloadStartTime = 0.5
SWEP.AnimReloadEndTime = 0.5
SWEP.AnimReloadExtraTimeAtEnd = 0.5
SWEP.AnimReloadProne = 2087
SWEP.AnimMeleeAttack = ACT_GMOD_GESTURE_MELEE_SHOVE_2HAND

SWEP.HoldtypePassive = "passive"
SWEP.HoldtypeHip = "shotgun"
SWEP.HoldtypeSights = "ar2"
SWEP.HoldtypeBipod = "rpg"



SWEP.Firemodes = {
    {
        Automatic = false,
        BurstLength = 0,
        CustomFiremode = "NONE",
        CustomBars = nil,
        Safe = true
    }
}
SWEP.CustomFiremode = false
SWEP.BurstLength = 0
SWEP.Automatic = true -- use this instead of changing SWEP.Primary.Automatic
SWEP.ManualAction = false

SWEP.ManualActionPos = Vector(0, 0, 0)
SWEP.ManualActionAng = Vector(0, 0, 0)

SWEP.AimTime = 0.25