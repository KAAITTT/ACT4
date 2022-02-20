SWEP.Base = "act3_base"

SWEP.Spawnable = true
SWEP.AdminSpawnable = false
SWEP.PrintName = "USP"
SWEP.Category = "ACT3 - Firearms"

SWEP.Desc_Country = "Germany"
SWEP.Desc_Manufacturer = "Heckler And Koch"
SWEP.Desc_Mechanism = "Short-Recoil Locked Breech"
SWEP.Desc_Year = 1993
SWEP.Desc_Weight = 0.789 -- kg
SWEP.ACT3Cat = ACT3_CAT_PISTOL
SWEP.Sidearm = true

SWEP.Slot = 1

SWEP.WorldModel = "models/weapons/act3/pistol_usp.mdl"
SWEP.WorldModelBase = "models/weapons/act3/pistol_usp.mdl" -- Worldmodel base of the weapon world model.
SWEP.WorldModelPos = Vector(4.043, 1.534, 2.158)
SWEP.WorldModelAng = Angle(-4.651, 0, 180)
SWEP.WorldModelBodygroups = "00000"

SWEP.DefaultAttachments = {
}

SWEP.AttachmentBodygroups = {
}

SWEP.Attachments = {
    ["accessory"] = {
        Type = "accessory",
        PrintName = "Accessory",
        Installed = nil,
        Required = false,
        Scale = 1,
        Pos = Vector(4.51, -0.08, 4),
        Ang = Angle(0, 0, 90)
    },
    ["sight_pistol"] = {
        PrintName = "Compact Sight",
        Type = "sight_pistol",
        Installed = nil,
        Requireed = false,
        Pos = Vector(0.202, 0.039, 6.493),
        Ang = Angle(0, 0, 0)
    },
    ["muzzle"] = {
        Type = "pistol_muzzle",
        PrintName = "Muzzle",
        Installed = nil,
        Required = false,
        Scale = 1.1,
        Pos = Vector(9.753, 0.079, 5.789),
        Ang = Angle(0, 0, 0)
    }
}

SWEP.MuzzleOffset = Vector(10.385, 1.575, -4.317)
SWEP.MuzzleAngle = Angle(0, 0, 0)
SWEP.EjectPos = Vector(2.435, -0.99, 5.572)
SWEP.EjectAng = Angle(0, 0, 0)
SWEP.MagazineOffsetPos = Vector(0, 0, 0)
SWEP.MagazineOffsetAng = Angle(0, 0, 0)

SWEP.ReloadSoundsTable = {
    {
        time = 0.1,
        path = "weapons/usp/usp_clipout.wav",
        comp = ACT3_STPART_MAGEJECT
    },
    {
        time = 0.8,
        path = "weapons/usp/usp_clipin.wav",
        comp = ACT3_STPART_MAGLOAD
    },
    {
        time = 1.5,
        path = "weapons/usp/usp_sliderelease.wav",
        comp = ACT3_STPART_EMPTYRACK
    },
}

SWEP.TrueIronsPos = Vector(-0.044, 6.872, -6.719)
SWEP.TrueIronsAng = Vector(0.601, 0, 0)

SWEP.LowPos = Vector(4.623, 18.693, -13.266)
SWEP.LowAng = Vector(-25.327, -11.256, 14.069)



SWEP.DamageMult = 1 -- the weapon's main stats are just taken from the bullet
SWEP.ShootingDelay = 60 / 600
SWEP.TriggerDelay = 0

SWEP.Recoil = 3
SWEP.RecoilAngles = 25

SWEP.BlowbackAmount = 2
SWEP.BlowbackRecovery = 6
SWEP.BlowbackMax = 3
SWEP.RollBlowbackAmount = 4
SWEP.RollBlowbackRecovery = 10
SWEP.RollBlowbackMax = 45

SWEP.HeatAccumulation = 10 -- Out of 100, the amount of heat each shot adds to the weapon
SWEP.HeatDissipation = 75 -- Amount of heat dissipated per second

SWEP.Precision = 1 / 150
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

SWEP.DefaultLoad = "45acp_fmj" -- the round that this gun will be loaded with by default
SWEP.DefaultMagazine = { -- this is the weapon's default magazine, this will be automatically given if the setting act3_instantaction is enabled
    Type = "usp_12",
    Rounds = {}
}

SWEP.MagazineVisible = true

SWEP.MagazineType = "usp"

SWEP.Calibre = "45acp"
SWEP.PrintCalibre = ".45 ACP"

SWEP.MuzzleVelocity = 13000


-- Shell effect is unnecessary since they are taken from "bullets"
SWEP.ShellDelay = 0
SWEP.RevolverEject = false -- whether this weapon ejects shells when reloading instead of after each shot

SWEP.MuzzleEffect = "act3_muzzleeffect"
SWEP.Suppressed = false

SWEP.SoundShoot = "weapons/usp/usp_unsil-1.wav"
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



SWEP.Firemodes = {
    {
        Automatic = false,
    },
    {
        Safe = true
    }
}

SWEP.AimTime = 0.25