SWEP.Base = "act3_base"

SWEP.Spawnable = true
SWEP.AdminSpawnable = false
SWEP.PrintName = "P90"
SWEP.Category = "ACT3 - Firearms"

SWEP.Desc_Country = "Belgium"
SWEP.Desc_Manufacturer = "Fabrique National"
SWEP.Desc_Mechanism = "Straight Blowback Closed Bolt"
SWEP.Desc_Year = 1991
SWEP.Desc_Weight = 2.6 -- kg
SWEP.ACT3Cat = ACT3_CAT_SMG
SWEP.Sidearm = false

SWEP.Slot = 3

SWEP.WorldModel = "models/weapons/act3/smg_p90.mdl"
SWEP.WorldModelBase = "models/weapons/act3/smg_p90.mdl" -- Worldmodel base of the weapon world model.
SWEP.WorldModelPos = Vector(8.217, 0.642, 2.877)
SWEP.WorldModelAng = Angle(-12.374, 0, 180)
SWEP.WorldModelBodygroups = "00000"

SWEP.DefaultAttachments = {
    ["fcg"] = "p90_fcg_auto",
    ["top"] = "p90_mount_usg",
    ["barrel"] = "p90_barrel_factory"
}

SWEP.AttachmentBodygroups = {
    ["p90_mount_reflex"] = {ind = 1, bg = 0},
    ["p90_mount_rail"] = {ind = 1, bg = 1},
    ["p90_barrel_short"] = {ind = 2, bg = 0},
    ["p90_barrel_carbine"] = {ind = 2, bg = 1},
}


SWEP.Attachments = {
    ["fcg"] = {
        Type = "p90_fcg",
        PrintName = "Fire Group",
        Installed = nil,
        Required = true,
        Scale = 1,
    },
    ["top"] = {
        Type = "p90_mount",
        PrintName = "Mount",
        Installed = nil,
        Required = true,
        Scale = 1,
    },
    ["barrel"] = {
        Type = "p90_barrel",
        PrintName = "Barrel",
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
        Pos = Vector(0.916, 0.467, 10.92),
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
        Pos = Vector(0.916, -1.635, 10.92),
        Ang =  Angle(0, 0, 180),
        Randomize = true,
        RandomizeChance = 10,
    }
}

SWEP.MuzzleOffset = Vector(13.6, 1.524, -5.994)
SWEP.MuzzleAngle = Angle(0, 0, 0)
SWEP.EjectPos = Vector(-15.598, -2, 3.591)
SWEP.EjectAng = Angle(-90, 90, 0)
SWEP.MagazineOffsetPos = Vector(0, 0, 0)
SWEP.MagazineOffsetAng = Angle(0, 0, 0)

SWEP.ReloadSoundsTable = {
    {
        time = 0.1,
        path = "weapons/p90/p90_clipout.wav",
        comp = ACT3_STPART_MAGEJECT
    },
    {
        time = 1.0,
        path = "weapons/p90/p90_clipin.wav",
        comp = ACT3_STPART_MAGLOAD
    },
    {
        time = 1.45,
        path = "weapons/p90/p90_boltpull.wav",
        comp = ACT3_STPART_EMPTYRACK
    },
}



SWEP.TrueIronsPos = Vector(0.167, 11.557, -12.129)
SWEP.TrueIronsAng = Vector(0.861, -1.897, 0)

SWEP.SightedAimPos = Vector(0.167, 0, -12.129)
SWEP.SightedAimAng = Vector(0.861, -1.897, 0)

SWEP.LowPos = Vector(4.623, 18.693, -13.266)
SWEP.LowAng = Vector(-25.327, -11.256, 14.069)

SWEP.DamageMult = 1 -- the weapon's main stats are just taken from the bullet
SWEP.ShootingDelay = 60 / 900
SWEP.TriggerDelay = 0

SWEP.Recoil = 1.25
SWEP.RecoilAngles = 25

SWEP.BlowbackAmount = 0.75
SWEP.BlowbackRecovery = 6
SWEP.BlowbackMax = 3
SWEP.RollBlowbackAmount = 3
SWEP.RollBlowbackRecovery = 10
SWEP.RollBlowbackMax = 45

SWEP.HeatAccumulation = 5 -- Out of 100, the amount of heat each shot adds to the weapon
SWEP.HeatDissipation = 125 -- Amount of heat dissipated per second

SWEP.Precision = 1 / 250
SWEP.MaxHeatPrecision = 1 / 50
SWEP.HipfirePenalty = 0 -- Deviation applied on hip fire
SWEP.MaxHeatHipfirePenalty = 0.075
SWEP.MaxMovePenalty = 0.025
SWEP.DispersionInSights = false

SWEP.Sway = 2



SWEP.SpeedMult = 1
SWEP.SightedSpeedMult = 0.9



SWEP.OpenBolt = false -- this weapon will not chamber a round to fire. Instead, it will take rounds directly from the magazine. Examples of such weapons include revolvers and open bolt guns.
SWEP.InternalMag = false -- whether this weapon uses detachable magazines or loads rounds directly into the weapon

SWEP.DefaultLoad = "57x28_ap" -- the round that this gun will be loaded with by default
SWEP.DefaultMagazine = { -- this is the weapon's default magazine, this will be automatically given if the setting act3_instantaction is enabled
    Type = "p90_50",
    Rounds = {}
}

SWEP.MagazineType = "p90"

SWEP.Calibre = "57x28"
SWEP.PrintCalibre = "5.7x28mm"
SWEP.PostReloadDelay = 0.25
SWEP.ReloadTimeOverride = -1 -- override reload time. usually no reason to do this unless using custom anims not in anim table.

SWEP.MuzzleVelocity = 37600

SWEP.MuzzleEffect = "act3_muzzleeffect"
SWEP.Suppressed = false

SWEP.SoundShoot = "weapons/p90/p90-1.wav"
SWEP.SoundShootSuppressed = "weapons/m4a1/m4a1-1.wav"
SWEP.SoundShootVol = 105
SWEP.SoundShootPitch = 100

SWEP.SoundCycle = "weapons/mp5navy/mp5_slideback.wav"
SWEP.SoundDryfire = "weapons/ar2/ar2_empty.wav"



SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2
SWEP.AnimReload = ACT_HL2MP_GESTURE_RELOAD_SMG1
SWEP.AnimReloadProne = 2087
SWEP.AnimMeleeAttack = ACT_GMOD_GESTURE_MELEE_SHOVE_2HAND

SWEP.HoldtypePassive = "passive"
SWEP.HoldtypeHip = "shotgun"
SWEP.HoldtypeSights = "tight"



SWEP.Firemodes = {
    {
        Automatic = true,
    },
    {
        Automatic = false,
    },
    {
        Safe = true
    }
}

SWEP.AimTime = 0.25