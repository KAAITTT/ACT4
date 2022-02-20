ENT.Type 				= "anim"
ENT.Base 				= "base_entity"
ENT.PrintName 			= "Bazooka HEAT"
ENT.Author 				= ""
ENT.Information 		= ""

ENT.Spawnable 			= false


AddCSLuaFile()

ENT.Model = "models/weapons/act3/rocket_bazooka.mdl"
ENT.FuseTime = 30
ENT.ArmTime = 0.25
ENT.TrackingAngle = 0.75
ENT.Ticks = 0
ENT.ACT3Projectile = true

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

    self.MotorSound = CreateSound( self, "weapons/rpg/rocket1.wav")
    self.MotorSound:Play()
end

function ENT:OnRemove()
    self.MotorSound:Stop()
end

end

local images_muzzle = {"effects/muzzleflash1", "effects/muzzleflash2", "effects/muzzleflash3", "effects/muzzleflash4"}

local function TableRandomChoice(tbl)
    return tbl[math.random(#tbl)]
end

function ENT:Think()
    if CLIENT then
        if self.Ticks % 5 == 0 then
            local emitter = ParticleEmitter(self:GetPos())

            if !self:IsValid() or self:WaterLevel() > 2 then return end

            local smoke = emitter:Add("particle/particle_smokegrenade", self:GetPos())
            smoke:SetVelocity( VectorRand() * 25 )
            smoke:SetGravity( Vector(math.Rand(-5, 5), math.Rand(-5, 5), math.Rand(-20, -25)) )
            smoke:SetDieTime( math.Rand(2.0, 2.5) )
            smoke:SetStartAlpha( 255 )
            smoke:SetEndAlpha( 0 )
            smoke:SetStartSize( 0 )
            smoke:SetEndSize( 125 )
            smoke:SetRoll( math.Rand(-180, 180) )
            smoke:SetRollDelta( math.Rand(-0.2,0.2) )
            smoke:SetColor( 20, 20, 20 )
            smoke:SetAirResistance( 5 )
            smoke:SetPos( self:GetPos() )
            smoke:SetLighting( false )
            emitter:Finish()
        end

        local emitter = ParticleEmitter(self:GetPos())

        local fire = emitter:Add(TableRandomChoice(images_muzzle), self:GetPos())
        fire:SetVelocity((self:GetAngles() + Angle(0, -90, 0)):Forward() * -1000)
        fire:SetDieTime(0.2)
        fire:SetStartAlpha(255)
        fire:SetEndAlpha(0)
        fire:SetStartSize(16)
        fire:SetEndSize(0)
        fire:SetRoll( math.Rand(-180, 180) )
        fire:SetColor(255, 255, 255)
        fire:SetPos(self:GetPos())

        emitter:Finish()

        self.Ticks = self.Ticks + 1

    end
end

function ENT:Detonate()
    if !self:IsValid() then return end

    ACT3_SmokeExplosion(self:GetPos())

    self:Remove()
end

function ENT:PhysicsCollide(colData, collider)
    self:Detonate()
end

function ENT:Draw()
    self:DrawModel()
end