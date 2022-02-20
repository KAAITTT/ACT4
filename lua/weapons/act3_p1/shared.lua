SWEP.Base = "act3_base"

SWEP.Spawnable = true
SWEP.AdminSpawnable = false
SWEP.PrintName = "P1"
SWEP.Category = "ACT3 - Firearms"

SWEP.Desc_Country = "Germany"
SWEP.Desc_Manufacturer = "Carl Walther Waffenfabrik"
SWEP.Desc_Mechanism = "Short Recoil"
SWEP.Desc_Year = 1957
SWEP.Desc_Weight = 0.8 -- kg
SWEP.ACT3Cat = ACT3_CAT_PISTOL
SWEP.Sidearm = true

SWEP.GiveToCombine = false

SWEP.Slot = 1

SWEP.WorldModel = "models/weapons/act3/pistol_p1.mdl"
SWEP.WorldModelBase = "models/weapons/act3/pistol_p1.mdl"
SWEP.WorldModelPos = Vector(0, 0, 1.041)
SWEP.WorldModelAng = Angle(-11.263, 0, 180)
SWEP.WorldModelBodygroups = "00000"

SWEP.DefaultAttachments = {
}

SWEP.AttachmentBodygroups = {
}

SWEP.Attachments = {
    ["sight_pistol"] = {
        PrintName = "Compact Sight",
        Type = "sight_pistol",
        Installed = nil,
        Requireed = false,
        Pos = Vector(3.654, -1.183, 3.971),
        Ang = Angle(0, 0, 0),
        Randomize = true,
        RandomizeChance = 30,
    },
    ["muzzle"] = {
        Type = "pistol_muzzle",
        PrintName = "Muzzle",
        Installed = nil,
        Required = false,
        Scale = 1.0,
        Pos = Vector(13.704, -1.13, 3.417),
        Ang = Angle(0, 0, 0),
        Randomize = true,
        RandomizeChance = 30,
    }
}

SWEP.MuzzleOffset = Vector(9.805, 1.179, -4.421)
SWEP.MuzzleAngle = Angle(0, 0, 0)
SWEP.EjectPos = Vector(3.782, -1.392, 3.259)
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
        path = "weapons/fiveseven/fiveseven_slidepull.wav",
        comp = ACT3_STPART_EMPTYRACK
    },
}

SWEP.TrueIronsPos = Vector(1.169, 0, -3.924)
SWEP.TrueIronsAng = Vector(0, 0, 0)

SWEP.SightedAimPos = Vector(1.169, 0, -3.924)
SWEP.SightedAimAng = Vector(0, 0, 0)

SWEP.LowPos = Vector(4.623, 18.693, -13.266)
SWEP.LowAng = Vector(-25.327, -11.256, 14.069)



SWEP.DamageMult = 1 -- the weapon's main stats are just taken from the bullet
SWEP.ShootingDelay = 60 / 1000
SWEP.TriggerDelay = 0

SWEP.Recoil = 2.5
SWEP.RecoilAngles = 25

SWEP.BlowbackAmount = 1.5
SWEP.BlowbackRecovery = 6
SWEP.BlowbackMax = 2
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

SWEP.Sway = 2



SWEP.SpeedMult = 1
SWEP.SightedSpeedMult = 0.9



SWEP.OpenBolt = false -- this weapon will not chamber a round to fire. Instead, it will take rounds directly from the magazine. Examples of such weapons include revolvers and open bolt guns.
SWEP.InternalMag = false -- whether this weapon uses detachable magazines or loads rounds directly into the weapon

SWEP.DefaultLoad = "9x19_fmj" -- the round that this gun will be loaded with by default
SWEP.DefaultMagazine = { -- this is the weapon's default magazine, this will be automatically given if the setting act3_instantaction is enabled
    Type = "p1_8",
    Rounds = {}
}
SWEP.MagazineVisible = false

SWEP.MagazineType = "p1"

SWEP.Calibre = "9x19"
SWEP.PrintCalibre = "9x19mm Parabellum"

SWEP.MuzzleVelocity = 20000


-- Shell effect is unnecessary since they are taken from "bullets"
SWEP.ShellDelay = 0
SWEP.RevolverEject = false -- whether this weapon ejects shells when reloading instead of after each shot

SWEP.MuzzleEffect = "act3_muzzleeffect"
SWEP.Suppressed = false

SWEP.SoundShoot = "weapons/fiveseven/fiveseven-1.wav"
SWEP.SoundShootSuppressed = "weapons/usp/usp1.wav"
SWEP.SoundShootVol = 105
SWEP.SoundShootPitch = 115

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



SWEP.Firemodes = {
    {
        Automatic = false,
    },
    {
        Safe = true
    }
}

SWEP.AimTime = 0.25