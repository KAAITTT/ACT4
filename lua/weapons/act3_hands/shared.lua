SWEP.Base = "act3_base_melee"

SWEP.Spawnable = true
SWEP.AdminSpawnable = false
SWEP.PrintName = "Empty Hands"
SWEP.Category = "ACT3 - Other"

SWEP.Desc_Country = "N/A"
SWEP.Desc_Manufacturer = "Your Mom"
SWEP.Desc_Mechanism = "Three-segment fingers"
SWEP.Desc_Year = "2.5 Million BCE"
SWEP.Desc_Weight = 0 -- kg
SWEP.ACT3Cat = ACT3_CAT_MELEE
SWEP.Sidearm = true

SWEP.Desc_Extra = {
    "",
    "Look, ma! Hands!",
    "",
    "No hunter killing can be done with these.",
}

SWEP.AttachmentBodygroups = {
}

SWEP.Attachments = {
    ["hands"] = {
        Type = "any",
        PrintName = "Drop Attachments",
        Installed = nil,
        Required = false,
    },
}

SWEP.Slot = 0

SWEP.WorldModel = ""
SWEP.WorldModelBase = nil -- Worldmodel base of the weapon world model.

SWEP.UseTrueIrons = true

SWEP.PrimaryMelee = true -- primary attack is melee
SWEP.QuickMelee = false -- has quick melee attack
SWEP.MeleeDamagetype = DMG_CLUB
SWEP.MeleeTraceOffset = Vector(0, 0, 0)
SWEP.MeleeAttackTime = 0.4
SWEP.MeleeDamage = 15
SWEP.MeleeForce = 50

SWEP.MagazineType = "hands"
SWEP.Magazine = nil
SWEP.InternalMag = false

SWEP.Safe = true

SWEP.MeleeBackstab = true
SWEP.MeleeBackstabDamage = 30

SWEP.AnimMeleeAttack = ACT_HL2MP_GESTURE_RANGE_ATTACK_FIST
SWEP.AnimMeleeAttackAimed = ACT_HL2MP_GESTURE_RANGE_ATTACK_FIST

SWEP.HoldtypePassive = "normal"
SWEP.HoldtypeHip = "normal"
SWEP.HoldtypeSights = "normal"

SWEP.CustomFiremode = "NONE"

SWEP.SoundMelee = "weapons/slam/throw.wav"
SWEP.SoundMeleeHit = "physics/body/body_medium_impact_hard1.wav"
SWEP.SoundMeleeHitFlesh = "physics/body/body_medium_impact_hard6.wav"
SWEP.SoundMeleeHitBackstab = "physics/body/body_medium_break2.wav"
SWEP.SoundDraw = ""