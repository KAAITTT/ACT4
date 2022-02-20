ENT.Type = "anim"
ENT.Base = "base_entity"
ENT.PrintName = "Thrown Case"
ENT.Author = ""
ENT.Information = ""
ENT.Spawnable = false
ENT.AdminSpawnable = false

ENT.Model = "models/shells/shell_556.mdl"
ENT.FuseTime = 3.5
ENT.ArmTime = 0
ENT.Sounds = ACT3.SHELLSOUNDSTABLE
ENT.ImpactFuse = false
ENT.Scale = 1

AddCSLuaFile()

if SERVER then

function ENT:Initialize()
    self:SetModel( self.Model )

    local pb_vert = 2 * self.Scale
    local pb_hor = 0.5 * self.Scale

    self:PhysicsInitBox(Vector(-pb_vert,-pb_hor,-pb_hor), Vector(pb_vert,pb_hor,pb_hor))
    self:SetCollisionBounds(Vector(-2 -2, -2), Vector(2, 2, 2))

    self:DrawShadow( true )

    local phys = self:GetPhysicsObject()

    if phys:IsValid() then
        phys:Wake()
        phys:SetBuoyancyRatio(0)
    end

    self.HitPitch = 90 + math.Rand(-5,5)
    self.SpawnTime = CurTime()
    self.Armed = true
end

function ENT:PhysicsCollide(data, physobj)
    sound.Play(self.Sounds[math.random(#self.Sounds)], self:GetPos(), 65, self.HitPitch, 1)

    if self.Armed then
        self.Armed = false
        for _, npc in pairs(ents.FindInSphere(self:GetPos(), 512)) do
            if !npc:IsNPC() then continue end

            npc:SetSaveValue( "m_vecLastPosition", self:GetPos() )
            npc:SetSchedule( SCHED_FORCED_GO )
        end
    end
end

function ENT:Think()
    if (self.SpawnTime + GetConVar("act3_mags_time"):GetInt()) <= CurTime() then
        self:Remove()
    end
end

end

function ENT:Draw()
    if CLIENT then
        self:DrawModel()
    end
end