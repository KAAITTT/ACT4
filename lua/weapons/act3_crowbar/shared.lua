SWEP.Base = "act3_base_melee"

SWEP.Spawnable = true
SWEP.AdminSpawnable = false
SWEP.PrintName = "Crowbar"
SWEP.Category = "ACT3 - Other"

SWEP.Desc_Country = "USA"
SWEP.Desc_Manufacturer = "Home Depot"
SWEP.Desc_Mechanism = "Blunt Force"
SWEP.Desc_Year = 2012
SWEP.Desc_Weight = 1.25 -- kg
SWEP.ACT3Cat = ACT3_CAT_MELEE
SWEP.Sidearm = true

SWEP.Desc_Extra = {
    "",
    "Weapon of free men.",
    "",
}

SWEP.AttachmentBodygroups = {
}

SWEP.Slot = 0

SWEP.WorldModel = "models/weapons/w_crowbar.mdl"
SWEP.WorldModelBase = "models/weapons/w_crowbar.mdl" -- Worldmodel base of the weapon world model.
SWEP.WorldModelPos = Vector(3.588, 1.368, -3.619)
SWEP.WorldModelAng = Angle(90, 0, 133.815)

SWEP.PrimaryMelee = true -- primary attack is melee
SWEP.QuickMelee = false -- has quick melee attack
SWEP.MeleeDamagetype = DMG_CLUB
SWEP.MeleeTraceOffset = Vector(8, -24, 0)
SWEP.MeleeAttackTime = 0.4
SWEP.MeleeDamage = 55
SWEP.MeleeForce = 400

SWEP.MeleeBackstab = true
SWEP.MeleeBackstabDamage = 95

SWEP.AnimMeleeAttack = ACT_HL2MP_GESTURE_RANGE_ATTACK_MELEE
SWEP.AnimMeleeAttackAimed = ACT_HL2MP_GESTURE_RANGE_ATTACK_MELEE

SWEP.HoldtypePassive = "normal"
SWEP.HoldtypeHip = "melee"
SWEP.HoldtypeSights = "melee2"

SWEP.SoundMelee = "weapons/knife/knife_slash2.wav"
SWEP.SoundMeleeHit = "weapons/crowbar/crowbar_impact1.wav"
SWEP.SoundMeleeHitFlesh = "physics/body/body_medium_impact_hard5.wav"
SWEP.SoundMeleeHitBackstab = "physics/body/body_medium_break4.wav"
SWEP.SoundDraw = "act3/uni-draw.wav"