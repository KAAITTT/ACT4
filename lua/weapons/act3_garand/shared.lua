SWEP.Base = "act3_base"

SWEP.Spawnable = true
SWEP.AdminSpawnable = false
SWEP.PrintName = "M1 Garand"
SWEP.Category = "ACT3 - Firearms"

SWEP.Desc_Country = "USA"
SWEP.Desc_Manufacturer = "Winchester"
SWEP.Desc_Mechanism = "Gas-Operated Rotating Bolt"
SWEP.Desc_Year = 1934
SWEP.Desc_Weight = 4.31 -- kg
SWEP.ACT3Cat = ACT3_CAT_BATTLE
SWEP.Sidearm = false

SWEP.Slot = 3

SWEP.WorldModel = "models/weapons/act3/rifle_garand.mdl"
SWEP.WorldModelBase = "models/weapons/act3/rifle_garand.mdl" -- Worldmodel base of the weapon world model.
SWEP.WorldModelPos = Vector(0, -0.157, 0.319)
SWEP.WorldModelAng = Angle(-6.827, 0, 180)
SWEP.WorldModelBodygroups = "00000" -- Sets the bodygroups of the world model.
SWEP.WorldModelSkin = 0 -- Set the skin of the world model.
SWEP.WorldModelAttachments = {} -- {{string path, string bodygroups, int skin, vector pos, angle ang}}

SWEP.DefaultAttachments = {
    ["stock"] = "garand_stock",
    ["fore"] = "garand_fore"
}

SWEP.AttachmentBodygroups = {
    ["garand_stock"] = {ind = 1, bg = 0},
    ["garand_stock_cut"] = {ind = 1, bg = 1},
    ["garand_scope"] = {ind = 2, bg = 1},
    ["garand_fore"] = {ind = 3, bg = 0},
    ["garand_fore_short"] = {ind = 3, bg = 1},
    ["garand_fore_obrez"] = {ind = 3, bg = 2},
}

SWEP.Attachments = {
    ["stock"] = {
        Type = "garand_stock",
        PrintName = "Stock",
        Installed = nil,
        Required = true,
    },
    ["fore"] = {
        Type = "garand_fore",
        PrintName = "Foreend",
        Installed = nil,
        Required = true,
    },
    ["scope"] = {
        Type = "garand_scope",
        ExtraTypes = {"am_rail"},
        PrintName = "Scope",
        Installed = nil,
        Required = false,
        Pos = Vector(16.721, -1.066, 4.626)
    },
} -- {{id=""}}


SWEP.MuzzleOffset = Vector(35.352, 0.898, -8.178)
SWEP.MuzzleAngle = Angle(0, 0, 0)
SWEP.EjectPos =  Vector(10.248, -1.201, 5.298)
SWEP.EjectAng = Angle(0, 0, 0)

SWEP.ReloadSoundsTable = {
    {
        time = 1.0,
        path = "act3/weapons/garand/garand_clipin1.wav",
    },
    {
        time = 1.45,
        path = "act3/weapons/garand/garand_clipin2.wav",
    },
}

SWEP.Magnification = 1.5

SWEP.TrueIronsPos = Vector(1.049, -2.533, -5.316)
SWEP.TrueIronsAng = Vector(0.032, -0.004, 0)

SWEP.SightedAimPos = Vector(1.049, -2.533, -5.316)
SWEP.SightedAimAng = Vector(0.032, -0.004, 0)

SWEP.UseTrueIrons = true

SWEP.LowPos = Vector(4.623, 18.693, -13.266)
SWEP.LowAng = Vector(-25.327, -11.256, 14.069)


SWEP.ShootingDelay = 60 / 400
SWEP.TriggerDelay = 0

SWEP.Recoil = 8
SWEP.RecoilAngles = 10

SWEP.BlowbackAmount = 2
SWEP.BlowbackRecovery = 5
SWEP.BlowbackMax = 2

SWEP.HeatAccumulation = 40 -- Out of 100, the amount of heat each shot adds to the weapon
SWEP.HeatDissipation = 200 -- Amount of heat dissipated per second

SWEP.Precision = 1 / 700
SWEP.MaxHeatPrecision = 1 / 50
SWEP.HipfirePenalty = 0
SWEP.MaxHeatHipfirePenalty = 0
SWEP.MaxMovePenalty = 0

SWEP.Sway = 1.5

SWEP.SightedSpeedMult = 0.7

SWEP.OpenBolt = true
SWEP.InternalMag = true -- whether this weapon uses detachable magazines or loads rounds directly into the weapon

SWEP.DefaultLoad = "3006_fmj"

SWEP.Magazine = { -- this is the weapon's default magazine, this will be automatically given if the setting act3_instantaction is enabled
    Type = "garand_clip_8",
    Rounds = {}, -- the actual bulletids that make up the ammo in the magazine
}

SWEP.MagazineType = "int"
SWEP.MagazineVisible = false

SWEP.MagazineOffsetPos = Vector(-4.158, -0.63, 7.406)
SWEP.MagazineOffsetAng = Angle(0, 0, 0)

SWEP.Calibre = "3006"
SWEP.PrintCalibre = ".30-06 Winchester"


-- Shell effect is unnecessary since they are taken from "bullets"
SWEP.ShellDelay = 0

SWEP.MuzzleEffect = "act3_muzzleeffect"

SWEP.SoundShoot = "act3/weapons/garand/garand-1.wav"
SWEP.SoundShootSuppressed = "weapons/m4a1/m4a1-1.wav"
SWEP.SoundShootVol = 120
SWEP.SoundShootPitch = 100

SWEP.SoundLastShoot = "act3/weapons/garand/garand_clipding.wav"

SWEP.SoundCycle = "weapons/famas/famas_forearm.wav"
SWEP.SoundDryfire = "weapons/shotgun/shotgun_empty.wav"



SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_RPG
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
        CustomBars = nil,
        CustomFiremode = nil,
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

SWEP.MuzzleVelocity = 41000