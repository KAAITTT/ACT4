SWEP.Base = "act3_base"

SWEP.Spawnable = true
SWEP.AdminSpawnable = false
SWEP.PrintName = "SIG SG550"
SWEP.Category = "ACT3 - Firearms"

SWEP.Desc_Country = "Switzerland"
SWEP.Desc_Manufacturer = "SIG Sauer"
SWEP.Desc_Mechanism = "Gas Operated Rotating Bolt"
SWEP.Desc_Year = 1990
SWEP.Desc_Weight = 4.1 -- kg
SWEP.ACT3Cat = ACT3_CAT_ASSAULT
SWEP.Sidearm = false

--SWEP.Purpose = "America's favorite. The AR platform is loved by as many as it is hated. Poor logistics choices in the Vietnam War resulted in it gaining a reputation for being unreliable, though it is an undeserved reputation. As the most popular gun in the USA, owing in part to the federal Assault Weapons Ban, this rifle has more aftermarket support than you can shake a suppressor at. Its action is the basis for many modern assault rifles."

SWEP.Slot = 3

SWEP.WorldModel = "models/weapons/act3/rifle_sg552.mdl"
SWEP.WorldModelBase = "models/weapons/act3/rifle_sg552.mdl" -- Worldmodel base of the weapon world model.
SWEP.WorldModelPos = Vector(-0.473, 0.593, 1.093)
SWEP.WorldModelAng = Angle(-10.917, 0, 180)

SWEP.DefaultAttachments = {
    ["barrel"] = "sg552_barrel_long",
    ["fcg"] = "sg552_fcg"
}

SWEP.AttachmentBodygroups = {
    ["sg552_barrel_short"] = {ind = 1, bg = 0},
    ["sg552_barrel_long"] = {ind = 1, bg = 1},
}

SWEP.Attachment_Flags = {
}



