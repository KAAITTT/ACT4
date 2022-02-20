function SWEP:Think()
    if !self:SanityCheck() then return end

    if self.FirstLoad then
        self:DoInitialize()
    end

    if CLIENT then
        local pt = GetConVar("prone_disabletransitions")

        if pt then
            pt:SetBool(true)
        end
    end

    if self:ClientOrSP() then
        if self.RemainingRecoil > 0 then
            local recoil_amt = self.RemainingRecoil * self:DeltaTime() * 10

            local xcomp = math.sin(math.rad(self.RecoilDir)) * recoil_amt
            local ycomp = math.cos(math.rad(self.RecoilDir)) * recoil_amt

            self:SetCamAngles( self:GetCamAngles() - Angle( xcomp, ycomp, 0 ) )
            self.RemainingRecoil = math.Clamp( self.RemainingRecoil - recoil_amt - 0.1, 0, 1000)
        end

        if self.Sway > 0 and self.State == ACT3_STATE_INSIGHTS then
            local sway_amt = self.Sway * self:DeltaTime() * GetConVar("act3_mult_sway"):GetFloat() * 0.25

            if self.Owner:Crouching() then
                sway_amt = sway_amt * 0.75
            end

            if self:IsProne() then
                sway_amt = sway_amt * 0.5
            end

            if self.InBipod then
                sway_amt = 0
            end

            local xcomp = math.sin(CurTime() * ACT3.SwayPeriodX) * sway_amt
            local ycomp = math.cos(CurTime() * ACT3.SwayPeriodY) * sway_amt

            self:SetCamAngles( self:GetCamAngles() - Angle( xcomp, ycomp, 0 ) )
        end

        if self.Blowback > 0 or math.abs(self.RollBlowback) > 0 then
            local blowback_amt = self:DeltaTime() * self.BlowbackRecovery
            local rollblowback_amt = self:DeltaTime() * self.RollBlowbackRecovery * self.RollBlowback
            self.Blowback = math.Clamp(self.Blowback - blowback_amt, 0, self.BlowbackMax)
            self.RollBlowback = math.Clamp( self.RollBlowback - rollblowback_amt, -self.RollBlowbackMax, self.RollBlowbackMax)
        end
    end

    if self.Heat > 0 then
        self.Heat = math.Approach(self.Heat, 0, self:DeltaTime() * self.HeatDissipation * 0.25)
    end

    if !self:Disabled() then

        if self:IsSprintingRobust() then
            self:EnterSprint()
        end

        if ((self.Owner:KeyDown(IN_ATTACK) or GetConVar("act3_alwaysactive"):GetBool()) and !self.Safe) and self.State != ACT3_STATE_INSIGHTS then
            self:EnterHipfire()
            self.LastEnterHipfireTime = CurTime()
        end

        if self.LastEnterHipfireTime + self:GetHoldHipfireTime() < CurTime() then
            self:ExitHipfire()
        end

        if self.Owner:KeyDown(IN_ATTACK2) then
            self:EnterSights()
        else
            self:ExitSights()
        end

    end

    if !self:IsSprintingRobust() then
        self:ExitSprint()
    end

    if self.State == ACT3_STATE_PRIMED and !self.Owner:KeyDown(IN_ATTACK) then
        if self.Throwable then
            if self:GetNextSecondaryFire() <= CurTime() then
                self:ThrowGrenade()
                self.State = ACT3_STATE_IDLE
            end
        elseif self.PrimaryMelee then
            self:MeleeAttack()
        end
    end

    if self.State == ACT3_STATE_SWING then
        self:ProcessMeleeAttack()
    end

    if self.InBipod then
        self:ExitBipod()
    else
        self:EnterBipod()
    end

    if self.State == ACT3_STATE_PRONETRANSITION then
        if !self:InProneTransition() then
            self.State = ACT3_STATE_IDLE
        end
    else
        if self:InProneTransition() then
            self:ExitSights()
            self.State = ACT3_STATE_PRONETRANSITION
        end
    end

    if self:InSights() and self.TrackingType == ACT3_TRACK_TYPE_FF then
        local target = self:GetFFTarget()
        if target != self.FF_Target then
            self.FF_LastSoughtTime = CurTime()
            self.FF_Target = target
            self.FF_Locked = false
        elseif self.FF_LastSoughtTime + self.FFSeek_LockTime <= CurTime() and !self.FF_Locked then
            self.FF_Locked = true
            if CLIENT then
                self:EmitSound("buttons/blip1.wav", 75, 140)
            end
            self.FF_LastBeepTime = 0
        end

        if !self.FF_Locked and (self.FF_LastBeepTime or 0) + (self.FFSeek_LockTime / 3) <= CurTime() then
            if CLIENT then
                self:EmitSound("buttons/blip1.wav", 75, 100)
            end
            self.FF_LastBeepTime = CurTime()
        end
    else
        self.FF_Locked = false
        self.FF_Target = nil
    end

    if self.FF_Target and !self.FF_Target:IsValid() then
        self.FF_Locked = false
        self.FF_Target = nil
    end

    if self.Owner:KeyReleased(IN_ATTACK) and !self.RunningAway then
        self.TriggerDown = false
        self.BurstCount = 0
    end

    if self.Owner:KeyPressed(IN_ATTACK) then
        self.Reload_Cancel = true
    end

    if self.RunningAway then
        self:PrimaryAttack()

        if self.BurstCount >= self.BurstLength then
            self.RunningAway = false
        end
    end

    self:ProcessTimers()

    self:OnThink()
end

function SWEP:OnThink()
end