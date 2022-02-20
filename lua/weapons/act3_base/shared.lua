-- ACT3: Arctic's Customizable Thirdperson (Weapons) 3
-- Contact https://steamcommunity.com/id/ArcticWinterZzZ/
-- Follow the link in my description to the public Discord server, or start a discussion in the ACT3 workshop page.

-- If you wish to make a weapon on this base, please do not include its code. This way you won't need to roll new changes in.
-- Remember that this isn't necessarily the best code! Please, if you want to learn from it, don't treat this as gospel!

SWEP.State = ACT3_STATE_IDLE

SWEP.ReloadTimeTable = {
    [ACT_HL2MP_GESTURE_RELOAD_AR2] = 2,
    [ACT_HL2MP_GESTURE_RELOAD_SMG1] = 2,
    [ACT_HL2MP_GESTURE_RELOAD_PISTOL] = 1.5,
    [ACT_HL2MP_GESTURE_RELOAD_REVOLVER] = 2.5,
    [ACT_HL2MP_GESTURE_RELOAD_SHOTGUN] = 2.5,
    [ACT_HL2MP_GESTURE_RELOAD_DUEL] = 3.25,
}

SWEP.InAimStates = {
    [ACT3_STATE_INHIPFIRE] = true,
    [ACT3_STATE_INSIGHTS] = true,
    [ACT3_STATE_PRIMED] = true,
    [ACT3_STATE_SWING] = true
}

SWEP.DisableStates = {
    [ACT3_STATE_RELOAD] = true,
    [ACT3_STATE_ININVMENU] = true,
    [ACT3_STATE_DISABLE] = true,
    [ACT3_STATE_SWING] = true,
    [ACT3_STATE_INSPRINT] = true,
    [ACT3_STATE_PRONETRANSITION] = true,
    [ACT3_STATE_PRIMED] = true,
    [ACT3_STATE_SWING] = true
}

SWEP.DisableInvStates = {
    [ACT3_STATE_RELOAD] = true,
    [ACT3_STATE_DISABLE] = true,
    [ACT3_STATE_SWING] = true,
    [ACT3_STATE_INSPRINT] = true,
    [ACT3_STATE_INSIGHTS] = true,
    [ACT3_STATE_PRONETRANSITION] = true,
    [ACT3_STATE_PRIMED] = true,
}

SWEP.DisableReloadStates = {
    [ACT3_STATE_RELOAD] = true,
    [ACT3_STATE_DISABLE] = true,
    [ACT3_STATE_SWING] = true,
    [ACT3_STATE_INSPRINT] = true,
    [ACT3_STATE_INSIGHTS] = false,
    [ACT3_STATE_PRONETRANSITION] = true,
    [ACT3_STATE_PRIMED] = true,
    [ACT3_STATE_SWING] = true
}

SWEP.CanShootStates = {
    [ACT3_STATE_INSIGHTS] = true,
    [ACT3_STATE_INHIPFIRE] = true,
    [ACT3_STATE_PRIMED] = true,
    [ACT3_STATE_INBIPOD] = true
}

SWEP.SlowStates = {
    [ACT3_STATE_INSIGHTS] = true,
    [ACT3_STATE_ININVMENU] = true,
    [ACT3_STATE_PRIMED] = true
}

-- only stuff below this line usually matters

SWEP.Spawnable = false
SWEP.AdminOnly = false

SWEP.PrintName = "" -- weapon's name

SWEP.Desc_Country = "" -- this stuff is just flavour text
SWEP.Desc_Manufacturer = ""
SWEP.Desc_Mechanism = ""
SWEP.Desc_Year = 2018
SWEP.Desc_Weight = 0 -- kg
SWEP.ACT3Cat = ACT3_CAT_BATTLE -- category system for other mods. Does nothing. See /lua/act3/shared/enums_config.lua for complete list.
SWEP.Sidearm = false -- Does nothing. In theory this should say whether a weapon is a sidearm or not.

