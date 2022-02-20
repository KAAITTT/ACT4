ENT.Type = "anim"
ENT.Base = "base_entity"
ENT.PrintName = "Knife"
ENT.Author = ""
ENT.Information = ""
ENT.Spawnable = false
ENT.AdminSpawnable = false

ENT.Model = "models/weapons/w_knife_t.mdl"

AddCSLuaFile()

function ENT:Initialize()
    if SERVER then
        self:SetModel( self.Model )
        self:SetMoveType( MOVETYPE_VPHYSICS )
        self:SetSolid( SOLID_VPHYSICS )
        self:PhysicsInit( SOLID_VPHYSICS )
        self:SetCollisionGroup( COLLISION_GROUP_PROJECTILE )
        self:DrawShadow( true )

        local phys = self:GetPhysicsObject()
        if phys:IsValid() then
            phys:Wake()
            phys:SetBuoyancyRatio(0)
        end

        self.dt = CurTime() + 15

    end
end

function ENT:PhysicsCollide(data, physobj)
    if SERVER then
        if data.HitEntity:GetClass() == "worldspawn" then
            self:SetMoveType( MOVETYPE_NONE )
            self:SetAngles( data.OurOldVelocity:Angle() + Angle(90, 0, 0) )
            self:SetPos( data.HitPos - (data.HitNormal * 8) )
            self:EmitSound( "weapons/knife/knife_hitwall1.wav" )
            self.dt = CurTime() + 5
        else
            self:EmitSound( "weapons/knife/knife_hit1.wav" )
            local damage = DamageInfo()
            damage:SetAttacker( self.Owner )
            damage:SetDamage( 50 )
            damage:SetDamageType( DMG_SLASH )
            damage:SetInflictor( self )
            damage:SetReportedPosition( data.HitPos )
            damage:SetDamagePosition( data.HitPos )
            data.HitEntity:TakeDamageInfo( damage )
            self:Remove()
        end
    end
end



function ENT:Think()
    if SERVER then
        if CurTime() >= self.dt then
            self:Remove()
        end
    end
end

function ENT:Draw()
    if CLIENT then
        self:DrawModel()
    end
end