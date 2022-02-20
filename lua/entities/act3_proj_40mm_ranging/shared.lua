ENT.Type 				= "anim"
ENT.Base 				= "base_entity"
ENT.PrintName 			= "40mm Ranging Round"
ENT.Author 				= ""
ENT.Information 		= ""

ENT.Spawnable 			= false


AddCSLuaFile()

ENT.Model = "models/projectiles/m203_projectile.mdl"
ENT.Material = Material("effects/laser_tracer")

if SERVER then

function ENT:Initialize()
    self:SetModel(self.Model)
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)

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

function ENT:PhysicsCollide(colData, collider)

    if colData.HitEntity:Health() > 0 then

        local dmg = DamageInfo()

        dmg:SetReportedPosition(colData.HitPos)
        dmg:SetInflictor(self.Weapon)
        dmg:SetAttacker(self.Owner)
        dmg:SetDamage(45)
        dmg:SetDamageType(DMG_CRUSH)

        colData.HitEntity:TakeDamageInfo(dmg)

    end

    self:EmitSound("weapons/fx/rics/ric1.wav")
    self:Remove()
end

end

function ENT:Draw()
    local startpos = self:GetPos()
    local endpos = self:GetPos() + self:GetVelocity() * 0.25

    render.SetMaterial(self.Material)
    render.DrawBeam(startpos, endpos, 12, 0, 1, Color(255, 35, 74))

    return false
end