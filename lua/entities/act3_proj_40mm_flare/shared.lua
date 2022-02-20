ENT.Type 				= "anim"
ENT.Base 				= "base_entity"
ENT.PrintName 			= "40mm Flare"
ENT.Author 				= ""
ENT.Information 		= ""

ENT.Spawnable 			= false


AddCSLuaFile()

ENT.Model = "models/Items/Flare.mdl"
ENT.Material = Material("particle/particle_glow_04")
ENT.Color = Color(255, 50, 50)
ENT.Time = 15
ENT.Ticks = 0

function ENT:Initialize()
    if SERVER then
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
        self.FSound = CreateSound(self, "weapons/flaregun/burn.wav")
        self.FSound:FadeOut(self.Time)
        self.FSound:ChangePitch(50, self.Time)
    end

    self.SpawnTime = CurTime()
end

function ENT:Think()
    if CLIENT then
        if self.Ticks % 5 == 0 then

            local delta = 1 - ((CurTime() - self.SpawnTime) / self.Time)
            local emitter = ParticleEmitter(self:GetPos())

            if !self:IsValid() or self:WaterLevel() > 2 then return end

            local smoke = emitter:Add("particle/particle_smokegrenade", self:GetPos())
            smoke:SetVelocity( VectorRand() * 25 )
            smoke:SetGravity( Vector(math.Rand(-5, 5), math.Rand(-5, 5), math.Rand(-30, -55)) )
            smoke:SetDieTime( math.Rand(1.5, 2.0) * delta )
            smoke:SetStartAlpha( 255 )
            smoke:SetEndAlpha( 0 )
            smoke:SetStartSize( 0 )
            smoke:SetEndSize( 100 * delta )
            smoke:SetRoll( math.Rand(-180, 180) )
            smoke:SetRollDelta( math.Rand(-0.2,0.2) )
            smoke:SetColor( 255, 50, 50 )
            smoke:SetAirResistance( 5 )
            smoke:SetPos( self:GetPos() )
            smoke:SetLighting( false )
            emitter:Finish()
        end

        self.Ticks = self.Ticks + 1
    else
        if self.SpawnTime + self.Time <= CurTime() then
            self:Remove()
        end
    end
end

function ENT:OnRemove()
    if SERVER then
        self.FSound:Stop()
    end
end

function ENT:Draw()
    local startpos = self:GetPos()
    local delta = 1 - ((CurTime() - self.SpawnTime) / self.Time)

    cam.Start3D()
        render.SetMaterial(self.Material)
        render.DrawSprite(startpos, math.Rand(100, 150) * delta, math.Rand(100, 150) * delta, self.Color)
    cam.End3D()

    local dlight = DynamicLight(self:EntIndex())
    dlight.r = self.Color.r
    dlight.g = self.Color.g
    dlight.b = self.Color.b
    dlight.minlight = 0
    dlight.style = 0
    dlight.Brightness = 3 * delta
    dlight.Pos = self:GetPos()
    dlight.Size = 2048 * delta
    dlight.Decay = 25000
    dlight.DieTime = CurTime() + (FrameTime() * 2)

    return false
end