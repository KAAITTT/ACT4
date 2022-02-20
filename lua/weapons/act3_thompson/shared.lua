SWEP.Base = "act3_base"

SWEP.Spawnable = true
SWEP.AdminSpawnable = false
SWEP.PrintName = "M1 Thompson"
SWEP.Category = "ACT3 - Firearms"

SWEP.Desc_Country = "USA"
SWEP.Desc_Manufacturer = "Auto-Ordnance"
SWEP.Desc_Mechanism = "Blowback"
SWEP.Desc_Year = 1938
SWEP.Desc_Weight = 4.5 -- kg
SWEP.ACT3Cat = ACT3_CAT_SMG
SWEP.Sidearm = false

SWEP.GiveToCombine = false

SWEP.Slot = 3

SWEP.WorldModel = "models/weapons/act3/smg_thompson.mdl"
SWEP.WorldModelBase = "models/weapons/act3/smg_thompson.mdl" -- Worldmodel base of the weapon world model.
SWEP.WorldModelPos = Vector(0.423, -0.21, 1.587)
SWEP.WorldModelAng = Angle(-10.702, 0, 180)
SWEP.WorldModelBodygroups = "00000"

SWEP.DefaultAttachments = {
    ["stock"] = "thompson_stock",
}

SWEP.AttachmentBodygroups = {
    ["thompson_stock"] = {ind = 1, bg = 1},
    ["thompson_fg"] = {ind = 2, bg = 1},
}

SWEP.Attachments = {
    ["stock"] = {
        Type = "thompson_stock",
        PrintName = "Stock",
        Installed = nil,
        Required = false,
        Scale = 1,
    },
    ["foregrip"] = {
        Type = "thompson_fg",
        PrintName = "Foregrip",
        Installed = nil,
        Required = false,
        Scale = 1
    }
}

SWEP.MuzzleOffset = Vector(19.729, 0.87, -6.895)
SWEP.MuzzleAngle = Angle(0, 0, 0)
SWEP.EjectPos = Vector(7.495, -0.963, 4.982)
SWEP.EjectAng = Angle(0, 0, 0)
SWEP.MagazineOffsetPos = Vector(7.502, -1.022, 4.4)
SWEP.MagazineOffsetAng = Angle(0, 0, 0)

SWEP.ReloadSoundsTable = {
    {
        time = 0.1,
        path = "weapons/mac10/mac10_clipout.wav",
        comp = ACT3_STPART_MAGEJECT
    },
    {
        time = 1.0,
        path = "weapons/tmp/tmp_clipin.wav",
        comp = ACT3_STPART_MAGLOAD
    },
    {
        time = 1.45,
        path = "weapons/mac10/mac10_boltpull.wav",
        comp = ACT3_STPART_EMPTYRACK
    },
}

SWEP.TrueIronsPos = Vector(1.039, 7.497, -5.956)
SWEP.TrueIronsAng = Vector(0.275, 0, 0)

SWEP.LowPos = Vector(4.623, 18.693, -13.266)
SWEP.LowAng = Vector(-25.327, -11.256, 14.069)

SWEP.Magnification = 1.5



SWEP.DamageMult = 1 -- the weapon's main stats are just taken from the bullet
SWEP.ShootingDelay = 60 / 700
SWEP.TriggerDelay = 0

SWEP.Recoil = 3
SWEP.RecoilAngles = 10

SWEP.BlowbackAmount = 0.4
SWEP.BlowbackRecovery = 3
SWEP.BlowbackMax = 2
SWEP.RollBlowbackAmount = 2
SWEP.RollBlowbackRecovery = 10
SWEP.RollBlowbackMax = 45

SWEP.HeatAccumulation = 5 -- Out of 100, the amount of heat each shot adds to the weapon
SWEP.HeatDissipation = 125 -- Amount of heat dissipated per second

SWEP.Precision = 1 / 175
SWEP.MaxHeatPrecision = 1 / 50
SWEP.HipfirePenalty = 0 -- Deviation applied on hip fire
SWEP.MaxHeatHipfirePenalty = 0.075
SWEP.MaxMovePenalty = 0.025
SWEP.DispersionInSights = false

SWEP.Sway = 2



SWEP.SpeedMult = 1
SWEP.SightedSpeedMult = 0.9



SWEP.OpenBolt = true -- this weapon will not chamber a round to fire. Instead, it will take rounds directly from the magazine. Examples of such weapons include revolvers and open bolt guns.
SWEP.InternalMag = false -- whether this weapon uses detachable magazines or loads rounds directly into the weapon

SWEP.DefaultLoad = "45acp_fmj" -- the round that this gun will be loaded with by default
SWEP.DefaultMagazine = { -- this is the weapon's default magazine, this will be automatically given if the setting act3_instantaction is enabled
    Type = "thompson_30",
    Rounds = {}
}

SWEP.MagazineType = "thompson"

SWEP.Calibre = "45acp"
SWEP.PrintCalibre = ".45 ACP"
SWEP.PostReloadDelay = 0.25
SWEP.ReloadTimeOverride = -1 -- override reload time. usually no reason to do this unless using custom anims not in anim table.

SWEP.CustomBullet = nil -- the custom bullet. Shoot this instead of the magazine round.

SWEP.MuzzleVelocity = 20000

SWEP.Shield = false



SWEP.DisableCrosshair = false
SWEP.CrosshairOverride = false
SWEP.CrosshairSizeMult = 1


-- tracking module

SWEP.TrackingModule = false
SWEP.TrackingLockon = false -- whether or not the weapon is able to "lock on" to a target instead of needing to keep laser paint
SWEP.TrackingRange = 15000
SWEP.TrackingType = "SACLOS"


-- Shell effect is unnecessary since they are taken from "bullets"
SWEP.ShellDelay = 0
SWEP.RevolverEject = false -- whether this weapon ejects shells when reloading instead of after each shot

SWEP.MuzzleEffect = "act3_muzzleeffect"
SWEP.Suppressed = false

SWEP.SoundShoot = "weapons/mac10/mac10-1.wav"
SWEP.SoundShootSuppressed = "weapons/m4a1/m4a1-1.wav"
SWEP.SoundShootVol = 105
SWEP.SoundShootPitch = 90

SWEP.SoundCycle = "weapons/mp5navy/mp5_slideback.wav"
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
        BurstLength = 0,
        CustomFiremode = nil,
        CustomBars = nil,
        Safe = false
    },
    {
        Automatic = false,
        BurstLength = 0,
        CustomFiremode = nil,
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

SWEP.AimTime = 0.25