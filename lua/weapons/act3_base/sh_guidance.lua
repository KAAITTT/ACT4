function SWEP:GetTrackingPoint()
    if self.Owner:IsNPC() then
        if self.Owner:GetEnemy() and self.Owner:GetEnemy():IsValid() then
            return self.Owner:GetEnemy():WorldSpaceCenter()
        end
    end

    if !self.LightsOn then return nil end
    if self.State != ACT3_STATE_INSIGHTS then return nil end

    if self.TrackingType == ACT3_TRACK_TYPE_NONE then
        return nil
    elseif self.TrackingType == ACT3_TRACK_TYPE_SACLOS then

        local ltr = util.TraceLine({
            start = self.Owner:EyePos(),
            endpos = self.Owner:EyePos() + (self:GetShootAng():Forward() * self.TrackingRange),
            mask = MASK_SHOT,
            filter = self.Owner
        })

        return ltr.HitPos
    elseif self.TrackingType == ACT3_TRACK_TYPE_FF then
        if self.FF_Locked then
            return self.FF_Target:WorldSpaceCenter()
        end
    end

end

function SWEP:GetIsValidFFTarget(ent)
    if !IsEntity(ent) then return false end
    if !(ent:IsNPC() or ent:GetClass() == "prop_physics" or ent:IsScripted()) then return false end
    if string.sub(ent:GetClass(), 1, 3) == "env" then return false end
    if ent:IsWeapon() then return false end
    if ent.ACT3Projectile then return false end
    return true
end

function SWEP:GetFFTarget()
    local targettable = ents.FindInSphere(self.Owner:EyePos(), self.FFSeek_Range)

    local target = nil
    local maxdp = self.FFSeek_AOA

    for i, k in pairs(targettable) do
        if !self:GetIsValidFFTarget(k) then continue end
        local dv = (k:WorldSpaceCenter() - self.Owner:EyePos()):GetNormalized()
        local dp = dv:Dot(self.Owner:EyeAngles():Forward())
        if dp > maxdp then
            target = k
            maxdp = dp
        end
    end

    return target
end