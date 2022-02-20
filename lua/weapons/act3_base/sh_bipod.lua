function SWEP:CanBipod()
    local maxs = Vector(2, 2, 2)
    local mins = Vector(-2, -2, -2)

    local pos = self.Owner:EyePos()
    local angle = self.Owner:EyeAngles()

    if self.State != ACT3_STATE_INSIGHTS then
        return false
    end

    if !self.BipodInstalled then
        return false
    end

    if self.InBipod then
        if self.EnteredBipodPos != self.Owner:EyePos() then
            return false
        end
    end

    if self.Owner:GetVelocity():Length() > 0 then
        return false
    end

    local p = angle.p

    if math.abs(p) >= 60 then return end

    local rangemult = 2

    if self:IsProne() then
        rangemult = 2.5
    end

    local tr = util.TraceLine({
        start = pos,
        endpos = pos + (angle:Forward() * 48 * rangemult),
        filter = self.Owner,
        mask = MASK_SOLID
    })

    if tr.Hit then -- check for stuff in front of us
        return false
    end

    maxs = Vector(8, 8, 0)
    mins = Vector(-8, -8, -16)

    angle.p = angle.p + 15

    tr = util.TraceHull({
        start = pos,
        endpos = pos + (angle:Forward() * 24 * rangemult),
        filter = self.Owner,
        maxs = maxs,
        mins = mins,
        mask = MASK_SOLID
    })

    if tr.Hit then
        return true
    else
        return false
    end
end

function SWEP:EnterBipod()
    if self:CanBipod() and !self.InBipod then
        self.InBipod = true
        self.EnteredBipodPos = self.Owner:EyePos()
        self.BipodPos = self.Owner:EyePos() + (self.Owner:EyeAngles():Forward() * 6) + (self.Owner:EyeAngles():Up() * -3)
        self.EnteredBipodTime = CurTime()
        self:EmitSound(self.SoundEnterBipod, 75, 100, 1, CHAN_ITEM)
        self:SetShouldHoldType()
    end
end

function SWEP:ExitBipod()
    if !self:CanBipod() and self.InBipod then
        self.InBipod = false
        self.ExitedBipodTime = CurTime()
        self:EmitSound(self.SoundExitBipod, 75, 100, 1, CHAN_ITEM)
        self:SetShouldHoldType()
    end
end