-- SWEP.WElements = {
-- 	["scope"] = { type = "Model", model = "models/weapons/act3/atts/att_farviewscope.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(8.654, 0.209, 5.748), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
-- 	["mag"] = { type = "Model", model = "models/weapons/act3/mag_sg552_25.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(9.826, 0, 3.22), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
-- 	["base"] = { type = "Model", model = "models/weapons/act3/rifle_sg552.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-0.473, 0.593, 1.093), angle = Angle(-10.917, 0, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
-- 	["muzzle"] = { type = "Model", model = "models/editor/axis_helper.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(23.142, -0.146, 3.569), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
-- 	["supp"] = { type = "Model", model = "models/weapons/act3/atts/att_suppressor.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(25.833, -0.098, 3.558), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
-- 	["eject"] = { type = "Model", model = "models/editor/axis_helper.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(9.392, 0, 4.245), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
-- }


SWEP.Attachments = {
    ["barrel"] = {
        Type = "sg552_barrel", -- type of attachments this slot can take
        PrintName = "Barrel", -- name this slot shows
        Installed = nil, -- which attachment is actually installed in this slot
        Required = true,
        Scale = 1, -- scale applied to attachments in this slot
    },
    ["sight"] = {
        Type = "sight",
        PrintName = "Sight",
        Installed = nil,
        Required = false,
        Scale = 1,
        Pos = Vector(8.654, 0.209, 5.748),
        Ang = Angle(0, 0, 0),
        Randomize = true,
        RandomizeChance = 40,
    },
    ["fcg"] = {
        Type = "sg552_fcg",
        PrintName = "Fire Group",
        Installed = nil,
        Required = true,
        Scale = 1,
    },
    ["foregrip"] = {
        Type = "foregrip",
        PrintName = "Foregrip",
        Installed = nil,
        Required = false,
        Pos = Vector(16.097, 0, 2.808),
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
        Pos = Vector(16.097, 1.382, 4),
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
        Pos = Vector(16.097, -1.493, 4),
        Ang =  Angle(0, 0, 180),
        Randomize = true,
        RandomizeChance = 10,
    },
}

SWEP.MuzzleOffset = Vector(0, 0, 0)
SWEP.NewMuzzleOffset = Vector(23.142, 0.75, 8.869)
SWEP.MuzzleAngle = Angle(0, 0, 0)
SWEP.EjectPos = Vector(9.392, 0, 3.245)
SWEP.EjectAng = Angle(0, 0, 0)
SWEP.MagazineOffsetPos = Vector(9.826, 0, 3.22)
SWEP.MagazineOffsetAng = Angle(0, 0, 0)

SWEP.ReloadSoundsTable = {
    {
        time = 0.1,
        path = "weapons/sg550/sg550_clipout.wav",
        comp = ACT3_STPART_MAGEJECT
    },
    {
        time = 1.0,
        path = "weapons/sg552/sg552_clipin.wav",
        comp = ACT3_STPART_MAGLOAD
    },
    {
        time = 1.45,
        path = "weapons/sg550/sg550_boltpull.wav",
        comp = ACT3_STPART_EMPTYRACK
    },
}

SWEP.TrueIronsPos = Vector(0.12, 2.796, -6.242)
SWEP.TrueIronsAng = Vector(0.273, 0, 0)

SWEP.SightedAimPos = Vector(-0.051, -7.658, -11.5)
SWEP.SightedAimAng = Vector(2.371, -0.191, 0)


SWEP.LowPos = Vector(4.623, 18.693, -13.266)
SWEP.LowAng = Vector(-25.327, -11.256, 14.069)



SWEP.DamageMult = 1 -- the weapon's main stats are just taken from the bullet
SWEP.ShootingDelay = 60 / 700
SWEP.TriggerDelay = 0

SWEP.Recoil = 3
SWEP.RecoilAngles = 25

SWEP.BlowbackAmount = 1
SWEP.BlowbackRecovery = 5
SWEP.BlowbackMax = 2.5
SWEP.RollBlowbackAmount = 3
SWEP.RollBlowbackRecovery = 10
SWEP.RollBlowbackMax = 45

SWEP.HeatAccumulation = 15 -- Out of 100, the amount of heat each shot adds to the weapon
SWEP.HeatDissipation = 200 -- Amount of heat dissipated per second

SWEP.Precision = 1 / 750
SWEP.MaxHeatPrecision = 1 / 50
SWEP.HipfirePenalty = 0 -- Deviation applied on hip fire
SWEP.MaxHeatHipfirePenalty = 0.075
SWEP.MaxMovePenalty = 0.05
SWEP.DispersionInSights = false

SWEP.Sway = 2.25



SWEP.SpeedMult = 1
SWEP.SightedSpeedMult = 0.9



SWEP.OpenBolt = false -- this weapon will not chamber a round to fire. Instead, it will take rounds directly from the magazine. Examples of such weapons include revolvers and open bolt guns.
SWEP.InternalMag = false -- whether this weapon uses detachable magazines or loads rounds directly into the weapon

SWEP.DefaultLoad = "556x45_fmj" -- the round that this gun will be loaded with by default
SWEP.DefaultMagazine = { -- this is the weapon's default magazine, this will be automatically given if the setting act3_instantaction is enabled
    Type = "sig_25",
    Rounds = {}
}

SWEP.MagazineType = "sig"

SWEP.Calibre = "556x45"
SWEP.PrintCalibre = "5.56x45mm"

SWEP.MuzzleVelocity = 25000

SWEP.MuzzleEffect = "act3_muzzleeffect"
SWEP.Suppressed = false

SWEP.SoundShoot = "weapons/sg550/sg550-1.wav"
SWEP.SoundShootSuppressed = "weapons/m4a1/m4a1-1.wav"
SWEP.SoundShootVol = 110
SWEP.SoundShootPitch = 100

SWEP.SoundCycle = "weapons/m4a1/m4a1_boltpull.wav"
SWEP.SoundDryfire = "weapons/ar2/ar2_empty.wav"



SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2
SWEP.AnimReload = ACT_HL2MP_GESTURE_RELOAD_AR2
SWEP.AnimMeleeAttack = ACT_GMOD_GESTURE_MELEE_SHOVE_2HAND

SWEP.HoldtypePassive = "passive"
SWEP.HoldtypeHip = "shotgun"
SWEP.HoldtypeSights = "ar2"
SWEP.HoldtypeBipod = "rpg"


SWEP.Firemodes = {
    {
        Automatic = false,
        BurstLength = 0,
        CustomFiremode = "NONE",
        CustomBars = nil,
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