SWEP.Slot = 3

SWEP.TraditionalWorldModel = false -- whether to use the "traditional" view models
SWEP.WorldModel = "models/weapons/flare.mdl" -- Weapon's traditional world model.
SWEP.ViewModel = nil -- ahahahahahahahahahahahahahahahahahahHAHAHHAAHAHAHHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAH

SWEP.WorldModelBase = "" -- Worldmodel base of the weapon world model.
SWEP.WorldModelPos = Vector(0, 0, 0)
SWEP.WorldModelAng = Angle(0, 0, 0)
SWEP.WorldModelBodygroups = "" -- Sets the bodygroups of the world model.
SWEP.WorldModelSkin = 0 -- Set the skin of the world model.
SWEP.WorldModelAttachments = {} -- default extra models like SCK

SWEP.MuzzleOffset = Vector(0, 0, 0) -- Vector of the weapon muzzle relative to hand.
SWEP.MuzzleAngle = Angle(0, 0, 0)
SWEP.NewMuzzleOffset = nil -- Vector the weapon muzzle relative to the gun base.

SWEP.ShootAngleOffset = Angle(0, 0, 0) -- Angle to offset the direction the bullet comes out at.

SWEP.EjectPos = Vector(0, 0, 0) -- position to eject shell at relative to base
SWEP.EjectAng = Angle(0, 0, 0) -- angle of shell. A bit weird. Play with this a little to get it where you want.

SWEP.MagazineOffsetPos = Vector(0, 0, 0) -- position relative to base to place magazine
SWEP.MagazineOffsetAng = Angle(0, 0, 0) -- see above
SWEP.MagazineDropOffsetPos = Vector(0, 0, 0)


SWEP.AttachmentBodygroups = { -- bodygroups that can be used by the attachment system. Use act3_generatebgs while looking at a model to generate a complete table.
    ["ak_barrel_long"] = {ind = 2, bg = 2}
}

SWEP.Attachments = {
    [""] = { -- needs unique ID
        Pos = Vector(0, 0, 0), -- position offset for attachments in this slot
        Ang = Vector(0, 0, 0), -- angle offset
        Type = "", -- type of attachments this slot can take
        ExtraTypes = {}, -- list of attachments that can also be applied.
        PrintName = "", -- name this slot shows
        Installed = nil, -- which attachment is actually installed in this slot
        Required = true, -- whether something MUST be attached in this slot; weapon MUST come with default attachments with this slot filled in
        Scale = 1, -- scale applied to attachments in this slot
        Randomize = false, -- this slot can receive a random attachment when this weapon is spawned on to an NPC.
        RandomizeChance = 25, -- chance to receive said attachment
        RandomizeWhitelist = {}, -- this is a full list of attachments this slot can receive
    }
}

SWEP.SaveBase = nil -- if set this designates this weapon to share saves with anything else that has that class/savebase

SWEP.DefaultAttachments = {} -- {{["slot"] = "attid"}} the gun will spawn with these attachments attached.
SWEP.DefaultAttachmentsOrdered = {} -- {[0] = {"slot", "attid"}} the gun will spawn these attachments in order.

SWEP.AttachmentFlags = {} -- flags the gun has. You can put things here by default.

SWEP.TrueIronsPos = Vector(0, 0, 0) -- self explanatory
SWEP.TrueIronsAng = Vector(0, 0, 0)

SWEP.EyeReliefExtra = 0 -- how much extra eye relief to give
SWEP.EyeRelief = 0 -- moves the gun away from the camera this amount. Generally autocalculated.

SWEP.MuzzleElev = 0
SWEP.MuzzleElevExtra = 0 -- similar but for the muzzle

SWEP.SightedAimPos = Vector(0, 0, 0) -- for when a sight is attached. Calibrate with calibration tool. Other sights will have an offset.
SWEP.SightedAimAng = Vector(0, 0, 0)

