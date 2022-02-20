SWEP.Base = "act3_base"

SWEP.Spawnable = true
SWEP.AdminSpawnable = false
SWEP.PrintName = "UMP-45"
SWEP.Category = "ACT3 - Firearms"

SWEP.Desc_Country = "Germany"
SWEP.Desc_Manufacturer = "Heckler And Koch"
SWEP.Desc_Mechanism = "Closed-Bolt Blowback"
SWEP.Desc_Year = 1999
SWEP.Desc_Weight = 2.3 -- kg
SWEP.ACT3Cat = ACT3_CAT_SMG
SWEP.Sidearm = false

SWEP.Slot = 3

SWEP.WorldModel = "models/weapons/act3/smg_ump.mdl"
SWEP.WorldModelBase = "models/weapons/act3/smg_ump.mdl" -- Worldmodel base of the weapon world model.
SWEP.WorldModelPos = Vector(14.303, 0.796, 2.134)
SWEP.WorldModelAng = Angle(-11.745, 0, 180)
SWEP.WorldModelBodygroups = "00000"

SWEP.DefaultAttachments = {
    ["stock"] = "ump_stock_factory",
    ["barrel"] = "ump_barrel_factory",
    ["fcg"] = "ump_fcg_4pos"
}

SWEP.AttachmentBodygroups = {
    ["ump_barrel_carbine"] = {ind = 1, bg = 1},
    ["ump_barrel_short"] = {ind = 1, bg = 2},
    ["ump_stock_factory"] = {ind = 2, bg = 1},
    ["ump_stock_carbine"] = {ind = 2, bg = 2},
}

SWEP.AttachmentFlags = {
    "nobipod",
    "noubgl"
}

SWEP.Attachments = {
    ["stock"] = {
        Type = "ump_stock",
        PrintName = "Stock",
        Installed = nil,
        Required = false,
        Scale = 1,
    },
    ["barrel"] = {
        Type = "ump_barrel",
        PrintName = "Barrel",
        Installed = nil,
        Required = true,
        Scale = 1,
    },
    ["fcg"] = {
        Type = "ump_fcg",
        PrintName = "Fire Group",
        Installed = nil,
        Required = true,
        Scale = 1,
    },
    ["sight"] = {
        Type = "sight",
        PrintName = "Sight",
        Installed = nil,
        Required = false,
        Scale = 1,
        Pos = Vector(-6.328, 0.135, 10.578),
        Ang = Angle(0, 0, 0),
        Randomize = true,
        RandomizeChance = 40,
    },
    ["foregrip"] = {
        Type = "foregrip",
        PrintName = "Foregrip",
        Installed = nil,
        Required = false,
        Pos = Vector(1.518, 0, 6.992),
        Ang = Angle(0, 0, 0),
        Randomize = true,
        RandomizeChance = 30,
        RandomizeWhitelist = false
    },
    ["accessory_right"] = {
        Type = "accessory",
        PrintName = "Accessory",
        Installed = nil,
        Required = false,
        Scale = 1,
        Pos = Vector(-1.92, 0.959, 7.881),
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
        Pos = Vector(-1.92, -1.249, 7.881),
        Ang =  Angle(0, 0, 180),
        Randomize = true,
        RandomizeChance = 10,
    }
}

SWEP.MuzzleOffset = Vector(18.184, 0.916, -6.944)
SWEP.MuzzleAngle = Angle(0, 0, 0)
SWEP.EjectPos = Vector(-6.783, 0, 8.086)
SWEP.EjectAng = Angle(0, 0, 0)
SWEP.MagazineOffsetPos = Vector(2.533, 0, 7.701)
SWEP.MagazineOffsetAng = Angle(0, 0, 0)

SWEP.ReloadSoundsTable = {
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

SWEP.TrueIronsPos = Vector(0.16, 16.337, -10.532)
SWEP.TrueIronsAng = Vector(0.344, -0.116, 0)

SWEP.SightedAimPos = Vector(0.16, -10, -10.532)
SWEP.SightedAimAng = Vector(0.344, -0.116, 0)

SWEP.LowPos = Vector(4.623, 18.693, -13.266)
SWEP.LowAng = Vector(-25.327, -11.256, 14.069)



SWEP.DamageMult = 1 -- the weapon's main stats are just taken from the bullet
SWEP.ShootingDelay = 60 / 600
SWEP.TriggerDelay = 0

SWEP.Recoil = 1.5
SWEP.RecoilAngles = 35

SWEP.BlowbackAmount = 1
SWEP.BlowbackRecovery = 6
SWEP.BlowbackMax = 3
SWEP.RollBlowbackAmount = 1
SWEP.RollBlowbackRecovery = 10
SWEP.RollBlowbackMax = 45

SWEP.HeatAccumulation = 15 -- Out of 100, the amount of heat each shot adds to the weapon
SWEP.HeatDissipation = 125 -- Amount of heat dissipated per second

SWEP.Precision = 1 / 225
SWEP.MaxHeatPrecision = 1 / 50
SWEP.HipfirePenalty = 0 -- Deviation applied on hip fire
SWEP.MaxHeatHipfirePenalty = 0.075
SWEP.MaxMovePenalty = 0.025
SWEP.DispersionInSights = false

SWEP.Sway = 3



SWEP.SpeedMult = 1
SWEP.SightedSpeedMult = 0.9



SWEP.OpenBolt = true -- this weapon will not chamber a round to fire. Instead, it will take rounds directly from the magazine. Examples of such weapons include revolvers and open bolt guns.
SWEP.InternalMag = false -- whether this weapon uses detachable magazines or loads rounds directly into the weapon

SWEP.DefaultLoad = "45acp_fmj" -- the round that this gun will be loaded with by default
SWEP.DefaultMagazine = { -- this is the weapon's default magazine, this will be automatically given if the setting act3_instantaction is enabled
    Type = "ump_25",
    Rounds = {}
}

SWEP.MagazineVisible = true

SWEP.MagazineType = "ump"

SWEP.Calibre = "45acp"
SWEP.PrintCalibre = ".45 ACP"

SWEP.MuzzleVelocity = 15000


-- Shell effect is unnecessary since they are taken from "bullets"
SWEP.ShellDelay = 0
SWEP.RevolverEject = false -- whether this weapon ejects shells when reloading instead of after each shot

SWEP.MuzzleEffect = "act3_muzzleeffect"
SWEP.Suppressed = false

SWEP.SoundShoot = "weapons/ump45/ump45-1.wav"
SWEP.SoundShootSuppressed = "weapons/usp/usp1.wav"
SWEP.SoundShootVol = 105
SWEP.SoundShootPitch = 100

SWEP.SoundCycle = "weapons/galil/galil_boltpull.wav"
SWEP.SoundDryfire = "weapons/ar2/ar2_empty.wav"



SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_SMG1
SWEP.AnimReload = ACT_HL2MP_GESTURE_RELOAD_SMG1
SWEP.AnimReloadProne = 2087
SWEP.AnimMeleeAttack = ACT_GMOD_GESTURE_MELEE_SHOVE_1HAND

SWEP.HoldtypePassive = "passive"
SWEP.HoldtypeHip = "shotgun"
SWEP.HoldtypeSights = "ar2"
SWEP.HoldtypeBipod = "ar2"



SWEP.Firemodes = {
    {
        Automatic = true,
    },
    {
        Automatic = true,
        BurstLength = 2
    },
    {
        Automatic = false,
    },
    {
        Safe = true
    }
}

SWEP.AimTime = 0.25