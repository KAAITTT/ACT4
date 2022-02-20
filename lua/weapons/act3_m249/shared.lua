SWEP.Base = "act3_base"

SWEP.Spawnable = true
SWEP.AdminSpawnable = false
SWEP.PrintName = "M249"
SWEP.Category = "ACT3 - Firearms"

SWEP.Desc_Country = "Belgium"
SWEP.Desc_Manufacturer = "Fabrique National"
SWEP.Desc_Mechanism = "Gas-Actuated Open Bolt"
SWEP.Desc_Year = 1974
SWEP.Desc_Weight = 6.85 -- kg
SWEP.ACT3Cat = ACT3_CAT_LMG
SWEP.Sidearm = false

SWEP.Slot = 3

SWEP.WorldModel = "models/weapons/act3/mg_m249.mdl"
SWEP.WorldModelBase = "models/weapons/act3/mg_m249.mdl" -- Worldmodel base of the weapon world model.
SWEP.WorldModelPos = Vector(13.017, 0.266, 3.006)
SWEP.WorldModelAng = Angle(-8.445, 0, 180)

SWEP.DefaultAttachments = {
    ["stock"] = "m249_stock_factory",
    ["grip"] = "m249_grip_factory",
    ["handguard"] = "m249_handguard_factory",
    ["barrel"] = "m249_barrel_factory",
    ["fcg"] = "m249_fcg_auto"
}

SWEP.AttachmentBodygroups = {
    ["m249_stock_factory"] = {ind = 1, bg = 1},
    ["m249_stock_poly"] = {ind = 1, bg = 2},
    ["m249_stock_wood"] = {ind = 1, bg = 3},
    ["m249_rail"] = {ind = 2, bg = 1},
    ["m249_barrel_factory"] = {ind = 3, bg = 0},
    ["m249_barrel_short"] = {ind = 3, bg = 1},
    ["m249_handguard_factory"] = {ind = 4, bg = 0},
    ["m249_handguard_heatshield"] = {ind = 4, bg = 1},
    ["m249_handguard_smooth"] = {ind = 4, bg = 2},
    ["m249_handguard_wood"] = {ind = 4, bg = 3},
    ["m249_grip_poly"] = {ind = 5, bg = 0},
    ["m249_grip_wood"] = {ind = 5, bg = 1},
}

SWEP.Attachment_Flags = {}

SWEP.Attachments = {
    ["stock"] = {
        Type = "m249_stock",
        PrintName = "Stock",
        Installed = nil,
        Required = false,
        Scale = 1,
    },
    ["conversion"] = {
        Type = "m249_conversion",
        PrintName = "Conversion",
        Installed = nil,
        Required = false,
        Randomize = true,
        RandomizeChance = 30,
    },
    ["fcg"] = {
        Type = "m249_fcg",
        PrintName = "Fire Group",
        Installed = nil,
        Required = false
    },
    ["top"] = {
        Type = "m249_top",
        PrintName = "Top",
        Installed = nil,
        Required = false,
        Scale = 1,
    },
    ["barrel"] = {
        Type = "m249_barrel",
        PrintName = "Barrel",
        Installed = nil,
        Required = true,
        Scale = 1,
    },
    ["handguard"] = {
        Type = "m249_handguard",
        PrintName = "Handguard",
        Installed = nil,
        Required = true,
        Scale = 1,
    },
    ["grip"] = {
        Type = "m249_grip",
        PrintName = "Grip",
        Installed = nil,
        Required = true,
        Scale = 1,
    },
    ["foregrip"] = {
        Type = "foregrip",
        PrintName = "Foregrip",
        Installed = nil,
        Required = false,
        Pos = Vector(2.645, -0.537, 7.66),
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
        Pos = Vector(3.869, 1.485, 7.986),
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
        Pos = Vector(3.869, -1.856, 7.901),
        Ang =  Angle(0, 0, 180),
        Randomize = true,
        RandomizeChance = 10,
   }
}

SWEP.MuzzleOffset = Vector(31.704, 0.428, -9.907)
SWEP.MuzzleAngle = Angle(-8.445, 0, 0)
SWEP.EjectPos = Vector(-1.468, 0, 7.931)
SWEP.EjectAng = Angle(0, 0, 0)
SWEP.MagazineOffsetPos = Vector(-0.982, -0.152, 7.381)
SWEP.MagazineOffsetAng = Angle(0, 0, 0)

SWEP.ReloadSoundsTable = {
    {
        time = 0.1,
        path = "weapons/m249/m249_boxout.wav",
        comp = ACT3_STPART_MAGEJECT
    },
    {
        time = 1.0,
        path = "weapons/m249/m249_boxin.wav",
        comp = ACT3_STPART_MAGLOAD
    },
    {
        time = 1.45,
        path = "weapons/famas/famas_forearm.wav",
        comp = ACT3_STPART_EMPTYRACK
    },
}

SWEP.TrueIronsPos = Vector(0.159, 20, -11.438)
SWEP.TrueIronsAng = Vector(0, 0, 0)

SWEP.SightedAimPos = Vector(-0.051, -7.658, -11.5)
SWEP.SightedAimAng = Vector(0, -0.191, 0)


SWEP.LowPos = Vector(4.623, 18.693, -13.266)
SWEP.LowAng = Vector(-25.327, -11.256, 14.069)



SWEP.ShootingDelay = 60 / 700
SWEP.TriggerDelay = 0

SWEP.Recoil = 2
SWEP.RecoilAngles = 45

SWEP.BlowbackAmount = 1
SWEP.BlowbackRecovery = 5
SWEP.BlowbackMax = 2.5
SWEP.RollBlowbackAmount = 3
SWEP.RollBlowbackRecovery = 10
SWEP.RollBlowbackMax = 45

SWEP.HeatAccumulation = 10 -- Out of 100, the amount of heat each shot adds to the weapon
SWEP.HeatDissipation = 200 -- Amount of heat dissipated per second

SWEP.Precision = 1 / 200
SWEP.MaxHeatPrecision = 1 / 50
SWEP.HipfirePenalty = 0.025 -- Deviation applied on hip fire
SWEP.MaxHeatHipfirePenalty = 0.05
SWEP.MaxMovePenalty = 0.05
SWEP.DispersionInSights = true

SWEP.Sway = 3.5



SWEP.SpeedMult = 1
SWEP.SightedSpeedMult = 0.9



SWEP.OpenBolt = true -- this weapon will not chamber a round to fire. Instead, it will take rounds directly from the magazine. Examples of such weapons include revolvers and open bolt guns.
SWEP.InternalMag = false -- whether this weapon uses detachable magazines or loads rounds directly into the weapon

SWEP.DefaultLoad = "556x45_fmj" -- the round that this gun will be loaded with by default
SWEP.DefaultMagazine = { -- this is the weapon's default magazine, this will be automatically given if the setting act3_instantaction is enabled
    Type = "m249_150",
    Rounds = {}
}

SWEP.MagazineType = "m249"

SWEP.Calibre = "556x45"
SWEP.PrintCalibre = "5.56x45mm"

SWEP.MuzzleVelocity = 22500

SWEP.MuzzleEffect = "act3_muzzleeffect"
SWEP.Suppressed = false

SWEP.SoundShoot = "weapons/m249/m249-1.wav"
SWEP.SoundShootSuppressed = "weapons/m4a1/m4a1-1.wav"
SWEP.SoundShootVol = 110
SWEP.SoundShootPitch = 100

SWEP.SoundCycle = "weapons/m4a1/m4a1_boltpull.wav"
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
    },
    {
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