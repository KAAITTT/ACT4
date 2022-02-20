function SWEP:NetworkFiremode()
    if self.Owner:IsNPC() then return end
    net.Start("ACT3_NetworkFiremode")
    net.WriteEntity(self)
    net.WriteUInt(self.CurrentFiremode, 8)
    net.SendOmit(self.Owner)
end

function SWEP:ChangeFiremodeTo(mode)
    if self.CannotFiremodes then return end

    if self.Firemodes[self.CurrentFiremode].ResetFunc then
        self.Firemodes[self.CurrentFiremode].ResetFunc(self)
    end

    if !self.Firemodes[mode] then
        self:ChangeFiremodeTo(1)
        return
    end

    local newmode = self.Firemodes[mode]
    self.CurrentFiremode = mode

    self.Automatic = newmode.Automatic or false
    self.BurstLength = newmode.BurstLength or 0
    self.Safe = newmode.Safe or false
    self.CustomBars = newmode.CustomBars or nil
    self.CustomFiremode = newmode.CustomFiremode or nil
    self.RunAwayBurst = newmode.RunAway or false

    if newmode.EquipFunc then
        newmode.EquipFunc(self)
    end

    if newmode.Bodygroups and CLIENT then
        self:RebuildModels()
    end

    if (newmode.Network or newmode.Bodygroups) and SERVER then
        self:NetworkFiremode()
    end
end

function SWEP:ChangeFiremode()
    if self.CannotFiremodes then return end
    if self.State == ACT3_STATE_RELOAD then return end
    if #self.Firemodes == 1 and !self.UBGL then return end

    self:CallOnClient("ChangeFiremode")
    local newmode = self.CurrentFiremode + 1

    if self.UBGL_Enabled then
        self.UBGL_Enabled = false
        newmode = 1
        self:SetShouldHoldType()
    else
        if newmode > #self.Firemodes then
            if self.UBGL then
                self.UBGL_Enabled = true
                self:SetShouldHoldType()
                return
            end
            newmode = 1
        end
    end

    self:ChangeFiremodeTo(newmode)
    self.Owner:DoAnimationEvent(ACT_FLINCH_SHOULDER_RIGHT) 
    self:EmitSound(self.SoundChangeFiremode, 75, 100, 1, CHAN_ITEM)
end

function SWEP:GetFiremodeText()
    local firemode = "SEMI"

    if self.Automatic then
        firemode = "AUTO"
    end

    if self.BurstLength > 0 then
        firemode = tostring(self.BurstLength)
        firemode = firemode .. "BST"
    end

    if self.BinaryTrigger then
        firemode = "BINA"
    end

    if self.Safe then
        firemode = "SAFE"
    end

    if self.PrimaryMelee then
        firemode = "MELEE"
    end

    if self.CustomFiremode then
        firemode = self.CustomFiremode
    end

    if self.UBGL_Enabled then
        firemode = self.UBGL_Firemode or "UBGL"
    end

    return firemode
end

function SWEP:GetFiremodeBars()
    local bars = {
        [1] = true,
        [2] = false,
        [3] = false,
        [4] = false,
        [5] = false
    }

    if self.Automatic then
        bars = {
            [1] = true,
            [2] = true,
            [3] = true,
            [4] = true,
            [5] = true
        }
    end

    if self.BurstLength > 0 then
        for i = 1, 5 do
            if i <= self.BurstLength then
                bars[i] = true
            else
                bars[i] = false
            end
        end
    end

    if self.BinaryTrigger then
        bars = {
            [1] = true,
            [2] = false,
            [3] = false,
            [4] = false,
            [5] = true
        }
    end

    if self.Safe then
       bars = {
        [1] = false,
        [2] = false,
        [3] = false,
        [4] = false,
        [5] = false
    }
    end

    if self.CustomBars then
        bars = self.CustomBars
    end

    if self.UBGL_Enabled then
        bars = {
            [1] = false,
            [2] = false,
            [3] = false,
            [4] = true,
            [5] = true
        }
    end

    return bars
end

function SWEP:GetCustomText()
    return ""
end