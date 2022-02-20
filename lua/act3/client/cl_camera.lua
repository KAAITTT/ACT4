ACT3_RelativeCamAngles = Angle(0, 0, 0)
ACT3_RelativePlayerAngles = Angle(0, 0, 0)
ACT3_FOV = 90

local function ACT3_CalcView( ply, pos, angles, fov )
    local cam_enabled = GetConVar("act3_cam_enable"):GetBool()
    local enable_ts = GetConVar("act3_truescopes_enabled"):GetBool()
    local enable_ti = GetConVar("act3_trueirons_enabled"):GetBool()
    local cam_always = GetConVar("act3_cam_always"):GetBool()
    local znear = GetConVar("act3_cam_znear"):GetInt()
    local shouldtruefp = false
    
    local att = ACT3.EyeAtt
    local cam_forward = 0
    local cam_up = 0
    local cam_right = 0
    local cam_drawviewer = true
    local cam_angoffset = Angle(10, 0, 0)
    cam_angoffset_vector = cam_angoffset:Forward()

    local tracestart = pos
    local traceend = nil
    
    
    

    

    

    
    

    local wpn = ply:GetActiveWeapon()

    local insights = (wpn.State == ACT3_STATE_INSIGHTS) or (wpn.State == ACT3_STATE_PRIMED)

    local view = {}

    ACT3_DoAntiClip()

    if !wpn.ACT3Weapon and !GetConVar("act3_forcedcam"):GetBool() then return end

    if wpn.ACT3Weapon and wpn:BeingOvertaken() then return end

    if !cam_enabled then return end

    if !wpn.UseTrueIrons then
        enable_ti = false
    end

    if enable_ti and !wpn.TrueScopeImage then
        shouldtruefp = true
    elseif enable_ts and wpn.TrueScopeImage then
        shouldtruefp = true
    end

    local targetfov = GetConVar("act3_fov"):GetFloat()

    if insights and shouldtruefp then
        traceend = pos
        cam_drawviewer = false
        targetfov = GetConVar("act3_weaponsightfov"):GetFloat() 
    else
        att = GetConVar("act3_cam_att"):GetString()
        cam_forward = GetConVar("act3_cam_forward"):GetFloat()
        cam_right = GetConVar("act3_cam_right"):GetFloat()
        cam_up = GetConVar("act3_cam_up"):GetFloat()

        if GetConVar("act3_rcam"):GetBool() then
            att = GetConVar("act3_rcam_att"):GetString()
            cam_forward = GetConVar("act3_rcam_forward"):GetFloat()
            cam_right = GetConVar("act3_rcam_right"):GetFloat()
            cam_up = GetConVar("act3_rcam_up"):GetFloat()
        end
    end 

    if wpn.State == ACT3_STATE_ININVMENU then
        targetfov = targetfov * 0.8
    end

    local approachspeed = 180


    if wpn.ACT3Weapon and wpn:IsAiming() then
        if wpn.State == ACT3_STATE_INSIGHTS then
            if GetConVar("act3_insightsfov"):GetBool() then 
            targetfov = GetConVar("act3_weaponsightfov"):GetFloat() 
            end 
            if !wpn.UseTrueIrons then
                
            end
            approachspeed = math.huge
        end

        if GetConVar("act3_hipzoom"):GetBool() and (wpn.State == ACT3_STATE_INHIPFIRE or !shouldtruefp) then
            targetfov = targetfov  * 0.8
        end
    end

    local attob = ply:LookupAttachment(att)

    local attpos = pos

    if attob > 0 then
        attpos = ply:GetAttachment(attob).Pos
    end

    if GetConVar("act3_objcam"):GetBool() then
        attpos = wpn:GetHandPos()
    end

    local trfilter = {ply}

    angles = ACT3_RelativeCamAngles

    local up = angles:Up()
    local right = angles:Right()
    local forward = angles:Forward()

    if !traceend then
        traceend = attpos + (up * cam_up) + (right * cam_right * GetConVar("act3_cam_shoulder"):GetInt()) + (forward * cam_forward)
    end

    view.znear = znear
    view.drawviewer = cam_drawviewer
    view.viewmodelfov = 90
   

    if wpn.State == 2 and ply:KeyDown(IN_WALK) then
        targetfov = targetfov * 0.8
    end

    if wpn.State == 2 and enable_ti then
        cam_angoffset = Angle(0,0,0)
    end
    ACT3_FOV = Lerp( FrameTime() * GetConVar("act3_fovchangespeed"):GetFloat() , ACT3_FOV, targetfov )
    view.fov = ACT3_FOV
    local tr = util.TraceLine({
        start = tracestart,
        endpos = traceend,
        filter = trfilter,
        mask = MASK_OPAQUE,
    })

    vorigin = tr.HitPos
    if tr.Hit then
        vorigin = (tr.HitNormal * znear * 2)
    end

    view.origin = vorigin
    view.angles = angles + cam_angoffset + LocalPlayer():GetViewPunchAngles()


    return view
