SWEP.Base = "act3_base"

SWEP.Spawnable = true
SWEP.AdminSpawnable = false
SWEP.PrintName = "AUG"
SWEP.Category = "ACT3 - Firearms"

SWEP.Desc_Country = "Austria"
SWEP.Desc_Manufacturer = "Steyr"
SWEP.Desc_Mechanism = "Gas-Operated Rotating Bolt"
SWEP.Desc_Year = 1978
SWEP.Desc_Weight = 3.6 -- kg
SWEP.ACT3Cat = ACT3_CAT_ASSAULT
SWEP.Sidearm = false

SWEP.Desc_Extra = {
    "",
    "Austrian bullpup assault rifle.",
    "",
    "Takes STANAG compatible mags."
}

SWEP.Slot = 3

SWEP.WorldModel = "models/weapons/act3/rifle_aug.mdl"
SWEP.WorldModelBase = "models/weapons/act3/rifle_aug.mdl" -- Worldmodel base of the weapon world model.
SWEP.WorldModelPos = Vector(14.043, 0.512, 2.022)
SWEP.WorldModelAng = Angle(-10.617, 0, 180)

SWEP.DefaultAttachments = {
    ["barrel"] = "aug_barrel_long",
    ["mount"] = "aug_mount_scope",
    ["foregrip"] = "aug_grip_folded",
    ["fcg"] = "aug_fcg_auto"
}

SWEP.AttachmentBodygroups = {
    ["aug_grip_extended"] = {ind = 1, bg = 0},
    ["aug_grip_folded"] = {ind = 1, bg = 1},
    ["aug_barrel_long"] = {ind = 2, bg = 0},
    ["aug_barrel_short"] = {ind = 2, bg = 1},
    ["aug_barrel_med"] = {ind = 2, bg = 2},
    ["aug_mount_scope"] = {ind = 3, bg = 0},
    ["aug_mount_rail"] = {ind = 3, bg = 1},
    ["aug_mount_rail_lp"] = {ind = 3, bg = 2}
}


SWEP.Attachment_Flags = {
}

SWEP.Attachments = {
    ["mount"] = {
        Type = "aug_mount",
        PrintName = "Mount",
        Installed = nil,
        Required = true,
        Scale = 1,
    },
    ["fcg"] = {
        Type = "aug_fcg",
        PrintName = "Fire Group",
        Installed = nil,
        Required = true,
    },
    ["barrel"] = {
        Type = "aug_barrel", -- type of attachments this slot can take
        PrintName = "Barrel", -- name this slot shows
        Installed = nil, -- which attachment is actually installed in this slot
        Required = true,
        Scale = 1, -- scale applied to attachments in this slot
    },
    ["foregrip"] = {
        Type = "aug_grip",
        PrintName = "Foregrip",
        Installed = nil,
        Required = true,
        Pos = Vector(1.661, 0, 6.973),
        Ang = Angle(0, 0, 0),
        Randomize = true,
        RandomizeChance = 50,
    },
    ["accessory_right"] = {
        Type = "accessory",
        PrintName = "Accessory",
        Installed = nil,
        Required = false,
        Scale = 1,
        Pos = Vector(-4.59, 1.095, 7.282),
        Ang = Angle(0, 0, 0),
        Randomize = true,
        RandomizeChance = 10,
    },
    ["bolt"] = {
        Type = "bolt",
        ExtraTypes = {"bolt_heavy", "bolt_light"},
        PrintName = "Bolt",
        Installed = nil,
        Required = false,
    },
}

SWEP.MuzzleOffset = Vector(26.93, 0.855, -8.15)
SWEP.MuzzleAngle = Angle(0, 0, 0)
SWEP.EjectPos = Vector(-14.881, 0, 7.684)
SWEP.EjectAng = Angle(0, 0, 0)
SWEP.MagazineOffsetPos = Vector(-14.912, -0.257, 6.691)
SWEP.MagazineOffsetAng = Angle(0, 0, 0)

SWEP.SightAboveBore = 6

SWEP.ReloadSoundsTable = {
    {
        time = 0.1,
        path = "weapons/aug/aug_clipout.wav",
        comp = ACT3_STPART_MAGEJECT
    },
    {
        time = 1.0,
        path = "weapons/aug/aug_clipin.wav",
        comp = ACT3_STPART_MAGLOAD
    },
    {
        time = 1.45,
        path = "weapons/aug/aug_boltpull.wav",
        comp = ACT3_STPART_EMPTYRACK
    },
}

SWEP.TrueIronsPos = Vector(0.3, 17.785, -10.608)
SWEP.TrueIronsAng = Vector(0, 0, 0)

SWEP.SightedAimPos = Vector(0.3, -5, -10.608)
SWEP.SightedAimAng =  Vector(0, 0, 0)


SWEP.LowPos = Vector(4.623, 18.693, -13.266)
SWEP.LowAng = Vector(-25.327, -11.256, 14.069)



SWEP.DamageMult = 1 -- the weapon's main stats are just taken from the bullet
SWEP.ShootingDelay = 60 / 680
SWEP.TriggerDelay = 0

SWEP.Recoil = 3.5
SWEP.RecoilAngles = 35

SWEP.BlowbackAmount = 1
SWEP.BlowbackRecovery = 5
SWEP.BlowbackMax = 2.5
SWEP.RollBlowbackAmount = 3
SWEP.RollBlowbackRecovery = 10
SWEP.RollBlowbackMax = 45

SWEP.HeatAccumulation = 30 -- Out of 100, the amount of heat each shot adds to the weapon
SWEP.HeatDissipation = 200 -- Amount of heat dissipated per second

SWEP.Precision = 1 / 350
SWEP.MaxHeatPrecision = 1 / 50
SWEP.HipfirePenalty = 0 -- Deviation applied on hip fire
SWEP.MaxHeatHipfirePenalty = 0.075
SWEP.MaxMovePenalty = 0.05
SWEP.DispersionInSights = false

SWEP.Sway = 2



SWEP.SpeedMult = 1
SWEP.SightedSpeedMult = 0.9



SWEP.OpenBolt = false -- this weapon will not chamber a round to fire. Instead, it will take rounds directly from the magazine. Examples of such weapons include revolvers and open bolt guns.
SWEP.InternalMag = false -- whether this weapon uses detachable magazines or loads rounds directly into the weapon

SWEP.DefaultLoad = "556x45_fmj" -- the round that this gun will be loaded with by default
SWEP.DefaultMagazine = { -- this is the weapon's default magazine, this will be automatically given if the setting act3_instantaction is enabled
    Type = "aug_36",
    Rounds = {}
}

SWEP.MagazineType = "stanag"

SWEP.Calibre = "556x45"
SWEP.PrintCalibre = "5.56x45mm"

SWEP.MuzzleVelocity = 25000

SWEP.MuzzleEffect = "act3_muzzleeffect"
SWEP.Suppressed = false

SWEP.SoundShoot = "weapons/aug/aug-1.wav"
SWEP.SoundShootSuppressed = "weapons/m4a1/m4a1-1.wav"
SWEP.SoundShootVol = 110
SWEP.SoundShootPitch = 100

SWEP.SoundCycle = "weapons/m4a1/m4a1_boltpull.wav"
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
        Automatic = true
    },
    {
        Automatic = false
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