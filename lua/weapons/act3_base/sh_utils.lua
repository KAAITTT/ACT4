-- Shared utilities

function SWEP:SanityCheck()
    if !IsValid(self) or !IsValid(self.Owner) then
        return false
    end
    return true
end

function SWEP:Disabled()
    return self.DisableStates[self.State]
end

function SWEP:GetHoldHipfireTime()
    return GetConVar("act3_hipfiretime"):GetFloat()
end

function SWEP:GetCamAngles()
    if CLIENT then
        return ACT3_RelativeCamAngles
    else
        return Angle(0, 0, 0)
    end
end

function SWEP:SetCamAngles(ang)
    ACT3_RelativeCamAngles = ang
end

function SWEP:InvDisabled()
    return self.DisableInvStates[self.State]
end

function SWEP:ReloadDisabled()
    return self.DisableReloadStates[self.State]
end

function SWEP:IsSprintingRobust()
    local speed = self.Owner:GetVelocity():Length()

    if !self.Owner:KeyDown(IN_SPEED) then return false end
    if !self.Owner:OnGround() then return false end
    if speed <= 10 then return false end

    return true
end

function SWEP:IsAiming()
    return self.InAimStates[self.State]
end

function SWEP:InScope()
    if self.State == ACT3_STATE_INSIGHTS and self.TrueScopeImage then
        return true
    else
        return false
    end
end

function SWEP:IsProne()
    if PRONE_INPRONE then
        return self.Owner:IsProne()
    else
        return false
    end
end

function SWEP:InProneTransition()
    if PRONE_INPRONE then
        return self.Owner:ProneIsGettingUp() or self.Owner:ProneIsGettingDown()
    else
        return false
    end
end

function SWEP:ClientOrSP()
    return (CLIENT and IsFirstTimePredicted()) or game.SinglePlayer()
end

function SWEP:InitTimers()
    self.ActiveTimers = {} -- {{time, callback}}
end

function SWEP:SetTimer(time, callback, id)
    id = id or ""
    table.insert(self.ActiveTimers, {time + CurTime(), id, callback})
end

function SWEP:KillTimer(id)
    local mfr = {}
    for k, v in pairs(self.ActiveTimers) do
        if v[2] == id then
            table.insert(mfr, k)
        end
    end

    for k, v in pairs(mfr) do
        table.remove(self.ActiveTimers, v)
    end
end

function SWEP:KillTimers()
    self.ActiveTimers = {}
end

function SWEP:ProcessTimers()
    local ct = CurTime()

    for k, v in pairs(self.ActiveTimers) do
        if v[1] <= ct then
            v[3]()
            table.remove(self.ActiveTimers, k)
        end
    end
end

function SWEP:IsValid()
    return true
end

function SWEP:PlaySoundTable(soundtable, id)
    if CLIENT and game.SinglePlayer() then return end
    id = id or ""
    for k, v in pairs(soundtable) do

        local pitch = 100
        local vol = 75

        if v.pitch then
            pitch = v.pitch
        end

        if v.vol then
            vol = v.vol
        end

        if isnumber(v.time) then
            if v.time < 0 then continue end
            if self.Owner:IsNPC() then
                timer.Simple(v.time, function()
                    if !IsValid(self) then return end
                    if !IsValid(self.Owner) then return end
                    self:EmitSound(v.path, vol, pitch, 1, CHAN_ITEM)
                end)
            else
                self:SetTimer(v.time, function() self:EmitSound(v.path, vol, pitch, 1, CHAN_ITEM) end, id)
            end
        end
    end
end

function SWEP:BeingOvertaken()
    return self.Owner:ShouldDrawLocalPlayer() or LocalPlayer() != self.Owner
end

function SWEP:ShouldDrawVM()
    if CLIENT then
        if ((self.State == ACT3_STATE_INSIGHTS or self.State == ACT3_STATE_INBIPOD) and GetConVar("act3_trueirons_enabled"):GetBool()) and !self:BeingOvertaken() then
            return true
        else
            return false
        end
    else
        return false
    end
end

function SWEP:DeltaTime()
    if self:ClientOrSP() then
        return FrameTime()
    else
        return engine.TickInterval()
    end
end

function SWEP:ShouldDrawCrosshair()
    if self.State == ACT3_STATE_INHIPFIRE then
        return true
    elseif self.State == ACT3_STATE_INSIGHTS then
        if GetConVar("act3_trueirons_enabled"):GetBool() then
            return false
        else
            return true
        end
    else
        return false
    end
end