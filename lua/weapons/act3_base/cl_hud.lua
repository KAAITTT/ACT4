function SWEP:DrawScope()
    local delta = CurTime() - self.LastEnterSightsTime
    delta = delta / self.AimTime
    if delta > 1 then
        delta = 1
    elseif delta <= 0 then
        delta = 0
        lastang = ang
    end

    local offset = Angle(-90 * (delta - 1), 0, 0)

    cam.Start3D()

    local screenpos = (EyePos() + ((self.Owner:EyeAngles() + offset):Forward() * 256)):ToScreen()

    cam.End3D()

    local x = screenpos.x
    local y = screenpos.y

    local scopesize = ScrH()
    if ScrW() < scopesize then
        scopesize = ScrW()
    end

    scopesize = math.ceil(scopesize * 1.05)

    local scopeposx = x - ( scopesize / 2 )
    local scopeposy = y - ( scopesize / 2 )

    if self.TrueScopeBlackbox then

        if scopeposx > ScrW() or scopeposx < 0 - scopesize or scopeposy > ScrH() or scopeposy < 0 - scopesize then

            surface.SetDrawColor( 0, 0, 0 )

            surface.DrawRect( 0, 0, ScrW(), ScrH() )

        else

            surface.SetDrawColor( 0, 0, 0 )

            surface.DrawRect( scopeposx - ScrW(), scopeposy - ScrH(), 4 * ScrW(), ScrH() )
            surface.DrawRect( scopeposx - ScrW(), scopeposy + scopesize , 4 * ScrW(), ScrH() )

            surface.DrawRect( scopeposx - ScrW(), scopeposy - ScrH(), ScrW(), 4 * ScrH() )
            surface.DrawRect( scopeposx + scopesize, scopeposy - ScrH() , ScrW(), 4 * ScrH() )

        end

    end

    if self.TrueScopeLighting then
        local col = render.ComputeDynamicLighting(EyePos(), self.Owner:EyeAngles():Forward())
        surface.SetDrawColor(col.x, col.y, col.z)
    else
        surface.SetDrawColor( 255, 255, 255 )
    end

    surface.SetMaterial( self.TrueScopeImage )
    surface.DrawTexturedRect( scopeposx, scopeposy, scopesize, scopesize )

    self:OnDrawScope(x, y)
end

function SWEP:OnDrawScope(x, y)
    -- put your code here
end

function SWEP:DrawHolosight()
    if ACT3NVG and ACT3NVG.NVGActive then
        return
    end

    local delta = CurTime() - self.LastEnterSightsTime
    delta = delta / self.AimTime

    local firetime = self.NextRealFire - CurTime()

    if self.ManualAction and firetime > 0 and !self.TrueScopeImage then
        delta = 0
    end

    if delta >= 1 then
        cam.Start3D()

        local pos = EyePos() + ((self.Owner:EyeAngles()):Forward() * (512 + self.EyeRelief))

        render.SetMaterial( self.HolosightImage )
        render.DrawSprite( pos, self.HolosightSize, self.HolosightSize, self.HolosightColor )

        cam.End3D()

        /*
        local x = screenpos.x
        local y = screenpos.y

        local scopesize = ScreenScale(self.HolosightSize)

        local scopeposx = x - ( scopesize / 2 )
        local scopeposy = y - ( scopesize / 2 )

        surface.SetDrawColor( self.HolosightColor )
        surface.SetMaterial( self.HolosightImage )
        surface.DrawTexturedRect( scopeposx, scopeposy, scopesize, scopesize )

        self:OnDrawHolosight(x, y)
        */
    end
end

local square = Material("act3hud/square.png")

function SWEP:DrawTargetTracking()
    local targets = {}

    local besttarget = self:GetFFTarget()

    targets = ents.FindInSphere(self.Owner:EyePos(), self.FFSeek_Range)

    for i, k in pairs(targets) do
        if !self:GetIsValidFFTarget(k) then
            continue
        end

        cam.Start3D()

        local screenpos = k:WorldSpaceCenter():ToScreen()

        cam.End3D()

        local x = screenpos.x
        local y = screenpos.y

        local size = ScreenScale(16)

        local posx = x - ( size / 2 )
        local posy = y - ( size / 2 )

        if besttarget == k then
            surface.SetDrawColor( Color(200, 0, 0) )

            size = ScreenScale(24)

            posx = x - ( size / 2 )
            posy = y - ( size / 2 )

            local locktext = "LOCKING..."

            if self.FF_Locked then
                locktext = "LOCKED"
            end

            surface.SetFont("ACT3_LCD_20_Glow")
            local tpx = x - (surface.GetTextSize(locktext) / 2)
            local tpy = y + ScreenScale(4)

            surface.SetTextPos(tpx, tpy)
            surface.SetTextColor(Color(200, 0, 0))
            surface.SetFont("ACT3_LCD_20_Glow")
            surface.DrawText(locktext)
            surface.SetTextPos(tpx, tpy)
            surface.SetFont("ACT3_LCD_20")
            surface.DrawText(locktext)
        else
            surface.SetDrawColor( Color(255, 255, 255) )
        end
        surface.SetMaterial( square )
        surface.DrawTexturedRect( posx, posy, size, size )
    end
end

function SWEP:OnDrawHolosight(x, y)
    -- put your code here
end

function SWEP:DrawHUDBackground()
    if self.State == ACT3_STATE_INSIGHTS then

        if self.ThermalVision then
            ACT3_DoThermalVision(self)
        end

        if self.NightScope then
            ACT3_DoNightVision(self)
        end

        if self.TrackingType == ACT3_TRACK_TYPE_FF then
            self:DrawTargetTracking()
        end

        if self:BeingOvertaken() then return end

        if self.TrueScopeImage then
            self:DrawScope()
        end

        if !self:ShouldDrawVM() then return end

        if self.HolosightImage then
            self:DrawHolosight()
        end
    end
end

function SWEP:OnDrawHUD()

end

function SWEP:DrawHUD()
    self:OnDrawHUD()

    if self.State == ACT3_STATE_ININVMENU then
        self:DrawInventory()
    end
end