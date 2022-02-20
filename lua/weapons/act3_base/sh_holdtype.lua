
function SWEP:SetShouldHoldType()
    if self.State == ACT3_STATE_PRIMED then
        self:SetHoldType(self.HoldtypePrimed)
    elseif self.State == ACT3_STATE_INSIGHTS then
        if self.UBGL_Enabled then
            self:SetHoldType(self.UBGL_HoldtypeSights)
            return
        end

        if self.InBipod then
            self:SetHoldType(self.HoldtypeBipod or self.HoldtypeSights)
        else
            self:SetHoldType(self.HoldtypeSights)
        end
    elseif self.State == ACT3_STATE_INHIPFIRE then
        if GetConVar("act3_hipholdtype"):GetBool() then
            if self.UBGL_Enabled then
                self:SetHoldType(self.UBGL_HoldtypeHip)
                return
            end

            self:SetHoldType(self.HoldtypeHip)
        else
            if self.UBGL_Enabled then
                self:SetHoldType(self.UBGL_HoldtypeSights)
                return
            end

            self:SetHoldType(self.HoldtypeSights)
        end
    elseif self.State == ACT3_STATE_ININVMENU then
        self:SetHoldType(self.HoldtypeInv or self.HoldtypePassive)
    elseif !GetConVar("act3_alwaysactive"):GetBool() then
        self:SetHoldType(self.HoldtypePassive)
    end
end