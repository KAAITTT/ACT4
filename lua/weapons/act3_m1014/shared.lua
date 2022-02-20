SWEP.Base = "act3_base"

SWEP.Spawnable = true
SWEP.AdminSpawnable = false
SWEP.PrintName = "M1014"
SWEP.Category = "ACT3 - Firearms"

SWEP.Desc_Country = "Italy"
SWEP.Desc_Manufacturer = "Benelli"
SWEP.Desc_Mechanism = "Gas-Operated Rotating Bolt"
SWEP.Desc_Year = 1998
SWEP.Desc_Weight = 3.82 -- kg
SWEP.ACT3Cat = ACT3_CAT_SHOTGUN
SWEP.Sidearm = false

SWEP.Slot = 3

SWEP.WorldModel = "models/weapons/act3/shot_m1014.mdl" -- Weapon's traditional world model, where applicable.
SWEP.WorldModelBase = "models/weapons/act3/shot_m1014.mdl" -- Worldmodel base of the weapon world model.
SWEP.WorldModelPos = Vector(13.788, 0.609, 2.361)
SWEP.WorldModelAng = Angle(-9.959, 0, 180)

SWEP.DefaultAttachments = {
    ["stock"] = "m1014_stock_folded",
    ["tube"] = "m1014_tube_4"
}

SWEP.AttachmentBodygroups = {
    ["m1014_tube_4"] = {ind = 1, bg = 0},
    ["m1014_tube_7"] = {ind = 1, bg = 1},
    ["m1014_stock_folded"] = {ind = 2, bg = 0},
    ["m1014_stock_extended"] = {ind = 2, bg = 1},
}


SWEP.Attachments = {
    ["sight"] = {
        Type = "sight",
        PrintName = "Sight",
        Installed = nil,
        Required = false,
        Scale = 1,
        Pos = Vector(-2.481, 0.072, 8.906),
        Ang = Angle(0, 0, 0),
        Randomize = true,
        RandomizeChance = 40,
    },
    ["stock"] = {
        Type = "m1014_stock",
        PrintName = "Stock",
        Installed = nil,
        Required = true,
        Scale = 1,
        Randomize = true,
        RandomizeChance = 50,
    },
    ["tube"] = {
        Type = "m1014_tube",
        PrintName = "Tube",
        Installed = nil,
        Required = true,
        Scale = 1,
    },
    ["foregrip"] = {
        Type = "foregrip",
        PrintName = "Foregrip",
        Installed = nil,
        Required = false,
        Pos = Vector(1.661, 0, 6.973),
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

SWEP.MuzzleOffset = Vector(30.965, 0.828, -8.285)
SWEP.MuzzleAngle = Angle(0, 0, 0)
SWEP.EjectPos = Vector(-1.818, 0, 7.373)
SWEP.EjectAng = Angle(0, 0, 0)

SWEP.ReloadSoundsTable = {}

SWEP.Magnification = 1

SWEP.TrueIronsPos = Vector(0.23, 18.132, -9.54)
SWEP.TrueIronsAng = Vector(1.832, 0.15, 0)

SWEP.SightedAimPos = Vector(0.23, -18, -9.54)
SWEP.SightedAimAng = Vector(1.832, 0.15, 0)

SWEP.UseTrueIrons = true

SWEP.LowPos = Vector(4.623, 18.693, -13.266)
SWEP.LowAng = Vector(-25.327, -11.256, 14.069)


SWEP.ShootingDelay = 60 / 500
SWEP.TriggerDelay = 0

SWEP.Recoil = 18
SWEP.RecoilAngles = 35

SWEP.BlowbackAmount = 3.5
SWEP.BlowbackRecovery = 4
SWEP.BlowbackMax = 5

SWEP.HeatAccumulation = 50 -- Out of 100, the amount of heat each shot adds to the weapon
SWEP.HeatDissipation = 200 -- Amount of heat dissipated per second

SWEP.Precision = 1 / 60
SWEP.MaxHeatPrecision = 1 / 35
SWEP.HipfirePenalty = 0
SWEP.MaxHeatHipfirePenalty = 0.075
SWEP.MaxMovePenalty = 0.05

SWEP.Sway = 1.5


SWEP.InternalMag = true -- whether this weapon uses detachable magazines or loads rounds directly into the weapon

SWEP.DefaultLoad = "12g_buck"

SWEP.Magazine = { -- this is the weapon's default magazine, this will be automatically given if the setting act3_instantaction is enabled
    Type = "m1014_tube_4",
    Rounds = {}, -- the actual bulletids that make up the ammo in the magazine
}

SWEP.MagazineType = "int"
SWEP.MagazineVisible = false

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
    },
    {
        Safe = true
    }
}

SWEP.BurstLength = 0
SWEP.Automatic = false -- use this instead of changing SWEP.Primary.Automatic

SWEP.MuzzleVelocity = 15000