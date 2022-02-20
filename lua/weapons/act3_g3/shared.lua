SWEP.Base = "act3_base"

SWEP.Spawnable = true
SWEP.AdminSpawnable = false
SWEP.PrintName = "G3"
SWEP.Category = "ACT3 - Firearms"

SWEP.Desc_Country = "Germany"
SWEP.Desc_Manufacturer = "Heckler And Koch"
SWEP.Desc_Mechanism = "Roller-Delayed Blowback"
SWEP.Desc_Year = 1959
SWEP.Desc_Weight = 4.1 -- kg
SWEP.ACT3Cat = ACT3_CAT_BATTLE
SWEP.Sidearm = false

SWEP.Desc_Extra = {
    "",
    "German battle rifle.",
    "",
}

SWEP.Slot = 3

SWEP.WorldModel = "models/weapons/act3/rifle_g3.mdl"
SWEP.WorldModelBase = "models/weapons/act3/rifle_g3.mdl" -- Worldmodel base of the weapon world model.
SWEP.WorldModelPos = Vector(13.289, 0.796, 3.038)
SWEP.WorldModelAng = Angle(-4.206, 0, 180)

SWEP.DefaultAttachments = {
    ["stock"] = "g3_stock_poly",
    ["barrel"] = "g3_barrel_long",
    ["grip"] = "g3_grip_poly",
    ["handguard"] = "g3_handguard_poly",
    ["fcg"] = "g3_fcg_auto"
}

SWEP.AttachmentBodygroups = {
    ["g3_handguard_poly"] = {ind = 1, bg = 0},
    ["g3_handguard_poly_short"] = {ind = 1, bg = 1},
    ["g3_handguard_wood_long"] = {ind = 1, bg = 2},
    ["g3_handguard_wood_short"] = {ind = 1, bg = 3},
    ["g3_barrel_long"] = {ind = 2, bg = 0},
    ["g3_barrel_short"] = {ind = 2, bg = 1},
    ["g3_barrel_sniper"] = {ind = 2, bg = 2},
    ["g3_grip_poly"] = {ind = 3, bg = 0},
    ["g3_grip_wood"] = {ind = 3, bg = 1},
    ["g3_stock_poly"] = {ind = 4, bg = 1},
    ["g3_stock_wood"] = {ind = 4, bg = 2},
    ["g3_stock_folded"] = {ind = 4, bg = 3},
    ["g3_stock_extended"] = {ind = 4, bg = 4},
    ["g3_mount_rail"] = {ind = 5, bg = 1},
}

SWEP.Attachment_Flags = {
}

SWEP.Attachments = {
    ["stock"] = {
        Type = "g3_stock",
        PrintName = "Stock",
        Installed = nil,
        Required = false,
        Scale = 1,
    },
    ["handguard"] = {
        Type = "g3_handguard", -- type of attachments this slot can take
        PrintName = "Handguard", -- name this slot shows
        Installed = nil, -- which attachment is actually installed in this slot
        Required = true,
        Scale = 1, -- scale applied to attachments in this slot
    },
    ["fcg"] = {
        Type = "g3_fcg",
        PrintName = "Fire Group",
        Installed = nil,
        Required = true
    },
    ["barrel"] = {
        Type = "g3_barrel", -- type of attachments this slot can take
        PrintName = "Barrel", -- name this slot shows
        Installed = nil, -- which attachment is actually installed in this slot
        Required = true,
        Scale = 1, -- scale applied to attachments in this slot
    },
    ["grip"] = {
        Type = "g3_grip", -- type of attachments this slot can take
        PrintName = "Grip", -- name this slot shows
        Installed = nil, -- which attachment is actually installed in this slot
        Required = true,
        Scale = 1, -- scale applied to attachments in this slot
    },
    ["mount"] = {
        Type = "g3_mount", -- type of attachments this slot can take
        PrintName = "Mount", -- name this slot shows
        Installed = nil, -- which attachment is actually installed in this slot
        Required = false,
        Scale = 1, -- scale applied to attachments in this slot
    },
    ["foregrip"] = {
        Type = "foregrip",
        PrintName = "Foregrip",
        Installed = nil,
        Required = false,
        Pos = Vector(2.217, 0, 7.936),
        Ang = Angle(0, 0, 0),
        Randomize = true,
        RandomizeChance = 30,
        
    },
    ["accessory_right"] = {
        Type = "accessory",
        PrintName = "Accessory",
        Installed = nil,
        Required = false,
        Scale = 1,
        Pos = Vector(0.456, 1.35, 7.893),
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
        Pos = Vector(0.456, -1.517, 7.893),
        Ang =  Angle(0, 0, 180),
        Randomize = true,
        RandomizeChance = 10,
    },
    ["bolt"] = {
        Type = "bolt",
        ExtraTypes = {"bolt_heavy", "bolt_light"},
        PrintName = "Bolt",
        Installed = nil,
        Required = false,
    },
}

