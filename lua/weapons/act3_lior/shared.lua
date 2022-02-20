SWEP.Base = "act3_base"

SWEP.Spawnable = true
SWEP.AdminSpawnable = false
SWEP.PrintName = "Lior-12"
SWEP.Category = "ACT3 - Firearms"

SWEP.Desc_Country = "Australia/UK"
SWEP.Desc_Manufacturer = "Arctic Combat Tactical Inc."
SWEP.Desc_Mechanism = "Gas-Operated Rotating Bolt"
SWEP.Desc_Year = 2019
SWEP.Desc_Weight = 3.8 -- kg
SWEP.ACT3Cat = ACT3_CAT_SHOTGUN
SWEP.Sidearm = false

SWEP.Slot = 3

SWEP.WorldModel = "models/weapons/act3/shot_lior.mdl" -- Weapon's traditional world model, where applicable.
SWEP.WorldModelBase = "models/weapons/act3/shot_lior.mdl" -- Worldmodel base of the weapon world model.
SWEP.WorldModelPos = Vector(13.623, 0, 2.559)
SWEP.WorldModelAng = Angle(-9.03, 0, 180)
SWEP.WorldModelBodygroups = "000000" -- Sets the bodygroups of the world model.
SWEP.WorldModelSkin = 0 -- Set the skin of the world model.
SWEP.WorldModelAttachments = {} -- {{string path, string bodygroups, int skin, vector pos, angle ang}}

SWEP.MagazineOffsetPos = Vector(-2.504, 0, 7.604)

SWEP.DefaultAttachments = {
    ["stock"] = "lior_stock_light",
    ["handguard"] = "lior_handguard_poly",
    ["grip"] = "lior_grip_poly",
    ["barrel"] = "lior_barrel_factory",
    ["fcg"] = "lior_fcg_semi"
}

SWEP.AttachmentBodygroups = {
    ["lior_handguard_poly"] = {ind = 1, bg = 0},
    ["lior_handguard_light"] = {ind = 1, bg = 1},
    ["lior_handguard_heavy"] = {ind = 1, bg = 2},
    ["lior_barrel_factory"] = {ind = 2, bg = 0},
    ["lior_barrel_short"] = {ind = 2, bg = 1},
    ["lior_grip_poly"] = {ind = 3, bg = 0},
    ["lior_grip_rifle"] = {ind = 3, bg = 1},
    ["lior_stock_light"] = {ind = 4, bg = 1},
    ["lior_stock_heavy"] = {ind = 4, bg = 2},
    ["ak_railmount"] = {ind = 5, bg = 1},
}

SWEP.Attachments = {
    ["stock"] = {
        Type = "lior_stock",
        PrintName = "Stock",
        Installed = nil,
        Required = false
    },
    ["handguard"] = {
        Type = "lior_handguard",
        PrintName = "Handguard",
        Installed = nil,
        Required = true
    },
    ["barrel"] = {
        Type = "lior_barrel",
        PrintName = "Barrel",
        Installed = nil,
        Required = true
    },
    ["grip"] = {
        Type = "lior_grip",
        PrintName = "Grip",
        Installed = nil,
        Required = true
    },
    ["fcg"] = {
        Type = "lior_fcg",
        PrintName = "Fire Group",
        Installed = nil,
        Required = true
    },
    ["mount"] = {
        Type = "lior_mount",
        PrintName = "Mount",
        Installed = nil,
        Required = false,
    },
    ["foregrip"] = {
        Type = "foregrip",
        PrintName = "Foregrip",
        Installed = nil,
        Required = false,
        Pos = Vector(1.921, -0.48, 7.38),
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
        Pos = Vector(2.859, 0.864, 7.881),
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
        Pos = Vector(2.859, -1.474, 7.877),
        Ang =  Angle(0, 0, 180),
        Randomize = true,
        RandomizeChance = 10,
        
    }
} -- {{id=""}}

