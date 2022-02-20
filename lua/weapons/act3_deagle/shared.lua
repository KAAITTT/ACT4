SWEP.Base = "act3_base"

SWEP.Spawnable = true
SWEP.AdminSpawnable = false
SWEP.PrintName = "Desert Eagle"
SWEP.Category = "ACT3 - Firearms"

SWEP.Desc_Country = "Israel"
SWEP.Desc_Manufacturer = "Israeli Military Industries"
SWEP.Desc_Mechanism = "Gas-Operated Rotating Bolt"
SWEP.Desc_Year = 1982
SWEP.Desc_Weight = 1.766 -- kg
SWEP.ACT3Cat = ACT3_CAT_PISTOL
SWEP.Sidearm = true

SWEP.Desc_Extra = {
    "",
    "Impractical heavy calibre pistol.",
    "",
}

SWEP.Slot = 1

SWEP.WorldModel = "models/weapons/act3/pistol_deagle.mdl"
SWEP.WorldModelBase = "models/weapons/act3/pistol_deagle.mdl" -- Worldmodel base of the weapon world model.
SWEP.WorldModelPos = Vector(4.043, 1.534, 2.158)
SWEP.WorldModelAng = Angle(-4.651, 0, 180)
SWEP.WorldModelBodygroups = "00000"

SWEP.DefaultAttachments = {
}

SWEP.AttachmentBodygroups = {
    ["deagle_stock"] = {ind = 1, bg = 1},
    ["deagle_railmount"] = {ind = 2, bg = 1},
}

SWEP.Attachments = {
    ["muzzle"] = {
        PrintName = "Muzzle",
        Type = "pistol_muzzle",
        Installed = nil,
        Required = false,
        Pos = Vector(12.168, 0.15, 6.109),
        Ang = Angle(0, 0, 0),
        Randomize = true,
        RandomizeChance = 20,
        
    },
    ["railmount"] = {
        PrintName = "Mount",
        Type = "deagle_mount",
        Installed = nil,
        Required = false
    },
    ["sight_pistol"] = {
        PrintName = "Compact Sight",
        Type = "sight_pistol",
        Installed = nil,
        Requireed = false,
        Pos = Vector(0.515, 0.149, 6.927),
        Ang = Angle(0, 0, 0),
        Randomize = true,
        RandomizeChance = 20,
        
    },
    ["accessory"] = {
        Type = "accessory",
        PrintName = "Accessory",
        Installed = nil,
        Required = false,
        Scale = 1,
        Pos = Vector(4.913, 0.208, 4.296),
        Ang = Angle(0, 0, 90),
        Randomize = true,
        RandomizeChance = 10,
        
    },
    ["stock"] = {
        PrintName = "Stock",
        Type = "deagle_stock",
        Installed = nil,
        Required = false,
        Randomize = true,
        RandomizeChance = 10,
        
    },
}

SWEP.MuzzleOffset = Vector(12.727, 1.495, -4.698)
SWEP.MuzzleAngle = Angle(0, 0, 0)
SWEP.EjectPos = Vector(4.435, -0.99, 6.072)
SWEP.EjectAng = Angle(0, 0, 0)
SWEP.MagazineOffsetPos = Vector(0, 0, 0)
SWEP.MagazineOffsetAng = Angle(0, 0, 0)

SWEP.ReloadSoundsTable = {
    {
        time = 0.1,
        path = "weapons/deagle/de_clipout.wav",
        comp = ACT3_STPART_MAGEJECT
    },
    {
        time = 0.8,
        path = "weapons/deagle/de_clipin.wav",
        comp = ACT3_STPART_MAGLOAD
    },
}

SWEP.TrueIronsPos = Vector(-0.188, 6.872, -7.18)
SWEP.TrueIronsAng = Vector(0.865, 0, 0)

SWEP.SightedAimPos = Vector(-0.188, -3, -7.18)
SWEP.SightedAimAng = Vector(0.865, 0, 0)

SWEP.LowPos = Vector(4.623, 18.693, -13.266)
SWEP.LowAng = Vector(-25.327, -11.256, 14.069)



SWEP.DamageMult = 1 -- the weapon's main stats are just taken from the bullet
SWEP.ShootingDelay = 60 / 300
SWEP.TriggerDelay = 0

SWEP.Recoil = 8
SWEP.RecoilAngles = 45

SWEP.BlowbackAmount = 2
SWEP.BlowbackRecovery = 6
SWEP.BlowbackMax = 3
SWEP.RollBlowbackAmount = 4
SWEP.RollBlowbackRecovery = 10
SWEP.RollBlowbackMax = 45

SWEP.HeatAccumulation = 15 -- Out of 100, the amount of heat each shot adds to the weapon
SWEP.HeatDissipation = 75 -- Amount of heat dissipated per second

SWEP.Precision = 1 / 250
SWEP.MaxHeatPrecision = 1 / 50
SWEP.HipfirePenalty = 0 -- Deviation applied on hip fire
SWEP.MaxHeatHipfirePenalty = 0.075
SWEP.MaxMovePenalty = 0.025
SWEP.DispersionInSights = false

SWEP.Sway = 3



SWEP.SpeedMult = 1
SWEP.SightedSpeedMult = 0.9



SWEP.OpenBolt = false -- this weapon will not chamber a round to fire. Instead, it will take rounds directly from the magazine. Examples of such weapons include revolvers and open bolt guns.
SWEP.InternalMag = false -- whether this weapon uses detachable magazines or loads rounds directly into the weapon

SWEP.DefaultLoad = "50ae_fmj" -- the round that this gun will be loaded with by default
SWEP.DefaultMagazine = { -- this is the weapon's default magazine, this will be automatically given if the setting act3_instantaction is enabled
    Type = "deagle_50_7",
    Rounds = {}
}

SWEP.MagazineVisible = true

SWEP.MagazineType = "deagle_50"

SWEP.Calibre = "50ae"
SWEP.PrintCalibre = ".50 Action Express"

SWEP.MuzzleVelocity = 25000


-- Shell effect is unnecessary since they are taken from "bullets"
SWEP.ShellDelay = 0
SWEP.RevolverEject = false -- whether this weapon ejects shells when reloading instead of after each shot

SWEP.MuzzleEffect = "act3_muzzleeffect"
SWEP.Suppressed = false

SWEP.SoundShoot = "weapons/deagle/deagle-1.wav"
SWEP.SoundShootSuppressed = "weapons/m4a1/m4a1-1.wav"
SWEP.SoundShootVol = 105
SWEP.SoundShootPitch = 100

SWEP.SoundCycle = "weapons/fiveseven/fiveseven_slidepull.wav"
SWEP.SoundDryfire = "weapons/ar2/ar2_empty.wav"



SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_REVOLVER
SWEP.AnimReload = ACT_HL2MP_GESTURE_RELOAD_PISTOL
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