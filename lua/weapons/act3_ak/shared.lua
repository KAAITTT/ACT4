SWEP.Base = "act3_base"

SWEP.Spawnable = true
SWEP.AdminSpawnable = false
SWEP.PrintName = "AKM"
SWEP.Category = "ACT3 - Firearms"

SWEP.Desc_Country = "Russia"
SWEP.Desc_Manufacturer = "Izhmash"
SWEP.Desc_Mechanism = "Gas-Operated Rotating Bolt"
SWEP.Desc_Year = 1956

SWEP.GiveToCombine = false

--SWEP.Purpose = "One of the most ubiquitous assault rifles ever invented. The right arm of the oppressed world; so great Mozambique put it on its flag. Rugged as a rock, and crude as one too."

SWEP.Desc_Weight = 3.1 -- kg
SWEP.ACT3Cat = ACT3_CAT_ASSAULT
SWEP.Sidearm = false

SWEP.Slot = 3

SWEP.WorldModel = "models/weapons/act3/rifle_ak.mdl"
SWEP.WorldModelBase = "models/weapons/act3/rifle_ak.mdl" -- Worldmodel base of the weapon world model.
SWEP.WorldModelPos = Vector(12.335, 0.958, 2.359)
SWEP.WorldModelAng = Angle(-7.153, 0, 180)

SWEP.AttachmentBodygroups = {
    ["ak_stock_none"] = {ind = 4, bg = 0},
    ["ak_stock_factory"] = {ind = 4, bg = 1},
    ["ak_stock_heavy"] = {ind = 4, bg = 3},
    ["ak_stock_light"] = {ind = 4, bg = 2},
    ["ak_stock_sniper"] = {ind = 4, bg = 4},
    ["ak_stock_poly"] = {ind = 4, bg = 5},
    ["ak_grip_poly"] = {ind = 3, bg = 1},
    ["ak_grip_rifle"] = {ind = 3, bg = 2},
    ["ak_barrel_long"] = {ind = 2, bg = 2},
    ["ak_barrel_short"] = {ind = 2, bg = 1},
    ["ak_handguard_short"] = {ind = 1, bg = 1},
    ["ak_handguard_poly"] = {ind = 1, bg = 2},
    ["ak_handguard_poly_short"] = {ind = 1, bg = 3},
    ["ak_mount_rail"] = {ind = 5, bg = 1},
    ["ak_mount_scope"] = {ind = 5, bg = 2},
    ["ak_mount_zmey"] = {ind = 5, bg = 3}
}

SWEP.DefaultAttachments = {
    ["stock"] = "ak_stock_factory",
    ["barrel"] = "ak_barrel_factory",
    ["grip"] = "ak_grip_factory",
    ["handguard"] = "ak_handguard_factory",
    ["fcg"] = "ak_fcg_auto"
} -- {{["slot"] = "id"}} the gun will spawn with these attachments attached.

SWEP.Attachments = {
    ["stock"] = {
        Type = "ak_stock",
        PrintName = "Stock",
        Installed = nil,
        Required = false,
        Scale = 1,
    },
    ["barrel"] = {
        Type = "ak_barrel", -- type of attachments this slot can take
        PrintName = "Barrel", -- name this slot shows
        Installed = nil, -- which attachment is actually installed in this slot
        Required = true,
        Scale = 1, -- scale applied to attachments in this slot
    },
    ["mount"] = {
        Type = "ak_mount",
        PrintName = "Mount",
        Installed = nil,
        Required = false,
        Randomize = true,
        RandomizeChance = 20,
    },
    ["fcg"] = {
        Type = "ak_fcg",
        PrintName = "Fire Group",
        Installed = nil,
        Required = true,
        Scale = 1,
    },
    ["handguard"] = {
        Type = "ak_handguard",
        PrintName = "Handguard",
        Installed = nil,
        Required = true,
        Scale = 1,
    },
    ["grip"] = {
        Type = "ak_grip",
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
        Pos = Vector(2.321, 0, 6.84),
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
        Pos = Vector(4.218, 1.139, 7.611),
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
        Pos =  Vector(4.218, -1.142, 7.611),
        Ang =  Angle(0, 0, 180),
        Randomize = true,
        RandomizeChance = 10,
    },
    ["bolt"] = {
        Type = "bolt",
        ExtraTypes = {"bolt_heavy", "bolt_light"},
        PrintName = "Bolt",
        Installed = nil,
        Required = false,
    },
}

