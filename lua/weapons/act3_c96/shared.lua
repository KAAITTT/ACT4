SWEP.Base = "act3_base"

SWEP.Spawnable = true
SWEP.AdminSpawnable = false
SWEP.PrintName = "C96"
SWEP.Category = "ACT3 - Firearms"

SWEP.Desc_Country = "German Empire"
SWEP.Desc_Manufacturer = "Mauser"
SWEP.Desc_Mechanism = "Short-Recoil"
SWEP.Desc_Year = 1896
SWEP.Desc_Weight = 1.13 -- kg
SWEP.ACT3Cat = ACT3_CAT_PISTOL
SWEP.Sidearm = true

SWEP.GiveToCombine = false

SWEP.Desc_Extra = {
    "",
    "Early automatic pistol.",
    "",
}

SWEP.Slot = 1

SWEP.WorldModel = "models/weapons/act3/pistol_c96.mdl"
SWEP.WorldModelBase = "models/weapons/act3/pistol_c96.mdl" -- Worldmodel base of the weapon world model.
SWEP.WorldModelPos = Vector(0.347, -0.32, 0.563)
SWEP.WorldModelAng = Angle(-2.53, 0, 180)
SWEP.WorldModelBodygroups = "00000"

SWEP.DefaultAttachments = {
    ["mag"] = "c96_mag_10",
    ["fcg"] = "c96_fcg_semi",
    ["barrel"] = "c96_barrel_factory"
}

SWEP.AttachmentBodygroups = {
    ["c96_barrel_factory"] = {ind = 1, bg = 0},
    ["c96_barrel_short"] = {ind = 1, bg = 1},
    ["c96_barrel_carbine"] = {ind = 1, bg = 2},
    ["c96_barrel_dl44"] = {ind = 1, bg = 3},
    ["c96_mag"] = {ind = 2, bg = 1},
    ["c96_mag_30"] = {ind = 2, bg = 2},
    ["c96_stock"] = {ind = 3, bg = 1},
    ["c96_scope"] = {ind = 4, bg = 1},
}

SWEP.Attachments = {
    ["fcg"] = {
        Type = "c96_fcg",
        Required = true,
        PrintName = "Fire Group",
        Installed = nil,
    },
    ["stock"] = {
        Type = "c96_stock",
        Required = false,
        PrintName = "Stock",
        Installed = nil
    },
    ["mag"] = {
        Type = "c96_mag",
        PrintName = "Magazine",
        Required = true,
        Installed = nil,
    },
    ["barrel"] = {
        Type = "c96_barrel",
        PrintName = "Barrel",
        Required = true,
        Installed = nil
    },
    ["scope"] = {
        Type = "c96_scope",
        ExtraTypes = {"sight_pistol"},
        PrintName = "Scope",
        Required = false,
        Installed = nil,
        Pos = Vector(4.872, -1.137, 5.098)
    }
}

SWEP.MuzzleOffset = Vector(14.053, 0.634, -4.33)
SWEP.MuzzleAngle = Angle(0, 0, 0)
SWEP.EjectPos = Vector(8.782, -1.142, 4.66)
SWEP.EjectAng = Angle(0, 0, 0)

SWEP.ReloadSoundsTable = {
    {
        time = 0,
        path = "act3/weapons/k98/k98_clipin2.wav",
    },
    {
        time = 0.25,
        path = "weapons/mac10/mac10_boltpull.wav",
        comp = ACT3_STPART_EMPTYRACK
    },
}

SWEP.TrueIronsPos = Vector(1.294, 0.675, -5.225)
SWEP.TrueIronsAng = Vector(1.034, 1.32, 0)

SWEP.LowPos = Vector(4.623, 18.693, -13.266)
SWEP.LowAng = Vector(-25.327, -11.256, 14.069)



SWEP.DamageMult = 1 -- the weapon's main stats are just taken from the bullet
SWEP.ShootingDelay = 60 / 900
SWEP.TriggerDelay = 0

SWEP.Recoil = 2.5
SWEP.RecoilAngles = 25

SWEP.BlowbackAmount = 1
SWEP.BlowbackRecovery = 6
SWEP.BlowbackMax = 1.5
SWEP.RollBlowbackAmount = 4
SWEP.RollBlowbackRecovery = 10
SWEP.RollBlowbackMax = 45

SWEP.HeatAccumulation = 15 -- Out of 100, the amount of heat each shot adds to the weapon
SWEP.HeatDissipation = 75 -- Amount of heat dissipated per second

SWEP.Precision = 1 / 100
SWEP.MaxHeatPrecision = 1 / 50
SWEP.HipfirePenalty = 0 -- Deviation applied on hip fire
SWEP.MaxHeatHipfirePenalty = 0.075
SWEP.MaxMovePenalty = 0.025
SWEP.DispersionInSights = false

SWEP.Sway = 3



SWEP.SpeedMult = 1
SWEP.SightedSpeedMult = 0.9



SWEP.OpenBolt = false -- this weapon will not chamber a round to fire. Instead, it will take rounds directly from the magazine. Examples of such weapons include revolvers and open bolt guns.
SWEP.InternalMag = true -- whether this weapon uses detachable magazines or loads rounds directly into the weapon

SWEP.DefaultLoad = "9x19_fmj" -- the round that this gun will be loaded with by default
SWEP.Magazine = { -- this is the weapon's default magazine, this will be automatically given if the setting act3_instantaction is enabled
    Type = "c96_10",
    Rounds = {}
}

SWEP.MagazineVisible = true

SWEP.MagazineType = "int"

SWEP.Calibre = "9x19"
SWEP.PrintCalibre = "9x19mm"

SWEP.MuzzleVelocity = 20000


-- Shell effect is unnecessary since they are taken from "bullets"
SWEP.ShellDelay = 0
SWEP.RevolverEject = false -- whether this weapon ejects shells when reloading instead of after each shot

SWEP.MuzzleEffect = "act3_muzzleeffect"
SWEP.Suppressed = false

SWEP.SoundShoot = "weapons/p228/p228-1.wav"
SWEP.SoundShootSuppressed = "weapons/usp/usp1.wav"
SWEP.SoundShootVol = 105
SWEP.SoundShootPitch = 100

SWEP.SoundCycle = "weapons/mac10/mac10_boltpull.wav"
SWEP.SoundDryfire = "weapons/ar2/ar2_empty.wav"



SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_PISTOL
SWEP.AnimReload = ACT_HL2MP_GESTURE_RELOAD_AR2
SWEP.ShotgunReload = true
SWEP.AnimReloadStartTime = 0.6
SWEP.AnimReloadExtraTimeAtEnd = 0.5
SWEP.AnimReloadEndTime = 0.2
SWEP.AnimReloadProne = 2087
SWEP.AnimMeleeAttack = ACT_GMOD_GESTURE_MELEE_SHOVE_1HAND

SWEP.HoldtypePassive = "normal"
SWEP.HoldtypeHip = "pistol"
SWEP.HoldtypeSights = "revolver"
SWEP.HoldtypeBipod = "revolver"



SWEP.Firemodes = {
    {
        Automatic = false,
    },
    {
        Safe = true
    }
}

SWEP.AimTime = 0.25