function SWEP:ToggleAccessories(onoff)
    onoff = onoff or !self.LightsOn

    local anythingtotoggle = false
    for i, k in pairs(self.Attachments) do
        if !k.Installed then continue end
        local att = ACT3_GetAttachment(k.Installed)

        if att.Toggleable then
            anythingtotoggle = true
            break
        end
    end

    if self.DefaultToggleable then
        anythingtotoggle = true
    end

    if !anythingtotoggle then return end

    self.LightsOn = onoff

    if SERVER then
        self:EmitSound("items/flashlight1.wav")
    end

    self:KillFlashlights()

    if CLIENT and self.Owner == LocalPlayer() then
        net.Start("ACT3_ToggleAcc")
        net.SendToServer()
    end
end

function SWEP:KillFlashlights()
    if SERVER then return end

    for i, k in pairs(self.Flashlights) do
        if IsValid(k) then
            k:Remove()

            self.Flashlights[i] = nil
        end
    end

    self.Flashlights = {}
end

function SWEP:GetFLIndex()
    return #self.Flashlights
end