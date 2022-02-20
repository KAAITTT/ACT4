SWEP.Base = "act3_base"

SWEP.Spawnable = true
SWEP.AdminSpawnable = false
SWEP.PrintName = "M1919 .30 Cal"
SWEP.Category = "ACT3 - Firearms"

SWEP.Desc_Country = "USA"
SWEP.Desc_Manufacturer = "Browning"
SWEP.Desc_Mechanism = "Short-Recoil Operation"
SWEP.Desc_Year = 1919
SWEP.Desc_Weight = 14 -- kg
SWEP.ACT3Cat = ACT3_CAT_GPMG
SWEP.Sidearm = false

SWEP.Slot = 3

SWEP.WorldModel = "models/weapons/act3/mg_m1919.mdl"
SWEP.WorldModelBase = "models/weapons/act3/mg_m1919.mdl" -- Worldmodel base of the weapon world model.
SWEP.WorldModelPos = Vector(1.546, 0, -1.578)
SWEP.WorldModelAng = Angle(-14.561, 0, 180)

SWEP.GiveToCombine = false

SWEP.DefaultAttachments = {
    ["barrel"] = "m1919_barrel_factory",
    ["grip"] = "m1919_grip"
}

SWEP.AttachmentBodygroups = {
    ["m1919_barrel_factory"] = {ind = 1, bg = 0},
    ["m1919_barrel_stinger"] = {ind = 1, bg = 1},
    ["m1919_grip"] = {ind = 2, bg = 0},
    ["m1919_stock"] = {ind = 2, bg = 1},
}

SWEP.Attachments = {
    ["barrel"] = {
        Type = "m1919_barrel",
        PrintName = "Barrel",
        Installed = nil,
        Required = true,
        Scale = 1,
    },
    ["grip"] = {
        Type = "m1919_grip",
        PrintName = "Grip",
        Installed = nil,
        Required = true,
        Scale = 1,
    },
    ["bolt"] = {
        Type = "bolt",
        ExtraTypes = {"bolt_heavy"},
        PrintName = "Bolt",
        Installed = nil,
        Required = false,
    },
}

SWEP.MuzzleOffset = Vector(44.513, 1.154, -13.518)
SWEP.MuzzleAngle = Angle(0, 0, 0)
SWEP.EjectPos = Vector(19.163, -1.196, 1.776)
SWEP.EjectAng = Angle(0, 0, 0)

SWEP.ReloadSoundsTable = {
    {
        time = 0.1,
        path = "weapons/m249/m249_chain.wav",
        comp = ACT3_STPART_BASE
    },
    {
        time = 1.0,
        path = "weapons/m249/m249_coverdown.wav",
        comp = ACT3_STPART_BASE
    },
    {
        time = 1.45,
        path = "weapons/galil/galil_boltpull.wav",
        comp = ACT3_STPART_EMPTYRACK
    },
}

SWEP.TrueIronsPos = Vector(1.154, 2.051, -4.49)
SWEP.TrueIronsAng = Vector(0, 0.082, 0)

SWEP.LowPos = Vector(4.623, 18.693, -13.266)
SWEP.LowAng = Vector(-25.327, -11.256, 14.069)

SWEP.ShootingDelay = 60 / 550
SWEP.TriggerDelay = 0

SWEP.Recoil = 4
SWEP.RecoilAngles = 65

SWEP.BlowbackAmount = 1
SWEP.BlowbackRecovery = 5
SWEP.BlowbackMax = 2.5
SWEP.RollBlowbackAmount = 3
SWEP.RollBlowbackRecovery = 10
SWEP.RollBlowbackMax = 45

SWEP.HeatAccumulation = 15 -- Out of 100, the amount of heat each shot adds to the weapon
SWEP.HeatDissipation = 200 -- Amount of heat dissipated per second

SWEP.Precision = 1 / 110
SWEP.MaxHeatPrecision = 1 / 50
SWEP.HipfirePenalty = 0.025 -- Deviation applied on hip fire
SWEP.MaxHeatHipfirePenalty = 0.1
SWEP.MaxMovePenalty = 0.05
SWEP.DispersionInSights = true

SWEP.Sway = 6.5



SWEP.SpeedMult = 1
SWEP.SightedSpeedMult = 0.5



SWEP.OpenBolt = true -- this weapon will not chamber a round to fire. Instead, it will take rounds directly from the magazine. Examples of such weapons include revolvers and open bolt guns.
SWEP.InternalMag = true -- whether this weapon uses detachable magazines or loads rounds directly into the weapon

SWEP.DefaultLoad = "3006_trw" -- the round that this gun will be loaded with by default
SWEP.Magazine = { -- this is the weapon's default magazine, this will be automatically given if the setting act3_instantaction is enabled
    Type = "m1919_belt_100",
    Rounds = {}
}

SWEP.BipodInstalled = true
SWEP.MagazineVisible = false

SWEP.MagazineType = "int"

SWEP.Calibre = "3006"
SWEP.PrintCalibre = ".30-06 Winchester"

SWEP.MuzzleVelocity = 40000

SWEP.MuzzleEffect = "act3_muzzleeffect"
SWEP.Suppressed = false

SWEP.SoundShoot = "act3/weapons/m1919/m1919-1.wav"
SWEP.SoundShootSuppressed = "weapons/m4a1/m4a1-1.wav"
SWEP.SoundShootVol = 110
SWEP.SoundShootPitch = 120

SWEP.SoundCycle = "weapons/galil/galil_boltpull.wav"
SWEP.SoundDryfire = "weapons/ar2/ar2_empty.wav"



SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2
SWEP.AnimReload = ACT_HL2MP_GESTURE_RELOAD_SMG1
SWEP.AnimReloadProne = 2087
SWEP.AnimMeleeAttack = ACT_GMOD_GESTURE_MELEE_SHOVE_2HAND

SWEP.HoldtypePassive = "passive"
SWEP.HoldtypeHip = "shotgun"
SWEP.HoldtypeSights = "ar2"
SWEP.HoldtypeBipod = "rpg"



SWEP.Firemodes = {
    {
        Automatic = true,
    },
    {
        Safe = true
    }
}
SWEP.CustomFiremode = false
SWEP.BurstLength = 0
SWEP.Automatic = true -- use this instead of changing SWEP.Primary.Automatic
SWEP.ManualAction = false

SWEP.ManualActionPos = Vector(0, 0, 0)
SWEP.ManualActionAng = Vector(0, 0, 0)

SWEP.AimTime = 0.25