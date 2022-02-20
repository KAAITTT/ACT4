SWEP.Base = "act3_base"

SWEP.Spawnable = true
SWEP.AdminSpawnable = false
SWEP.PrintName = "RPG-7"
SWEP.Category = "ACT3 - Firearms"

SWEP.Desc_Country = "Russia"
SWEP.Desc_Manufacturer = "Bazalt"
SWEP.Desc_Mechanism = "Rocket-Propelled HEAT Grenade"
SWEP.Desc_Year = 1958

--SWEP.Purpose = "One of the most ubiquitous assault rifles ever invented. The right arm of the oppressed world; so great Mozambique put it on its flag. Rugged as a rock, and crude as one too."

SWEP.Desc_Weight = 6.3 -- kg
SWEP.ACT3Cat = ACT3_CAT_EXPLOSIVE
SWEP.Sidearm = false

SWEP.Slot = 3

-- SWEP.TrueIronsPos = Vector(0.426, 13.383, -8.061)
-- SWEP.TrueIronsAng = Vector(1.723, -0.026, 0)
-- *********************************************
-- Code printed to console!
-- *********************************************
-- SWEP.WElements = {
-- 	["base"] = { type = "Model", model = "models/weapons/act3hd/launcher_rpg7.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(10.251, 0.358, -1.81), angle = Angle(-16.316, 0, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
-- 	["muzz"] = { type = "Model", model = "models/editor/axis_helper.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(8.375, 0, 4.046), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
-- }

SWEP.WorldModel = "models/weapons/act3hd/launcher_rpg7.mdl"
SWEP.WorldModelBase = "models/weapons/act3hd/launcher_rpg7.mdl" -- Worldmodel base of the weapon world model.
SWEP.WorldModelPos = Vector(10.083, 0.833, -1.499)
SWEP.WorldModelAng = Angle(-6.809, -3.902, 180)
SWEP.WorldModelBodygroups = "0000111111111"

SWEP.AttachmentBodygroups = {
    ["rpg7_sights_up"] = {ind = 1, bg = 0},
    ["rpg7_sights_down"] = {ind = 1, bg = 1},
    ["rpg7_rocket"] = {ind = 2, bg = 1},
    ["rpg7_rocket_he"] = {ind = 2, bg = 2},
}

SWEP.BulletAffectsBodygroups = {
    [1] = {
        ["rpg7_heat"] = {"rpg7_rocket"},
        ["rpg7_he"] = {"rpg7_rocket_he"}
    },
}

SWEP.DefaultAttachments = nil
SWEP.Attachments = nil

SWEP.MuzzleOffset = Vector(0, 0, 0)
SWEP.NewMuzzleOffset = Vector(28.649, -0.234, 9.6)

SWEP.ReloadSoundsTable = {
    {
        time = 1.0,
        path = "act3/rocket_clipin.wav",
    },
}

SWEP.TrueIronsPos = Vector(0.426, 10.72, -8.072)
SWEP.TrueIronsAng = Vector(2.088, 0, 0)

SWEP.LowPos = Vector(4.623, 18.693, -13.266)
SWEP.LowAng = Vector(-25.327, -11.256, 14.069)



SWEP.DamageMult = 1.0 -- the weapon's main stats are just taken from the bullet
SWEP.ShootingDelay = 60 / 600
SWEP.TriggerDelay = 0

SWEP.Recoil = 3.5
SWEP.RecoilAngles = 20

SWEP.BlowbackAmount = 3
SWEP.BlowbackRecovery = 3
SWEP.BlowbackMax = 3
SWEP.RollBlowbackAmount = 3
SWEP.RollBlowbackRecovery = 10
SWEP.RollBlowbackMax = 45

SWEP.HeatAccumulation = 35 -- Out of 100, the amount of heat each shot adds to the weapon
SWEP.HeatDissipation = 200 -- Amount of heat dissipated per second

SWEP.Precision = 1 / 500
SWEP.MaxHeatPrecision = 1 / 100
SWEP.HipfirePenalty = 0 -- Deviation applied on hip fire
SWEP.MaxHeatHipfirePenalty = 0.075
SWEP.MaxMovePenalty = 0.05
SWEP.DispersionInSights = true

SWEP.Sway = 4



SWEP.SpeedMult = 1
SWEP.SightedSpeedMult = 0.8



SWEP.OpenBolt = true -- this weapon will not chamber a round to fire. Instead, it will take rounds directly from the magazine. Examples of such weapons include revolvers and open bolt guns.
SWEP.InternalMag = true -- whether this weapon uses detachable magazines or loads rounds directly into the weapon

SWEP.DefaultLoad = "rpg7_heat" -- the round that this gun will be loaded with by default
SWEP.Magazine = {
    Type = "rpg7_chamber",
    Rounds = {}
}

SWEP.MagazineType = "int"

SWEP.Calibre = "rpg7"
SWEP.PrintCalibre = "RPG-7 Rockets"

SWEP.MuzzleEffect = "act3_muzzleeffect"
SWEP.Suppressed = false

SWEP.SoundShoot = "weapons/rpg/rocketfire1.wav"
SWEP.SoundShootVol = 140
SWEP.SoundShootPitch = 110

SWEP.CannotCycle = true

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_RPG
SWEP.AnimReload = ACT_HL2MP_GESTURE_RELOAD_AR2
SWEP.AnimMeleeAttack = ACT_GMOD_GESTURE_MELEE_SHOVE_2HAND

SWEP.HoldtypePassive = "passive"
SWEP.HoldtypeHip = "crossbow"
SWEP.HoldtypeSights = "rpg"
SWEP.HoldtypeBipod = "rpg"

SWEP.Firemodes = {
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
SWEP.CustomFiremode = false
SWEP.BurstLength = 0
SWEP.Automatic = false -- use this instead of changing SWEP.Primary.Automatic
SWEP.ManualAction = false

SWEP.ManualActionDelay = 0

SWEP.AimTime = 0.25