ENT.Type 				= "anim"
ENT.Base 				= "base_entity"
ENT.PrintName 			= "HE Slug"
ENT.Author 				= ""
ENT.Information 		= ""

ENT.Spawnable 			= false


AddCSLuaFile()

ENT.Model = "models/weapons/w_bullet.mdl"
ENT.Material = Material("effects/laser_tracer")

if SERVER then

function ENT:Initialize()
    self:SetModel(self.Model)
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    self:SetCollisionGroup(COLLISION_GROUP_PROJECTILE)

    local pb_vert = 1
    local pb_hor = 1

    self:PhysicsInitBox( Vector(-pb_vert,-pb_hor,-pb_hor), Vector(pb_vert,pb_hor,pb_hor) )

    local phys = self:GetPhysicsObject()
    if phys:IsValid() then
        phys:Wake()
        phys:SetBuoyancyRatio(0)
        phys:SetMass(1)
    end

    self.Armed = true

    self.SpawnTime = CurTime()
end

end

function ENT:Detonate()
    if !self:IsValid() then return end
    local effectdata = EffectData()
        effectdata:SetOrigin( self:GetPos() )

    if self:WaterLevel() >= 1 then
        util.Effect( "WaterSurfaceExplosion", effectdata )
    else
        util.Effect( "HelicopterMegaBomb", effectdata)
    end

    util.BlastDamage(self.Weapon, self.Owner, self:GetPos(), 128, 20)

    self:EmitSound("weapons/explode3.wav", 110, 150, 1, CHAN_AUTO)

    self:Remove()
end

function ENT:PhysicsCollide(colData, collider)
    self:Detonate()
end

function ENT:Draw()
    local startpos = self:GetPos()
    local endpos = self:GetPos() + self:GetVelocity() * 0.1

    render.SetMaterial(self.Material)
    render.DrawBeam(startpos, endpos, 8, 0, 1, Color(255, 242, 216))
end