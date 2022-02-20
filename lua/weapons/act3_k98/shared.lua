SWEP.Base = "act3_base"

SWEP.Spawnable = true
SWEP.AdminSpawnable = false
SWEP.PrintName = "K98"
SWEP.Category = "ACT3 - Firearms"

SWEP.Desc_Country = "Germany/Israel"
SWEP.Desc_Manufacturer = "Mauser"
SWEP.Desc_Mechanism = "Bolt-Action"
SWEP.Desc_Year = 1946
SWEP.Desc_Weight = 3.7 -- kg
SWEP.ACT3Cat = ACT3_CAT_SNIPER
SWEP.Sidearm = false

SWEP.Desc_Extra = {
    "",
    "Israeli 7.62x51mm Kar 98.",
    "",
    "Ironic, isn't it?"
}

SWEP.Slot = 3

SWEP.WorldModel = "models/weapons/act3/rifle_k98.mdl"
SWEP.WorldModelBase = "models/weapons/act3/rifle_k98.mdl" -- Worldmodel base of the weapon world model.
SWEP.WorldModelPos = Vector(13.838, -0.084, 2.532)
SWEP.WorldModelAng = Angle(-7.117, 0, 180)
SWEP.WorldModelBodygroups = "00000" -- Sets the bodygroups of the world model.
SWEP.WorldModelSkin = 0 -- Set the skin of the world model.
SWEP.WorldModelAttachments = {} -- {{string path, string bodygroups, int skin, vector pos, angle ang}}

SWEP.DefaultAttachments = {
    ["stock"] = "k98_stock_kurz"
}

SWEP.AttachmentBodygroups = {
    ["k98_stock_light"] = {ind = 1, bg = 1},
    ["k98_stock_obrez"] = {ind = 1, bg = 2},
    ["k98_stock_sport"] = {ind = 1, bg = 3},
    ["k98_mount_rail"] = {ind = 2, bg = 1},
    ["k98_mount_scope"] = {ind = 2, bg = 2},
    ["k98_barrel_long"] = {ind = 3, bg = 1},
    ["k98_barrel_obrez"] = {ind = 3, bg = 2},
    ["k98_magwell"] = {ind = 4, bg = 1},
    ["k98_cheekpad"] = {ind = 5, bg = 1}
}

SWEP.Attachments = {
    ["stock"] = {
        Type = "k98_stock",
        PrintName = "Stock",
        Installed = nil,
        Required = true,
    },
    ["foregrip"] = {
        Type = "foregrip",
        PrintName = "Foregrip",
        Installed = nil,
        Required = false,
        Pos = Vector(1.85, -0.541, 6.796),
        Ang = Angle(0, 0, 0),
        Randomize = true,
        RandomizeChance = 3,
        
    },
    ["mount"] = {
        Type = "k98_mount",
        PrintName = "Mount",
        Installed = nil,
        Required = false,
        Randomize = true,
        RandomizeChance = 10,
        
    },
    ["magwell"] = {
        Type = "k98_magwell",
        PrintName = "Conversion",
        Installed = nil,
        Required = false,
    },
    ["accessory_right"] = {
        Type = "accessory",
        PrintName = "Accessory",
        Installed = nil,
        Required = false,
        Scale = 1,
        Pos = Vector(2.263, 0.838, 7.381),
        Ang = Angle(0, 0, 0),
        Randomize = true,
        RandomizeChance = 5,
        
    },
    ["accessory_left"] = {
        Type = "accessory",
        PrintName = "Accessory",
        Installed = nil,
        Required = false,
        Scale = 1,
        Pos = Vector(2.263, -1.828, 7.381),
        Ang =  Angle(0, 0, 180),
        Randomize = true,
        RandomizeChance = 5,
        
    }
} -- {{id=""}}


SWEP.MuzzleOffset = Vector(34.013, 0.565, -9.858)
SWEP.MuzzleAngle = Angle(-12.367, 0, 0)
SWEP.EjectPos = Vector(-3.922, -0.55, 7.94)
SWEP.EjectAng = Angle(0, 0, 0)

-- SWEP.ReloadSoundsTable = {
--     {
--         time = 0.1,
--         path = "weapons/awp/awp_bolt.wav",
--     },
--     {
--         time = 1.0,
--         path = "act3/weapons/k98/k98_clipin.wav",
--     },
--     {
--         time = 1.45,
--         path = "weapons/awp/awp_bolt.wav",
--     },
-- }

