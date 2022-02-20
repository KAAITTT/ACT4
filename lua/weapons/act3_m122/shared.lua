SWEP.Base = "act3_base"

SWEP.Spawnable = true
SWEP.AdminSpawnable = false
SWEP.PrintName = "M1-22"
SWEP.Category = "ACT3 - Firearms"

SWEP.Desc_Country = "Italy"
SWEP.Desc_Manufacturer = "Chiappa"
SWEP.Desc_Mechanism = "Blowback"
SWEP.Desc_Year = 2016
SWEP.Desc_Weight = 2.3 -- kg
SWEP.ACT3Cat = ACT3_CAT_CARBINE
SWEP.Sidearm = true

SWEP.GiveToCombine = false

SWEP.Slot = 3

SWEP.WorldModel = "models/weapons/act3/rifle_m122.mdl"
SWEP.WorldModelBase = "models/weapons/act3/rifle_m122.mdl" -- Worldmodel base of the weapon world model.
SWEP.WorldModelPos = Vector(14.432, -0.151, 2.066)
SWEP.WorldModelAng = Angle(-11.363, 0, 180)
SWEP.WorldModelBodygroups = "00000"

SWEP.DefaultAttachments = {
    ["stock"] = "m122_stock_full",
    ["barrel"] = "m122_barrel_factory",
    ["fcg"] = "m122_fcg_semi"
}

SWEP.AttachmentBodygroups = {
    ["m122_stock_full"] = {ind = 1, bg = 0},
    ["m122_stock_cut"] = {ind = 1, bg = 1},
    ["m122_barrel_long"] = {ind = 2, bg = 0},
    ["m122_barrel_short"] = {ind = 2, bg = 1},
    ["m122_forerail"] = {ind = 3, bg = 1},
}


SWEP.Attachments = {
    ["stock"] = {
        Type = "m122_stock",
        PrintName = "Stock",
        Installed = nil,
        Required = true,
    },
    ["barrel"] = {
        Type = "m122_barrel",
        PrintName = "Barrel",
        Installed = nil,
        Required = true,
    },
    ["rail"] = {
        Type = "m122_rail",
        PrintName = "Rail",
        Installed = nil,
        Required = false,
    },
    ["fcg"] = {
        Type = "m122_fcg",
        PrintName = "Fire Group",
        Installed = nil,
        Required = true
    },
    ["foregrip"] = {
        Type = "foregrip",
        PrintName = "Foregrip",
        Installed = nil,
        Required = false,
        Pos = Vector(0.821, -0.8, 6.84),
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
        Pos = Vector(0, 0.652, 7.289),
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
        Pos = Vector(0, -1.862, 7.289),
        Ang =  Angle(0, 0, 180),
        Randomize = true,
        RandomizeChance = 10,
        
    },
    ["bolt"] = {
        Type = "bolt",
        ExtraTypes = {"bolt_heavy"},
        PrintName = "Bolt",
        Installed = nil,
        Required = false,
    },
}

SWEP.MuzzleOffset = Vector(26.611, 0.435, -8.014)
SWEP.MuzzleAngle = Angle(0, 0, 0)
SWEP.EjectPos = Vector(-5.558, -0.606, 7.627)
SWEP.EjectAng = Angle(0, 0, 0)

SWEP.ReloadSoundsTable = {
    {
        time = 0.1,
        path = "weapons/mac10/mac10_clipout.wav",
        comp = ACT3_STPART_MAGEJECT
    },
    {
        time = 1.0,
        path = "weapons/scout/scout_clipin.wav",
        comp = ACT3_STPART_MAGLOAD
    },
    {
        time = 1.45,
        path = "weapons/mac10/mac10_boltpull.wav",
        comp = ACT3_STPART_EMPTYRACK
    },
}

SWEP.TrueIronsPos = Vector(0.638, 11.732, -8.25)
SWEP.TrueIronsAng = Vector(0, 0, 0)

SWEP.SightedAimPos = Vector(0.638, 0.732, -8.25)
SWEP.SightedAimAng = Vector(0, 0, 0)

SWEP.LowPos = Vector(4.623, 18.693, -13.266)
SWEP.LowAng = Vector(-25.327, -11.256, 14.069)

SWEP.MagazineOffsetPos = Vector(-4.126, -0.541, 6.879)



SWEP.DamageMult = 1 -- the weapon's main stats are just taken from the bullet
SWEP.ShootingDelay = 60 / 1000
SWEP.TriggerDelay = 0

SWEP.Recoil = 0.5
SWEP.RecoilAngles = 45

SWEP.BlowbackAmount = 0.5
SWEP.BlowbackRecovery = 2.5
SWEP.BlowbackMax = 1
SWEP.RollBlowbackAmount = 4
SWEP.RollBlowbackRecovery = 10
SWEP.RollBlowbackMax = 45

SWEP.HeatAccumulation = 2 -- Out of 100, the amount of heat each shot adds to the weapon
SWEP.HeatDissipation = 75 -- Amount of heat dissipated per second

SWEP.Precision = 1 / 175
SWEP.MaxHeatPrecision = 1 / 50
SWEP.HipfirePenalty = 0 -- Deviation applied on hip fire
SWEP.MaxHeatHipfirePenalty = 0.075
SWEP.MaxMovePenalty = 0.025
SWEP.DispersionInSights = false

SWEP.Sway = 0.75



SWEP.SpeedMult = 1
SWEP.SightedSpeedMult = 0.9



SWEP.OpenBolt = false -- this weapon will not chamber a round to fire. Instead, it will take rounds directly from the magazine. Examples of such weapons include revolvers and open bolt guns.
SWEP.InternalMag = false -- whether this weapon uses detachable magazines or loads rounds directly into the weapon

SWEP.DefaultLoad = "22lr_lrn" -- the round that this gun will be loaded with by default
SWEP.DefaultMagazine = { -- this is the weapon's default magazine, this will be automatically given if the setting act3_instantaction is enabled
    Type = "1022_10",
    Rounds = {}
}

SWEP.MagazineVisible = true

SWEP.MagazineType = "1022"

SWEP.Calibre = "22lr"
SWEP.PrintCalibre = ".22 Long Rifle"

SWEP.MuzzleVelocity = 17312


-- Shell effect is unnecessary since they are taken from "bullets"
SWEP.ShellDelay = 0
SWEP.RevolverEject = false -- whether this weapon ejects shells when reloading instead of after each shot

SWEP.MuzzleEffect = "act3_muzzleeffect"
SWEP.Suppressed = false

SWEP.SoundShoot = "weapons/fiveseven/fiveseven-1.wav"
SWEP.SoundShootSuppressed = "weapons/usp/usp1.wav"
SWEP.SoundShootVol = 90
SWEP.SoundShootPitch = 110

SWEP.SoundCycle = "weapons/mac10/mac10_boltpull.wav"
SWEP.SoundDryfire = "weapons/ar2/ar2_empty.wav"



SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2
SWEP.AnimReload = ACT_HL2MP_GESTURE_RELOAD_AR2
SWEP.AnimReloadProne = 2087
SWEP.AnimMeleeAttack = ACT_GMOD_GESTURE_MELEE_SHOVE_1HAND

SWEP.HoldtypePassive = "passive"
SWEP.HoldtypeHip = "shotgun"
SWEP.HoldtypeSights = "ar2"
SWEP.HoldtypeBipod = "rpg"



SWEP.Firemodes = {
    {
        Automatic = false,
    },
    {
        Safe = true
    }
}

SWEP.AimTime = 0.25