SWEP.Base = "act3_base"

SWEP.Spawnable = true
SWEP.AdminSpawnable = false
SWEP.PrintName = "AWM"
SWEP.Category = "ACT3 - Firearms"

SWEP.Desc_Country = "United Kingdom"
SWEP.Desc_Manufacturer = "Accuracy International"
SWEP.Desc_Mechanism = "Bolt-Action"
SWEP.Desc_Year = 1988
SWEP.Desc_Weight = 6.5 -- kg
SWEP.ACT3Cat = ACT3_CAT_SNIPER
SWEP.Sidearm = false

SWEP.Desc_Extra = {
    "",
    "Cold weather sniper rifle.",
    "",
}

SWEP.Slot = 3

SWEP.WorldModel = "models/weapons/act3/rifle_awp.mdl"
SWEP.WorldModelBase = "models/weapons/act3/rifle_awp.mdl" -- Worldmodel base of the weapon world model.
SWEP.WorldModelPos = Vector(13.838, -0.084, 2.532)
SWEP.WorldModelAng = Angle(-7.117, 0, 180)
SWEP.WorldModelBodygroups = "00000" -- Sets the bodygroups of the world model.
SWEP.WorldModelSkin = 0 -- Set the skin of the world model.
SWEP.WorldModelAttachments = {} -- {{string path, string bodygroups, int skin, vector pos, angle ang}}

SWEP.DefaultAttachments = {
}

SWEP.AttachmentBodygroups = {
}

SWEP.Attachments = {
    ["foregrip"] = {
        Type = "foregrip",
        PrintName = "Foregrip",
        Installed = nil,
        Required = false,
        Pos = Vector(1.753, 0, 7.468),
        Ang = Angle(0, 0, 0)
    },
    ["sight"] = {
        Type = "sight",
        PrintName = "Sight",
        Installed = nil,
        Required = false,
        Scale = 1,
        Pos = Vector(-1.31, 0, 9.781),
        Ang = Angle(0, 0, 0),
        Randomize = true,
        RandomizeChance = 100,
        RandomizeWhitelist = {
            "att_sight_hunter",
            "att_sight_magnus",
            "att_sight_vampir",
            "att_sight_farview"
        }
    },
    ["muzzle"] = {
        Type = "rifle_muzzle",
        PrintName = "Muzzle",
        Installed = nil,
        Required = false,
        Scale = 1.5,
        Pos = Vector(29.903, -0.16, 8.586),
        Ang = Angle(0, 0, 0),
        Randomize = true,
        RandomizeChance = 25,
        
    },
    ["accessory_right"] = {
        Type = "accessory",
        PrintName = "Accessory",
        Installed = nil,
        Required = false,
        Scale = 1,
        Pos = Vector(8.27, 1.166, 7.355),
        Ang = Angle(0, 0, 0),
        Randomize = true,
        RandomizeChance = 20,
        
    },
    ["accessory_left"] = {
        Type = "accessory",
        PrintName = "Accessory",
        Installed = nil,
        Required = false,
        Scale = 1,
        Pos = Vector(8.27, -1.53, 7.355),
        Ang =  Angle(0, 0, 180),
        Randomize = true,
        RandomizeChance = 10,
        
    }
} -- {{id=""}}


SWEP.MuzzleOffset = Vector(38.525, 0.945, -10.499)
SWEP.MuzzleAngle = Angle(-12.367, 0, 0)
SWEP.EjectPos = Vector(-2.889, 0, 9.126)
SWEP.EjectAng = Angle(0, 0, 0)

SWEP.ReloadSoundsTable = {
    {
        time = 0.1,
        path = "weapons/awp/awp_clipout.wav",
        comp = ACT3_STPART_MAGEJECT
    },
    {
        time = 1.0,
        path = "weapons/awp/awp_clipin.wav",
        comp = ACT3_STPART_MAGLOAD
    },
    {
        time = 1.45,
        path = "weapons/scout/scout_bolt.wav",
        comp = ACT3_STPART_EMPTYRACK
    },
}

SWEP.Magnification = 1

SWEP.TrueIronsPos = Vector(0.134, 15.774, -10.171)
SWEP.TrueIronsAng = Vector(0, 0, 0)

SWEP.SightedAimPos = Vector(0.134, -5, -10.171)
SWEP.SightedAimAng = Vector(0, 0, 0)

SWEP.UseTrueIrons = true

SWEP.LowPos = Vector(4.623, 18.693, -13.266)
SWEP.LowAng = Vector(-25.327, -11.256, 14.069)


SWEP.ShootingDelay = 60 / 55
SWEP.TriggerDelay = 0

SWEP.Recoil = 12
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

SWEP.DefaultLoad = "338lm_fmj"

SWEP.DefaultMagazine = { -- this is the weapon's default magazine, this will be automatically given if the setting act3_instantaction is enabled
    Type = "awp_5",
    Rounds = {}, -- the actual bulletids that make up the ammo in the magazine
}

SWEP.MagazineType = "awp"
SWEP.MagazineVisible = true

SWEP.MagazineOffsetPos = Vector(0, 0, 0)
SWEP.MagazineOffsetAng = Angle(0, 0, 0)

SWEP.Calibre = "338lm"
SWEP.PrintCalibre = ".338 Lapua Magnum"


-- Shell effect is unnecessary since they are taken from "bullets"
SWEP.ShellDelay = 0.6

SWEP.MuzzleEffect = "act3_muzzleeffect"

SWEP.SoundShoot = "weapons/awp/awp1.wav"
SWEP.SoundShootSuppressed = "weapons/m4a1/m4a1-1.wav"
SWEP.SoundShootVol = 150
SWEP.SoundShootPitch = 100

SWEP.SoundBoltAction = "weapons/scout/scout_bolt.wav"
SWEP.SoundBoltActionDelay = 0.35
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

SWEP.ManualActionPos = Vector(0.129, 12.111, -10.171)
SWEP.ManualActionAng = Vector(-7.519, 0, -6.764)

SWEP.MuzzleVelocity = 44640