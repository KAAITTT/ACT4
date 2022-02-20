ENT.Type 				= "anim"
ENT.Base 				= "base_entity"
ENT.PrintName 			= "Bean Bag"
ENT.Author 				= ""
ENT.Information 		= ""

ENT.Spawnable 			= false


AddCSLuaFile()

ENT.Model = "models/projectiles/beanbag.mdl"

local beanbagcolors = {
    Color(255, 0, 0),
    Color(0, 255, 0),
    Color(0, 0, 255),
    Color(255, 255, 255),
    Color(255, 255, 0)
}


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

    self:SetColor(beanbagcolors[math.random(#beanbagcolors)])

    self.SpawnTime = CurTime()
end

function ENT:PhysicsCollide(colData, collider)
    if !self.Armed then return end
    self.Armed = false

    if colData.HitEntity:Health() > 0 then

        local dmg = DamageInfo()

        dmg:SetReportedPosition(colData.HitPos)
        dmg:SetInflictor(self.Weapon)
        dmg:SetAttacker(self.Owner)
        dmg:SetDamage(5)
        dmg:SetDamageType(DMG_CRUSH)

        colData.HitEntity:TakeDamageInfo(dmg)

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