SWEP.ReloadSoundsTable = {
    {
        time = 0.1,
        path = "act3/weapons/k98/k98_clipin2.wav",
    },
    {
        time = 0.45,
        path = "weapons/awp/awp_bolt.wav",
        comp = ACT3_STPART_EMPTYRACK
    },
}

SWEP.Magnification = 1

SWEP.TrueIronsPos = Vector(0.639, 13.157, -8.957)
SWEP.TrueIronsAng = Vector(0.607, 0.014, 0)

SWEP.SightedAimPos = Vector(0.639, -19.497, -8.957)
SWEP.SightedAimAng = Vector(0.607, 0.014, 0)

SWEP.UseTrueIrons = true

SWEP.LowPos = Vector(4.623, 18.693, -13.266)
SWEP.LowAng = Vector(-25.327, -11.256, 14.069)


SWEP.DamageMult = 1.25
SWEP.ShootingDelay = 60 / 70
SWEP.TriggerDelay = 0

SWEP.Recoil = 8
SWEP.RecoilAngles = 10

SWEP.BlowbackAmount = 3.5
SWEP.BlowbackRecovery = 4
SWEP.BlowbackMax = 5

SWEP.HeatAccumulation = 40 -- Out of 100, the amount of heat each shot adds to the weapon
SWEP.HeatDissipation = 200 -- Amount of heat dissipated per second

SWEP.Precision = 1 / 900
SWEP.MaxHeatPrecision = 1 / 50
SWEP.HipfirePenalty = 0
SWEP.MaxHeatHipfirePenalty = 0
SWEP.MaxMovePenalty = 0

SWEP.Sway = 1.5

SWEP.SightedSpeedMult = 0.75

SWEP.OpenBolt = true
SWEP.InternalMag = true -- whether this weapon uses detachable magazines or loads rounds directly into the weapon

SWEP.DefaultLoad = "762x51_fmj"

SWEP.Magazine = { -- this is the weapon's default magazine, this will be automatically given if the setting act3_instantaction is enabled
    Type = "k98_mag_5",
    Rounds = {}, -- the actual bulletids that make up the ammo in the magazine
}

SWEP.MagazineType = "int"
SWEP.MagazineVisible = false

SWEP.MagazineOffsetPos = Vector(-4.158, -0.63, 7.406)
SWEP.MagazineOffsetAng = Angle(0, 0, 0)

SWEP.Calibre = "762x51"
SWEP.PrintCalibre = "7.62x51mm NATO"


-- Shell effect is unnecessary since they are taken from "bullets"
SWEP.ShellDelay = 0.4

SWEP.MuzzleEffect = "act3_muzzleeffect"

SWEP.SoundShoot = "act3/weapons/k98/k98-1.wav"
SWEP.SoundShootSuppressed = "weapons/m4a1/m4a1-1.wav"
SWEP.SoundShootVol = 120
SWEP.SoundShootPitch = 100

SWEP.SoundBoltAction = "weapons/scout/scout_bolt.wav"
SWEP.SoundBoltActionDelay = 0.3
SWEP.SoundBoltActionVol = 75
SWEP.SoundBoltActionPitch = 100

SWEP.SoundCycle = "weapons/scout/scout_bolt.wav"
SWEP.SoundDryfire = "weapons/shotgun/shotgun_empty.wav"



SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_RPG
SWEP.AnimReload = ACT_HL2MP_GESTURE_RELOAD_AR2
SWEP.ShotgunReload = true
SWEP.AnimReloadStartTime = 0.5
SWEP.AnimReloadEndTime = 0.5
SWEP.AnimReloadExtraTimeAtEnd = 0.5
SWEP.AnimReloadProne = 2089
SWEP.AnimMeleeAttack = ACT_GMOD_GESTURE_MELEE_SHOVE_2HAND

SWEP.HoldtypePassive = "passive"
SWEP.HoldtypeHip = "shotgun"
SWEP.HoldtypeSights = "ar2"



SWEP.Firemodes = {
    {
        Automatic = false,
        BurstLength = 0,
        CustomFiremode = "BOLT",
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

SWEP.ManualAction = true

SWEP.ManualActionPos = Vector(0.639, 15.42, -8.961)
SWEP.ManualActionAng = Vector(-0.456, 0.014, 9.435)

SWEP.MuzzleVelocity = 41000