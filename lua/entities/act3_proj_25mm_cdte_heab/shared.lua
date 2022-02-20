ENT.Type 				= "anim"
ENT.Base 				= "base_entity"
ENT.PrintName 			= "25mm HEAB Round"
ENT.Author 				= ""
ENT.Information 		= ""

ENT.Spawnable 			= false


AddCSLuaFile()

ENT.Model = "models/projectiles/m203_projectile.mdl"
ENT.Ticks = 0

if SERVER then

function ENT:Initialize()
    self:SetModel(self.Model)
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)

    self:SetMaterial("models/projectiles/40mm_he")

    local pb_vert = 1
    local pb_hor = 1

    self:PhysicsInitBox( Vector(-pb_vert,-pb_hor,-pb_hor), Vector(pb_vert,pb_hor,pb_hor) )

    local phys = self:GetPhysicsObject()
    if phys:IsValid() then
        phys:Wake()
        phys:SetBuoyancyRatio(0)
        phys:SetMass(1)
        phys:EnableDrag(false)
        phys:AddAngleVelocity( Angle(0, 90, 0):Forward() * 3000 )
        phys:EnableGravity(false)
    end

    self.Armed = true

    self.SpawnTime = CurTime()

    if self.DataForProjectiles then
        self.FuseTime = self.DataForProjectiles.time
    else
        self.FuseTime = 10
    end

    timer.Simple(self.FuseTime, function()
        if !self:IsValid() then return end

        self:Detonate()

        -- print((self:GetPos() - self.Owner:EyePos()):Length() * ACT3.Conversions.HutoM)

    end)
end

else

function ENT:Think()
    if self.Ticks % 1 == 0 then
        local emitter = ParticleEmitter(self:GetPos())

        if !self:IsValid() or self:WaterLevel() > 2 then return end

        local smoke = emitter:Add("particle/particle_smokegrenade", self:GetPos())
        smoke:SetVelocity( self:GetAngles():Forward() * 100 )
        smoke:SetGravity( Vector(math.Rand(-5, 5), math.Rand(-5, 5), math.Rand(-20, -25)) )
        smoke:SetDieTime( math.Rand(0.5, 1) )
        smoke:SetStartAlpha( 255 )
        smoke:SetEndAlpha( 0 )
        smoke:SetStartSize( 0 )
        smoke:SetEndSize( 50 )
        smoke:SetRoll( math.Rand(-180, 180) )
        smoke:SetRollDelta( math.Rand(-0.2,0.2) )
        smoke:SetColor( 20, 20, 20 )
        smoke:SetAirResistance( 5 )
        smoke:SetPos( self:GetPos() )
        smoke:SetLighting( false )
        emitter:Finish()
    end

    self.Ticks = self.Ticks + 1
end

end

function ENT:Detonate()
    if !self:IsValid() then return end
    local effectdata = EffectData()
        effectdata:SetOrigin( self:GetPos() )

    if self:WaterLevel() >= 1 then
        util.Effect( "WaterSurfaceExplosion", effectdata )
        self:EmitSound("weapons/underwater_explode3.wav", 125, 100, 1, CHAN_AUTO)
    else
        util.Effect( "act3_rocketexplosion", effectdata)
        self:EmitSound("phx/explode02.wav", 125, 100, 1, CHAN_AUTO)
    end

    local attacker = self

    if self.Owner:IsValid() then
        attacker = self.Owner
    end

    util.BlastDamage(self, attacker, self:GetPos(), 512, 75)

    self:FireBullets({
        Attacker = attacker,
        Damage = 0,
        Tracer = 0,
        Distance = 20000,
        Dir = (self:GetAngles() - Angle(0, 90, 0)):Forward(),
        Src = self:GetPos(),
        Callback = function(att, tr, dmg)
            util.Decal("Scorch", tr.StartPos, tr.HitPos - (tr.HitNormal * 16), self)
        end
    })

    self:Remove()
end

function ENT:PhysicsCollide(colData, collider)
    self:Detonate()
end

function ENT:Draw()
    self:DrawModel()
end