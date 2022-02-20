SWEP.Base = "act3_base"

SWEP.Spawnable = true
SWEP.AdminSpawnable = false
SWEP.PrintName = "ATX-A2"
SWEP.Category = "ACT3 - Firearms"

SWEP.Desc_Country = "Australia/UK"
SWEP.Desc_Manufacturer = "Arctic Combat Tactical Inc."
SWEP.Desc_Mechanism = "LOSBR Guided Missiles"
SWEP.Desc_Year = 2006
SWEP.Desc_Weight = 22.6 -- kg
SWEP.ACT3Cat = ACT3_CAT_ANTITANK
SWEP.Sidearm = false

SWEP.Slot = 4

SWEP.WorldModel = "models/weapons/act3/launcher_atxa2.mdl" -- Weapon's traditional world model, where applicable.
SWEP.WorldModelBase = "models/weapons/act3/launcher_atxa2.mdl" -- Worldmodel base of the weapon world model.
SWEP.WorldModelPos = Vector(13.359, 0.646, 2.772)
SWEP.WorldModelAng = Angle(-9.226, 0, 180)
SWEP.WorldModelSkin = 0 -- Set the skin of the world model.
SWEP.WorldModelAttachments = {
    {
    model = "models/weapons/act3/atts/att_laser.mdl",
    bgs = "",
    skin = 0,
    nodraw = true,
    pos = Vector(-7.344, -1.027, 6.662),
    ang = Angle(0, 0, 0),
    renderfunc = function(pos, ang, ent, slotid, asvm)
        ACT3_DoLaser(pos, ang, ent, ent.LaserColor, asvm)
    end
    }
}

SWEP.DefaultToggleable = true

SWEP.LaserColor = Color(255, 50, 50)

SWEP.Attachments = {
    ["sight"] = {
        Type = "atxa2_sight",
        PrintName = "Sight",
        Required = false,
        Installed = nil
    }
}

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

SWEP.TrueIronsPos = Vector(5.982, 12.479, -11.323)
SWEP.TrueIronsAng = Vector(0, 0, 0)

SWEP.SightedAimPos = Vector(-0.695, 9.637, -8.023)

SWEP.UseTrueIrons = true

SWEP.LowPos = Vector(4.623, 18.693, -13.266)
SWEP.LowAng = Vector(-25.327, -11.256, 14.069)



SWEP.DamageMult = 1 -- the weapon's main stats are just taken from the bullet
SWEP.ShootingDelay = 60 / 200
SWEP.TriggerDelay = 0

SWEP.Recoil = 3
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


SWEP.DefaultLoad = "atxa2_heat"
SWEP.DefaultMagazine = {}

SWEP.Magazine = { -- this is the weapon's default magazine, this will be automatically given if the setting act3_instantaction is enabled
    Type = "atxa2_chamber",
    Rounds = {}
}
SWEP.MagazineVisible = false

SWEP.MagazineType = "int"

SWEP.Calibre = "atxa2"
SWEP.PrintCalibre = "ATX-A2 95mm Rocket"

-- tracking module
SWEP.TrackingRange = 100000
SWEP.TrackingType = ACT3_TRACK_TYPE_SACLOS
SWEP.FFSeek_Range = 100000 -- Maximum range the fire and forget seeker can pick up at
SWEP.FFSeek_AOA = 0.998 -- "Angle of Attack"; angle at which fire and forget seeker can pick up targets
SWEP.FFSeek_LockTime = 2 -- Time needed to lock on to a target

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