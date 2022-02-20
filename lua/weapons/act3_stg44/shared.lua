SWEP.Base = "act3_base"

SWEP.Spawnable = true
SWEP.AdminSpawnable = false
SWEP.PrintName = "StG 44"
SWEP.Category = "ACT3 - Firearms"

SWEP.Desc_Country = "Germany"
SWEP.Desc_Manufacturer = "Haenel"
SWEP.Desc_Mechanism = "Gas-Operated Long Stroke Piston"
SWEP.Desc_Year = 1944

SWEP.Desc_Weight = 4.6 -- kg
SWEP.ACT3Cat = ACT3_CAT_ASSAULT
SWEP.Sidearm = false

SWEP.GiveToCombine = false

SWEP.Slot = 3

SWEP.WorldModel = "models/weapons/act3/rifle_stg44.mdl"
SWEP.WorldModelBase = "models/weapons/act3/rifle_stg44.mdl" -- Worldmodel base of the weapon world model.
SWEP.WorldModelPos = Vector(0, 0, 1.817)
SWEP.WorldModelAng = Angle(-11.61, 0, 180)

SWEP.AttachmentBodygroups = {
    ["stg44_barrel_factory"] = {ind = 1, bg = 0},
    ["stg44_barrel_short"] = {ind = 1, bg = 1},
    ["stg44_barrel_compact"] = {ind = 1, bg = 2},
    ["stg44_barrel_sniper"] = {ind = 1, bg = 3},
    ["stg44_barrel_krummlauf"] = {ind = 1, bg = 4},
    ["stg44_stock"] = {ind = 2, bg = 1},
    ["stg44_shortscope"] = {ind = 3, bg = 1},
    ["stg44_sniperscope"] = {ind = 3, bg = 2},
}

SWEP.DefaultAttachments = {
    ["stock"] = "stg_stock",
    ["barrel"] = "stg_barrel_factory"
} -- {{["slot"] = "id"}} the gun will spawn with these attachments attached.

SWEP.Attachments = {
    ["stock"] = {
        Type = "stg_stock",
        PrintName = "Stock",
        Installed = nil,
        Required = false,
        Scale = 1,
    },
    ["barrel"] = {
        Type = "stg_barrel", -- type of attachments this slot can take
        PrintName = "Barrel", -- name this slot shows
        Installed = nil, -- which attachment is actually installed in this slot
        Required = true,
        Scale = 1, -- scale applied to attachments in this slot
    },
    ["mount"] = {
        Type = "stg_mount",
        ExtraTypes = {"am_rail"},
        PrintName = "Mount",
        Pos = Vector(4.459, -0.926, 6.335),
        Installed = nil,
        Required = false,
        Randomize = true,
        RandomizeChance = 20,
    },
    ["bolt"] = {
        Type = "bolt",
        ExtraTypes = {"bolt_heavy", "bolt_light"},
        PrintName = "Bolt",
        Installed = nil,
        Required = false,
    },
    ["under"] = {
        Type = "stg44_under",
        PrintName = "Underbarrel",
        Installed = nil,
        Required = false,
        Randomize = true,
        RandomizeChance = 10,
    }
}

SWEP.MuzzleOffset = Vector(26.245, 0.407, -8.643)
SWEP.MuzzleAngle = Angle(0, 0, 0)
SWEP.EjectPos = Vector(10.137, 0, 5.704)
SWEP.EjectAng = Angle(0, 0, 0)
SWEP.MagazineOffsetPos = Vector(0, 0, 0)
SWEP.MagazineOffsetAng = Angle(0, 0, 0)

SWEP.ReloadSoundsTable = {
    {
        time = 0.1,
        path = "weapons/ak47/ak47_clipout.wav",
        comp = ACT3_STPART_MAGEJECT
    },
    {
        time = 1.0,
        path = "weapons/ak47/ak47_clipin.wav",
        comp = ACT3_STPART_MAGLOAD
    },
    {
        time = 1.45,
        path = "weapons/famas/famas_forearm.wav",
        comp = ACT3_STPART_EMPTYRACK
    },
}

SWEP.TrueIronsPos = Vector(1.034, -0.45, -7.531)
SWEP.TrueIronsAng = Vector(-0, 1.271, 0)

SWEP.SightedAimPos = Vector(1.034, -0.45, -7.531)
SWEP.SightedAimAng = Vector(-0, 1.271, 0)

SWEP.LowPos = Vector(4.623, 18.693, -13.266)
SWEP.LowAng = Vector(-25.327, -11.256, 14.069)



SWEP.DamageMult = 1 -- the weapon's main stats are just taken from the bullet
SWEP.ShootingDelay = 60 / 550
SWEP.TriggerDelay = 0

SWEP.Recoil = 3.0
SWEP.RecoilAngles = 20

SWEP.BlowbackAmount = 1
SWEP.BlowbackRecovery = 5
SWEP.BlowbackMax = 2.5
SWEP.RollBlowbackAmount = 4
SWEP.RollBlowbackRecovery = 10
SWEP.RollBlowbackMax = 45

SWEP.HeatAccumulation = 35 -- Out of 100, the amount of heat each shot adds to the weapon
SWEP.HeatDissipation = 200 -- Amount of heat dissipated per second

SWEP.Precision = 1 / 200
SWEP.MaxHeatPrecision = 1 / 75
SWEP.HipfirePenalty = 0 -- Deviation applied on hip fire
SWEP.MaxHeatHipfirePenalty = 0.075
SWEP.MaxMovePenalty = 0.05
SWEP.DispersionInSights = false

SWEP.Sway = 2



SWEP.SpeedMult = 1
SWEP.SightedSpeedMult = 0.9



SWEP.OpenBolt = false -- this weapon will not chamber a round to fire. Instead, it will take rounds directly from the magazine. Examples of such weapons include revolvers and open bolt guns.
SWEP.InternalMag = false -- whether this weapon uses detachable magazines or loads rounds directly into the weapon

SWEP.DefaultLoad = "8mmk_fmj" -- the round that this gun will be loaded with by default
SWEP.DefaultMagazine = { -- this is the weapon's default magazine, this will be automatically given if the setting act3_instantaction is enabled
    Type = "stg44_30",
    Rounds = {}
}

SWEP.MagazineType = "stg44"

SWEP.Calibre = "8mmk"
SWEP.PrintCalibre = "7.92x33mm Kurz"

SWEP.MuzzleEffect = "act3_muzzleeffect"
SWEP.Suppressed = false

SWEP.SoundShoot = "weapons/aug/aug-1.wav"
SWEP.SoundShootSuppressed = "weapons/m4a1/m4a1-1.wav"
SWEP.SoundShootVol = 110
SWEP.SoundShootPitch = 85

SWEP.SoundCycle = "weapons/famas/famas_forearm.wav"
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
        BurstLength = 0,
        CustomFiremode = nil,
        CustomBars = nil,
        Safe = false
    },
    {
        Automatic = false,
        BurstLength = 0,
        CustomFiremode = nil,
        CustomBars = nil,
        Safe = false
    },
    {
        Automatic = false,
        BurstLength = 0,
        CustomFiremode = nil,
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

SWEP.MuzzleVelocity = 20000