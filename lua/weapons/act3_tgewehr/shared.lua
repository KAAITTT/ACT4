SWEP.Base = "act3_base"

SWEP.Spawnable = true
SWEP.AdminSpawnable = false
SWEP.PrintName = "Tankgewehr"
SWEP.Category = "ACT3 - Firearms"

SWEP.Desc_Country = "German Empire"
SWEP.Desc_Manufacturer = "Mauser"
SWEP.Desc_Mechanism = "Breech-Loading"
SWEP.Desc_Year = 1918
SWEP.Desc_Weight = 18.5 -- kg
SWEP.ACT3Cat = ACT3_CAT_ANTIMATERIEL
SWEP.Sidearm = false

SWEP.GiveToCombine = false

SWEP.Desc_Extra = {
    "",
    "The first Anti-Tank rifle.",
    "",
    "Used to kill British tanks during WW1.",
    "During this time, the German word for 'Tank' was",
    "simply 'Tank', a loanword from the British.",
    "Packs a monstrous punch. Capable of",
    "penetrating light armor."
}

SWEP.Slot = 3

SWEP.WorldModel = "models/weapons/act3/rifle_tankgewehr.mdl"
SWEP.WorldModelBase = "models/weapons/act3/rifle_tankgewehr.mdl" -- Worldmodel base of the weapon world model.
SWEP.WorldModelPos = Vector(13.873, 0.1, 2.029)
SWEP.WorldModelAng = Angle(-9.799, 0, 180)
SWEP.WorldModelBodygroups = "00000" -- Sets the bodygroups of the world model.
SWEP.WorldModelSkin = 0 -- Set the skin of the world model.
SWEP.WorldModelAttachments = {} -- {{string path, string bodygroups, int skin, vector pos, angle ang}}

SWEP.DefaultAttachments = {
}

SWEP.AttachmentBodygroups = {
}

SWEP.Attachments = {
    ["mount"] = {
        Type = "am_rail",
        PrintName = "Mount",
        Installed = nil,
        Required = false,
        Pos = Vector(2.601, -0.608, 8.682)
    },
}


SWEP.MuzzleOffset = Vector(44.521, 0.753, -11.009)
SWEP.MuzzleAngle = Angle(-12.367, 0, 0)
SWEP.EjectPos = Vector(-3.922, -0.55, 7.94)
SWEP.EjectAng = Angle(0, 0, 0)

SWEP.ReloadSoundsTable = {
    {
        time = 0.1,
        path = "weapons/awp/awp_bolt.wav",
    },
    {
        time = 0.75,
        path = "weapons/shotgun/shotgun_reload1.wav",
    },
    {
        time = 1.45,
        path = "weapons/awp/awp_bolt.wav",
    },
}

SWEP.Magnification = 1

SWEP.TrueIronsPos = Vector(0.629, 14.756, -9.19)
SWEP.TrueIronsAng = Vector(0.734, 0, 0)


SWEP.SightedAimPos = Vector(0.639, -19.497, -8.957)
SWEP.SightedAimAng = Vector(0.607, 0.014, 0)

SWEP.UseTrueIrons = true

SWEP.LowPos = Vector(4.623, 18.693, -13.266)
SWEP.LowAng = Vector(-25.327, -11.256, 14.069)


SWEP.ShootingDelay = 60 / 80
SWEP.TriggerDelay = 0

SWEP.Recoil = 48
SWEP.RecoilAngles = 5

SWEP.BlowbackAmount = 1
SWEP.BlowbackRecovery = 0.5
SWEP.BlowbackMax = 1

SWEP.HeatAccumulation = 40 -- Out of 100, the amount of heat each shot adds to the weapon
SWEP.HeatDissipation = 200 -- Amount of heat dissipated per second

SWEP.Precision = 1 / 300
SWEP.MaxHeatPrecision = 1 / 50
SWEP.HipfirePenalty = 0.025 -- Deviation applied on hip fire
SWEP.MaxHeatHipfirePenalty = 0.1
SWEP.MaxMovePenalty = 0.05
SWEP.DispersionInSights = true
SWEP.Sway = 5

SWEP.SightedSpeedMult = 0.9


SWEP.OpenBolt = true
SWEP.InternalMag = true -- whether this weapon uses detachable magazines or loads rounds directly into the weapon

SWEP.DefaultLoad = "13x92tuf_ap"

SWEP.BipodInstalled = true

SWEP.Magazine = { -- this is the weapon's default magazine, this will be automatically given if the setting act3_instantaction is enabled
    Type = "tg_chamber",
    Rounds = {}, -- the actual bulletids that make up the ammo in the magazine
}

SWEP.RevolverEject = true

SWEP.MagazineType = "int"
SWEP.MagazineVisible = false

SWEP.Calibre = "13x92tuf"
SWEP.PrintCalibre = "13.2x92mm Tank und Flieger"

SWEP.MuzzleEffect = "act3_muzzleeffect"

SWEP.SoundShoot = "weapons/awp/awp1.wav"
SWEP.SoundShootSuppressed = "weapons/m4a1/m4a1-1.wav"
SWEP.SoundShootVol = 140
SWEP.SoundShootPitch = 115

SWEP.SoundCycle = "weapons/scout/scout_bolt.wav"
SWEP.SoundDryfire = "weapons/shotgun/shotgun_empty.wav"

SWEP.SoundLastShoot = nil

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_RPG
SWEP.AnimReload = ACT_HL2MP_GESTURE_RELOAD_AR2
SWEP.AnimReloadProne = 2089
SWEP.AnimMeleeAttack = ACT_GMOD_GESTURE_MELEE_SHOVE_2HAND

SWEP.HoldtypePassive = "passive"
SWEP.HoldtypeHip = "shotgun"
SWEP.HoldtypeSights = "ar2"
SWEP.HoldtypeBipod = "rpg"


SWEP.Firemodes = {
    {
        Automatic = false,
        BurstLength = 0,
        CustomFiremode = "FIRE",
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

SWEP.MuzzleVelocity = 48000