ENT.Type 				= "anim"
ENT.Base 				= "base_entity"
ENT.PrintName 			= "Base Ground Attachment"
ENT.Author 				= ""
ENT.Information 		= ""

ENT.Spawnable 			= false

ENT.Category			= "ACT3 - Attachments"

AddCSLuaFile()

ENT.GiveAttachments = {} -- table of all the attachments to give, and in what quantity. {{["id"] = int quantity}}

ENT.SoundImpact = "weapon.ImpactSoft"

if SERVER then

function ENT:Initialize()
    self:SetModel("models/weapons/act3/ammopack.mdl")
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

    for i, k in pairs(self.GiveAttachments) do
        if i == "BaseClass" then continue end
        caller:ACT3_NWGiveAttachments(i, k)
    end

    self:EmitSound("items/itempickup.wav")
    self:Remove()
end

end

function ENT:Draw()
    self:DrawModel()
end
