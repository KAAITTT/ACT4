SWEP.Base = "act3_base"

SWEP.Spawnable = true
SWEP.AdminSpawnable = false
SWEP.PrintName = "M92FS"
SWEP.Category = "ACT3 - Firearms"

SWEP.Desc_Country = "Italy"
SWEP.Desc_Manufacturer = "Beretta"
SWEP.Desc_Mechanism = "Short-Recoil Tilting Barrel"
SWEP.Desc_Year = 1975
SWEP.Desc_Weight = 0.97 -- kg
SWEP.ACT3Cat = ACT3_CAT_PISTOL
SWEP.Sidearm = true

SWEP.Slot = 1

SWEP.WorldModel = "models/weapons/act3/pistol_m9.mdl"
SWEP.WorldModelBase = "models/weapons/act3/pistol_m9.mdl" -- Worldmodel base of the weapon world model.
SWEP.WorldModelPos = Vector(4.043, 1.534, 2.158)
SWEP.WorldModelAng = Angle(-4.651, 0, 180)
SWEP.WorldModelBodygroups = "00000"

SWEP.DefaultAttachments = {
    ["fcg"] = "m9_fcg_semi"
}

SWEP.Attachments = {
    ["muzzle"] = {
        PrintName = "Muzzle",
        Type = "pistol_muzzle",
        Installed = nil,
        Required = false,
        Pos = Vector(11.088, 0.086, 6.388),
        Ang = Angle(0, 0, 0),
        Randomize = true,
        RandomizeChance = 30,
    },
    ["sight_pistol"] = {
        PrintName = "Compact Sight",
        Type = "sight_pistol",
        Installed = nil,
        Requireed = false,
        Pos = Vector(0.026, 0.068, 6.872),
        Ang = Angle(0, 0, 0),
        Randomize = true,
        RandomizeChance = 30,
    },
    ["accessory"] = {
        Type = "accessory",
        PrintName = "Accessory",
        Installed = nil,
        Required = false,
        Scale = 1,
        Pos = Vector(4.913, -0.08, 4.296),
        Ang = Angle(0, 0, 90),
        Randomize = true,
        RandomizeChance = 10,
    },
    ["fcg"] = {
        PrintName = "Fire Group",
        Type = "m9_fcg",
        Installed = nil,
        Required = true
    }
}

SWEP.MuzzleOffset = Vector(11.482, 1.495, -4.936)
SWEP.MuzzleAngle = Angle(0, 0, 0)
SWEP.EjectPos = Vector(2.493, -1.06, 5.778)
SWEP.EjectAng = Angle(0, 0, 0)
SWEP.MagazineOffsetPos = Vector(0, 0, 0)
SWEP.MagazineOffsetAng = Angle(0, 0, 0)

SWEP.ReloadSoundsTable = {
    {
        time = 0.1,
        path = "weapons/elite/elite_clipout.wav",
        comp = ACT3_STPART_MAGEJECT
    },
    {
        time = 0.8,
        path = "weapons/elite/elite_leftclipin.wav",
        comp = ACT3_STPART_MAGLOAD
    },
    {
        time = 1.5,
        path = "weapons/elite/elite_sliderelease.wav",
        comp = ACT3_STPART_EMPTYRACK
    },
}

SWEP.TrueIronsPos = Vector(-0.062, 6.872, -7.182)
SWEP.TrueIronsAng = Vector(0.865, 0, 0)

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
    Type = "m9_15",
    Rounds = {}
}

SWEP.MagazineVisible = true

SWEP.MagazineType = "m9"

SWEP.Calibre = "9x19"
SWEP.PrintCalibre = "9x19mm"

SWEP.MuzzleVelocity = 20000


-- Shell effect is unnecessary since they are taken from "bullets"
SWEP.ShellDelay = 0
SWEP.RevolverEject = false -- whether this weapon ejects shells when reloading instead of after each shot

SWEP.MuzzleEffect = "act3_muzzleeffect"
SWEP.Suppressed = false

SWEP.SoundShoot = "weapons/elite/elite-1.wav"
SWEP.SoundShootSuppressed = "weapons/usp/usp1.wav"
SWEP.SoundShootVol = 105
SWEP.SoundShootPitch = 100

SWEP.SoundCycle = "weapons/usp/usp_slideback.wav"
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