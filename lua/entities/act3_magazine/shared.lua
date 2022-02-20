ENT.Type 				= "anim"
ENT.Base 				= "base_entity"
ENT.PrintName 			= "Base Magazine"
ENT.Author 				= ""
ENT.Information 		= ""

ENT.Spawnable 			= false

ENT.Category			= "ACT3 - Magazines"

AddCSLuaFile()

ENT.Full = true
ENT.Empty = false
ENT.Fresh = true

ENT.DefaultLoad = nil
ENT.MagazineTable = { -- this is the weapon's default magazine, this will be automatically given if the setting act3_instantaction is enabled
    Type = "akm_30",
    Rounds = {}, -- the actual bulletids that make up the ammo in the magazine
}

ENT.SoundEmpty = "weapon.ImpactHard"
ENT.SoundFull = "weapon.ImpactSoft"

if SERVER then

function ENT:Initialize()
    local magtype = ACT3_GetMagazineType(self.MagazineTable.Type)
    self:SetModel(magtype.Model)
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    self:SetCollisionGroup(COLLISION_GROUP_WEAPON)
    self:SetTrigger( true )
    self:SetPos(self:GetPos() + Vector(0, 0, 4))
    self:SetSkin(magtype.Skin or 0)

    if self.Full and magtype.FullBodygroups then
        for i, k in pairs(magtype.FullBodygroups) do
            self:SetBodygroup(i, k)
        end
    end

    if !self.Empty and !self.Full and magtype.PartialBodygroups then
        for i, k in pairs(magtype.PartialBodygroups) do
            self:SetBodygroup(i, k)
        end
    end

    if self.Empty and magtype.EmptyBodygroups then
        for i, k in pairs(magtype.EmptyBodygroups) do
            self:SetBodygroup(i, k)
        end
    end

    local phys = self:GetPhysicsObject()
    if phys:IsValid() then
        phys:Wake()
        phys:SetBuoyancyRatio(0)
    end

    self.MagazineTable = table.Copy(self.MagazineTable)

    if (GetConVar("act3_mags_defaultload"):GetBool() or magtype.Disposable) and self.Fresh and self.DefaultLoad then
        local bullet = ACT3_GetBulletID(self.DefaultLoad)

        for i = 1, magtype.MagSize do
            if !bullet then break end
            self.MagazineTable.Rounds[i] = bullet
        end
    end

    self.SpawnTime = CurTime()
end

function ENT:Think()
    if self.Full then return end -- can't despawn when we're full of ammo
    local dietime = self.SpawnTime + GetConVar("act3_mags_time"):GetInt()

    if dietime <= CurTime() then
        self:Remove()
    end
end

function ENT:PhysicsCollide(colData, collider)
    if colData.DeltaTime < 0.1 then return end

    if self.Empty then
        self:EmitSound(self.SoundEmpty)
    else
        self:EmitSound(self.SoundFull)
    end
end

function ENT:Use( activator, caller )
    local magtype = ACT3_GetMagazineType(self.MagazineTable.Type)
    if (GetConVar("act3_mags_nonreloadable"):GetBool() or magtype.Disposable) and self.Empty then return end
    if caller:ACT3_CanHoldMagazine(magtype.Slots) then
        caller:ACT3_GiveMagazine(self.MagazineTable)
        self:EmitSound("items/itempickup.wav")
        self:Remove()
    end
end

end

function ENT:Draw()
    self:DrawModel()
end
