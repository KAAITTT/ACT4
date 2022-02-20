SWEP.Base = "act3_base_thingy"

-- dummied out because I couldn't get the shield mechanic working properly
SWEP.Spawnable = true
SWEP.AdminSpawnable = false
SWEP.PrintName = "PB Shield"
SWEP.Category = "ACT3 - Other"

SWEP.Desc_Country = "Australia/UK"
SWEP.Desc_Manufacturer = "Arctic Combat Tactical Inc."
SWEP.Desc_Mechanism = "Steel-Ceramic Composite"
SWEP.Desc_Year = 2009
SWEP.Desc_Weight = 10.5 -- kg
SWEP.ACT3Cat = ACT3_CAT_SPECIAL
SWEP.Sidearm = true

SWEP.AttachmentBodygroups = {
}

SWEP.Slot = 0

SWEP.WorldModel = "models/weapons/act3/pbshield.mdl"
SWEP.WorldModelBase = "models/weapons/act3/pbshield.mdl" -- Worldmodel base of the weapon world model.
SWEP.WorldModelPos = Vector(3.47, 9.503, 5.563)
SWEP.WorldModelAng = Angle(0, -4.665, 170)


SWEP.WorldModelAttachments = {
    {
    model = "models/weapons/act3/pbshield.mdl",
    bgs = "",
    skin = 0,
    pos = Vector(3.47, 9.503, 5.563),
    ang = Angle(0, 4.665, 0),
    nodraw = true,
    shield = true
    }
}

SWEP.NPCUnusable = false

SWEP.PrimaryMelee = false

SWEP.UseTrueIrons = true
SWEP.TrueIronsPos = Vector(0, 10.413, -16.696)
SWEP.TrueIronsAng = Vector(0, 0, 0)

SWEP.CannotFiremodes = true

SWEP.CustomFiremode = "SHIELD"

SWEP.Safe = true

SWEP.AnimMeleeAttack = ACT_HL2MP_GESTURE_RANGE_ATTACK_KNIFE
SWEP.AnimMeleeAttackAimed = ACT_HL2MP_GESTURE_RANGE_ATTACK_MELEE

SWEP.HoldtypePassive = "melee2"
SWEP.HoldtypeHip = "melee2"
SWEP.HoldtypeSights = "melee2"

SWEP.SoundMelee = "weapons/knife/knife_slash2.wav"
SWEP.SoundMeleeHit = "physics/metal/metal_canister_impact_hard1.wav"
SWEP.SoundMeleeHitFlesh = "physics/body/body_medium_impact_hard5.wav"
SWEP.SoundMeleeHitBackstab = "physics/body/body_medium_break4.wav"
SWEP.SoundDraw = "act3/uni-draw.wav"

SWEP.InfiniteAmmo = true