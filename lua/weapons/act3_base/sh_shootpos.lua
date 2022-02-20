SWEP.ShootPositions = {
    [ACT3_STATE_INSIGHTS] = Vector(0, 8, -14),
    [ACT3_STATE_INHIPFIRE] = Vector(0, 8, -24),
}

SWEP.ShootPositionsCrouch = {
    [ACT3_STATE_INSIGHTS] = Vector(0, 0, 0),
    [ACT3_STATE_INHIPFIRE] = Vector(0, 0, 0),
}

/*
function SWEP:GetSrcPos()
    local offset = Vector(0, 0, 0)
    local ang = self.Owner:EyeAngles()
    local shootpostable = self.ShootPositions

    if self.Owner:Crouching() then
        shootpostable = self.ShootPositionsCrouch
    end

    if shootpostable[self.State] then
        offset = shootpostable[self.State]
    end

    shootpos = self.Owner:EyePos()
    shootpos = shootpos + (ang:Right() * offset.x)
    shootpos = shootpos + (ang:Forward() * offset.y)
    shootpos = shootpos + (ang:Up() * offset.z)

    return shootpos
end
*/

function SWEP:GetHandPos()
    if !self.Owner or !IsValid(self.Owner) then
        return nil
    end
 
    local hand = self.Owner:LookupBone(ACT3.HandBone)
 
    local handpos = self.Owner:EyePos()
    local handang = self.Owner:EyeAngles()
 
    if hand then
        local matrix = self.Owner:GetBoneMatrix(hand)
        handpos = matrix:GetTranslation()
        handang = matrix:GetAngles()    
    end
 
    return handpos, handang
end

function SWEP:GetEjectPos()
    if !self.Owner or !IsValid(self.Owner) then
        return nil
    end
    if self:ShouldDrawVM() then
        local pos, ang = self:GetModelPositionInSights()

        local ejectpos = self.EjectPos + Vector(0, 0.5, 0)
        local ejectang = self.EjectAng - Angle(0, 90, 0)

        pos = pos + ang:Forward() * ejectpos.x
        pos = pos + ang:Right() * ejectpos.y
        pos = pos + ang:Up() * ejectpos.z

        ang:RotateAroundAxis(ang:Right(), ejectang.p)
        ang:RotateAroundAxis(ang:Up(), ejectang.y)
        ang:RotateAroundAxis(ang:Forward(), ejectang.r)

        return pos, ang
    else
        local pos, ang = self:GetHandPos()

        local ejectpos = self.EjectPos + self.WorldModelPos + Vector(0, -0.5, -5)
        local ejectang = self.EjectAng + Angle(0, 90, 0) + self.WorldModelAng

        pos = pos + ang:Forward() * ejectpos.x
        pos = pos + ang:Right() * -ejectpos.y
        pos = pos + ang:Up() * -ejectpos.z

        ang:RotateAroundAxis(ang:Right(), ejectang.p)
        ang:RotateAroundAxis(ang:Up(), ejectang.y)
        ang:RotateAroundAxis(ang:Forward(), ejectang.r)

        return pos, ang
    end
end

function SWEP:GetMuzzlePos()
    if !self.Owner or !IsValid(self.Owner) then
        return nil
    end

    if self:ShouldDrawVM() then
        local pos, ang = EyePos(), EyeAngles()
        local offset = Vector(0, 0, 0)

        offset.x = self.MuzzleOffset.x
        offset.y = 0
        offset.z = -2 - self.MuzzleElev

        if self.NewMuzzleOffset then
            offset.x = offset.x + self.NewMuzzleOffset.x
        end

        if self:InScope() then
            offset.x = 16
            offset.z = -8
        end

        pos = pos + (ang:Forward() * offset.x)
        pos = pos + (ang:Right() * offset.y)
        pos = pos + (ang:Up() * offset.z)

        return pos, ang
    else
        local pos, ang = self:GetHandPos()

        local offset = self.MuzzleOffset

        if self.NewMuzzleOffset then
            offset = self.NewMuzzleOffset + self.MuzzleOffset + self.WorldModelPos + Vector(0, -2.25, -7.5)
            local offangle = self.WorldModelAng

            ang:RotateAroundAxis(ang:Right(), offangle.p)
            ang:RotateAroundAxis(ang:Up(), offangle.y)
            ang:RotateAroundAxis(ang:Forward(), offangle.r)

            pos = pos + ang:Forward() * offset.x
            pos = pos + ang:Right() * offset.y
            pos = pos + ang:Up() * offset.z

            return pos, ang
        end

        pos = pos + (ang:Right() * offset.y)
        pos = pos + (ang:Forward() * offset.x)
        pos = pos + (ang:Up() * offset.z)

        ang = ang + self.MuzzleAngle

        return pos, ang
    end
