SWEP.Base = "act3_base"

SWEP.Spawnable = true
SWEP.AdminSpawnable = false
SWEP.PrintName = "Super Blackhawk"
SWEP.Category = "ACT3 - Firearms"

SWEP.Desc_Country = "USA"
SWEP.Desc_Manufacturer = "Sturm Ruger"
SWEP.Desc_Mechanism = "Single-Action"
SWEP.Desc_Year = 1955
SWEP.Desc_Weight = 1.048 -- kg
SWEP.ACT3Cat = ACT3_CAT_PISTOL
SWEP.Sidearm = true

SWEP.Slot = 1

SWEP.WorldModel = "models/weapons/act3/pistol_blackhawk.mdl" --"models/weapons/act3/pist_saa.mdl"
SWEP.WorldModelBase = "models/weapons/act3/pistol_blackhawk.mdl" --"models/weapons/act3/pist_saa.mdl" -- Worldmodel base of the weapon world model.
SWEP.WorldModelPos = Vector(0.209, 0.397, 0.462)
SWEP.WorldModelAng = Angle(-6.209, 0, 180)
SWEP.WorldModelBodygroups = "00000"

SWEP.DefaultAttachments = {}
SWEP.AttachmentBodygroups = {}


SWEP.Attachments = {
    --[[
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
    ]]
}

SWEP.MuzzleOffset = Vector(11.442, 1.463, -5.299)
SWEP.MuzzleAngle = Angle(0, 0, 0)
SWEP.EjectPos = Vector(-5.097, -7.349, 6.732)
SWEP.EjectAng = Angle(0, 0, 90)

SWEP.TrueIronsPos =  Vector(1.105, 0, -5.279)
SWEP.TrueIronsAng = Vector(0, 0, 0)

SWEP.LowPos = Vector(4.623, 18.693, -13.266)
SWEP.LowAng = Vector(-25.327, -11.256, 14.069)



SWEP.DamageMult = 1.05 -- the weapon's main stats are just taken from the bullet
SWEP.ShootingDelay = 60 / 120
SWEP.TriggerDelay = 0

SWEP.Recoil = 6
SWEP.RecoilAngles = 45

SWEP.BlowbackAmount = 2
SWEP.BlowbackRecovery = 6
SWEP.BlowbackMax = 3
SWEP.RollBlowbackAmount = 15
SWEP.RollBlowbackRecovery = 10
SWEP.RollBlowbackMax = 45

SWEP.HeatAccumulation = 15 -- Out of 100, the amount of heat each shot adds to the weapon
SWEP.HeatDissipation = 75 -- Amount of heat dissipated per second

SWEP.Precision = 1 / 200
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
    Type = "blackhawk_chamber",
    Rounds = {}
}
SWEP.MagazineVisible = false

SWEP.MagazineType = "int"

SWEP.Calibre = "44mag"
SWEP.PrintCalibre = ".44 Magnum/Special"

SWEP.RevolverEject = true -- whether this weapon ejects shells when reloading instead of after each shot
SWEP.RevolverEjectPerRound = true

SWEP.MuzzleEffect = "act3_muzzleeffect"
SWEP.Suppressed = false

SWEP.SoundShoot = "weapons/357/357_fire2.wav"
SWEP.SoundShootVol = 120
SWEP.SoundShootPitch = 90

SWEP.SoundBoltAction = "weapons/p228/p228_slidepull.wav"
SWEP.SoundBoltActionDelay = 0.1
SWEP.SoundBoltActionVol = 75
SWEP.SoundBoltActionPitch = 110

SWEP.SoundDryfire = "weapons/ar2/ar2_empty.wav"

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_REVOLVER
SWEP.AnimReload = ACT_HL2MP_GESTURE_RELOAD_AR2
SWEP.ShotgunReload = true
SWEP.AnimReloadStartTime = 0.6
SWEP.AnimReloadExtraTimeAtEnd = 0.25
SWEP.AnimReloadEndTime = 0.5
SWEP.AnimReloadProne = 2087
SWEP.AnimMeleeAttack = ACT_GMOD_GESTURE_MELEE_SHOVE_1HAND

SWEP.ReloadSoundsTable = {
    {
        time = 0,
        path = "weapons/357/357_reload4.wav",
    },
    {
        time = 0.6,
        path = "weapons/357/357_reload3.wav",
        comp = ACT3_STPART_EMPTYRACK
    },
}

SWEP.HoldtypePassive = "normal"
SWEP.HoldtypeHip = "pistol"
SWEP.HoldtypeSights = "revolver"
SWEP.HoldtypeBipod = "revolver"

SWEP.CannotCycle = true

SWEP.Firemodes = {
    {
        Automatic = false,
        CustomFiremode = "SACT"
    },
    {
        Automatic = true,
        CustomFiremode = "FAN",
        EquipFunc = function(wpn)
            wpn.ShootingDelay = 60 / 350
            wpn.Precision = wpn.Precision * 5
        end,
        ResetFunc = function(wpn)
            wpn.ShootingDelay = 60 / 120
            wpn.Precision = wpn.Precision / 5
        end,
    }
}

SWEP.ManualAction = true
SWEP.ManualActionDelay = 0
SWEP.ManualActionPos = Vector(2.105, -2, -10.279)
SWEP.ManualActionAng = Vector(15, 0, 10)

SWEP.AimTime = 0.25