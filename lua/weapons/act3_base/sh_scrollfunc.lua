function SWEP:Scroll(val)
    if CLIENT and self.NetworkScroll then
        net.Start("ACT3_SyncScroll")
        net.WriteInt(val, 3)
        net.SendToServer()
    end

    if self.ScrollFunc == ACT3_FUNC_ZERO then
        self.ScrollPos = self.ScrollPos + val

        if self.ScrollPos >= self.ZeroIncrements then
            self.ScrollPos = self.ZeroIncrements - 1
        elseif self.ScrollPos < 0 then
            self.ScrollPos = 0
        elseif val != 0 then
            if CLIENT then
                surface.PlaySound("act3/adjust.wav")
            end
        end

        local delta = self.ScrollPos / (self.ZeroIncrements - 1)

        self.TrueIronsPos = ACT3_VectorLerp(delta, self.ZeroIronMinPos, self.ZeroIronMaxPos)
        self.TrueIronsAng = ACT3_VectorLerp(delta, self.ZeroIronMinAng, self.ZeroIronMaxAng)

        return true
    elseif self.ScrollFunc == ACT3_FUNC_ZOOM then
        self.ScrollPos = self.ScrollPos + val

        if self.ScrollPos >= self.ZoomIncrements then
            self.ScrollPos = self.ZoomIncrements - 1
        elseif self.ScrollPos < 0 then
            self.ScrollPos = 0
        elseif val != 0 then
            if CLIENT then
                surface.PlaySound("act3/adjust.wav")
            end
        end

        local delta = self.ScrollPos / (self.ZoomIncrements - 1)

        self.Magnification = Lerp(delta, self.MaxZoom, self.MinZoom)

        self:UpdateZoom()

        return true
    elseif self.ScrollFunc == ACT3_FUNC_HOLOSIGHT then
        self.ScrollPos = self.ScrollPos + val

        if self.ScrollPos > #self.HolosightTable then
            self.ScrollPos = #self.HolosightTable
        elseif self.ScrollPos < 1 then
            self.ScrollPos = 1
        elseif val != 0 then
            if CLIENT then
                surface.PlaySound("act3/adjust.wav")
            end
        end

        self.HolosightImage = self.HolosightTable[self.ScrollPos].Image
        self.HolosightColor = self.HolosightTable[self.ScrollPos].Color
        self.HolosightSize = self.HolosightTable[self.ScrollPos].Size
    elseif self.ScrollFunc == ACT3_FUNC_NIGHTSCOPE then
        val = -val
        self.ScrollPos = self.ScrollPos + val

        if self.ScrollPos >= self.NightScopeIncrements then
            self.ScrollPos = self.NightScopeIncrements - 1
        elseif self.ScrollPos < 0 then
            self.ScrollPos = 0
        elseif val != 0 then
            if CLIENT then
                if self.ScrollPos == 0 then
                    surface.PlaySound("buttons/button16.wav")
                elseif self.ScrollPos == 1 and val == 1 then
                    surface.PlaySound("buttons/button16.wav")
                else
                    surface.PlaySound("act3/adjust.wav")
                end
            end
        end

        local delta = self.ScrollPos / self.NightScopeIncrements

        if delta == 0 then
            self.NightScope = false
        else
            self.NightScope = true
            self.NightScopeContrast = Lerp(delta, 0, self.NightScopeMaxContrast)
        end
    elseif self.ScrollFunc == ACT3_FUNC_CUSTOM then
        return self:CustomScroll(val)
    end

    return false
end

function SWEP:CustomScroll(val)
    return false
end