SWEP.MuzzleOffset = Vector(31.6, 0.7, -7)
SWEP.MuzzleAngle = Angle(-7, 0, 0)
SWEP.EjectPos = Vector(-2.629, 0, 7.964)
SWEP.EjectAng = Angle(0, 0, 0)
SWEP.MagazineOffsetPos = Vector(-1.553, 0, 6.243)
SWEP.MagazineOffsetAng = Angle(0, 0, 0)

SWEP.ReloadSoundsTable = {
    {
        time = 0.1,
        path = "weapons/ak47/ak47_clipout.wav",
        comp = ACT3_STPART_MAGEJECT
    },
    {
        time = 1.0,
        path = "weapons/ak47/ak47_clipin.wav",
        comp = ACT3_STPART_MAGLOAD
    },
    {
        time = 1.45,
        path = "weapons/ak47/ak47_boltpull.wav",
        comp = ACT3_STPART_EMPTYRACK
    },
}

SWEP.EyeReliefExtra = 4

SWEP.TrueIronsPos = Vector(-0.04, 9.77, -9.889)
SWEP.TrueIronsAng = Vector(1.379, 0, 0)

SWEP.SightedAimPos = Vector(-0.051, 0, -10.44)
SWEP.SightedAimAng = Vector(0, 0, 0)

SWEP.LowPos = Vector(4.623, 18.693, -13.266)
SWEP.LowAng = Vector(-25.327, -11.256, 14.069)



SWEP.DamageMult = 1 -- the weapon's main stats are just taken from the bullet
SWEP.ShootingDelay = 60 / 600
SWEP.TriggerDelay = 0

SWEP.Recoil = 4.5
SWEP.RecoilAngles = 20

SWEP.BlowbackAmount = 1
SWEP.BlowbackRecovery = 5
SWEP.BlowbackMax = 2.5
SWEP.RollBlowbackAmount = 3
SWEP.RollBlowbackRecovery = 10
SWEP.RollBlowbackMax = 45

SWEP.HeatAccumulation = 35 -- Out of 100, the amount of heat each shot adds to the weapon
SWEP.HeatDissipation = 200 -- Amount of heat dissipated per second

SWEP.Precision = 1 / 300
SWEP.MaxHeatPrecision = 1 / 75
SWEP.HipfirePenalty = 0 -- Deviation applied on hip fire
SWEP.MaxHeatHipfirePenalty = 0.075
SWEP.MaxMovePenalty = 0.05
SWEP.DispersionInSights = false

SWEP.Sway = 2



SWEP.SpeedMult = 1
SWEP.SightedSpeedMult = 0.9



SWEP.OpenBolt = false -- this weapon will not chamber a round to fire. Instead, it will take rounds directly from the magazine. Examples of such weapons include revolvers and open bolt guns.
SWEP.InternalMag = false -- whether this weapon uses detachable magazines or loads rounds directly into the weapon

SWEP.DefaultLoad = "762x39_fmj" -- the round that this gun will be loaded with by default
SWEP.DefaultMagazine = { -- this is the weapon's default magazine, this will be automatically given if the setting act3_instantaction is enabled
    Type = "akm_30",
    Rounds = {}
}

SWEP.MagazineType = "akm"

SWEP.Calibre = "762x39"
SWEP.PrintCalibre = "7.62x39mm"

SWEP.MuzzleEffect = "act3_muzzleeffect"
SWEP.Suppressed = false

SWEP.SoundShoot = "weapons/ak47/ak47-1.wav"
SWEP.SoundShootSuppressed = "weapons/m4a1/m4a1-1.wav"
SWEP.SoundShootVol = 110
SWEP.SoundShootPitch = 100

SWEP.SoundCycle = "weapons/ak47/ak47_boltpull.wav"
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
        BurstLength = 0,
        CustomFiremode = nil,
        CustomBars = nil,
        Safe = false
    },
    {
        Automatic = false,
        BurstLength = 0,
        CustomFiremode = nil,
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
SWEP.CustomFiremode = false
SWEP.BurstLength = 0
SWEP.Automatic = true -- use this instead of changing SWEP.Primary.Automatic
SWEP.ManualAction = false

SWEP.ManualActionPos = Vector(0, 0, 0)
SWEP.ManualActionAng = Vector(0, 0, 0)

SWEP.AimTime = 0.25

SWEP.MuzzleVelocity = 20000