end

function SWEP:GetTracerOrigin()
    local pos = self:GetMuzzlePos()
    return pos
end

function SWEP:GetBorePos()
    if !self.Owner or !IsValid(self.Owner) then
        return nil
    end

    local shootpos = self:GetMuzzlePos()

    local tr = util.TraceLine({
        start = self.Owner:EyePos(), -- it is assumed that the eyes are always a "safe" and valid position to shoot from
        endpos = shootpos,
        filter = self.Owner
    })

    shootpos = tr.HitPos

    if tr.Hit then
        shootpos = tr.HitPos + (tr.HitNormal * 4)
    end

    return shootpos
end

function SWEP:GetGrenadeSrcPos()
    if !self.Owner or !IsValid(self.Owner) then
        return nil
    end

    local handpos, handang = self:GetHandPos()

    local tr = util.TraceLine({
        start = self.Owner:EyePos(),
        endpos = handpos,
        filter = self.Owner
    })

    shootpos = tr.HitPos

    if tr.Hit then
        shootpos = tr.HitPos + (tr.HitNormal * 2)
    end

    return shootpos
end

function SWEP:GetShootAng()
    if !self.Owner or !IsValid(self.Owner) then
        return nil
    end

    if self.FF_Smartgun and self:GetFFTarget() then
        local p1 = self:GetHandPos()
        local p2 = self:GetFFTarget():WorldSpaceCenter()

        local dir = (p2 - p1):GetNormalized()
        local ang = dir:Angle()

        return ang
    end

    if GetConVar("act3_realangles"):GetBool() and (self.State != ACT3_STATE_INSIGHTS or !(GetConVar("act3_trueirons_enabled"):GetBool() and self.UseTrueIrons) and !(GetConVar("act3_truescopes_enabled"):GetBool() and self.TrueScopeImage)) then
        local pos, ang = self:GetHandPos()
        local hpang = ang

        ang:RotateAroundAxis(hpang:Right(), self.WorldModelAng.p)

        ang:RotateAroundAxis(hpang:Right(), self.ShootAngleOffset.y)
        ang:RotateAroundAxis(hpang:Forward(), self.ShootAngleOffset.r)
        ang:RotateAroundAxis(hpang:Up(), self.ShootAngleOffset.p)

        return ang
    end

    return self.Owner:EyeAngles()
end

function SWEP:GetSrcPos()
    local sab = self.SightAboveBore
    if GetConVar("act3_disable_sightabovebore"):GetBool() then
        sab = 0
    end
    if (GetConVar("act3_trueirons_enabled"):GetBool() and self.UseTrueIrons) and self.State == ACT3_STATE_INSIGHTS then
        return self.Owner:EyePos() - Vector(0, 0, sab)
    elseif (GetConVar("act3_truescopes_enabled"):GetBool() and self.TrueScopeImage) and self.State == ACT3_STATE_INSIGHTS then
        return self.Owner:EyePos() - Vector(0, 0, sab)
    elseif GetConVar("act3_useeyepos_outsights"):GetBool() and self.State != ACT3_STATE_INSIGHTS then
        return self.Owner:EyePos() - Vector(0, 0, sab)
    else
        return self:GetBorePos()
    end
end