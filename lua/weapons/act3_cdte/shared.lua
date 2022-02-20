SWEP.Base = "act3_base"

SWEP.Spawnable = true
SWEP.AdminSpawnable = false
SWEP.PrintName = "CDTE"
SWEP.Category = "ACT3 - Firearms"

SWEP.Desc_Country = "Australia/UK"
SWEP.Desc_Manufacturer = "Arctic Combat Tactical Inc."
SWEP.Desc_Mechanism = ""
SWEP.Desc_Year = 2019

SWEP.Desc_Weight = 6.35 -- kg
SWEP.ACT3Cat = ACT3_CAT_EXPLOSIVE
SWEP.Sidearm = false

SWEP.Slot = 3

SWEP.WorldModel = "models/weapons/act3/launcher_cdte.mdl"
SWEP.WorldModelBase = "models/weapons/act3/launcher_cdte.mdl" -- Worldmodel base of the weapon world model.
SWEP.WorldModelPos =  Vector(14.385, 0.456, 2.035)
SWEP.WorldModelAng = Angle(-14.039, 0, 180)

SWEP.AttachmentBodygroups = {
}

SWEP.DefaultAttachments = {
} -- {{["slot"] = "id"}} the gun will spawn with these attachments attached.

SWEP.Attachments = {
}

SWEP.MuzzleOffset = Vector(19.781, 0.8, -7.284)
SWEP.MuzzleAngle = Angle(-7, 0, 0)
SWEP.EjectPos = Vector(-15.162, 0, 7.931)
SWEP.EjectAng = Angle(0, 0, 0)
SWEP.MagazineOffsetPos = Vector(-15.813, 0, 8.031)
SWEP.MagazineOffsetAng = Angle(0, 0, 0)

SWEP.ReloadSoundsTable = {
    {
        time = 0.1,
        path = "weapons/famas/famas_clipout.wav",
        comp = ACT3_STPART_MAGEJECT
    },
    {
        time = 1.0,
        path = "weapons/famas/famas_clipin.wav",
        comp = ACT3_STPART_MAGLOAD
    },
    {
        time = 1.45,
        path = "weapons/ak47/ak47_boltpull.wav",
        comp = ACT3_STPART_EMPTYRACK
    },
}

SWEP.TrueIronsPos = Vector(-0.04, 9.77, -9.889)
SWEP.TrueIronsAng = Vector(1.379, 0, 0)

SWEP.SightedAimPos = Vector(-0.051, 0, -10.44)
SWEP.SightedAimAng = Vector(0, 0, 0)

SWEP.LowPos = Vector(4.623, 18.693, -13.266)
SWEP.LowAng = Vector(-25.327, -11.256, 14.069)



SWEP.DamageMult = 1 -- the weapon's main stats are just taken from the bullet
SWEP.ShootingDelay = 60 / 250
SWEP.TriggerDelay = 0

SWEP.Recoil = 7
SWEP.RecoilAngles = 40

SWEP.BlowbackAmount = 1
SWEP.BlowbackRecovery = 5
SWEP.BlowbackMax = 2.5
SWEP.RollBlowbackAmount = 3
SWEP.RollBlowbackRecovery = 10
SWEP.RollBlowbackMax = 45

SWEP.HeatAccumulation = 40 -- Out of 100, the amount of heat each shot adds to the weapon
SWEP.HeatDissipation = 200 -- Amount of heat dissipated per second

SWEP.Precision = 1 / 500
SWEP.MaxHeatPrecision = 1 / 75
SWEP.HipfirePenalty = 0 -- Deviation applied on hip fire
SWEP.MaxHeatHipfirePenalty = 0.075
SWEP.MaxMovePenalty = 0.05
SWEP.DispersionInSights = false

SWEP.Sway = 2



SWEP.SpeedMult = 1
SWEP.SightedSpeedMult = 0.9



SWEP.OpenBolt = false -- this weapon will not chamber a round to fire. Instead, it will take rounds directly from the magazine. Examples of such weapons include revolvers and open bolt guns.
SWEP.InternalMag = false -- whether this weapon uses detachable magazines or loads rounds directly into the weapon

SWEP.DefaultLoad = "25mm_cdte_heab" -- the round that this gun will be loaded with by default
SWEP.DefaultMagazine = { -- this is the weapon's default magazine, this will be automatically given if the setting act3_instantaction is enabled
    Type = "cdte_5",
    Rounds = {}
}

SWEP.MagazineType = "cdte"

SWEP.Calibre = "25mm_cdte"
SWEP.PrintCalibre = "25mm CDTE"

SWEP.MuzzleEffect = "act3_muzzleeffect"
SWEP.Suppressed = false

SWEP.SoundShoot = "weapons/grenade_launcher1.wav"
SWEP.SoundShootSuppressed = "weapons/m4a1/m4a1-1.wav"
SWEP.SoundShootVol = 110
SWEP.SoundShootPitch = 130

SWEP.SoundCycle = "weapons/ak47/ak47_boltpull.wav"
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

SWEP.ManualActionPos = Vector(0, 0, 0)
SWEP.ManualActionAng = Vector(0, 0, 0)

SWEP.AimTime = 0.25

SWEP.MuzzleVelocity = 20000

SWEP.TrueScopeImage = Material("scopes/act3/thermal.png")
SWEP.Magnification = 2.5

SWEP.ScrollFunc = ACT3_FUNC_CUSTOM

SWEP.RangeDial = 10
SWEP.MaxRangeDial = 300
SWEP.MinRangeDial = 10

SWEP.NetworkScroll = true

function SWEP:OnDrawScope(x, y)
    local rangetext = "SET: " .. self.RangeDial .. "m"

    surface.SetTextPos(x + ScreenScale(64), y)
    surface.SetTextColor(Color(200, 0, 0))
    surface.SetFont("ACT3_LCD_20_Glow")
    surface.DrawText(rangetext)
    surface.SetTextPos(x + ScreenScale(64), y)
    surface.SetFont("ACT3_LCD_20")
    surface.DrawText(rangetext)
    
    local tr = util.TraceLine({
        start = EyePos(),
        endpos = EyePos() + (EyeAngles():Forward() * 100000),
        filter = LocalPlayer()
    })

    local range = math.Round(tr.Fraction * 100000 * ACT3.Conversions.HutoM) .. "m"

    if tr.HitSky then
        range = "---"
    end

    local rftext = "RANGE: " .. range

    surface.SetTextPos(x + ScreenScale(64), y + ScreenScale(20))
    surface.SetTextColor(Color(200, 0, 0))
    surface.SetFont("ACT3_LCD_20_Glow")
    surface.DrawText(rftext)
    surface.SetTextPos(x + ScreenScale(64), y + ScreenScale(20))
    surface.SetFont("ACT3_LCD_20")
    surface.DrawText(rftext)
end

function SWEP:OnInitialize()
end

function SWEP:CustomScroll(val)
    self.RangeDial = self.RangeDial - (val * 5)

    if self.RangeDial >= self.MaxRangeDial then
        self.RangeDial = self.MaxRangeDial
    elseif self.RangeDial < self.MinRangeDial then
        self.RangeDial = self.MinRangeDial
    elseif val != 0 then
        if CLIENT then
            surface.PlaySound("act3/adjust.wav")
        end
    end

    return true
end

function SWEP:PreShootRound(bulletid)
    self.DataForProjectiles = {time = self.RangeDial * ACT3.Conversions.HutoM * 0.7}
end