SWEP.ZeroIronMinPos = Vector(0, 0, 0) -- for sight func zeroing, see M203
SWEP.ZeroIronMinAng = Vector(0, 0, 0)
SWEP.ZeroIronMaxPos = Vector(0, 0, 0)
SWEP.ZeroIronMaxAng = Vector(0, 0, 0)
SWEP.ZeroIncrements = 0

SWEP.SightInstalled = false -- makes the gun use sighted aim pos

-- sights and scopes

SWEP.Magnification = 1

SWEP.NightScope = false
SWEP.NightScopeColor = Color(0, 255, 0)
SWEP.NightScopeActiveNVStrength = 12000
SWEP.NightScopeContrast = 3
SWEP.NightScopeMaxContrast = 3
SWEP.NightScopeIncrements = 8

SWEP.TrueScopeImage = false
SWEP.TrueScopeBlackbox = true
SWEP.TrueScopeNoComp = false
SWEP.TrueScopeLighting = false

SWEP.HolosightImage = nil
SWEP.HolosightColor = Color(255, 255, 255)
SWEP.HolosightSize = 64
SWEP.HolosightTable = {
    {Image = nil,
    Color = Color(255, 255, 255),
    Size = 64}
}

SWEP.MaxZoom = 1
SWEP.MinZoom = 1
SWEP.ZoomIncrements = 1

SWEP.ScrollFunc = ACT3_FUNC_NOTHING -- see cl_scrollfunc.lua for implemented scroll funcs
SWEP.NetworkScoll = false -- whether the scroll should be networked or not. Necessary if it actually does something. See: CDTE.

SWEP.UseTrueIrons = true

SWEP.LowPos = Vector(4.623, 18.693, -13.266) -- weapon is brought up from this position/angle.
SWEP.LowAng = Vector(-25.327, -11.256, 14.069)

SWEP.SightAboveBore = 3 -- offsets the shooting position from the camera position.


SWEP.DamageMult = 1 -- the weapon's main stats are just taken from the bullet
SWEP.DistanceMult = 1 -- multiplies effective range by this much

SWEP.ShootingDelay = 60 / 600 -- delay of shooting. 60 / RPM.

SWEP.Recoil = 1 -- self explanatory
SWEP.RecoilAngles = 45 -- Maximum angle for recoil. 0 = straight up. 90 = very shaky and jumpy.

SWEP.BlowbackAmount = 0.4 -- for procedural VM blowback to make it look nicer.
SWEP.BlowbackRecovery = 3
SWEP.BlowbackMax = 2
SWEP.RollBlowbackAmount = 5
SWEP.RollBlowbackRecovery = 15
SWEP.RollBlowbackMax = 45

SWEP.HeatAccumulation = 10 -- Out of 100, the amount of heat each shot adds to the weapon
SWEP.HeatDissipation = 100 -- Amount of heat dissipated per second

SWEP.Precision = 1 / 500
SWEP.MaxHeatPrecision = 1 / 100

SWEP.HipfirePenalty = 0 -- Deviation applied on hip fire
SWEP.MaxHeatHipfirePenalty = 0

SWEP.MaxMovePenalty = 0 -- dispersion applied on move
SWEP.DispersionInSights = false

SWEP.Sway = 1 -- amount this weapon will sway in sights
SWEP.VisualSway = 0 -- visual sway for model

SWEP.ReloadSoundsTable = {
    /*
    {
        time = 0.1, -- delay after reload to play sound
        path = "weapons/ak47/ak47_clipout.wav", -- path to sound file
        comp = ACT3_STPART_MAGEJECT -- only these three enums and nil are acceptable
    },
    {
        time = 1.0,
        path = "weapons/ak47/ak47_clipin.wav",
        comp = ACT3_STPART_MAGLOAD -- for eject/load/rack bolt.
    },
    {
        time = 1.45,
        path = "weapons/ak47/ak47_boltpull.wav",
        comp = ACT3_STPART_EMPTYRACK
    },
    */
}

