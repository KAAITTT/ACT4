SWEP.Base = "act3_base"

SWEP.Spawnable = true
SWEP.AdminSpawnable = false
SWEP.PrintName = "Scout"
SWEP.Category = "ACT3 - Firearms"

SWEP.Desc_Country = "Austria"
SWEP.Desc_Manufacturer = "Steyr"
SWEP.Desc_Mechanism = "Bolt-Action"
SWEP.Desc_Year = 1992
SWEP.Desc_Weight = 3 -- kg
SWEP.ACT3Cat = ACT3_CAT_SNIPER
SWEP.Sidearm = false

SWEP.Slot = 3

SWEP.WorldModel = "models/weapons/act3/rifle_scout.mdl"
SWEP.WorldModelBase = "models/weapons/act3/rifle_scout.mdl" -- Worldmodel base of the weapon world model.
SWEP.WorldModelPos = Vector(1.014, 0.962, 2.151)
SWEP.WorldModelAng = Angle(-13.759, 0, 180)
SWEP.WorldModelBodygroups = "00000" -- Sets the bodygroups of the world model.
SWEP.WorldModelSkin = 0 -- Set the skin of the world model.
SWEP.WorldModelAttachments = {} -- {{string path, string bodygroups, int skin, vector pos, angle ang}}

SWEP.DefaultAttachments = {
    ["sight"] = "att_sight_hunter",
    ["bolt"] = "scout_bolt_straight",
    ["barrel"] = "scout_barrel_factory",
    ["bipod"] = "scout_bipod_up"
}

SWEP.AttachmentBodygroups = {
    ["scout_barrel_factory"] = {ind = 1, bg = 0},
    ["scout_barrel_short"] = {ind = 1, bg = 1},
    ["scout_barrel_sd"] = {ind = 1, bg = 2},
    ["scout_bolt_straight"] = {ind = 2, bg = 0},
    ["scout_bolt_curved"] = {ind = 2, bg = 1},
    ["scout_bolt_spb"] = {ind = 2, bg = 2},
    ["scout_bipod_up"] = {ind = 3, bg = 0},
    ["scout_bipod_down"] = {ind = 3, bg = 1},
}

SWEP.Attachments = {
    ["barrel"] = {
        Type = "scout_barrel",
        PrintName = "Barrel",
        Installed = nil,
        Required = true,
        Scale = 1,
    },
    ["bolt"] = {
        Type = "scout_bolt",
        PrintName = "Bolt",
        Installed = nil,
        Required = true,
        Scale = 1,
        Randomize = true,
        RandomizeChance = 10,
    },
    ["conversion"] = {
        Type = "scout_conversion",
        PrintName = "Conversion",
        Installed = nil,
        Required = false,
        Scale = 1,
    },
    ["bipod"] = {
        Type = "scout_bipod",
        PrintName = "Bipod",
        Installed = nil,
        Required = true,
        Scale = 1,
        Randomize = true,
        RandomizeChance = 50,
    },
    ["sight"] = {
        Type = "sight",
        PrintName = "Sight",
        Installed = nil,
        Required = false,
        Scale = 1,
        Pos = Vector(16.392, 0.361, 5.349),
        Ang = Angle(0, 0, 0),
    },
    ["foregrip"] = {
        Type = "foregrip",
        PrintName = "Foregrip",
        Installed = nil,
        Required = false,
        Pos = Vector(14.758, 0, 2.558),
        Ang = Angle(0, 0, 0),
        Randomize = true,
        RandomizeChance = 5,
    },
} -- {{id=""}}


SWEP.MuzzleOffset = Vector(33.039, 0.973, -9.943)
SWEP.MuzzleAngle = Angle(0, 0, 0)
SWEP.EjectPos = Vector(-2.889, 0, 9.126)
SWEP.EjectAng = Angle(0, 0, 0)

SWEP.ReloadSoundsTable = {
    {
        time = 0.1,
        path = "weapons/scout/scout_clipout.wav",
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

SWEP.Magnification = 1

SWEP.TrueIronsPos = Vector(0, 0, -5.12)
SWEP.TrueIronsAng = Vector(0, 0, 0)

SWEP.SightedAimPos = Vector(0, 0, -5.12)
SWEP.SightedAimAng = Vector(0, 0, 0)

SWEP.UseTrueIrons = true

SWEP.LowPos = Vector(4.623, 18.693, -13.266)
SWEP.LowAng = Vector(-25.327, -11.256, 14.069)


SWEP.ShootingDelay = 60 / 80
SWEP.TriggerDelay = 0

SWEP.Recoil = 6
SWEP.RecoilAngles = 10

SWEP.BlowbackAmount = 3.5
SWEP.BlowbackRecovery = 4
SWEP.BlowbackMax = 5

SWEP.HeatAccumulation = 40 -- Out of 100, the amount of heat each shot adds to the weapon
SWEP.HeatDissipation = 200 -- Amount of heat dissipated per second

SWEP.Precision = 1 / 10000
SWEP.MaxHeatPrecision = 1 / 50
SWEP.HipfirePenalty = 0
SWEP.MaxHeatHipfirePenalty = 0
SWEP.MaxMovePenalty = 0

SWEP.Sway = 1.5


SWEP.OpenBolt = false
SWEP.InternalMag = false -- whether this weapon uses detachable magazines or loads rounds directly into the weapon

SWEP.DefaultLoad = "762x51_fmj"

SWEP.DefaultMagazine = { -- this is the weapon's default magazine, this will be automatically given if the setting act3_instantaction is enabled
    Type = "scout_10",
    Rounds = {}, -- the actual bulletids that make up the ammo in the magazine
}

SWEP.MagazineType = "scout"
SWEP.MagazineVisible = true

SWEP.MagazineOffsetPos = Vector(10.345, 0, 3.668)
SWEP.MagazineOffsetAng = Angle(0, 0, 0)

SWEP.Calibre = "762x51"
SWEP.PrintCalibre = "7.62x51mm NATO"


-- Shell effect is unnecessary since they are taken from "bullets"
SWEP.ShellDelay = 0.3

SWEP.MuzzleEffect = "act3_muzzleeffect"

SWEP.SoundShoot = "weapons/scout/scout_fire-1.wav"
SWEP.SoundShootSuppressed = "weapons/m4a1/m4a1-1.wav"
SWEP.SoundShootVol = 120
SWEP.SoundShootPitch = 100

SWEP.SoundBoltAction = "weapons/scout/scout_bolt.wav"
SWEP.SoundBoltActionDelay = 0.15
SWEP.SoundBoltActionVol = 75
SWEP.SoundBoltActionPitch = 100

SWEP.SoundCycle = "weapons/scout/scout_bolt.wav"
SWEP.SoundDryfire = "weapons/shotgun/shotgun_empty.wav"



SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_RPG
SWEP.AnimReload = ACT_HL2MP_GESTURE_RELOAD_AR2
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

SWEP.ManualActionPos = Vector(0, -1.861, -5.475)
SWEP.ManualActionAng = Vector(0, 0, 0)

SWEP.MuzzleVelocity = 41000