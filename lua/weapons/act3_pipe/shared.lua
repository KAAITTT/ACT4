SWEP.Base = "act3_base_melee"

SWEP.Spawnable = true
SWEP.AdminSpawnable = false
SWEP.PrintName = "Lead Pipe"
SWEP.Category = "ACT3 - Other"

SWEP.Desc_Country = "USA"
SWEP.Desc_Manufacturer = "Home Depot"
SWEP.Desc_Mechanism = "Blunt Force"
SWEP.Desc_Year = 1974
SWEP.Desc_Weight = 2.25 -- kg
SWEP.ACT3Cat = ACT3_CAT_MELEE
SWEP.Sidearm = true

SWEP.AttachmentBodygroups = {
}

SWEP.Slot = 0

SWEP.WorldModel = "models/props_canal/mattpipe.mdl"
SWEP.WorldModelBase = "models/props_canal/mattpipe.mdl" -- Worldmodel base of the weapon world model.
SWEP.WorldModelPos = Vector(2.799, 1.368, -3.619)
SWEP.WorldModelAng = Angle(0, 0, 0)

SWEP.PrimaryMelee = true -- primary attack is melee
SWEP.QuickMelee = false -- has quick melee attack
SWEP.MeleeDamagetype = DMG_SLASH
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
SWEP.SoundMeleeHit = "physics/metal/metal_canister_impact_hard1.wav"
SWEP.SoundMeleeHitFlesh = "physics/body/body_medium_impact_hard5.wav"
SWEP.SoundMeleeHitBackstab = "physics/body/body_medium_break4.wav"
SWEP.SoundDraw = "act3/uni-draw.wav"