SWEP.MuzzleOffset = Vector(27.975, 0.898, -6.792)
SWEP.MuzzleAngle = Angle(0, 0, 0)
SWEP.EjectPos = Vector(-3.194, 0, 8.416)
SWEP.EjectAng = Angle(0, 0, 0)
SWEP.MagazineOffsetPos = Vector(-3.047, 0, 8.045)
SWEP.MagazineOffsetAng = Angle(0, 0, 0)

SWEP.ReloadSoundsTable = {
    {
        time = 0.1,
        path = "weapons/g3sg1/g3sg1_clipout.wav",
        comp = ACT3_STPART_MAGEJECT
    },
    {
        time = 1.0,
        path = "weapons/g3sg1/g3sg1_clipin.wav",
        comp = ACT3_STPART_MAGLOAD
    },
    {
        time = 1.45,
        path = "weapons/g3sg1/g3sg1_slide.wav",
        comp = ACT3_STPART_EMPTYRACK
    },
}

SWEP.TrueIronsPos = Vector(0.045, 16.079, -10.374)
SWEP.TrueIronsAng = Vector(0.728, 0.007, 0)

SWEP.SightedAimPos = Vector(0.045, -5, -10.374)
SWEP.SightedAimAng = Vector(0.728, 0.007, 0)


SWEP.LowPos = Vector(4.623, 18.693, -13.266)
SWEP.LowAng = Vector(-25.327, -11.256, 14.069)



SWEP.DamageMult = 1 -- the weapon's main stats are just taken from the bullet
SWEP.ShootingDelay = 60 / 550
SWEP.TriggerDelay = 0

SWEP.Recoil = 6.5
SWEP.RecoilAngles = 35

SWEP.BlowbackAmount = 1
SWEP.BlowbackRecovery = 7.5
SWEP.BlowbackMax = 2.5
SWEP.RollBlowbackAmount = 5
SWEP.RollBlowbackRecovery = 10
SWEP.RollBlowbackMax = 45

SWEP.HeatAccumulation = 50 -- Out of 100, the amount of heat each shot adds to the weapon
SWEP.HeatDissipation = 200 -- Amount of heat dissipated per second

SWEP.Precision = 1 / 800
SWEP.MaxHeatPrecision = 1 / 50
SWEP.HipfirePenalty = 0 -- Deviation applied on hip fire
SWEP.MaxHeatHipfirePenalty = 0.075
SWEP.MaxMovePenalty = 0.1
SWEP.DispersionInSights = false

SWEP.Sway = 2



SWEP.SpeedMult = 1
SWEP.SightedSpeedMult = 0.9



SWEP.OpenBolt = false -- this weapon will not chamber a round to fire. Instead, it will take rounds directly from the magazine. Examples of such weapons include revolvers and open bolt guns.
SWEP.InternalMag = false -- whether this weapon uses detachable magazines or loads rounds directly into the weapon

SWEP.DefaultLoad = "762x51_fmj" -- the round that this gun will be loaded with by default
SWEP.DefaultMagazine = { -- this is the weapon's default magazine, this will be automatically given if the setting act3_instantaction is enabled
    Type = "g3_20",
    Rounds = {}
}

SWEP.MagazineType = "g3"

SWEP.Calibre = "762x51"
SWEP.PrintCalibre = "7.62x51mm NATO"

SWEP.MuzzleVelocity = 40000

SWEP.MuzzleEffect = "act3_muzzleeffect"
SWEP.Suppressed = false

SWEP.SoundShoot = "weapons/g3sg1/g3sg1-1.wav"
SWEP.SoundShootSuppressed = "weapons/m4a1/m4a1-1.wav"
SWEP.SoundShootVol = 120
SWEP.SoundShootPitch = 100

SWEP.SoundCycle = "weapons/m4a1/m4a1_boltpull.wav"
SWEP.SoundDryfire = "weapons/ar2/ar2_empty.wav"



SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2
SWEP.AnimReload = ACT_HL2MP_GESTURE_RELOAD_SMG1
SWEP.AnimReloadProne = 2087
SWEP.AnimMeleeAttack = ACT_GMOD_GESTURE_MELEE_SHOVE_2HAND

SWEP.HoldtypePassive = "passive"
SWEP.HoldtypeHip = "shotgun"
SWEP.HoldtypeSights = "ar2"
SWEP.HoldtypeBipod = "rpg"



SWEP.Firemodes = {
    {
        Automatic = true,
    },
    {
        Automatic = false,
    },
    {
        Automatic = false,
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