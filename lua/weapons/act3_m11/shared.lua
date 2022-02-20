SWEP.Base = "act3_base"

SWEP.Spawnable = true
SWEP.AdminSpawnable = false
SWEP.PrintName = "M-11/9"
SWEP.Category = "ACT3 - Firearms"

SWEP.Desc_Country = "USA"
SWEP.Desc_Manufacturer = "Vulcan Armament"
SWEP.Desc_Mechanism = "Straight Blowback"
SWEP.Desc_Year = 1972
SWEP.Desc_Weight = 2.84 -- kg
SWEP.ACT3Cat = ACT3_CAT_MACHINEPISTOL
SWEP.Sidearm = true

SWEP.GiveToCombine = false

SWEP.Slot = 2

SWEP.WorldModel = "models/weapons/act3/smg_m10.mdl"
SWEP.WorldModelBase = "models/weapons/act3/smg_m10.mdl" -- Worldmodel base of the weapon world model.
SWEP.WorldModelPos = Vector(6.225, 1.014, 3.467)
SWEP.WorldModelAng = Angle(-4.809, 0, 180)
SWEP.WorldModelBodygroups = "00000"

SWEP.DefaultAttachments = {
    ["barrel"] = "m11_barrel_factory",
    ["fcg"] = "m11_fcg_auto"
}

SWEP.AttachmentBodygroups = {
    ["m11_stock_mount"] = {ind = 1, bg = 1},
    ["m11_stock_wood"] = {ind = 1, bg = 2},
    ["m11_stock_folded"] = {ind = 2, bg = 1},
    ["m11_stock_extended"] = {ind = 2, bg = 2},
    ["m11_barrel_long"] = {ind = 3, bg = 1},
    ["m11_railmount"] = {ind = 4, bg = 1}
}


SWEP.Attachments = {
    ["stock"] = {
        Type = "m11_stock",
        PrintName = "Stock",
        Installed = nil,
        Required = false,
    },
    ["barrel"] = {
        Type = "m11_barrel",
        PrintName = "Barrel",
        Installed = nil,
        Required = true,
    },
    ["mount"] = {
        Type = "m11_mount",
        PrintName = "Mount",
        Installed = nil,
        Required = false,
    },
    ["fcg"] = {
        Type = "m11_fcg",
        PrintName = "Fire Group",
        Installed = nil,
        Required = true
    },
    ["accessory"] = {
        Type = "accessory",
        PrintName = "Accessory",
        Installed = nil,
        Required = false,
        Scale = 1,
        Pos = Vector(-0.147, 1.166, 7.347),
        Ang = Angle(0, 0, 0),
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
    ["conversion"] = {
        Type = "m11_conversion",
        PrintName = "Conversion",
        Installed = nil,
        Required = false,
    },
    ["under"] = {
        Type = "m11_under",
        PrintName = "Underbarrel",
        Installed = nil,
        Required = false,
        Randomize = true,
        RandomizeChance = 10,
    }
}

SWEP.MuzzleOffset = Vector(11.871, 1.133, -4.126)
SWEP.MuzzleAngle = Angle(0, 0, 0)
SWEP.EjectPos = Vector(-2.606, 0.079, 5.671)
SWEP.EjectAng = Angle(0, 0, 0)
SWEP.MagazineOffsetPos = Vector(-2.79, 0, 6.151)
SWEP.MagazineOffsetAng = Angle(0, 0, 0)

SWEP.ReloadSoundsTable = {
    {
        time = 0.1,
        path = "weapons/mac10/mac10_clipout.wav",
        comp = ACT3_STPART_MAGEJECT
    },
    {
        time = 1.0,
        path = "weapons/mac10/mac10_clipin.wav",
        comp = ACT3_STPART_MAGLOAD
    },
    {
        time = 1.45,
        path = "weapons/mac10/mac10_boltpull.wav",
        comp = ACT3_STPART_EMPTYRACK
    },
}

SWEP.TrueIronsPos = Vector(0.125, 9.064, -8.863)
SWEP.TrueIronsAng = Vector(-1.364, 0, 0)

SWEP.SightedAimPos = Vector(0.107, 0, -10.278)
SWEP.SightedAimAng = Vector(2.492, 0, -0.894)

SWEP.LowPos = Vector(4.623, 18.693, -13.266)
SWEP.LowAng = Vector(-25.327, -11.256, 14.069)



SWEP.DamageMult = 1 -- the weapon's main stats are just taken from the bullet
SWEP.ShootingDelay = 60 / 1100
SWEP.TriggerDelay = 0

SWEP.Recoil = 2.0
SWEP.RecoilAngles = 30

SWEP.BlowbackAmount = 0.3
SWEP.BlowbackRecovery = 6
SWEP.BlowbackMax = 1
SWEP.RollBlowbackAmount = 4
SWEP.RollBlowbackRecovery = 3
SWEP.RollBlowbackMax = 45

SWEP.HeatAccumulation = 15 -- Out of 100, the amount of heat each shot adds to the weapon
SWEP.HeatDissipation = 125 -- Amount of heat dissipated per second

SWEP.Precision = 1 / 110
SWEP.MaxHeatPrecision = 1 / 45
SWEP.HipfirePenalty = 0 -- Deviation applied on hip fire
SWEP.MaxHeatHipfirePenalty = 0.075
SWEP.MaxMovePenalty = 0.025
SWEP.DispersionInSights = false

SWEP.Sway = 3



SWEP.SpeedMult = 1
SWEP.SightedSpeedMult = 0.9



SWEP.OpenBolt = true -- this weapon will not chamber a round to fire. Instead, it will take rounds directly from the magazine. Examples of such weapons include revolvers and open bolt guns.
SWEP.InternalMag = false -- whether this weapon uses detachable magazines or loads rounds directly into the weapon
SWEP.CannotCycle = true

SWEP.DefaultLoad = "9x19_fmj" -- the round that this gun will be loaded with by default
SWEP.DefaultMagazine = { -- this is the weapon's default magazine, this will be automatically given if the setting act3_instantaction is enabled
    Type = "m10_16",
    Rounds = {}
}

SWEP.MagazineVisible = true

SWEP.MagazineType = "m10"

SWEP.Calibre = "9x19"
SWEP.PrintCalibre = "9x19mm"

SWEP.MuzzleVelocity = 20000


-- Shell effect is unnecessary since they are taken from "bullets"
SWEP.ShellDelay = 0
SWEP.RevolverEject = false -- whether this weapon ejects shells when reloading instead of after each shot

SWEP.MuzzleEffect = "act3_muzzleeffect"
SWEP.Suppressed = false

SWEP.SoundShoot = "weapons/mac10/mac10-1.wav"
SWEP.SoundShootSuppressed = "weapons/usp/usp1.wav"
SWEP.SoundShootVol = 105
SWEP.SoundShootPitch = 105

SWEP.SoundCycle = "weapons/mac10/mac10_boltpull.wav"
SWEP.SoundDryfire = "weapons/ar2/ar2_empty.wav"



SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_SMG1
SWEP.AnimReload = ACT_HL2MP_GESTURE_RELOAD_SMG1
SWEP.AnimReloadProne = 2087
SWEP.AnimMeleeAttack = ACT_GMOD_GESTURE_MELEE_SHOVE_1HAND

SWEP.HoldtypePassive = "normal"
SWEP.HoldtypeHip = "pistol"
SWEP.HoldtypeSights = "revolver"
SWEP.HoldtypeBipod = "revolver"



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