-- bullet stuff

SWEP.SightedSpeedMult = 0.9 -- speed mult to apply when in sights

SWEP.ChamberedRound = nil -- int bullettypeid
SWEP.OpenBolt = false -- this weapon will not chamber a round to fire. Instead, it will take rounds directly from the magazine. Examples of such weapons include revolvers and open bolt guns.
SWEP.InternalMag = true -- whether this weapon uses detachable magazines or loads rounds directly into the weapon

SWEP.DoesNotReload = false -- this weapon cannot be reloaded

SWEP.DefaultLoad = "762x39_fmj" -- the round that this gun will be loaded with by default
SWEP.DefaultMagazine = { -- this is the weapon's default magazine, this will be automatically given if the setting act3_instantaction is enabled
    Type = "akm_30",
    Rounds = {}, -- the actual bulletids that make up the ammo in the magazine
}
SWEP.Magazine = nil -- currently loaded mag.
-- set only for weapons with Internal Magazine.

SWEP.MagazineType = "akm" -- type of mag the gun can accept
SWEP.MagazineVisible = true -- whether the magazine can be seen on the body of the weapon
SWEP.MagazineScale = 1 -- scale of the magazine
SWEP.MagazineDisintegrates = false -- whether the magazine will automatically eject after it runs out
SWEP.InfiniteAmmo = false -- the feed mechanism is shaped like an infinity symbol.

SWEP.InternalWeapon = false -- the weapon is treated as a combination weapon-ammo unit; e.g. M72 LAW, knife, grenade
-- an internal weapon cannot be reloaded. It can only use its default magazine, filled with its default load.

SWEP.BulletAffectsBodygroups = nil

-- SWEP.BulletAffectsBodygroups = { -- allows the loading of certain bullet types to influence enabling certain bodygroups on the gun. Index key corresponds to 1st round, 2nd round, etc.
-- -- chamber is index 0.
-- -- first bullet in magazine is index 1.
--     [1] = {
--         ["rpg7_heat"] = {"rocket_heat"},
--         ["rpg7_ogv"] = {"rocket_ogv"}
--     }
-- }

/*

-- set key to "" for any other round type.

SWEP.BulletAffectsBodygroups = {
    [1] = {[""] = {"bullet1"}},
    [2] = {[""] = {"bullet2"}},
    ...
}
*/

-- while reloading, these bodygroups will be active. They take precedence over all other bodygroups.
-- uses attachment bodygroups.
-- SWEP.ReloadAffectsBodygroups = {
--     "slide_lock",
--     "thing_2"
-- }

SWEP.Calibre = "" -- type of ammo this gun can take. Useful for mags that hold multiple types of ammo.

SWEP.PrintCalibre = "" -- calibre to show on stats pages.
SWEP.PostReloadDelay = 0.25 -- Time after reload to still prohibit doing stuff
SWEP.ReloadTimeOverride = 1 -- reload time to use for any animation not covered by the table
SWEP.ReloadTimeMult = 1

SWEP.MuzzleVelocity = 15000 -- self explanatory.

SWEP.CustomBullet = nil -- the custom bullet. Shoot this instead of the magazine round. Don't think this works.

-- bipod

SWEP.BipodInstalled = false -- self explanatory.


-- crosshair

SWEP.DisableCrosshair = false -- self explanatory.
SWEP.CrosshairSizeMult = 1


-- tracking module

SWEP.TrackingRange = 100000 -- range this weapon can track up to.
SWEP.TrackingType = ACT3_TRACK_TYPE_NONE -- can be either ACT3_TRACK_TYPE_NONE or ACT3_TRACK_TYPE_SACLOS. SACLOS provides laser-following guidance.
-- Guidance is not automatic. It must be applied to projectile.
-- See ATXA2 rockets.
SWEP.FFSeek_Range = 100000 -- Maximum range the fire and forget seeker can pick up at
SWEP.FFSeek_AOA = 0.975 -- "Angle of Attack"; angle at which fire and forget seeker can pick up targets
SWEP.FFSeek_LockTime = 4 -- Time needed to lock on to a target
SWEP.FF_Smartgun = false -- Gun automatically aims at locked target

