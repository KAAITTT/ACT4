ENT.Type 				= "anim"
ENT.Base 				= "base_entity"
ENT.PrintName 			= "Soda Can"
ENT.Author 				= ""
ENT.Information 		= ""

ENT.Spawnable 			= false


AddCSLuaFile()

ENT.Model = "models/props_junk/PopCan01a.mdl"


if SERVER then

function ENT:Initialize()
    self:SetModel(self.Model)
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    self:SetCollisionGroup(COLLISION_GROUP_NONE)
    self:SetPhysicsAttacker(self.Owner, 60)

    local phys = self:GetPhysicsObject()
    if phys:IsValid() then
        phys:Wake()
        phys:SetBuoyancyRatio(0)
        phys:SetMass(1)
    end

    self.Armed = true

    self:SetSkin(math.random(0, 2))

    self.SpawnTime = CurTime()
end

function ENT:PhysicsCollide(data, collider)
    if !self.Armed then return end
    self.Armed = false

    if data.HitEntity:Health() > 0 then

        local dmg = DamageInfo()

        dmg:SetReportedPosition(data.HitPos)
        dmg:SetInflictor(self.Weapon)
        dmg:SetAttacker(self.Owner)
        dmg:SetDamage(5)
        dmg:SetDamageType(DMG_CRUSH)

        data.HitEntity:TakeDamageInfo(dmg)

    end

    if data.DeltaTime < 0.25 then return end
    if data.Speed > 75 then
        self:EmitSound(Sound("physics/metal/soda_can_impact_hard" .. math.random(1,3) .. ".wav"))
    elseif data.Speed > 25 then
        self:EmitSound(Sound("physics/metal/soda_can_impact_soft" .. math.random(1,3) .. ".wav"))
    end
end

function ENT:Think()
    local dietime = self.SpawnTime + GetConVar("act3_serverdebris_time"):GetInt()

    if dietime <= CurTime() then
        self:Remove()
    end
end

end

function ENT:Draw()
    self:DrawModel()
end