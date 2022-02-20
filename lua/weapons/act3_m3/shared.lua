SWEP.Base = "act3_base"

SWEP.Spawnable = true
SWEP.AdminSpawnable = false
SWEP.PrintName = "M3"
SWEP.Category = "ACT3 - Firearms"

SWEP.Desc_Country = "Italy"
SWEP.Desc_Manufacturer = "Benelli"
SWEP.Desc_Mechanism = "Inertia Recoil Pump Action"
SWEP.Desc_Year = 1989
SWEP.Desc_Weight = 3.3 -- kg
SWEP.ACT3Cat = ACT3_CAT_SHOTGUN
SWEP.Sidearm = false

SWEP.Slot = 3

SWEP.WorldModel = "models/weapons/act3/shot_m3.mdl" -- Weapon's traditional world model, where applicable.
SWEP.WorldModelBase = "models/weapons/act3/shot_m3.mdl" -- Worldmodel base of the weapon world model.
SWEP.WorldModelPos = Vector(13.248, 0.939, 2.428)
SWEP.WorldModelAng = Angle(-7.117, 0, 180)
SWEP.WorldModelBodygroups = "000040" -- Sets the bodygroups of the world model.
SWEP.WorldModelSkin = 0 -- Set the skin of the world model.
SWEP.WorldModelAttachments = {} -- {{string path, string bodygroups, int skin, vector pos, angle ang}}

SWEP.DefaultAttachments = {
    ["stock"] = "m3_stock_solid",
    ["barrel"] = "m3_barrel_factory",
    ["slide"] = "m3_slide_factory",
    ["tube"] = "m3_tube_4",
}

SWEP.AttachmentBodygroups = {
    ["m3_slide_flash"] = {ind = 1, bg = 1},
    ["m3_slide_wood"] = {ind = 1, bg = 2},
    ["m3_tube_short"] = {ind = 2, bg = 2},
    ["m3_tube_long"] = {ind = 2, bg = 1},
    ["m3_barrel_long"] = {ind = 3, bg = 1},
    ["m3_barrel_short"] = {ind = 3, bg = 2},
    ["m3_stock_wood"] = {ind = 4, bg = 1},
    ["m3_stock_sport"] = {ind = 4, bg = 2},
    ["m3_stock_light"] = {ind = 4, bg = 3},
    ["m3_stock_solid"] = {ind = 4, bg = 0},
    ["m3_top_rail"] = {ind = 5, bg = 1},
}

SWEP.Attachments = {
    ["stock"] = {
        Type = "m3_stock",
        PrintName = "Stock",
        Installed = nil,
        Required = false,
        Scale = 1,
    },
    ["barrel"] = {
        Type = "m3_barrel",
        PrintName = "Barrel",
        Installed = nil,
        Required = true,
        Scale = 1,
    },
    ["slide"] = {
        Type = "m3_slide",
        PrintName = "Slide",
        Installed = nil,
        Required = true,
        Scale = 1,
    },
    ["tube"] = {
        Type = "m3_tube",
        PrintName = "Tube",
        Installed = nil,
        Required = true,
        Scale = 1,
    },
    ["top"] = {
        Type = "m3_top",
        PrintName = "Upper",
        Installed = nil,
        Required = false,
        Scale = 1,
    },
    ["accessory_right"] = {
        Type = "accessory",
        PrintName = "Accessory",
        Installed = nil,
        Required = false,
        Scale = 1,
        Pos = Vector(7.879, 1.491, 6.453),
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
        Pos = Vector(7.876, -1.637, 6.453),
        Ang =  Angle(0, 0, 180),
        Randomize = true,
        RandomizeChance = 10,
        
    }
} -- {{id=""}}

SWEP.MuzzleOffset = Vector(28.3, 0.8, -8.2)
SWEP.MuzzleAngle = Angle(-7, 0, 0)
SWEP.EjectPos = Vector(-2.171, 1.5, 7.87)
SWEP.EjectAng = Angle(0, 0, 0)

