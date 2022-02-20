SWEP.Base = "act3_base_thingy"

SWEP.Spawnable = true
SWEP.AdminSpawnable = false
SWEP.PrintName = "Flashlight"
SWEP.Category = "ACT3 - Other"

SWEP.Desc_Country = "USA"
SWEP.Desc_Manufacturer = "Maglite"
SWEP.Desc_Mechanism = "LED"
SWEP.Desc_Year = 2012
SWEP.Desc_Weight = 0.360 -- kg
SWEP.ACT3Cat = ACT3_CAT_MELEE
SWEP.Sidearm = true

SWEP.Desc_Extra = {
    "",
    "Lights the way.",
    "",
}

SWEP.AttachmentBodygroups = {

}

SWEP.Slot = 0

SWEP.WorldModel = "models/weapons/act3/atts/att_flashlight.mdl"
SWEP.WorldModelBase = "" -- Worldmodel base of the weapon world model.
SWEP.WorldModelPos = Vector(0, 0, 0)
SWEP.WorldModelAng = Angle(0, 0, 0)

local flashmat = "effects/flashlight001"

SWEP.WorldModelAttachments = {
    {
    model = "models/weapons/act3/atts/att_flashlight.mdl",
    bgs = "",
    skin = 0,
    pos = Vector(3.174, 1.36, -0.647),
    ang = Angle(0, -15, 0),
    renderfunc = function(pos, ang, ent, slotid, asvm)
        ACT3_DoFlashlight(pos, ang, ent, slotid, flashmat, ent.FL_Dist, ent.FL_Brightness, ent.FL_Fov, ent.FL_Col)
    end
    }
}

SWEP.FL_Dist = 700
SWEP.FL_Brightness = 3
SWEP.FL_Fov = 90
SWEP.FL_Col = Color(255, 255, 255)

SWEP.Firemodes = {
    {
        CustomFiremode = "HIPOWER",
        Safe = true,
        Network = true,
        EquipFunc = function(wep)
            wep.FL_Dist = 1000
            wep.FL_Brightness = 3
            wep.FL_Fov = 90
            wep.FL_Col = Color(255, 255, 255)
        end
    },
    {
        CustomFiremode = "LOPOWER",
        Safe = true,
        Network = true,
        EquipFunc = function(wep)
            wep.FL_Dist = 750
            wep.FL_Brightness = 2.5
            wep.FL_Fov = 90
            wep.FL_Col = Color(155, 155, 155)
        end
    },
    {
        CustomFiremode = "ECO",
        Safe = true,
        Network = true,
        EquipFunc = function(wep)
            wep.FL_Dist = 500
            wep.FL_Brightness = 2
            wep.FL_Fov = 90
            wep.FL_Col = Color(55, 55, 55)
        end
    },
}

SWEP.CannotFiremodes = false

SWEP.CustomFiremode = "HIPOWER"

SWEP.DefaultToggleable = true

SWEP.Safe = true

SWEP.PrimaryMelee = true -- primary attack is melee
SWEP.QuickMelee = false -- has quick melee attack
SWEP.MeleeDamagetype = DMG_SLASH
SWEP.MeleeTraceOffset = Vector(8, 0, 0)
SWEP.MeleeAttackTime = 0.4
SWEP.MeleeDamage = 20
SWEP.MeleeForce = 200

SWEP.MeleeBackstab = true
SWEP.MeleeBackstabDamage = 95

SWEP.AnimMeleeAttack = ACT_HL2MP_GESTURE_RANGE_ATTACK_KNIFE
SWEP.AnimMeleeAttackAimed = ACT_HL2MP_GESTURE_RANGE_ATTACK_MELEE

SWEP.HoldtypePassive = "normal"
SWEP.HoldtypeHip = "slam"
SWEP.HoldtypeSights = "pistol"

SWEP.SoundMelee = "weapons/knife/knife_slash2.wav"
SWEP.SoundMeleeHit = "physics/metal/metal_canister_impact_hard1.wav"
SWEP.SoundMeleeHitFlesh = "physics/body/body_medium_impact_hard5.wav"
SWEP.SoundMeleeHitBackstab = "physics/body/body_medium_break4.wav"
SWEP.SoundDraw = "act3/uni-draw.wav"