
SWEP.LastEnterSightsTime = 0
SWEP.LastExitSightsTime = 0
SWEP.LastEnterHipfireTime = 0
SWEP.LastExitHipfireTime = 0
SWEP.StartEnterHipfireTime = 0

function SWEP:EnterHipfire()
    if self.State == ACT3_STATE_INHIPFIRE then return end
    if self:Disabled() then return end

    self.LastEnterHipfireTime = CurTime()
    self.StartEnterHipfireTime = CurTime()

    self.State = ACT3_STATE_INHIPFIRE
    self:SetShouldHoldType()

    self:UpdateZoom()
end

function SWEP:ExitHipfire()
    if self.State != ACT3_STATE_INHIPFIRE then return end
    if self:Disabled() then return end

    self.LastExitHipfireTime = CurTime()

    self.State = ACT3_STATE_IDLE
    self:SetShouldHoldType()

    self:UpdateZoom()
end

function SWEP:UpdateZoom()
    if SERVER then return end

    time = time or self.AimTime

    if self.State == ACT3_STATE_INSIGHTS then
        self:SetFOV(90 / self.Magnification)
    else
        self:SetFOV(0)
    end
end

SWEP.CurrentFOV = 90
SWEP.ApproachFOV = 90
SWEP.ApproachAmount = 90

function SWEP:SetFOV(amt)
    self.ApproachFOV = amt
end

function SWEP:GetFOV()
    return self.CurrentFOV
end

function SWEP:TranslateFOV(fov)
    if self.Magnification == 1 then return fov end

    if self.State != ACT3_STATE_INSIGHTS then
        self.ApproachFOV = fov
    end
    self.CurrentFOV = math.Approach(self.CurrentFOV, self.ApproachFOV, self.ApproachAmount * self:DeltaTime())
    return self.CurrentFOV
end

function SWEP:EnterSights()
    if self.State == ACT3_STATE_INSIGHTS then return end
    if self:Disabled() then return end

    self.LastEnterSightsTime = CurTime()
    self.StartEnterHipfireTime = CurTime()

    if self.SoundEnterAim then
        self:EmitSound(self.SoundEnterAim, 65, 100, 1, CHAN_ITEM)
    end

    self.State = ACT3_STATE_INSIGHTS
    self:SetShouldHoldType()

    self:UpdateZoom()
end

function SWEP:ExitSights()
    if self.State != ACT3_STATE_INSIGHTS then return end
    if self:Disabled() then return end

    self.LastExitSightsTime = CurTime()
    self.LastEnterHipfireTime = CurTime()

    if self.SoundExitAim then
        self:EmitSound(self.SoundExitAim, 65, 100, 1, CHAN_ITEM)
    end

    self.FF_LastSoughtTime = CurTime()
    self.FF_Target = nil

    self.State = ACT3_STATE_INHIPFIRE
    self:SetShouldHoldType()

    self:UpdateZoom()
end

function SWEP:EnterSprint()
    if self.State == ACT3_STATE_INSPRINT then return end

    self.State = ACT3_STATE_INSPRINT
    self:SetShouldHoldType()

    self:UpdateZoom()
end

function SWEP:ExitSprint()
    if self.State != ACT3_STATE_INSPRINT then return end

    self.State = ACT3_STATE_IDLE
    self:SetShouldHoldType()

    self:UpdateZoom()
end

function SWEP:InSights()
    if self.State != ACT3_STATE_INSIGHTS then return false end

    return true
end

function SWEP:InScope()
    if !self:InSights() then return false end
    if !self.TrueScopeImage then return false end

    return true
end