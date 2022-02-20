SWEP.Base = "act3_base"

SWEP.Spawnable = true
SWEP.AdminSpawnable = false
SWEP.PrintName = "Glock 17"
SWEP.Category = "ACT3 - Firearms"

SWEP.Desc_Country = "Austria"
SWEP.Desc_Manufacturer = "Glock GMBH"
SWEP.Desc_Mechanism = "Short-Recoil Tilting Barrel"
SWEP.Desc_Year = 1979
SWEP.Desc_Weight = 0.625 -- kg
SWEP.ACT3Cat = ACT3_CAT_PISTOL
SWEP.Sidearm = true

SWEP.Desc_Extra = {
    "",
    "Basic 9mm pistol.",
    "",
}

SWEP.Slot = 1

SWEP.WorldModel = "models/weapons/act3/pistol_g17.mdl"
SWEP.WorldModelBase = "models/weapons/act3/pistol_g17.mdl" -- Worldmodel base of the weapon world model.
SWEP.WorldModelPos = Vector(0, 1.412, 1.067)
SWEP.WorldModelAng = Angle(-10.004, 0, 180)
SWEP.WorldModelBodygroups = "00000"

SWEP.DefaultAttachments = {
    ["fcg"] = "g17_fcg_semi"
}

SWEP.AttachmentBodygroups = {
    ["g17_stock"] = {ind = 1, bg = 1},
    ["g17_railmount"] = {ind = 2, bg = 1},
}

SWEP.Attachments = {
    ["muzzle"] = {
        PrintName = "Muzzle",
        Type = "pistol_muzzle",
        Installed = nil,
        Required = false,
        Pos = Vector(13.555, -0.445, 3.778),
        Ang = Angle(0, 0, 0),
        Randomize = true,
        RandomizeChance = 30,
        
    },
    ["sight_pistol"] = {
        PrintName = "Compact Sight",
        Type = "sight_pistol",
        Installed = nil,
        Requireed = false,
        Pos = Vector(3.019, -0.442, 4.468),
        Ang = Angle(0, 0, 0),
        Randomize = true,
        RandomizeChance = 30,
        
    },
    ["railmount"] = {
        PrintName = "Mount",
        Type = "g17_mount",
        Installed = nil,
        Required = false
    },
    ["accessory"] = {
        Type = "accessory",
        PrintName = "Accessory",
        Installed = nil,
        Required = false,
        Scale = 1,
        Pos = Vector(7.682, -0.496, 2.055),
        Ang = Angle(0, 0, 90),
        Randomize = true,
        RandomizeChance = 10,
        
    },
    ["stock"] = {
        PrintName = "Stock",
        Type = "g17_stock",
        Installed = nil,
        Required = false,
        Randomize = true,
        RandomizeChance = 30,
        
    },
    ["fcg"] = {
        PrintName = "Fire Group",
        Type = "g17_fcg",
        Installed = nil,
        Required = true
    }
}

SWEP.MuzzleOffset = Vector(9.546, 1.822, -4.449)
SWEP.MuzzleAngle = Angle(0, 0, 0)
SWEP.EjectPos = Vector(4.435, -0.99, 6.572)
SWEP.EjectAng = Angle(0, 0, 0)
SWEP.MagazineOffsetPos = Vector(0, 0, 0)
SWEP.MagazineOffsetAng = Angle(0, 0, 0)

SWEP.ReloadSoundsTable = {
    {
        time = 0.1,
        path = "weapons/glock/glock_clipout.wav",
        comp = ACT3_STPART_MAGEJECT
    },
    {
        time = 0.8,
        path = "weapons/glock/glock_clipin.wav",
        comp = ACT3_STPART_MAGLOAD
    },
    {
        time = 1.5,
        path = "weapons/glock/glock_sliderelease.wav",
        comp = ACT3_STPART_EMPTYRACK
    },
}

SWEP.TrueIronsPos = Vector(0.409, 4.06, -4.474)
SWEP.TrueIronsAng = Vector(0.365, -0.071, 0)

SWEP.SightedAimPos = Vector(0.409, -3, -4.474)
SWEP.SightedAimAng = Vector(0.365, -0.071, 0)

SWEP.LowPos = Vector(4.623, 18.693, -13.266)
SWEP.LowAng = Vector(-25.327, -11.256, 14.069)



SWEP.DamageMult = 1 -- the weapon's main stats are just taken from the bullet
SWEP.ShootingDelay = 60 / 1000
SWEP.TriggerDelay = 0

SWEP.Recoil = 2.5
SWEP.RecoilAngles = 25

SWEP.BlowbackAmount = 2
SWEP.BlowbackRecovery = 6
SWEP.BlowbackMax = 3
SWEP.RollBlowbackAmount = 4
SWEP.RollBlowbackRecovery = 10
SWEP.RollBlowbackMax = 45

SWEP.HeatAccumulation = 15 -- Out of 100, the amount of heat each shot adds to the weapon
SWEP.HeatDissipation = 75 -- Amount of heat dissipated per second

SWEP.Precision = 1 / 100
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

SWEP.DefaultLoad = "9x19_fmj" -- the round that this gun will be loaded with by default
SWEP.DefaultMagazine = { -- this is the weapon's default magazine, this will be automatically given if the setting act3_instantaction is enabled
    Type = "g17_17",
    Rounds = {}
}

SWEP.MagazineVisible = true

SWEP.MagazineType = "g17"

SWEP.Calibre = "9x19"
SWEP.PrintCalibre = "9x19mm"

SWEP.MuzzleVelocity = 20000


-- Shell effect is unnecessary since they are taken from "bullets"
SWEP.ShellDelay = 0
SWEP.RevolverEject = false -- whether this weapon ejects shells when reloading instead of after each shot

SWEP.MuzzleEffect = "act3_muzzleeffect"
SWEP.Suppressed = false

SWEP.SoundShoot = "weapons/glock/glock18-1.wav"
SWEP.SoundShootSuppressed = "weapons/usp/usp1.wav"
SWEP.SoundShootVol = 105
SWEP.SoundShootPitch = 100

SWEP.SoundCycle = "weapons/glock/glock_slideback.wav"
SWEP.SoundDryfire = "weapons/ar2/ar2_empty.wav"



SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_PISTOL
SWEP.AnimReload = ACT_HL2MP_GESTURE_RELOAD_PISTOL
SWEP.AnimReloadProne = 2087
SWEP.AnimMeleeAttack = ACT_GMOD_GESTURE_MELEE_SHOVE_1HAND

SWEP.HoldtypePassive = "normal"
SWEP.HoldtypeHip = "pistol"
SWEP.HoldtypeSights = "revolver"
SWEP.HoldtypeBipod = "revolver"



SWEP.Firemodes = { -- glocks lack safeties
    {
        Automatic = false,
    }
}

SWEP.AimTime = 0.25