end

hook.Add( "CalcView", "ACT3_CalcView", ACT3_CalcView )

ACT3.TurningSpeed = 360
ACT3.CamPitch = 75

function ACT3_InputMouseApply( cmd, x, y, ang )
    if !GetConVar("act3_cam_enable"):GetBool() then return end

    local ply = LocalPlayer()
    local wpn = ply:GetActiveWeapon()
    local turnspeed = ACT3.TurningSpeed

    if !wpn.ACT3Weapon and !GetConVar("act3_forcedcam"):GetBool() then
        ACT3_RelativeCamAngles = EyeAngles() 
        ACT3_RelativePlayerAngles = EyeAngles()
        return
    end

    local relative = true

    if wpn.ACT3Weapon and wpn:IsAiming() then
        relative = false
    end

    local mult = 1

    if wpn.State == ACT3_STATE_INSIGHTS then
        turnspeed = math.huge
        mult = 1 / wpn.Magnification
    end

    if !GetConVar("act3_cam_relativemotion"):GetBool() then
        relative = false
    end

    local targetplayerangles = ACT3_RelativePlayerAngles

    if !relative then
        targetplayerangles = ACT3_RelativeCamAngles
    else

        local movevec = Vector(cmd:GetForwardMove(), cmd:GetSideMove(), cmd:GetUpMove())

        if movevec:Length() > 0 then
            targetplayerangles = ACT3_RelativeCamAngles - movevec:Angle()

            cmd:SetForwardMove(movevec:Length())
            cmd:SetSideMove(0)
            cmd:SetUpMove(0)
        end
    end

    if ply:InVehicle() then
        targetplayerangles = targetplayerangles - ply:GetVehicle():GetAngles()
    end

    ACT3_RelativePlayerAngles = targetplayerangles

    local c_angles = cmd:GetViewAngles()

    if ply:InVehicle() then
        c_angles = c_angles
    end

    local deltax = x * 25 * mult * GetConVar("sensitivity"):GetFloat() * GetConVar("act3_sensitivity"):GetFloat() / ScrW()
    local deltay = y * 25 * mult * GetConVar("sensitivity"):GetFloat() * GetConVar("act3_sensitivity"):GetFloat() / ScrH()

    if GetConVar("m_yaw"):GetFloat() < 0 then
        deltax = deltax * -1
    end

    if GetConVar("m_pitch"):GetFloat() < 0 then
        deltay = deltay * -1
    end    
        


    ACT3_RelativeCamAngles.r = 0

    CamRestrict = c_angles[1] - 75
    CamRestrict1 = c_angles[1] + 75
    CamRestrict3 = c_angles[2] - 75
    CamRestrict4 = c_angles[2] + 75


    

    

    if ply:KeyDown(IN_USE) then
        turnspeednew = 0.0001
        print(c_angles)

        ACT3_RelativeCamAngles.p = math.Clamp(ACT3_RelativeCamAngles.p + deltay, -ACT3.CamPitch, ACT3.CamPitch)
        ACT3_RelativeCamAngles.y = math.Clamp(ACT3_RelativeCamAngles.y - deltax, CamRestrict3, CamRestrict4)
    else
        ACT3_RelativeCamAngles.p = math.Clamp(ACT3_RelativeCamAngles.p + deltay, -ACT3.CamPitch, ACT3.CamPitch)
        ACT3_RelativeCamAngles.y = ACT3_RelativeCamAngles.y - deltax 
        turnspeednew = 10
    end


    if GetConVar("act3_camerasmoothing"):GetBool() then
        if wpn.State == ACT3_STATE_INSIGHTS and !ply:KeyDown(IN_USE) then
            c_angles[1] = math.ApproachAngle(c_angles[1], targetplayerangles[1], FrameTime() * turnspeed)
            c_angles[2] = math.ApproachAngle(c_angles[2], targetplayerangles[2], FrameTime() * turnspeed)
            c_angles[3] = math.ApproachAngle(c_angles[3], targetplayerangles[3], FrameTime() * turnspeed)
        end
        c_angles = LerpAngle( FrameTime() * turnspeednew, c_angles, targetplayerangles )
    else

    c_angles[1] = math.ApproachAngle(c_angles[1], targetplayerangles[1], FrameTime() * turnspeed)
    c_angles[2] = math.ApproachAngle(c_angles[2], targetplayerangles[2], FrameTime() * turnspeed)
    c_angles[3] = math.ApproachAngle(c_angles[3], targetplayerangles[3], FrameTime() * turnspeed) 
    end

 

    cmd:SetViewAngles(c_angles)




    return true
end

hook.Add( "InputMouseApply", "ACT3_InputMouseApply", ACT3_InputMouseApply )