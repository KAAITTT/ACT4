SWEP.Base = "act3_base_thingy"

SWEP.Spawnable = true
SWEP.AdminSpawnable = false
SWEP.PrintName = "Laser Pointer"
SWEP.Category = "ACT3 - Other"

SWEP.Desc_Country = "China"
SWEP.Desc_Manufacturer = "Shenzhen Laser Co. Ltd."
SWEP.Desc_Mechanism = "Laser Diode"
SWEP.Desc_Year = 2018
SWEP.Desc_Weight = 0.100 -- kg
SWEP.ACT3Cat = ACT3_CAT_MELEE
SWEP.Sidearm = true

SWEP.AttachmentBodygroups = {

}

SWEP.Slot = 0

SWEP.WorldModel = "models/weapons/act3/atts/att_laser.mdl"
SWEP.WorldModelBase = "" -- Worldmodel base of the weapon world model.
SWEP.WorldModelPos = Vector(0, 0, 0)
SWEP.WorldModelAng = Angle(0, 0, 0)

SWEP.WorldModelAttachments = {
    {
    model = "models/weapons/act3/atts/att_laser.mdl",
    bgs = "",
    skin = 0,
    pos = Vector(3.289, 1.81, -1.231),
    ang = Angle(0, -15, 0),
    renderfunc = function(pos, ang, ent, slotid, asvm)
        pos = pos + (ang:Forward() * 4) + (ang:Right() * -0.1)
        ACT3_DoLaser(pos, ang, ent, ent.LaserColor, asvm)
    end
    }
}

SWEP.LaserColor = Color(255, 50, 50)

SWEP.Firemodes = {
    {
        CustomFiremode = "RED",
        Safe = true,
        Network = true,
        EquipFunc = function(wep)
            wep.LaserColor = Color(255, 50, 50)
        end
    },
    {
        CustomFiremode = "GREEN",
        Safe = true,
        Network = true,
        EquipFunc = function(wep)
            wep.LaserColor = Color(50, 255, 50)
        end
    },
    {
        CustomFiremode = "BLUE",
        Safe = true,
        Network = true,
        EquipFunc = function(wep)
            wep.LaserColor = Color(50, 50, 255)
        end
    },
    {
        CustomFiremode = "IR",
        Safe = true,
        Network = true,
        EquipFunc = function(wep)
            wep.LaserColor = Color(0, 0, 0)
        end
    },
}

SWEP.CannotFiremodes = false

SWEP.CustomFiremode = "RED"

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