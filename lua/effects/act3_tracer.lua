EFFECT.Material = Material("particle/water/waterdrop_001a_refract")
EFFECT.Color = Color(255, 255, 255)
EFFECT.Width = 4

function EFFECT:Init(data)
    local quality = GetConVar("act3_effect_quality"):GetInt()

    local wpn = data:GetEntity()
    local bulletid = wpn.LastShotBullet

    if !bulletid then
        bulletid = ACT3_GetBulletID("556x45_fmj")
    end

    self.Bullet = ACT3_GetBullet(bulletid)
    if wpn.MuzzleVelocity then
        self.Speed = wpn.MuzzleVelocity * self.Bullet.MuzzleVelocityMult
    else
        self.Speed = 25000
    end
    self.EndPos = data:GetOrigin()

    if !wpn.GetMuzzlePos then
        self.DieTime = 0
        return
    end


    local mpos = wpn:GetMuzzlePos()

    if !mpos then self:Remove() return end

    self.TrueLength = (mpos - self.EndPos):Length()
    self.StartPos = wpn:GetMuzzlePos() + ((self.EndPos - wpn:GetMuzzlePos()):GetNormalized() * ACT3.BulletsMinDistance)

    if self.TrueLength <= ACT3.BulletsMinDistance then
        self.DieTime = 0
    end

    self.SpawnTime = CurTime()
    self.Length = (self.StartPos - self.EndPos):Length()
    self.DieTime = self.SpawnTime + (self.Length / self.Speed)
    self:SetRenderBoundsWS(self.StartPos, self.EndPos)
end

function EFFECT:Think()
    return self.DieTime > CurTime()
end

function EFFECT:Render()
    local bullet = self.Bullet

    local delta = (CurTime() - self.SpawnTime) / (self.DieTime - self.SpawnTime)
    local startbeampos = Lerp(delta, self.StartPos, self.EndPos)
    local endbeampos = Lerp(delta + (bullet.TracerLength / self.Length), self.StartPos, self.EndPos)

    local width = bullet.TracerWidth
    local headsize = bullet.TracerHeadSize

    if ACT3_InNightScope and bullet.Glow then
        width = width * 3
        headsize = headsize * 3
    end

    if bullet.TracerBody then
        render.SetMaterial(bullet.TracerBody)
        render.DrawSprite(endbeampos, headsize, headsize, bullet.TracerColor)
    end

    if bullet.TracerTail then
        render.SetMaterial(bullet.TracerTail)
        render.DrawBeam(startbeampos, endbeampos, width, bullet.TracerTPoint2, bullet.TracerTPoint1, bullet.TracerColor)
    end
end