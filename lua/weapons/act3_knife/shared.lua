SWEP.Base = "act3_base_melee"

SWEP.Spawnable = true
SWEP.AdminSpawnable = false
SWEP.PrintName = "Combat Knife"
SWEP.Category = "ACT3 - Other"

SWEP.Desc_Country = "USA"
SWEP.Desc_Manufacturer = "Tacticool Knives"
SWEP.Desc_Mechanism = "Sharp Edge"
SWEP.Desc_Year = 2002
SWEP.Desc_Weight = 0.22 -- kg
SWEP.ACT3Cat = ACT3_CAT_MELEE
SWEP.Sidearm = true

SWEP.AttachmentBodygroups = {
    ["knife_hilt_long"] = {ind = 1, bg = 1},
    ["knife_handle_wood"] = {ind = 2, bg = 1}
}

SWEP.Slot = 0

SWEP.WorldModel = "models/weapons/act3/knife.mdl"
SWEP.WorldModelBase = "models/weapons/act3/knife.mdl" -- Worldmodel base of the weapon world model.
SWEP.WorldModelPos = Vector(14.364, 1.041, 2.464)
SWEP.WorldModelAng = Angle(-9.464, 0, 180)

SWEP.PrimaryMelee = true -- primary attack is melee
SWEP.QuickMelee = false -- has quick melee attack
SWEP.MeleeDamagetype = DMG_SLASH
SWEP.MeleeTraceOffset = Vector(8, -16, 0)
SWEP.MeleeAttackTime = 0.4
SWEP.MeleeDamage = 35
SWEP.MeleeForce = 250

SWEP.MeleeBackstab = true
SWEP.MeleeBackstabDamage = 90

SWEP.AnimMeleeAttack = ACT_HL2MP_GESTURE_RANGE_ATTACK_MELEE
SWEP.AnimMeleeAttackAimed = ACT_HL2MP_GESTURE_RANGE_ATTACK_MELEE

SWEP.HoldtypePassive = "normal"
SWEP.HoldtypeHip = "knife"
SWEP.HoldtypeSights = "melee"

SWEP.SoundMelee = "weapons/knife/knife_slash1.wav"
SWEP.SoundMeleeHit = "weapons/knife/knife_hitwall1.wav"
SWEP.SoundMeleeHitFlesh = "weapons/knife/knife_hit3.wav"
SWEP.SoundMeleeHitBackstab = "weapons/knife/knife_stab.wav"
SWEP.SoundDraw = "weapons/knife/knife_deploy1.wav"