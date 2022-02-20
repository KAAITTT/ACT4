SWEP.Base = "act3_base"

-- use this base for melee weapons

SWEP.Spawnable = false
SWEP.AdminSpawnable = false
SWEP.PrintName = ""
SWEP.Category = "ACT3 - Other"

SWEP.Description = ""
SWEP.Desc_Country = ""
SWEP.Desc_Manufacturer = ""
SWEP.Desc_Mechanism = ""
SWEP.Desc_Year = 2019
SWEP.Desc_Weight = 1 -- kg
SWEP.Sidearm = true

SWEP.Slot = 0

SWEP.TraditionalWorldModel = false
SWEP.ViewModel = nil
SWEP.WorldModel = nil -- Weapon's traditional world model, where applicable.

SWEP.Sway = 0

SWEP.DefaultMagazine = nil
SWEP.Magazine = {
    Type = "melee",
    Rounds = {}
}

SWEP.MagazineType = "melee"
SWEP.MagazineVisible = false

SWEP.InfiniteAmmo = true
SWEP.InternalWeapon = false

SWEP.UseTrueIrons = false

SWEP.CannotReload = true
SWEP.CannotFiremodes = true

SWEP.PrimaryMelee = true -- primary attack is melee
SWEP.QuickMelee = false -- has quick melee attack
SWEP.MeleeDamagetype = DMG_SLASH
SWEP.MeleeTraceOffset = Vector(8, -16, 0)
SWEP.MeleeAttackTime = 0.4
SWEP.MeleeDamage = 16
SWEP.MeleeForce = 250

SWEP.MeleeBackstab = true
SWEP.MeleeBackstabDamage = 125

SWEP.AnimMeleeAttack = ACT_HL2MP_GESTURE_RANGE_ATTACK_MELEE
SWEP.AnimMeleeAttackAimed = ACT_HL2MP_GESTURE_RANGE_ATTACK_MELEE2

SWEP.HoldtypePassive = "normal"
SWEP.HoldtypeHip = "knife"
SWEP.HoldtypeSights = "melee"

SWEP.SoundMelee = "weapons/knife/knife_slash1.wav"
SWEP.SoundMeleeHit = "weapons/knife/knife_hitwall1.wav"
SWEP.SoundMeleeHitFlesh = "weapons/knife/knife_hit2.wav"
SWEP.SoundMeleeHitBackstab = "weapons/knife/knife_stab.wav"
SWEP.SoundDraw = "weapons/knife/knife_deploy1.wav"
SWEP.SoundEnterAim = ""
SWEP.SoundExitAim = ""

SWEP.CannotCycle = true

SWEP.CustomFiremode = "MELEE"

SWEP.HideCrosshair = true

SWEP.NPCUnusable = true