local case = {}

case.Sounds = ACT3.SHELLSOUNDSTABLE
case.Pitch = 90
case.Scale = 1.5
case.Model = "models/shells/shell_57.mdl"
case.Material = nil

case.SpawnTime = 0

function case:Init(data)

    if !IsValid(data:GetEntity()) then return end

    if GetConVar("act3_shell_disable"):GetBool() then return end

    local wpn = data:GetEntity()
    if !IsValid(wpn) then return end
    local ply = wpn:GetOwner()
    if !IsValid(ply) then return end
    if !wpn.ACT3Weapon then return end

    local pos, ang = wpn:GetEjectPos()
    dir = ang:Forward()
    ang = ply:EyeAngles()

    self:SetPos(pos)
    self:SetModel(self.Model)
    self:SetModelScale(self.Scale)
    self:DrawShadow(true)
    self:SetAngles(ang)

    if self.Material then
        self:SetMaterial(self.Material)
    end

    local pb_vert = 2 * self.Scale
    local pb_hor = 0.5 * self.Scale

    self:PhysicsInitBox(Vector(-pb_vert,-pb_hor,-pb_hor), Vector(pb_vert,pb_hor,pb_hor))

    self:SetCollisionGroup(COLLISION_GROUP_INTERACTIVE_DEBRIS)
    self:SetCollisionBounds(Vector(-2 -2, -2), Vector(2, 2, 2))

    local phys = self:GetPhysicsObject()

    phys:Wake()
    phys:SetDamping(0, 5)
    phys:SetMaterial("act3_case_bouncy")

    phys:SetVelocity((dir * data:GetMagnitude() * math.Rand(1, 2)) + ply:GetAbsVelocity())
    phys:AddAngleVelocity(VectorRand() * 400)

    self.HitPitch = self.Pitch + math.Rand(-5,5)

    self.SpawnTime = CurTime()
end

function case:PhysicsCollide()
    sound.Play(self.Sounds[math.random(#self.Sounds)], self.Entity:GetPos(), 65, self.HitPitch, 1)
end

function case:Think()
    if GetConVar("act3_shell_disable"):GetBool() then return end
    if (self.SpawnTime + GetConVar("act3_shelltime"):GetInt() - 1) <= CurTime() then
        self:SetRenderFX( kRenderFxFadeFast )
        if (self.SpawnTime + GetConVar("act3_shelltime"):GetInt()) <= CurTime() then
            return false
        end
    end
    return true
end

function case:Render()
    if GetConVar("act3_shell_disable"):GetBool() then return end
    self.Entity:DrawModel()
end

function ACT3_RegisterCustomShell(name, model, pitch, sounds, scale, material)
    if SERVER then return end

    local eff = table.Copy(case)

    eff.Model = model
    eff.Pitch = pitch or 100
    eff.Sounds = sounds or ACT3.SHELLSOUNDSTABLE
    eff.Scale = scale or 1
    eff.Material = material or nil

    effects.Register(eff, name)
end

ACT3_RegisterCustomShell("act3_case_9x19", "models/shells/shell_9mm.mdl", 105, ACT3.SHELLSOUNDSTABLE, 1)

ACT3_RegisterCustomShell("act3_case_22lr", "models/shells/shell_9mm.mdl", 115, ACT3.SHELLSOUNDSTABLE, 0.65)

ACT3_RegisterCustomShell("act3_case_45acp", "models/shells/shell_9mm.mdl", 102, ACT3.SHELLSOUNDSTABLE, 1.2)

ACT3_RegisterCustomShell("act3_case_44mag", "models/shells/shell_9mm.mdl", 100, ACT3.SHELLSOUNDSTABLE, 1.3)

ACT3_RegisterCustomShell("act3_case_50ae", "models/shells/shell_9mm.mdl", 97, ACT3.SHELLSOUNDSTABLE, 1.4)

ACT3_RegisterCustomShell("act3_case_762x39", "models/shells/shell_57.mdl", 90, ACT3.SHELLSOUNDSTABLE, 1.5)

ACT3_RegisterCustomShell("act3_case_57x28", "models/shells/shell_57.mdl", 100, ACT3.SHELLSOUNDSTABLE, 1)

ACT3_RegisterCustomShell("act3_case_338lm", "models/shells/shell_338mag.mdl", 82, ACT3.SHELLSOUNDSTABLE, 1)

ACT3_RegisterCustomShell("act3_case_50bmg", "models/shells/shell_338mag.mdl", 60, ACT3.SHELLSOUNDSTABLE, 1.5)

ACT3_RegisterCustomShell("act3_case_13x92tuf", "models/shells/shell_338mag.mdl", 57, ACT3.SHELLSOUNDSTABLE, 1.55)

ACT3_RegisterCustomShell("act3_case_762x51", "models/shells/shell_762nato.mdl", 85, ACT3.SHELLSOUNDSTABLE, 1.5)

ACT3_RegisterCustomShell("act3_case_3006", "models/shells/shell_762nato.mdl", 83, ACT3.SHELLSOUNDSTABLE, 1.6)

ACT3_RegisterCustomShell("act3_case_556x45", "models/shells/shell_556.mdl", 87, ACT3.SHELLSOUNDSTABLE, 1.25)

ACT3_RegisterCustomShell("act3_case_25mm", "models/shells/shell_9mm.mdl", 60, ACT3.SHELLSOUNDSTABLE, 4)

ACT3_RegisterCustomShell("act3_case_12g_buck", "models/shells/shell_12gauge.mdl", 100, ACT3.SHELLSOUNDSTABLE_SHOTGUN, 1.5)

ACT3_RegisterCustomShell("act3_case_12g_bird", "models/shells/shell_12gauge.mdl", 100, ACT3.SHELLSOUNDSTABLE_SHOTGUN, 1.5, "models/shells/shell_12g_birdshot")

ACT3_RegisterCustomShell("act3_case_12g_slug", "models/shells/shell_12gauge.mdl", 100, ACT3.SHELLSOUNDSTABLE_SHOTGUN, 1.5, "models/shells/shell_12g_slug")

ACT3_RegisterCustomShell("act3_case_12g_flec", "models/shells/shell_12gauge.mdl", 100, ACT3.SHELLSOUNDSTABLE_SHOTGUN, 1.5, "models/shells/shell_12g_flec")

ACT3_RegisterCustomShell("act3_case_12g_bean", "models/shells/shell_12gauge.mdl", 100, ACT3.SHELLSOUNDSTABLE_SHOTGUN, 1.5, "models/shells/shell_12g_bean")

ACT3_RegisterCustomShell("act3_case_12g_expl", "models/shells/shell_12gauge.mdl", 100, ACT3.SHELLSOUNDSTABLE_SHOTGUN, 1.5, "models/shells/shell_12g_expl")

ACT3_RegisterCustomShell("act3_case_12g_magnum", "models/shells/shell_12gauge.mdl", 100, ACT3.SHELLSOUNDSTABLE_SHOTGUN, 1.5, "models/shells/shell_12g_magnum")

ACT3_RegisterCustomShell("act3_case_40mm", "models/weapons/act3/m203_case.mdl", 50, ACT3.SHELLSOUNDSTABLE, 1)