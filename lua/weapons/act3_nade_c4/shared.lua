SWEP.Base = "act3_base_grenade"

SWEP.Spawnable = true
SWEP.AdminSpawnable = false
SWEP.PrintName = "High Explosive"
SWEP.Category = "ACT3 - Other"

SWEP.Desc_Country = "N/A"
SWEP.Desc_Manufacturer = "Phoenix Connection"
SWEP.Desc_Mechanism = "Composition 4 Explosive"
SWEP.Desc_Year = 1990
SWEP.Desc_Weight = 1.25 -- kg
SWEP.ACT3Cat = ACT3_CAT_GRENADE

SWEP.Slot = 4

SWEP.TraditionalWorldModel = true
SWEP.ViewModel = nil
SWEP.WorldModel = "models/weapons/w_c4.mdl"

SWEP.Projectile = "act3_thrown_c4"
SWEP.ProjectileAngles = Angle(0, 0, 0)

SWEP.ProjectileForce = 100
SWEP.ProjectileForceMax = 500
SWEP.ProjectileChargeTime = 2

SWEP.DataForProjectiles = {time = 5}

SWEP.CannotFiremodes = false
SWEP.Firemodes = {
    {
        CustomFiremode = "10 SEC",
        EquipFunc = function(wep)
            wep.DataForProjectiles = {time = 10}
        end,
        CustomBars = {
            [1] = true,
        }
    },
    {
        CustomFiremode = "20 SEC",
        EquipFunc = function(wep)
            wep.DataForProjectiles = {time = 20}
        end,
        CustomBars = {
            [1] = true,
            [2] = true,
        }
    },
    {
        CustomFiremode = "30 SEC",
        EquipFunc = function(wep)
            wep.DataForProjectiles = {time = 30}
        end,
        CustomBars = {
            [1] = true,
            [2] = true,
            [3] = true,
        }
    },
    {
        CustomFiremode = "40 SEC",
        EquipFunc = function(wep)
            wep.DataForProjectiles = {time = 40}
        end,
        CustomBars = {
            [1] = true,
            [2] = true,
            [3] = true,
            [4] = true,
        }
    },
    {
        CustomFiremode = "50 SEC",
        EquipFunc = function(wep)
            wep.DataForProjectiles = {time = 50}
        end,
        CustomBars = {
            [1] = true,
            [2] = true,
            [3] = true,
            [4] = true,
            [5] = true,
        }
    }
}
SWEP.CustomFiremode = "15 SEC"
SWEP.SoundChangeFiremode = "weapons/c4/c4_click.wav"
SWEP.SoundPrime = ""