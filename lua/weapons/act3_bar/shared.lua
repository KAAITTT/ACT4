SWEP.Base = "act3_base"

SWEP.Spawnable = true
SWEP.AdminSpawnable = false
SWEP.PrintName = "BAR"
SWEP.Category = "ACT3 - Firearms"

SWEP.Desc_Country = "USA"
SWEP.Desc_Manufacturer = "Browning"
SWEP.Desc_Mechanism = "Rising Bolt Lock"
SWEP.Desc_Year = 1917
SWEP.Desc_Weight = 7.25 -- kg
SWEP.ACT3Cat = ACT3_CAT_LMG
SWEP.Sidearm = false

SWEP.Slot = 3

SWEP.WorldModel = "models/weapons/act3/mg_bar.mdl"
SWEP.WorldModelBase = "models/weapons/act3/mg_bar.mdl" -- Worldmodel base of the weapon world model.
SWEP.WorldModelPos = Vector(-0.232, -0.478, 0.955)
SWEP.WorldModelAng = Angle(-11.374, 0, 180)

SWEP.AttachmentBodygroups = {
    ["bar_barrel_long"] = {ind = 1, bg = 0},
    ["bar_barrel_medium"] = {ind = 1, bg = 1},
    ["bar_barrel_short"] = {ind = 1, bg = 2},
    ["bar_stock"] = {ind = 2, bg = 1},
    ["bar_grip"] = {ind = 3, bg = 1},
    ["bar_stock"] = {ind = 4, bg = 1},
    ["bar_bipod"] = {ind = 5, bg = 1},
}


SWEP.DefaultAttachments = {
    ["stock"] = "bar_stock",
    ["barrel"] = "bar_barrel_long"
}

SWEP.Attachments = {
    ["stock"] = {
        Type = "bar_stock",
        PrintName = "Stock",
        Installed = nil,
        Required = false,
        Scale = 1,
    },
    ["barrel"] = {
        Type = "bar_barrel", -- type of attachments this slot can take
        PrintName = "Barrel", -- name this slot shows
        Installed = nil, -- which attachment is actually installed in this slot
        Required = true,
        Scale = 1, -- scale applied to attachments in this slot
        Randomize = true,
        RandomizeChance = 20
    },
    ["grip"] = {
        Type = "bar_grip", -- type of attachments this slot can take
        PrintName = "Grip", -- name this slot shows
        Installed = nil, -- which attachment is actually installed in this slot
        Required = false,
        Scale = 1, -- scale applied to attachments in this slot
        Randomize = true,
        RandomizeChance = 20
    },
    ["bipod"] = {
        Type = "bar_bipod", -- type of attachments this slot can take
        PrintName = "Bipod", -- name this slot shows
        Installed = nil, -- which attachment is actually installed in this slot
        Required = false,
        Scale = 1, -- scale applied to attachments in this slot
        Randomize = true,
        RandomizeChance = 30
    },
    ["bolt"] = {
        Type = "bolt",
        ExtraTypes = {"bolt_heavy", "bolt_light"},
        PrintName = "Bolt",
        Installed = nil,
        Required = false,
    },
}

SWEP.MuzzleOffset = Vector(37.936, 0.859, -10.855)
SWEP.MuzzleAngle = Angle(0, 0, 0)
SWEP.EjectPos = Vector(8.993, -0.87, 5.14)
SWEP.EjectAng = Angle(0, 0, 0)
SWEP.MagazineOffsetPos = Vector(0, 0, 0)
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
        path = "weapons/sg552/sg552_boltpull.wav",
        comp = ACT3_STPART_EMPTYRACK
    },
}

SWEP.TrueIronsPos = Vector(1.36, 0, -5.452)
SWEP.TrueIronsAng = Vector(0, 0, 0)

SWEP.SightedAimPos = Vector(0.045, -5, -10.374)
SWEP.SightedAimAng = Vector(0.728, 0.007, 0)


SWEP.LowPos = Vector(4.623, 18.693, -13.266)
SWEP.LowAng = Vector(-25.327, -11.256, 14.069)



SWEP.DamageMult = 1 -- the weapon's main stats are just taken from the bullet
SWEP.ShootingDelay = 60 / 700
SWEP.TriggerDelay = 0

SWEP.Recoil = 6.5
SWEP.RecoilAngles = 35

SWEP.BlowbackAmount = 0.5
SWEP.BlowbackRecovery = 4
SWEP.BlowbackMax = 2.5
SWEP.RollBlowbackAmount = 5
SWEP.RollBlowbackRecovery = 10
SWEP.RollBlowbackMax = 45

SWEP.HeatAccumulation = 50 -- Out of 100, the amount of heat each shot adds to the weapon
SWEP.HeatDissipation = 200 -- Amount of heat dissipated per second

SWEP.Precision = 1 / 200
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

SWEP.DefaultLoad = "3006_fmj" -- the round that this gun will be loaded with by default
SWEP.DefaultMagazine = { -- this is the weapon's default magazine, this will be automatically given if the setting act3_instantaction is enabled
    Type = "bar_20",
    Rounds = {}
}

SWEP.MagazineType = "bar"

SWEP.Calibre = "3006"
SWEP.PrintCalibre = ".30-06 Winchester"

SWEP.MuzzleVelocity = 40000

SWEP.MuzzleEffect = "act3_muzzleeffect"
SWEP.Suppressed = false

SWEP.SoundShoot = "weapons/galil/galil-1.wav"
SWEP.SoundShootSuppressed = "weapons/m4a1/m4a1-1.wav"
SWEP.SoundShootVol = 120
SWEP.SoundShootPitch = 85

SWEP.SoundCycle = "weapons/sg552/sg552_boltpull.wav"
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
        CustomFiremode = "FAST",
    },
    {
        Automatic = true,
        CustomFiremode = "SLOW",
        EquipFunc = function(wpn)
            wpn.ShootingDelay = wpn.ShootingDelay * 1.75
        end,
        ResetFunc = function(wpn)
            wpn.ShootingDelay = wpn.ShootingDelay / 1.75
        end
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