SWEP.MuzzleOffset = Vector(29.343, 0.3, -7.775)
SWEP.MuzzleAngle = Angle(0, 0, 0)
SWEP.EjectPos = Vector(-2.564, 0, 8.383)
SWEP.EjectAng = Angle(0, 0, 0)

SWEP.ReloadSoundsTable = {
    {
        time = 0.1,
        path = "weapons/galil/galil_clipout.wav",
        comp = ACT3_STPART_MAGEJECT
    },
    {
        time = 1.0,
        path = "weapons/galil/galil_clipin.wav",
        comp = ACT3_STPART_MAGLOAD
    },
    {
        time = 1.45,
        path = "weapons/galil/galil_boltpull.wav",
        comp = ACT3_STPART_EMPTYRACK
    },
}

SWEP.Magnification = 1

SWEP.TrueIronsPos = Vector(0.226, 13.149, -10.438)
SWEP.TrueIronsAng = Vector(0.595, 0, 0)

SWEP.SightedAimPos = Vector(0.226, -5, -10.438)
SWEP.SightedAimAng = Vector(0.595, 0, 0)

SWEP.UseTrueIrons = true

SWEP.LowPos = Vector(4.623, 18.693, -13.266)
SWEP.LowAng = Vector(-25.327, -11.256, 14.069)


SWEP.ShootingDelay = 60 / 400
SWEP.TriggerDelay = 0

SWEP.Recoil = 10
SWEP.RecoilAngles = 35

SWEP.BlowbackAmount = 2
SWEP.BlowbackRecovery = 4
SWEP.BlowbackMax = 2.5

SWEP.HeatAccumulation = 50 -- Out of 100, the amount of heat each shot adds to the weapon
SWEP.HeatDissipation = 200 -- Amount of heat dissipated per second

SWEP.Precision = 1 / 50
SWEP.MaxHeatPrecision = 1 / 25
SWEP.HipfirePenalty = 0
SWEP.MaxHeatHipfirePenalty = 0.075
SWEP.MaxMovePenalty = 0.05

SWEP.Sway = 1.5

SWEP.OpenBolt = false
SWEP.InternalMag = false -- whether this weapon uses detachable magazines or loads rounds directly into the weapon

SWEP.DefaultLoad = "12g_buck"

SWEP.DefaultMagazine = { -- this is the weapon's default magazine, this will be automatically given if the setting act3_instantaction is enabled
    Type = "lior_12",
    Rounds = {}, -- the actual bulletids that make up the ammo in the magazine
}

SWEP.MagazineType = "lior"
SWEP.MagazineVisible = true

SWEP.Calibre = "12g"
SWEP.PrintCalibre = "12 Gauge"


-- Shell effect is unnecessary since they are taken from "bullets"
SWEP.ShellDelay = 0

SWEP.MuzzleEffect = "act3_muzzleeffect"

SWEP.SoundShoot = "weapons/xm1014/xm1014-1.wav"
SWEP.SoundShootVol = 115
SWEP.SoundShootPitch = 100

SWEP.SoundCycle = "weapons/galil/galil_boltpull.wav"
SWEP.SoundDryfire = "weapons/shotgun/shotgun_empty.wav"



SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_RPG
SWEP.AnimReload = ACT_HL2MP_GESTURE_RELOAD_SMG1
SWEP.AnimReloadProne = 2089
SWEP.AnimMeleeAttack = ACT_GMOD_GESTURE_MELEE_SHOVE_2HAND

SWEP.HoldtypePassive = "passive"
SWEP.HoldtypeHip = "shotgun"
SWEP.HoldtypeSights = "ar2"



SWEP.Firemodes = {
    {
        Automatic = false,
    },
    {
        Automatic = false,
        BurstLength = 0,
        CustomFiremode = nil,
        CustomBars = nil,
        Safe = true
    }
}

SWEP.BurstLength = 0
SWEP.Automatic = false -- use this instead of changing SWEP.Primary.Automatic

SWEP.MuzzleVelocity = 13000