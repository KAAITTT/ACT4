ENT.Type 				= "anim"
ENT.Base 				= "base_entity"
ENT.PrintName 			= "Ammo Pack"
ENT.Author 				= ""
ENT.Information 		= ""

ENT.Spawnable 			= false

ENT.Category			= "ACT3 - Loose Ammo"

AddCSLuaFile()

ENT.Model = "models/weapons/act3/ammopack.mdl"

ENT.GiveBullets = {} -- table of all the bullets to give, and in what quantity. {{["name"] = int quantity}}

ENT.SoundImpact = "weapon.ImpactSoft"

if SERVER then

function ENT:Initialize()
    self:SetModel(self.Model)
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    self:SetCollisionGroup(COLLISION_GROUP_WEAPON)
    self:SetTrigger( true )
    self:SetPos(self:GetPos() + Vector(0, 0, 4))

    local phys = self:GetPhysicsObject()
    if phys:IsValid() then
        phys:Wake()
        phys:SetBuoyancyRatio(0)
    end
end

function ENT:PhysicsCollide(colData, collider)
    if colData.DeltaTime < 0.25 then return end

    self:EmitSound(self.SoundImpact)
end

function ENT:Use( activator, caller )
    if !caller:IsPlayer() then return end

    for i, k in pairs(self.GiveBullets) do
        if i == "BaseClass" then continue end
        caller:ACT3_NWGiveBullets(i, k)
    end

    self:EmitSound("items/itempickup.wav")
    self:Remove()
end

end

function ENT:Draw()
    self:DrawModel()
end
