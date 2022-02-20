SWEP.Base = "act3_base"

SWEP.Spawnable = true
SWEP.AdminSpawnable = false
SWEP.PrintName = "Over/Under"
SWEP.Category = "ACT3 - Firearms"

SWEP.Desc_Country = "USA"
SWEP.Desc_Manufacturer = "Mossberg"
SWEP.Desc_Mechanism = "Break-Action"
SWEP.Desc_Year = 2012
SWEP.Desc_Weight = 3.5 -- kg
SWEP.ACT3Cat = ACT3_CAT_SHOTGUN
SWEP.Sidearm = false

SWEP.GiveToCombine = false

SWEP.Slot = 3

SWEP.WorldModel = "models/weapons/act3/shot_dbou.mdl" -- Weapon's traditional world model, where applicable.
SWEP.WorldModelBase = "models/weapons/act3/shot_dbou.mdl" -- Worldmodel base of the weapon world model.
SWEP.WorldModelPos = Vector(9.788, 0.88, 3.388)
SWEP.WorldModelAng = Angle(-14.205, 0, 180)

SWEP.WorldModelBodygroups = "" -- Sets the bodygroups of the world model.
SWEP.WorldModelSkin = 0 -- Set the skin of the world model.

SWEP.Attachments = {
    ["mount"] = {
        Type = "am_rail",
        PrintName = "Mount",
        Installed = nil,
        Required = false,
        Pos = Vector(2.611, -0.009, 8.017)
    },
} -- {{id=""}}

SWEP.DefaultAttachments = nil -- {{id=""}} the gun will spawn with these attachments attached.



SWEP.MuzzleOffset = Vector(33.463, 0.91, -10.447)
SWEP.MuzzleAngle = Angle(-7, 0, 0)
SWEP.EjectPos = Vector(0, 0, 7.084)
SWEP.EjectAng = Angle(0, 0, 90)

SWEP.TrueIronsPos = Vector(0.002, 7.53, -8.261)
SWEP.TrueIronsAng = Vector(0, 0, 0)


SWEP.UseTrueIrons = true


SWEP.DamageMult = 1 -- the weapon's main stats are just taken from the bullet
SWEP.ShootingDelay = 60 / 1200
SWEP.TriggerDelay = 0

SWEP.Recoil = 10
SWEP.RecoilAngles = 5

SWEP.BlowbackAmount = 2
SWEP.BlowbackRecovery = 2
SWEP.BlowbackMax = 2.5

SWEP.HeatAccumulation = 50 -- Out of 100, the amount of heat each shot adds to the weapon
SWEP.HeatDissipation = 100 -- Amount of heat dissipated per second

SWEP.Precision = 1 / 65
SWEP.MaxHeatPrecision = 1 / 65

SWEP.Sway = 0.5



SWEP.SpeedMult = 1
SWEP.SightedSpeedMult = 0.9


SWEP.OpenBolt = true -- this weapon will not chamber a round to fire. Instead, it will take rounds directly from the magazine. Examples of such weapons include revolvers and open bolt guns.
SWEP.InternalMag = true -- whether this weapon uses detachable magazines or loads rounds directly into the weapon


SWEP.DefaultLoad = "12g_buck"
SWEP.DefaultMagazine = {}

SWEP.Magazine = { -- this is the weapon's default magazine, this will be automatically given if the setting act3_instantaction is enabled
    Type = "db_chamber",
    Rounds = {}
}
SWEP.MagazineVisible = false

SWEP.MagazineType = "int"

SWEP.Calibre = "12g"
SWEP.PrintCalibre = "12 Gauge"

SWEP.RevolverEject = true -- whether this weapon ejects shells when reloading instead of after each shot

SWEP.MuzzleEffect = "act3_muzzleeffect"
SWEP.Suppressed = false

SWEP.SoundShoot = "weapons/shotgun/shotgun_fire6.wav"
SWEP.SoundShootVol = 115
SWEP.SoundShootPitch = 100

SWEP.SoundDryfire = "weapons/shotgun/shotgun_empty.wav"



SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_RPG
SWEP.AnimReload = ACT_HL2MP_GESTURE_RELOAD_SHOTGUN
SWEP.AnimMeleeAttack = ACT_GMOD_GESTURE_MELEE_SHOVE_2HAND

SWEP.HoldtypePassive = "passive"
SWEP.HoldtypeHip = "shotgun"
SWEP.HoldtypeSights = "ar2"



SWEP.Firemodes = {
    {
        Automatic = false,
        CustomFiremode = "FIRE"
    },
    {
        Safe = true
    }
}
SWEP.CustomFiremode = nil
SWEP.BurstLength = 0
SWEP.Automatic = false -- use this instead of changing SWEP.Primary.Automatic
SWEP.ManualAction = false
SWEP.CannotCycle = true

SWEP.ReloadSoundsTable = {
    {
        time = 0,
        path = "weapons/357/357_reload1.wav",
        comp = ACT3_STPART_MAGEJECT
    },
}