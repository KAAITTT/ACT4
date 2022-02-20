function SWEP:RebuildAttachments()
    local original = weapons.Get(self:GetClass())

    -- build flags

    self.AttachmentFlags = original.AttachmentFlags

    for i, k in pairs(self.Attachments) do
        if !k.Installed then continue end

        local att = ACT3_GetAttachment(k.Installed)

        if att.GivesFlags then
            for _, l in pairs(att.GivesFlags) do
                self.AttachmentFlags[l] = true
            end
        end
    end

    if CLIENT then
        self:RebuildModels()
    end
end

function SWEP:HasHipfireHelper()
    for i, k in pairs(self.Attachments) do
        if !k.Installed then continue end

        local att = ACT3_GetAttachment(k.Installed)

        if att.HipfireHelper then
            if att.Toggleable and self.LightsOn then
                return true
            else
                return true
            end
        end
    end

    return false
end

function SWEP:AttachFlagsOkay(att)

    for i, k in pairs(att.ExcludeFlags or {}) do
        if self.AttachmentFlags[k] then return false end
    end

    for i, k in pairs(att.RequiredFlags or {}) do
        if !self.AttachmentFlags[k] then return false end
    end

    return true
end

function SWEP:RequestAttach(slotid, attid)
    if self.Attachments[slotid].Installed == attid then return end
    if !self.Owner:ACT3_GetHasAttachment(attid) then return end

    local att = ACT3_GetAttachment(attid)

    if !self:AttachFlagsOkay(att) then return end

    if att.Slot != self.Attachments[slotid].Type then
        if !self.Attachments[slotid].ExtraTypes then return end

        local ok = false

        for _, k in pairs(self.Attachments[slotid].ExtraTypes) do
            if k == att.Slot then
                ok = true
                break
            end
        end

        if !ok then return end
    end

    if self.Attachments[slotid].Installed then
        self:RequestDetachForAttach(slotid)
    end

    self:Attach(attid, slotid)

    if self.State == ACT3_STATE_ININVMENU then
        self.Inv_Select = self:SlotToInvIndex(slotid)
    end

    net.Start("ACT3_Attach")
    net.WriteString(attid)
    net.WriteString(slotid)
    net.SendToServer()

    surface.PlaySound("weapons/famas/famas_clipin.wav")
end

function SWEP:RequestDetachForAttach(slotid)
    self:Detach(slotid)

    net.Start("ACT3_Detach")
    net.WriteString(slotid)
    net.SendToServer()

    surface.PlaySound("weapons/famas/famas_clipout.wav")
end

function SWEP:RequestDetach(slotid)
    if self.Attachments[slotid].Required then return end
    self:Detach(slotid)

    net.Start("ACT3_Detach")
    net.WriteString(slotid)
    net.SendToServer()

    surface.PlaySound("weapons/famas/famas_clipout.wav")
end

function SWEP:GetMaxInstallOrder()
    local max = 0

    for i, k in pairs(self.Attachments) do
        if k.InstalledOrder and k.InstalledOrder > max then
            max = k.InstalledOrder
        end
    end

    return max
end

function SWEP:Attach(attid, slotid, default)
    default = default or false

    local att = ACT3_GetAttachment(attid)

    if !att then return end

    if !default then
        if self.Attachments[slotid].Installed then return end

        if !self.Owner:ACT3_GetHasAttachment(attid) then return end
        if !self:AttachFlagsOkay(att) then return end
        self.Owner:ACT3_TakeAttachment(attid)
    end

    if !self.Attachments[slotid] then return end

    att.AttachFunc(self)

    self.Attachments[slotid].Installed = attid
    self.Attachments[slotid].InstalledOrder = self:GetMaxInstallOrder() + 1

    if att.GivesSlots then
        for i, k in pairs(att.GivesSlots) do
            local newslotid = slotid .. i
            local preinstalled = nil

            if self.Attachments[newslotid] then
                preinstalled = self.Attachments[newslotid].Installed
            end

            self.Attachments[newslotid] = table.Copy(k)

            if self.Attachments[slotid].ProcGenAtt then
                self.Attachments[newslotid].ProcGenAtt = true
            end

            if self.Attachments[slotid].Pos then
                self.Attachments[newslotid].Pos = (self.Attachments[newslotid].Pos or Vector(0, 0, 0)) + (self.Attachments[slotid].Pos or Vector(0, 0, 0))
            end

            if self.Attachments[slotid].Ang then
                self.Attachments[newslotid].Ang = (self.Attachments[newslotid].Ang or Angle(0, 0, 0)) + (self.Attachments[slotid].Ang or Angle(0, 0, 0))
            end

            if k.Installed and !preinstalled then
                self.Attachments[newslotid].Installed = nil
                self:Attach(k.Installed, newslotid, default)
            elseif preinstalled then
                self.Attachments[newslotid].Installed = preinstalled
            end
        end
    end

    if att.IsSight then
        self.SightInstalled = true
    end

    self:RebuildAttachments()

    if !default and SERVER then
        ACT3_UpdateWeaponData(self, self.Owner)
    end
end

function SWEP:Detach(slotid)
    if !self.Attachments[slotid] then return end
    if !self.Attachments[slotid].Installed then return end

    local att = ACT3_GetAttachment(self.Attachments[slotid].Installed)

    if self.Owner:IsPlayer() then
        self.Owner:ACT3_GiveAttachment(self.Attachments[slotid].Installed)
    end

    att.DetachFunc(self)

    self.Attachments[slotid].Installed = nil

    if att.GivesSlots then
        for i, k in pairs(att.GivesSlots) do
            local newslotid = slotid .. i
            self:Detach(newslotid)
            self.Attachments[newslotid] = nil
        end
    end

    if att.IsSight then
        local orig = weapons.Get(self:GetClass())
        self.TrueIronsPos = orig.TrueIronsPos
        self.TrueIronsAng = orig.TrueIronsAng
        self.SightInstalled = false
        self.EyeRelief = 0
    end

    self:RebuildAttachments()

    if SERVER then
        ACT3_UpdateWeaponData(self, self.Owner)
    end
end