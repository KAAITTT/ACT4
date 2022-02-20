SWEP.Base = "act3_base"

SWEP.Spawnable = true
SWEP.AdminOnly = true
SWEP.PrintName = "Minigun"
SWEP.Category = "ACT3 - Firearms"

SWEP.Desc_Country = "USA"
SWEP.Desc_Manufacturer = "General Electric"
SWEP.Desc_Mechanism = "Electrically Driven Rotary Breech"
SWEP.Desc_Year = 1960
SWEP.Desc_Weight = 20 -- kg
SWEP.ACT3Cat = ACT3_CAT_HMG
SWEP.Sidearm = false

SWEP.Slot = 3

SWEP.WorldModel = "models/weapons/act3/mg_minigun.mdl"
SWEP.WorldModelBase = "models/weapons/act3/mg_minigun.mdl" -- Worldmodel base of the weapon world model.
SWEP.WorldModelPos = Vector(18.545, 1.986, 3.188)
SWEP.WorldModelAng = Angle(0, 7.269, 180)

SWEP.DefaultAttachments = {
}

SWEP.AttachmentBodygroups = {
}

SWEP.Attachment_Flags = {
}

SWEP.Attachments = {
}

SWEP.MuzzleOffset = Vector(44.652, -1.05, 2.335)
SWEP.MuzzleAngle = Angle(0, 0, 0)
SWEP.EjectPos = Vector(-10.134, -5.375, 0.244)
SWEP.EjectAng = Angle(0, 0, 0)
SWEP.MagazineOffsetPos = Vector(-3.047, 0, 8.045)
SWEP.MagazineOffsetAng = Angle(0, 0, 0)

SWEP.ReloadSoundsTable = {
    {
        time = 0.1,
        path = "weapons/m249/m249_boxout.wav",
        comp = ACT3_STPART_MAGEJECT
    },
    {
        time = 1.45,
        path = "weapons/m249/m249_boxin.wav",
        comp = ACT3_STPART_MAGLOAD
    },
}

SWEP.TrueIronsPos = Vector(0.307, 4.432, -4.687)
SWEP.TrueIronsAng = Vector(0, 0, 0)

SWEP.TrueIronsPos = Vector(0.307, 4.432, -4.687)
SWEP.TrueIronsAng = Vector(0, 0, 0)


SWEP.LowPos = Vector(4.623, 18.693, -13.266)
SWEP.LowAng = Vector(-25.327, -11.256, 14.069)



SWEP.DamageMult = 1 -- the weapon's main stats are just taken from the bullet
SWEP.ShootingDelay = 60 / 2000
SWEP.TriggerDelay = 0

SWEP.Recoil = 0.75
SWEP.RecoilAngles = 60

SWEP.BlowbackAmount = 0.25
SWEP.BlowbackRecovery = 7.5
SWEP.BlowbackMax = 2.5
SWEP.RollBlowbackAmount = 5
SWEP.RollBlowbackRecovery = 10
SWEP.RollBlowbackMax = 45

SWEP.HeatAccumulation = 10 -- Out of 100, the amount of heat each shot adds to the weapon
SWEP.HeatDissipation = 100 -- Amount of heat dissipated per second

SWEP.Precision = 1 / 100
SWEP.MaxHeatPrecision = 1 / 25
SWEP.HipfirePenalty = 0 -- Deviation applied on hip fire
SWEP.MaxHeatHipfirePenalty = 0
SWEP.MaxMovePenalty = 0
SWEP.DispersionInSights = true

SWEP.Sway = 2

SWEP.MuzzleElev = 8
SWEP.SightAboveBore = 12


SWEP.SpeedMult = 1
SWEP.SightedSpeedMult = 0.5



SWEP.OpenBolt = true -- this weapon will not chamber a round to fire. Instead, it will take rounds directly from the magazine. Examples of such weapons include revolvers and open bolt guns.
SWEP.InternalMag = true -- whether this weapon uses detachable magazines or loads rounds directly into the weapon

SWEP.DefaultLoad = "762x51_fmj" -- the round that this gun will be loaded with by default
SWEP.DefaultMagazine = { -- this is the weapon's default magazine, this will be automatically given if the setting act3_instantaction is enabled
    Type = "minigun_500",
    Rounds = {}
}

SWEP.Magazine = {
    Type = "minigun_500",
    Rounds = {}
}

SWEP.MagazineType = "int"

SWEP.Calibre = "762x51"
SWEP.PrintCalibre = "7.62x51mm NATO"

SWEP.MuzzleVelocity = 40000

SWEP.MuzzleEffect = "act3_muzzleeffect"
SWEP.Suppressed = false

SWEP.SoundShoot = "weapons/m249/m249-1.wav"
SWEP.SoundShootSuppressed = "weapons/m4a1/m4a1-1.wav"
SWEP.SoundShootVol = 120
SWEP.SoundShootPitch = 85

SWEP.SoundCycle = "weapons/m4a1/m4a1_boltpull.wav"
SWEP.SoundDryfire = "weapons/ar2/ar2_empty.wav"



SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2
SWEP.AnimReload = ACT_HL2MP_GESTURE_RELOAD_SMG1
SWEP.AnimReloadProne = 2087
SWEP.AnimMeleeAttack = ACT_GMOD_GESTURE_MELEE_SHOVE_2HAND

SWEP.HoldtypePassive = "passive"
SWEP.HoldtypeHip = "physgun"
SWEP.HoldtypeSights = "physgun"
SWEP.HoldtypeBipod = "rpg"



SWEP.Firemodes = {
    {
        Automatic = true,
        CustomFiremode = "2000RPM",
        EquipFunc = function(wpn)
            wpn.ShootingDelay = 60 / 2000
        end
    },
    {
        Automatic = true,
        CustomFiremode = "1500RPM",
        EquipFunc = function(wpn)
            wpn.ShootingDelay = 60 / 1500
        end
    },
    {
        Automatic = true,
        CustomFiremode = "1000RPM",
        EquipFunc = function(wpn)
            wpn.ShootingDelay = 60 / 1000
        end
    },
    {
        Automatic = true,
        CustomFiremode = "500RPM",
        EquipFunc = function(wpn)
            wpn.ShootingDelay = 60 / 500
        end
    },
    {
        Automatic = false,
        Safe = true
    }
}
SWEP.CustomFiremode = "2000RPM"
SWEP.BurstLength = 0
SWEP.Automatic = true -- use this instead of changing SWEP.Primary.Automatic
SWEP.ManualAction = false

SWEP.ManualActionPos = Vector(0, 0, 0)
SWEP.ManualActionAng = Vector(0, 0, 0)

SWEP.AimTime = 0.25