-- Shell effect is unnecessary since they are taken from "bullets"
SWEP.ShellDelay = 0 -- self explanatory.
SWEP.RevolverEject = false -- whether this weapon ejects shells when reloading instead of after each shot
SWEP.RevolverEjectPerRound = false -- single action revolver style reloads
SWEP.ShellCatcher = false -- true will disable shell ejects

SWEP.MuzzleEffect = "act3_muzzleeffect" -- self explanatory
SWEP.Suppressed = false -- no muzzle flash, use suppressed sound
SWEP.FlashHidden = false -- also no muzzle flash
SWEP.Subsonic = false -- won't get a crack

SWEP.UBGL = false -- no underbarrel grenade launcher installed
SWEP.UBGL_ReloadSoundsTable = {}
SWEP.UBGL_Recoil = 0
SWEP.UBGL_BlowbackAmount = 4
SWEP.UBGL_Automatic = false
SWEP.UBGL_Bullet = "40mm_he" -- which bullet type the UBGL fires.
SWEP.UBGL_MagazineSize = 1
SWEP.UBGL_SoundShoot = ""
SWEP.UBGL_EquipFunc = function(weapon) end
SWEP.UBGL_ResetFunc = function(weapon) end
SWEP.UBGL_AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_RPG
SWEP.UBGL_AnimReload = ACT_HL2MP_GESTURE_RELOAD_AR2
SWEP.UBGL_HoldtypeHip = "crossbow"
SWEP.UBGL_HoldtypeSights = "rpg"
SWEP.UBGL_Firemode = "UBGL M203"
SWEP.UBGL_FireDelay = 60 / 100
SWEP.UBGL_Precision = 0
SWEP.UBGL_Is_Melee = false -- UBGL will cause the melee attack
SWEP.UBGL_MuzzleVelocity = 10000

SWEP.SoundShoot = "" -- obvious
SWEP.SoundShootVol = 100
SWEP.SoundShootPitch = 100

SWEP.SoundBoltAction = "" -- obvious
SWEP.SoundBoltActionDelay = 0.5
SWEP.SoundBoltActionVol = 75
SWEP.SoundBoltActionPitch = 100

-- these should also all be obvious

SWEP.SoundLastShoot = ""
SWEP.SoundMelee = ""
SWEP.SoundMeleeHit = ""
SWEP.SoundMeleeHitFlesh = ""
SWEP.SoundDraw = ""
SWEP.SoundEnterBipod = "physics/metal/weapon_impact_soft3.wav"
SWEP.SoundExitBipod = "physics/metal/weapon_impact_soft2.wav"
SWEP.SoundEnterAim = "act3/uni-draw.wav"
SWEP.SoundExitAim = "act3/uni-holster.wav"
SWEP.SoundCycle = "weapons/ak47/ak47_boltpull.wav"
SWEP.SoundDryfire = "weapons/ar2/ar2_empty.wav"
SWEP.SoundChangeFiremode = "weapons/smg1/switch_single.wav"
SWEP.SoundPrime = "act3/pinpull.wav"


-- melee attacks

SWEP.PrimaryMelee = false -- primary attack is melee
SWEP.QuickMelee = false -- has quick melee attack
SWEP.MeleeDamagetype = DMG_SLASH -- damage type of melee attack
SWEP.MeleeTraceOffset = Vector(0, 0, 0) -- use act3_client_debug to see the actual trace line where the melee weapon can hit
SWEP.MeleeStartTraceOffset = Vector(0,0,0)
SWEP.MeleeDecal = "" -- decal the melee attack creates on hit. Don't think this one works.
SWEP.MeleeAttackTime = 0.25 -- time the melee attack swings for
SWEP.MeleeDamage = 16 -- self explanatory
SWEP.MeleeForce = 250 -- force the melee attack applies