SWEP.ReloadSoundsTable = {}

SWEP.Magnification = 1

SWEP.TrueIronsPos = Vector(0.048, 13.918, -8.954)
SWEP.TrueIronsAng = Vector(0, 0, 0)

SWEP.SightedAimPos = Vector(0.041, -17.342, -9.023)
SWEP.SightedAimAng = Vector(0, 0, 0)

SWEP.UseTrueIrons = true

SWEP.LowPos = Vector(4.623, 18.693, -13.266)
SWEP.LowAng = Vector(-25.327, -11.256, 14.069)


SWEP.ShootingDelay = 60 / 80
SWEP.TriggerDelay = 0

SWEP.Recoil = 18
SWEP.RecoilAngles = 35

SWEP.BlowbackAmount = 3.5
SWEP.BlowbackRecovery = 4
SWEP.BlowbackMax = 5

SWEP.HeatAccumulation = 40 -- Out of 100, the amount of heat each shot adds to the weapon
SWEP.HeatDissipation = 200 -- Amount of heat dissipated per second

SWEP.Precision = 1 / 55
SWEP.MaxHeatPrecision = 1 / 55
SWEP.HipfirePenalty = 0
SWEP.MaxHeatHipfirePenalty = 0.075
SWEP.MaxMovePenalty = 0.05

SWEP.Sway = 1.5


SWEP.InternalMag = true -- whether this weapon uses detachable magazines or loads rounds directly into the weapon

SWEP.DefaultLoad = "12g_buck"

SWEP.Magazine = { -- this is the weapon's default magazine, this will be automatically given if the setting act3_instantaction is enabled
    Type = "m3_tube_4",
    Rounds = {}, -- the actual bulletids that make up the ammo in the magazine
}

SWEP.MagazineType = "int"
SWEP.MagazineVisible = false

SWEP.Calibre = "12g"
SWEP.PrintCalibre = "12 Gauge"


-- Shell effect is unnecessary since they are taken from "bullets"
SWEP.ShellDelay = 0.4

SWEP.MuzzleEffect = "act3_muzzleeffect"

SWEP.SoundShoot = "weapons/xm1014/xm1014-1.wav"
SWEP.SoundShootVol = 115
SWEP.SoundShootPitch = 100

SWEP.SoundBoltAction = "weapons/m3/m3_pump.wav"
SWEP.SoundBoltActionDelay = 0.1
SWEP.SoundBoltActionVol = 75
SWEP.SoundBoltActionPitch = 120

SWEP.SoundCycle = "weapons/m3/m3_pump.wav"
SWEP.SoundDryfire = "weapons/shotgun/shotgun_empty.wav"



SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_SHOTGUN
SWEP.AnimReload = ACT_HL2MP_GESTURE_RELOAD_SHOTGUN
SWEP.ShotgunReload = true
SWEP.AnimReloadStartTime = 0.3
SWEP.AnimReloadEndTime = 0.35
SWEP.AnimReloadExtraTimeAtEnd = 1.5
SWEP.AnimReloadProne = 2089
SWEP.AnimMeleeAttack = ACT_GMOD_GESTURE_MELEE_SHOVE_2HAND

SWEP.HoldtypePassive = "passive"
SWEP.HoldtypeHip = "shotgun"
SWEP.HoldtypeSights = "ar2"



SWEP.Firemodes = {
    {
        Automatic = false,
        BurstLength = 0,
        CustomFiremode = "PUMP",
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

SWEP.CustomFiremode = "PUMP"
SWEP.BurstLength = 0
SWEP.Automatic = false -- use this instead of changing SWEP.Primary.Automatic
SWEP.ManualAction = true

SWEP.ManualActionPos = Vector(0.05, 10.444, -9.268)
SWEP.ManualActionAng = Vector(-3.339, 0, 7.888)

SWEP.MuzzleVelocity = 15000