ENT.Type = "anim"
ENT.Base = "base_entity"
ENT.PrintName = "Smoke Cloud"
ENT.Author = ""
ENT.Information = ""
ENT.Spawnable = false
ENT.AdminSpawnable = false

ENT.Particles = nil
ENT.BillowTime = ACT3.BillowTime
ENT.Life = ACT3.SmokeTime
ENT.ACT3SmokeCloud = true

AddCSLuaFile()

function ENT:Initialize()
    if SERVER then
        self:SetModel( "models/weapons/w_eq_smokegrenade_thrown.mdl" )
        self:SetMoveType( MOVETYPE_NONE )
        self:SetSolid( SOLID_NONE )
        self:DrawShadow( false )
    else
        local emitter = ParticleEmitter(self:GetPos())

        self.Particles = {}

        for i = 1, 10 do
            local smoke = emitter:Add(ACT3_GetSmokeImage(), self:GetPos())
            smoke:SetVelocity( VectorRand() * 256 )
            smoke:SetDieTime( self.BillowTime )
            smoke:SetStartAlpha( 0 )
            smoke:SetEndAlpha( 255 )
            smoke:SetStartSize( 0 )
            smoke:SetEndSize( ACT3.SmokeRadius )
            smoke:SetRoll( math.Rand(-180, 180) )
            smoke:SetRollDelta( math.Rand(-0.2,0.2) )
            smoke:SetColor( ACT3.SmokeColor.r, ACT3.SmokeColor.g, ACT3.SmokeColor.b )
            smoke:SetAirResistance( 75 )
            smoke:SetPos( self:GetPos() )
            smoke:SetCollide( true )
            smoke:SetBounce( 0.2 )
            smoke:SetLighting( false )
            smoke:SetNextThink( CurTime() + FrameTime() )
            smoke:SetThinkFunction( function(pa)
                if !pa then return end

                local d = pa:GetLifeTime() / pa:GetDieTime()

                local prog = (-d ^ 2) + (2 * d)

                pa:SetEndSize( ACT3.SmokeRadius * prog )
                pa:SetStartSize( ACT3.SmokeRadius * prog )
                pa:SetNextThink( CurTime() + FrameTime() )
            end )

            table.insert(self.Particles, smoke)
        end

        emitter:Finish()
    end

    self:EmitSound("weapons/smokegrenade/sg_explode.wav")

    self.bt = CurTime() + self.BillowTime
    self.billowed = false
    self.dt = CurTime() + self.Life + self.BillowTime
end

function ENT:Think()

    if SERVER then
        local targets = ents.FindInSphere(self:GetPos(), 256)
        for _, k in pairs(targets) do
            if k:IsNPC() then
                k:SetNPCState(NPC_STATE_PRONE)
            end
        end
    end

    if self.bt < CurTime() and !self.billowed then
        self.billowed = true
        if CLIENT then
            for i, k in pairs(self.Particles) do
                if !k then continue end
                k:SetThinkFunction( function() end )
                k:SetLifeTime( 0 )
                k:SetDieTime( self.Life )
                k:SetStartAlpha( 255 )
            end
        end
    end

    if self.dt < CurTime() then
        if CLIENT then
            for i, k in pairs(self.Particles) do
                if !k then continue end
                k:SetLifeTime( 0 )
                k:SetDieTime( math.Rand(2.5, 5) )
                k:SetEndAlpha( 0 )
            end
        else
            self:Remove()
        end
    end
end

function ENT:Draw()
    return false
end