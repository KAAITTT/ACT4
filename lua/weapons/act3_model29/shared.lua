SWEP.Base = "act3_base"

SWEP.Spawnable = true
SWEP.AdminSpawnable = false
SWEP.PrintName = "Model 29"
SWEP.Category = "ACT3 - Firearms"

SWEP.Desc_Country = "USA"
SWEP.Desc_Manufacturer = "Smith And Wesson"
SWEP.Desc_Mechanism = "Double-Action"
SWEP.Desc_Year = 1955
SWEP.Desc_Weight = 1.276 -- kg
SWEP.ACT3Cat = ACT3_CAT_PISTOL
SWEP.Sidearm = true

SWEP.Slot = 1

SWEP.WorldModel = "models/weapons/act3/pist_model29.mdl"
SWEP.WorldModelBase = "models/weapons/act3/pist_model29.mdl" -- Worldmodel base of the weapon world model.
SWEP.WorldModelPos =  Vector(12.003, -5.79, 1.942)
SWEP.WorldModelAng = Angle(-8.037, 0, 180)
SWEP.WorldModelBodygroups = "00000"

SWEP.DefaultAttachments = {
    ["barrel"] = "m29_barrel_snub"
}

SWEP.AttachmentBodygroups = {
    ["m29_barrel_snub"] = {ind = 1, bg = 0},
    ["m29_barrel_long"] = {ind = 1, bg = 1},
}


SWEP.Attachments = {
    ["barrel"] = {
        Type = "m29_barrel",
        PrintName = "Barrel",
        Installed = nil,
        Required = true,
        Randomize = true,
        RandomizeChance = 50,
        
    },
    ["sight_pistol"] = {
        PrintName = "Compact Sight",
        Type = "sight_pistol",
        Installed = nil,
        Requireed = false,
        Pos = Vector(-5.46, -7.178, 8.359),
        Ang = Angle(0, 0, 0),
        Randomize = true,
        RandomizeChance = 20,
        
    },
}

SWEP.MuzzleOffset = Vector(11.442, 1.463, -5.299)
SWEP.MuzzleAngle = Angle(0, 0, 0)
SWEP.EjectPos = Vector(-5.097, -7.349, 6.732)
SWEP.EjectAng = Angle(0, 0, 90)

SWEP.TrueIronsPos =  Vector(7.196, 15.958, -8.577)
SWEP.TrueIronsAng = Vector(0, 0, 0)

SWEP.LowPos = Vector(4.623, 18.693, -13.266)
SWEP.LowAng = Vector(-25.327, -11.256, 14.069)



SWEP.DamageMult = 1 -- the weapon's main stats are just taken from the bullet
SWEP.ShootingDelay = 60 / 350
SWEP.TriggerDelay = 0

SWEP.Recoil = 6
SWEP.RecoilAngles = 45

SWEP.BlowbackAmount = 2
SWEP.BlowbackRecovery = 6
SWEP.BlowbackMax = 3
SWEP.RollBlowbackAmount = 4
SWEP.RollBlowbackRecovery = 10
SWEP.RollBlowbackMax = 45

SWEP.HeatAccumulation = 15 -- Out of 100, the amount of heat each shot adds to the weapon
SWEP.HeatDissipation = 75 -- Amount of heat dissipated per second

SWEP.Precision = 1 / 300
SWEP.MaxHeatPrecision = 1 / 50
SWEP.HipfirePenalty = 0 -- Deviation applied on hip fire
SWEP.MaxHeatHipfirePenalty = 0.075
SWEP.MaxMovePenalty = 0.025
SWEP.DispersionInSights = false

SWEP.Sway = 1.5



SWEP.SpeedMult = 1
SWEP.SightedSpeedMult = 0.9



SWEP.OpenBolt = true -- this weapon will not chamber a round to fire. Instead, it will take rounds directly from the magazine. Examples of such weapons include revolvers and open bolt guns.
SWEP.InternalMag = true -- whether this weapon uses detachable magazines or loads rounds directly into the weapon


SWEP.DefaultLoad = "44mag_fmj"
SWEP.DefaultMagazine = {}

SWEP.Magazine = { -- this is the weapon's default magazine, this will be automatically given if the setting act3_instantaction is enabled
    Type = "m29_chamber",
    Rounds = {}
}
SWEP.MagazineVisible = false

SWEP.MagazineType = "int"

SWEP.Calibre = "44mag"
SWEP.PrintCalibre = ".44 Magnum/Special"

SWEP.RevolverEject = true -- whether this weapon ejects shells when reloading instead of after each shot

SWEP.MuzzleEffect = "act3_muzzleeffect"
SWEP.Suppressed = false

SWEP.SoundShoot = "weapons/357/357_fire2.wav"
SWEP.SoundShootVol = 120
SWEP.SoundShootPitch = 100

SWEP.SoundDryfire = "weapons/ar2/ar2_empty.wav"

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_REVOLVER
SWEP.AnimReload = ACT_HL2MP_GESTURE_RELOAD_REVOLVER
SWEP.AnimReloadProne = 2087
SWEP.AnimMeleeAttack = ACT_GMOD_GESTURE_MELEE_SHOVE_1HAND

SWEP.HoldtypePassive = "normal"
SWEP.HoldtypeHip = "pistol"
SWEP.HoldtypeSights = "revolver"
SWEP.HoldtypeBipod = "revolver"

SWEP.CannotCycle = true

SWEP.Firemodes = {
    {
        Automatic = false,
        CustomFiremode = "DACT"
    },
    {
        Safe = true
    }
}

SWEP.AimTime = 0.25