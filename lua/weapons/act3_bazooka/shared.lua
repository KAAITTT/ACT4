SWEP.Base = "act3_base"

SWEP.Spawnable = true
SWEP.AdminSpawnable = false
SWEP.PrintName = "M1A1 Bazooka"
SWEP.Category = "ACT3 - Firearms"

SWEP.Desc_Country = "USA"
SWEP.Desc_Manufacturer = "General Electric"
SWEP.Desc_Mechanism = "Electric Ignition"
SWEP.Desc_Year = 1942
SWEP.Desc_Weight = 5.8 -- kg
SWEP.ACT3Cat = ACT3_CAT_ANTITANK
SWEP.Sidearm = false

SWEP.GiveToCombine = false

SWEP.Slot = 4

SWEP.WorldModel = "models/weapons/act3/launcher_bazooka.mdl" -- Weapon's traditional world model, where applicable.
SWEP.WorldModelBase = "models/weapons/act3/launcher_bazooka.mdl" -- Worldmodel base of the weapon world model.
SWEP.WorldModelPos = Vector(0, -0.362, 0.419)
SWEP.WorldModelAng = Angle(0, 0, 180)

SWEP.WorldModelSkin = 0 -- Set the skin of the world model.

SWEP.DefaultAttachments = nil -- {{id=""}} the gun will spawn with these attachments attached.



SWEP.MuzzleOffset = Vector(17.572, 1.72, -8.964)
SWEP.MuzzleAngle = Angle(0, 0, 0)

SWEP.ReloadSoundsTable = {
    {
        time = 1,
        path = "act3/rocket_clipin.wav",
    },
}

SWEP.TrueScopeImage = nil
SWEP.TrueScopeBlackbox = true

SWEP.ZeroIronMinPos = Vector(2.91, 3.913, -7.877)
SWEP.ZeroIronMinAng = Vector(2.782, -0.055, 0)
SWEP.ZeroIronMaxPos = Vector(2.91, 3.913, -8.348)
SWEP.ZeroIronMaxAng = Vector(3.756, -0.055, 0)
SWEP.ZeroIncrements = 3

SWEP.ScrollFunc = ACT3_FUNC_ZERO

SWEP.TrueIronsPos = Vector(2.91, 3.913, -7.877)
SWEP.TrueIronsAng = Vector(2.782, -0.055, 0)

SWEP.SightedAimPos = Vector(-0.695, 9.637, -8.023)

SWEP.Magnification = 1.5

SWEP.UseTrueIrons = true

SWEP.LowPos = Vector(4.623, 18.693, -13.266)
SWEP.LowAng = Vector(-25.327, -11.256, 14.069)



SWEP.DamageMult = 1 -- the weapon's main stats are just taken from the bullet
SWEP.ShootingDelay = 60 / 200
SWEP.TriggerDelay = 0

SWEP.Recoil = 4
SWEP.RecoilAngles = 15

SWEP.BlowbackAmount = 2
SWEP.BlowbackRecovery = 2
SWEP.BlowbackMax = 2

SWEP.HeatAccumulation = 50 -- Out of 100, the amount of heat each shot adds to the weapon
SWEP.HeatDissipation = 100 -- Amount of heat dissipated per second

SWEP.Precision = 1 / 100
SWEP.MaxHeatPrecision = 1 / 30

SWEP.Sway = 0.5



SWEP.SpeedMult = 1
SWEP.SightedSpeedMult = 0.9



SWEP.ChamberedRound = nil -- int bulletid
SWEP.OpenBolt = true -- this weapon will not chamber a round to fire. Instead, it will take rounds directly from the magazine. Examples of such weapons include revolvers and open bolt guns.
SWEP.InternalMag = true -- whether this weapon uses detachable magazines or loads rounds directly into the weapon


SWEP.DefaultLoad = "bazooka_heat"
SWEP.DefaultMagazine = {}

SWEP.Magazine = { -- this is the weapon's default magazine, this will be automatically given if the setting act3_instantaction is enabled
    Type = "bazooka_chamber",
    Rounds = {}
}
SWEP.MagazineVisible = false

SWEP.MagazineType = "int"

SWEP.Calibre = "bazooka"
SWEP.PrintCalibre = "Bazooka 60mm Rocket"

SWEP.MuzzleEffect = "act3_muzzleeffect"
SWEP.Suppressed = false

SWEP.SoundShoot = "weapons/rpg/rocketfire1.wav"
SWEP.SoundShootVol = 120
SWEP.SoundShootPitch = 100

SWEP.SoundDryfire = "weapons/shotgun/shotgun_empty.wav"

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_RPG
SWEP.AnimReload = ACT_HL2MP_GESTURE_RELOAD_AR2
SWEP.AnimReloadProne = 2087

SWEP.HoldtypePassive = "passive"
SWEP.HoldtypeHip = "crossbow"
SWEP.HoldtypeSights = "rpg"



SWEP.Firemodes = {
    {
        Automatic = true,
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