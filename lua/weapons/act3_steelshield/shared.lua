SWEP.Base = "act3_base_thingy"

-- dummied out because I couldn't get the shield mechanic working properly
SWEP.Spawnable = true
SWEP.AdminSpawnable = false
SWEP.PrintName = "Steel Shield"
SWEP.Category = "ACT3 - Other"

SWEP.Desc_Country = "USA"
SWEP.Desc_Manufacturer = "General Motors"
SWEP.Desc_Mechanism = "Rolled Homogenous Armor"
SWEP.Desc_Year = 1988
SWEP.Desc_Weight = 8.5 -- kg
SWEP.ACT3Cat = ACT3_CAT_SPECIAL
SWEP.Sidearm = true

SWEP.AttachmentBodygroups = {

}

SWEP.Slot = 0

SWEP.WorldModel = "models/weapons/act3/steelshield.mdl"
SWEP.WorldModelBase = "models/weapons/act3/steelshield.mdl" -- Worldmodel base of the weapon world model.
SWEP.WorldModelPos = Vector(4.05, 11.348, 3.377)
SWEP.WorldModelAng = Angle(-11.386, 90, 180)


SWEP.WorldModelAttachments = {
    {
    model = "models/weapons/act3/steelshield.mdl",
    bgs = "",
    skin = 0,
    pos = Vector(4.05, 11.348, 3.377),
    ang = Angle(11.386, 0, 11.386),
    nodraw = true,
    shield = true
    }
}

SWEP.NPCUnusable = false

SWEP.PrimaryMelee = false

SWEP.UseTrueIrons = true
SWEP.TrueIronsPos = Vector(-6.908, -1.086, -9.303)
SWEP.TrueIronsAng = Vector(0, -90, 0)

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