SWEP.Base = "act3_base"

SWEP.Spawnable = true
SWEP.AdminSpawnable = false
SWEP.PrintName = "Land Pattern Musket"
SWEP.Category = "ACT3 - Firearms"

SWEP.Desc_Country = "Great Britain"
SWEP.Desc_Manufacturer = "Various"
SWEP.Desc_Mechanism = "Flintlock"
SWEP.Desc_Year = 1722
SWEP.Desc_Weight = 4.8 -- kg
SWEP.ACT3Cat = ACT3_CAT_SPECIAL
SWEP.Sidearm = false

SWEP.GiveToCombine = false

SWEP.Slot = 3

SWEP.WorldModel = "models/weapons/act3/musket_brownbess.mdl"
SWEP.WorldModelBase = "models/weapons/act3/musket_brownbess.mdl" -- Worldmodel base of the weapon world model.
SWEP.WorldModelPos = Vector(12.776, 0.805, 2.941)
SWEP.WorldModelAng = Angle(-10.513, 0, 180)
SWEP.WorldModelBodygroups = "00000" -- Sets the bodygroups of the world model.
SWEP.WorldModelSkin = 0 -- Set the skin of the world model.
SWEP.WorldModelAttachments = {} -- {{string path, string bodygroups, int skin, vector pos, angle ang}}

SWEP.AttachmentBodygroups = {
["musket_toprail"] = {ind = 1, bg = 1},
}


SWEP.Attachments = {
    ["foregrip"] = {
        Type = "foregrip",
        PrintName = "Foregrip",
        Installed = nil,
        Required = false,
        Pos = Vector(2.948, 0, 6.541),
        Ang = Angle(0, 0, 0),
    },
    ["mount"] = {
        Type = "musket_mount",
        PrintName = "Mount",
        Installed = nil,
        Required = false,
    },
    ["accessory_right"] = {
        Type = "accessory",
        PrintName = "Accessory",
        Installed = nil,
        Required = false,
        Scale = 1,
        Pos = Vector(7.531, 0.986, 7.206),
        Ang = Angle(0, 0, 0),
    },
    ["accessory_left"] = {
        Type = "accessory",
        PrintName = "Accessory",
        Installed = nil,
        Required = false,
        Scale = 1,
        Pos = Vector(7.867, -1.357, 7.206),
        Ang =  Angle(0, 0, 180),
    }
} -- {{id=""}}


SWEP.MuzzleOffset = Vector(37.995, 0.972, -9.445)
SWEP.MuzzleAngle = Angle(0, 0, 0)

SWEP.ReloadSoundsTable = {
    {
        time = 0.1,
        path = "weapons/shotgun/shotgun_reload1.wav",
    },
    {
        time = 1.45,
        path = "weapons/p228/p228_slideback.wav",
    },
}

SWEP.Magnification = 1

SWEP.TrueIronsPos = Vector(0.064, 15.852, -8.523)
SWEP.TrueIronsAng = Vector(0.382, 0, 0)

SWEP.SightedAimPos = Vector(0.064, -5, -8.523)
SWEP.SightedAimAng = Vector(0.382, 0, 0)

SWEP.UseTrueIrons = true

SWEP.LowPos = Vector(4.623, 18.693, -13.266)
SWEP.LowAng = Vector(-25.327, -11.256, 14.069)


SWEP.ShootingDelay = 60 / 10
SWEP.TriggerDelay = 0

SWEP.Recoil = 8
SWEP.RecoilAngles = 10

SWEP.BlowbackAmount = 3.5
SWEP.BlowbackRecovery = 4
SWEP.BlowbackMax = 5

SWEP.HeatAccumulation = 40 -- Out of 100, the amount of heat each shot adds to the weapon
SWEP.HeatDissipation = 200 -- Amount of heat dissipated per second

SWEP.Precision = 1 / 40
SWEP.MaxHeatPrecision = 1 / 25
SWEP.HipfirePenalty = 0 -- Deviation applied on hip fire
SWEP.MaxHeatHipfirePenalty = 0.075
SWEP.MaxMovePenalty = 0.1
SWEP.DispersionInSights = false

SWEP.Sway = 1.5


SWEP.OpenBolt = true
SWEP.InternalMag = true -- whether this weapon uses detachable magazines or loads rounds directly into the weapon

SWEP.DefaultLoad = "musketball"

SWEP.Magazine = { -- this is the weapon's default magazine, this will be automatically given if the setting act3_instantaction is enabled
    Type = "musket_chamber",
    Rounds = {}, -- the actual bulletids that make up the ammo in the magazine
}

SWEP.MagazineType = "int"
SWEP.MagazineVisible = false

SWEP.Calibre = "musketball"
SWEP.PrintCalibre = "Musket Ball"

SWEP.MuzzleEffect = "act3_musket_muzzleeffect"

SWEP.SoundShoot = "ambient/explosions/explode_9.wav"
SWEP.SoundShootSuppressed = "weapons/m4a1/m4a1-1.wav"
SWEP.SoundShootVol = 120
SWEP.SoundShootPitch = 125

SWEP.CannotCycle = true

SWEP.SoundDryfire = "weapons/shotgun/shotgun_empty.wav"



SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_CROSSBOW
SWEP.AnimReload = ACT_HL2MP_GESTURE_RELOAD_AR2
SWEP.AnimReloadProne = 2089
SWEP.AnimMeleeAttack = ACT_GMOD_GESTURE_MELEE_SHOVE_2HAND

SWEP.HoldtypePassive = "passive"
SWEP.HoldtypeHip = "shotgun"
SWEP.HoldtypeSights = "ar2"



SWEP.Firemodes = {
    {
        Automatic = false,
        BurstLength = 0,
        CustomFiremode = "FLNT",
        CustomBars = nil,
        Safe = false
    },
}

SWEP.ManualAction = false

SWEP.MuzzleVelocity = 20000