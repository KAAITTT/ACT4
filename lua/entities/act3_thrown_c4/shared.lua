ENT.Type = "anim"
ENT.Base = "base_entity"
ENT.PrintName = "High Explosive"
ENT.Author = ""
ENT.Information = ""
ENT.Spawnable = false
ENT.AdminSpawnable = false

ENT.Model = "models/weapons/w_c4.mdl"
ENT.FuseTime = 15
ENT.ArmTime = 0
ENT.ImpactFuse = false

AddCSLuaFile()

function ENT:Initialize()
    if SERVER then
        if self.DataForProjectiles then
            self.FuseTime = self.DataForProjectiles.time
        end

        self:SetModel( self.Model )
        self:SetMoveType( MOVETYPE_VPHYSICS )
        self:SetSolid( SOLID_VPHYSICS )
        self:PhysicsInit( SOLID_VPHYSICS )
        self:DrawShadow( true )

        local phys = self:GetPhysicsObject()
        if phys:IsValid() then
            phys:Wake()
            phys:SetBuoyancyRatio(0)
        end

        self.kt = CurTime() + self.FuseTime
        self.at = CurTime() + self.ArmTime
        self.NextBeepTime = CurTime()
    end
end

function ENT:PhysicsCollide(data, physobj)
    if SERVER then
        if data.Speed > 75 then
            self:EmitSound(Sound("physics/cardboard/cardboard_box_impact_hard" .. math.random(1,7) .. ".wav"))
        elseif data.Speed > 25 then
            self:EmitSound(Sound("physics/cardboard/cardboard_box_impact_soft" .. math.random(1,7) .. ".wav"))
        end

        if self.at <= CurTime() and self.ImpactFuse then
            self:Detonate()
        end
    end
end

function ENT:Think()
    if SERVER then
        if CurTime() >= self.kt then
            self:Detonate()
        end

        if CurTime() >= self.NextBeepTime then
            self:EmitSound("weapons/c4/c4_beep1.wav", 90, 100, 0.5, CHAN_AUTO)
            self.NextBeepTime = CurTime() + 1
        end
    end
end

function ENT:Detonate()
    if SERVER then
        if not self:IsValid() then return end
        local effectdata = EffectData()
            effectdata:SetOrigin( self:GetPos() )

        util.Effect( "act3_highexplosion", effectdata)

        local attacker = self

        if self.Owner:IsValid() then
            attacker = self.Owner
        end

        self:EmitSound("weapons/c4/c4_explode1.wav", 150, 100, 1, CHAN_AUTO)
        util.BlastDamage(self, attacker, self:GetPos(), 1024, 150)

        self:Remove()

    end
end

function ENT:Use( activator, caller )
    self:EmitSound("weapons/c4/c4_disarm.wav")
    self:Remove()
end

function ENT:Draw()
    if CLIENT then
        self:DrawModel()
    end
end