SWEP.MeleeBackstab = true -- weapon can do melee backstab
SWEP.MeleeBackstabDamage = 125 -- how much damage that does



SWEP.Throwable = false -- weapon is throwable.



SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_PISTOL
SWEP.AnimReloadStartTime = 0 -- when the reload animation starts playing
SWEP.AnimReloadEndTime = nil -- and when it stops. Effectively overrides reload time.
SWEP.AnimReloadExtraTimeAtEnd = nil

SWEP.AnimReloadNoMagStartTime = 0
-- ONLY for shotgun reload
SWEP.AnimReload = ACT_HL2MP_GESTURE_RELOAD_PISTOL
SWEP.AnimReloadProne = ACT_HL2MP_GESTURE_RELOAD_PISTOL_PRONE
SWEP.AnimMeleeAttack = ACT_GMOD_GESTURE_MELEE_SHOVE_1HAND

SWEP.HoldtypePassive = "normal"
SWEP.HoldtypeHip = "pistol"
SWEP.HoldtypeSights = "revolver"
SWEP.HoldtypePrimed = "grenade"
SWEP.HoldtypeBipod = nil
SWEP.HoldtypeInv = nil

-- Available:
-- "pistol"
-- "smg"
-- "shotgun"
-- "rpg"
-- "ar2"
SWEP.HoldtypeNPC = nil

SWEP.AnimatedBones = { -- table to define animated bolt bones on the gun
    {
        bone = "",
        offset = Vector(0, 0, 0),
        angle = Angle(0, 0, 0)
    }
}

SWEP.AnimatedBones_LastShootBoltLock = false -- whether the gun's bolt locks back on the last shot, like on pistols.


SWEP.NPCUnusable = false -- Weapon cannot be used by NPCs.
SWEP.GiveToRebels = true
SWEP.GiveToCombine = true

SWEP.DefaultToggleable = false -- weapon by default has F toggleables

SWEP.FiremodeChangeAnim = nil
SWEP.Firemodes = {
    {
        Automatic = true,
        BurstLength = 0,
        FiremodeName = nil,
        CustomBars = nil,
        Safe = false,
        EquipFunc = nil,
        ResetFunc = nil,
        Bodygroups = nil, -- similar to attachment bodygroups
        RunAway = false, -- see SWEP.RunAwayBurst
        Network = false -- this firemode should be networked. Only if other players can visibly see the effects of this firemode, e.g. flashlight/laser
    }
} -- {{bool automatic, int burstlength, bool safe, table custombars or bool false, string name or false}}

-- unless your gun doesn't have firemodes don't set these variables
SWEP.CustomFiremode = false -- this is what shows up on the UI
SWEP.CustomBars = false -- {[1] = true, [2] = true...} : Display a custom set of bars on the HUD.
SWEP.RunAwayBurst = false -- gun will shoot burstlength shots with one trigger pull
SWEP.BurstLength = 0
SWEP.Automatic = false -- use this instead of changing SWEP.Primary.Automatic
SWEP.CannotCycle = false -- for whatever reason, disable the manual cycle functionality
SWEP.CannotFiremodes = false -- for whatever reason, disable firemode functionality

SWEP.ManualAction = false -- use the procedural animation system

SWEP.ManualActionDelay = 0
SWEP.ManualActionPos = Vector(0, 0, 0)
SWEP.ManualActionAng = Vector(0, 0, 0)

SWEP.AimTime = 0.25
SWEP.HoldHipfireTime = 2

SWEP.Shield_mmRHAe = 25 -- how many units of armor one unit of shield material counts as


-- dummy code
SWEP.Primary.ClipSize		= -1
SWEP.Primary.DefaultClip	= -1
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "none"

SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic	= true
SWEP.Secondary.Ammo			= "none"



-- do not modify
SWEP.Flashlights = {}
SWEP.Safe = false
SWEP.ACT3Weapon = true
SWEP.TriggerDown = false
SWEP.DrawCrosshair = false
SWEP.Heat = 0
SWEP.CurrentFiremode = 1
SWEP.FirstLoad = true
SWEP.MagazineIndex = nil
SWEP.PerformedSelfMagOperation = false
SWEP.RevolverShellTable = {}
SWEP.BurstCount = 0
SWEP.InBipod = false
SWEP.UBGL_Enabled = false
SWEP.UBGL_Rounds = 0
SWEP.DataForProjectile = {}
SWEP.BoltLockedBack = false

SWEP.LightsOn = true

if CLIENT or game.SinglePlayer() then

SWEP.FF_LastSoughtTime = math.huge
SWEP.RemainingRecoil = 0
SWEP.RecoilDir = 0
SWEP.Blowback = 0
SWEP.RollBlowback = 0
SWEP.LastBlowback = 0

SWEP.OnPrimeTime = 0

SWEP.Inv_Page = 1
SWEP.Inv_Select = 1
SWEP.Inv_Offset = 0
SWEP.Inv_Submenu = false
SWEP.Inv_Submenu_Select = 1
SWEP.Inv_Submenu_Offset = 0

SWEP.NextRealFire = 0

SWEP.ScrollPos = 0

SWEP.DrawWeaponInfoBox = false

end

AddCSLuaFile()

include("sh_scrollfunc.lua")
include("sh_npc.lua")
include("sh_utils.lua")
include("sh_holdtype.lua")
include("sh_firemodes.lua")
include("sh_move.lua")
include("sh_ubgl.lua")
include("sh_reload.lua")
include("sh_sights.lua")
include("sh_shootpos.lua")
include("sh_inv.lua")
include("sh_bipod.lua")
include("sh_melee.lua")
include("sh_bullet.lua")
include("sh_grenade.lua")
include("sh_attach.lua")
include("sh_think.lua")
include("sh_accessories.lua")
include("sh_shield.lua")
include("sh_deploy.lua")
include("sh_guidance.lua")
include("sh_anim.lua")
include( "ai_translations.lua" )
include( "sh_quickmelee.lua" )

AddCSLuaFile("sh_scrollfunc.lua")
AddCSLuaFile("sh_npc.lua")
AddCSLuaFile("sh_utils.lua")
AddCSLuaFile("sh_holdtype.lua")
AddCSLuaFile("sh_firemodes.lua")
AddCSLuaFile("sh_move.lua")
AddCSLuaFile("sh_ubgl.lua")
AddCSLuaFile("sh_reload.lua")
AddCSLuaFile("sh_sights.lua")
AddCSLuaFile("sh_shootpos.lua")
AddCSLuaFile("sh_inv.lua")
AddCSLuaFile("sh_bipod.lua")
AddCSLuaFile("sh_melee.lua")
AddCSLuaFile("sh_bullet.lua")
AddCSLuaFile("sh_grenade.lua")
AddCSLuaFile("sh_attach.lua")
AddCSLuaFile("sh_think.lua")
AddCSLuaFile("sh_accessories.lua")
AddCSLuaFile("sh_shield.lua")
AddCSLuaFile("sh_deploy.lua")
AddCSLuaFile("sh_guidance.lua")
AddCSLuaFile("sh_anim.lua")
AddCSLuaFile( "ai_translations.lua" )

AddCSLuaFile("cl_saves.lua")
AddCSLuaFile("cl_drawinv.lua")
AddCSLuaFile("cl_hud.lua")
AddCSLuaFile("cl_model.lua")

if CLIENT then
    include("cl_saves.lua")
    include("cl_drawinv.lua")
    include("cl_hud.lua")
    include("cl_model.lua")
end

function SWEP:SecondaryAttack()
    return
end