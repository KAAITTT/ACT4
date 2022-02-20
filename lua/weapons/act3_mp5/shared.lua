SWEP.Base = "act3_base"

SWEP.Spawnable = true
SWEP.AdminSpawnable = false
SWEP.PrintName = "MP5"
SWEP.Category = "ACT3 - Firearms"

SWEP.Desc_Country = "Germany"
SWEP.Desc_Manufacturer = "Heckler And Koch"
SWEP.Desc_Mechanism = "Roller-Delayed Blowback"
SWEP.Desc_Year = 1966
SWEP.Desc_Weight = 2.5 -- kg
SWEP.ACT3Cat = ACT3_CAT_SMG
SWEP.Sidearm = false

SWEP.Slot = 3

SWEP.WorldModel = "models/weapons/act3/smg_mp5.mdl"
SWEP.WorldModelBase = "models/weapons/act3/smg_mp5.mdl" -- Worldmodel base of the weapon world model.
SWEP.WorldModelPos = Vector(7.006, 0.996, 4.102)
SWEP.WorldModelAng = Angle(-6.441, 0, 180)
SWEP.WorldModelBodygroups = "00000"

SWEP.DefaultAttachments = {
    ["stock"] = "mp5_stock_solid",
    ["foreend"] = "mp5_fore_a2",
    ["top"] = "mp5_top_rearsight",
    ["fcg"] = "mp5_fcg_auto"
}

SWEP.AttachmentBodygroups = {
    ["mp5_handguard_k"] = {ind = 1, bg = 1},
    ["mp5_handguard_sd"] = {ind = 1, bg = 2},
    ["mp5_handguard_wood"] = {ind = 1, bg = 3},
    ["mp5_handguard_flash"] = {ind = 1, bg = 4},
    ["mp5_barrel_k"] = {ind = 2, bg = 1},
    ["mp5_barrel_sd"] = {ind = 2, bg = 2},
    ["mp5_barrel_carbine"] = {ind = 2, bg = 3},
    ["mp5_top_rail"] = {ind = 3, bg = 1},
    ["mp5_stock_folded"] = {ind = 4, bg = 1},
    ["mp5_stock_extended"] = {ind = 4, bg = 2},
    ["mp5_stock_solid"] = {ind = 4, bg = 3},
    ["mp5_stock_wood"] = {ind = 4, bg = 4},
}

SWEP.WElements = {
	["mag"] = { type = "Model", model = "models/weapons/act3/mag_mp5_30.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(10.17, 0.263, 8.22), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["sight"] = { type = "Model", model = "models/weapons/act3/atts/att_farviewscope.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(-0.362, 0.626, 11.366), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["base"] = { type = "Model", model = "models/weapons/act3/smg_mp5.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(7.006, 0.996, 4.102), angle = Angle(-6.441, 0, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {[3] = 1, [4] = 3} },
	["suppr"] = { type = "Model", model = "models/weapons/act3/atts/att_suppressor.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(17.627, 0.145, 9.409), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["fg"] = { type = "Model", model = "models/weapons/act3/atts/att_foregrip.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(8.494, 0.19, 8.288), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}


SWEP.Attachments = {
    ["stock"] = {
        Type = "mp5_stock",
        PrintName = "Stock",
        Installed = nil,
        Required = false,
        Scale = 1,
    },
    ["foreend"] = {
        Type = "mp5_fore", -- type of attachments this slot can take
        PrintName = "Foreend", -- name this slot shows
        Installed = nil, -- which attachment is actually installed in this slot
        Required = true,
        Scale = 1, -- scale applied to attachments in this slot
    },
    ["fcg"] = {
        Type = "mp5_fcg",
        PrintName = "Fire Group",
        Installed = nil,
        Required = true,
        Scale = 1,
    },
    ["top"] = {
        Type = "mp5_top",
        PrintName = "Top",
        Installed = nil,
        Required = true,
        Scale = 1,
    },
    ["foregrip"] = {
        Type = "foregrip",
        PrintName = "Foregrip",
        Installed = nil,
        Required = false,
        Pos = Vector(8.494, 0.19, 8.288),
        Ang = Angle(0, 0, 0),
        Randomize = true,
        RandomizeChance = 30,
    },
    ["accessory_right"] = {
        Type = "accessory",
        PrintName = "Accessory",
        Installed = nil,
        Required = false,
        Scale = 1,
        Pos = Vector(6.672, 0.828, 9.586),
        Ang = Angle(0, 0, 0),
        Randomize = true,
        RandomizeChance = 10,
    },
    ["accessory_left"] = {
        Type = "accessory",
        PrintName = "Accessory",
        Installed = nil,
        Required = false,
        Scale = 1,
        Pos = Vector(6.672, -1.407, 9.586),
        Ang =  Angle(0, 0, 180),
        Randomize = true,
        RandomizeChance = 10,
    }
}

SWEP.AttachmentFlags = {
    "noubgl"
}

SWEP.MuzzleOffset = Vector(20.673, 1.437, -6.666)
SWEP.MuzzleAngle = Angle(-3.735, 0, 0)
SWEP.EjectPos = Vector(1.779, 0, 6.142)
SWEP.EjectAng = Angle(0, 0, 0)
SWEP.MagazineOffsetPos = Vector(10.17, 0.263, 8.22)
SWEP.MagazineOffsetAng = Angle(0, 0, 0)

SWEP.ReloadSoundsTable = {
    {
        time = 0.1,
        path = "weapons/mp5navy/mp5_clipout.wav",
        comp = ACT3_STPART_MAGEJECT
    },
    {
        time = 1.0,
        path = "weapons/tmp/tmp_clipin.wav",
        comp = ACT3_STPART_MAGLOAD
    },
    {
        time = 1.45,
        path = "weapons/mp5navy/mp5_slideback.wav",
        comp = ACT3_STPART_EMPTYRACK
    },
}

SWEP.TrueIronsPos = Vector(-0.238, 7.244, -12.511)
SWEP.TrueIronsAng = Vector(3.263, -0.218, 0)


SWEP.SightedAimPos = Vector(0.14, -3, -12.69)
SWEP.SightedAimAng = Vector(4.271, -2.238, -0.844)

SWEP.LowPos = Vector(4.623, 18.693, -13.266)
SWEP.LowAng = Vector(-25.327, -11.256, 14.069)



SWEP.DamageMult = 1 -- the weapon's main stats are just taken from the bullet
SWEP.ShootingDelay = 60 / 850
SWEP.TriggerDelay = 0

SWEP.Recoil = 2
SWEP.RecoilAngles = 25

SWEP.BlowbackAmount = 0.75
SWEP.BlowbackRecovery = 6
SWEP.BlowbackMax = 3
SWEP.RollBlowbackAmount = 3
SWEP.RollBlowbackRecovery = 10
SWEP.RollBlowbackMax = 45

SWEP.HeatAccumulation = 5 -- Out of 100, the amount of heat each shot adds to the weapon
SWEP.HeatDissipation = 125 -- Amount of heat dissipated per second

SWEP.Precision = 1 / 150
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
    Type = "mp5_30",
    Rounds = {}
}

SWEP.MagazineType = "mp5"

SWEP.Calibre = "9x19"
SWEP.PrintCalibre = "9x19mm"
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

SWEP.SoundShoot = "weapons/mp5navy/mp5-1.wav"
SWEP.SoundShootSuppressed = "weapons/m4a1/m4a1-1.wav"
SWEP.SoundShootVol = 105
SWEP.SoundShootPitch = 100

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
        Automatic = true,
        BurstLength = 3,
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