SWEP.Base = "act3_base"

SWEP.Spawnable = true
SWEP.AdminSpawnable = false
SWEP.PrintName = "M203 Standalone"
SWEP.Category = "ACT3 - Firearms"

SWEP.Desc_Country = "USA"
SWEP.Desc_Manufacturer = "Knight's Armament Company"
SWEP.Desc_Mechanism = "High-Low Propulsion System"
SWEP.Desc_Year = 1969
SWEP.Desc_Weight = 1.36 -- kg
SWEP.ACT3Cat = ACT3_CAT_GRENADE
SWEP.Sidearm = false

SWEP.Slot = 4

SWEP.WorldModel = "models/weapons/act3/launcher_m203.mdl" -- Weapon's traditional world model, where applicable.
SWEP.WorldModelBase = "models/weapons/act3/launcher_m203.mdl" -- Worldmodel base of the weapon world model.
SWEP.WorldModelPos = Vector(12.55, 0.628, 2.467)
SWEP.WorldModelAng = Angle(-10.082, 0, 180)
SWEP.WorldModelBodygroups = "" -- Sets the bodygroups of the world model.
SWEP.WorldModelSkin = 0 -- Set the skin of the world model.

SWEP.Attachments = nil -- {{id=""}}

SWEP.DefaultAttachments = nil -- {{id=""}} the gun will spawn with these attachments attached.



SWEP.MuzzleOffset = Vector(19.952, 0, -5.449)
SWEP.MuzzleAngle = Angle(-7, 0, 0)
SWEP.EjectPos = Vector(9.1, 0, -3.628)
SWEP.EjectAng = Angle(0, 0, 90)

SWEP.ReloadSoundsTable = {
    {
        time = 0.1,
        path = "act3/m203-open.wav",
    },
    {
        time = 1.0,
        path = "act3/m203-load.wav",
        comp = ACT3_STPART_MAGLOAD,
    },
    {
        time = 1.45,
        path = "act3/m203-close.wav",
    },
}



SWEP.Magnification = 1

SWEP.NightScope = false
SWEP.NightScopeColor = Color(0, 255, 0)

SWEP.TrueScopeImage = false
SWEP.TrueScopeBlackbox = true

SWEP.TrueIronsPos = Vector(-0.109, 12.42, -11.811)
SWEP.TrueIronsAng = Vector(5.63, -0.304, 0)

SWEP.ZeroIronMinPos = Vector(-0.109, 12.42, -11.811)
SWEP.ZeroIronMinAng = Vector(5.63, -0.304, 0)
SWEP.ZeroIronMaxPos = Vector(-0.091, 12.42, -12.9)
SWEP.ZeroIronMaxAng = Vector(-4.237, -0.304, 0)
SWEP.ZeroIncrements = 15

SWEP.ScrollFunc = ACT3_FUNC_ZERO

SWEP.UseTrueIrons = true

SWEP.LowPos = Vector(4.623, 18.693, -13.266)
SWEP.LowAng = Vector(-25.327, -11.256, 14.069)



SWEP.DamageMult = 1 -- the weapon's main stats are just taken from the bullet
SWEP.ShootingDelay = 60 / 60
SWEP.TriggerDelay = 0

SWEP.Recoil = 14
SWEP.RecoilAngles = 15

SWEP.BlowbackAmount = 2
SWEP.BlowbackRecovery = 2
SWEP.BlowbackMax = 2

SWEP.HeatAccumulation = 50 -- Out of 100, the amount of heat each shot adds to the weapon
SWEP.HeatDissipation = 100 -- Amount of heat dissipated per second

SWEP.Precision = 1 / 150
SWEP.MaxHeatPrecision = 1 / 30

SWEP.Sway = 0.5



SWEP.SpeedMult = 1
SWEP.SightedSpeedMult = 0.9



SWEP.ChamberedRound = nil -- int bulletid
SWEP.OpenBolt = true -- this weapon will not chamber a round to fire. Instead, it will take rounds directly from the magazine. Examples of such weapons include revolvers and open bolt guns.
SWEP.InternalMag = true -- whether this weapon uses detachable magazines or loads rounds directly into the weapon


SWEP.DefaultLoad = "40mm_he"
SWEP.DefaultMagazine = {}

SWEP.Magazine = { -- this is the weapon's default magazine, this will be automatically given if the setting act3_instantaction is enabled
    Type = "m203_chamber",
    Rounds = {}
}
SWEP.MagazineVisible = false

SWEP.MagazineType = "int"

SWEP.Calibre = "40mm"
SWEP.PrintCalibre = "40x46mm"
SWEP.PostReloadDelay = 0.25
SWEP.ReloadTimeOverride = -1 -- override reload time. usually no reason to do this unless using custom anims not in anim table.


SWEP.CustomBullet = nil -- the custom bullet. Shoot this instead of the magazine round.



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
SWEP.RevolverEject = true -- whether this weapon ejects shells when reloading instead of after each shot

SWEP.MuzzleEffect = "act3_muzzleeffect"
SWEP.Suppressed = false

SWEP.SoundShoot = "weapons/grenade_launcher1.wav"
SWEP.SoundShootVol = 120
SWEP.SoundShootPitch = 100

SWEP.SoundDryfire = "weapons/shotgun/shotgun_empty.wav"



SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_RPG
SWEP.AnimReload = ACT_HL2MP_GESTURE_RELOAD_AR2
SWEP.AnimReloadProne = 2087
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