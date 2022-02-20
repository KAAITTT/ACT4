ACT3_KEY_MENU_BACK = "+menu"
ACT3_KEY_MENU_NEXT = "+use"
ACT3_KEY_TOGGLEINV = "+menu_context"
ACT3_KEY_MWHEEL_NEXT = "invnext"
ACT3_KEY_MWHEEL_PREV = "invprev"
ACT3_KEY_PRIMARY = "+attack"
ACT3_KEY_SECONDARY = "+attack2"
ACT3_KEY_CYCLE = "slot1"
ACT3_KEY_SWITCHFIREMODE = "+zoom"

function ACT3_PlayerBindPress(ply, bind, pressed)
    if !pressed then return end
    if !ply:IsValid() then return end

    local wpn = ply:GetActiveWeapon()

    if !wpn.ACT3Weapon then return end

    local block = false

    if bind == ACT3_KEY_SWITCHFIREMODE and ACT3.EnableFiremodeSwitching then
        ply:ConCommand("act3_switchfiremode")
        block = true
    elseif bind == ACT3_KEY_TOGGLEINV and ACT3.EnableCustomizeMenu then
        wpn:InvPress_C()
        block = true
    elseif bind == "impulse 100" then
        wpn:ToggleAccessories()
        block = GetConVar("act3_disable_default_fl"):GetBool()
    elseif bind == "+use" and GetConVar("act3_npc_usetogive"):GetBool() then
        local tr = util.TraceLine({
            start = EyePos(),
            endpos = EyePos() + (EyeAngles():Forward() * 64),
            filter = LocalPlayer()
        })

        if IsValid(tr.Entity) then
            ply:ConCommand("act3_give")
        end
    end

    if wpn.State == ACT3_STATE_INSIGHTS then
        if bind == ACT3_KEY_MWHEEL_NEXT then
            wpn:Scroll(1)
            block = true
        elseif bind == ACT3_KEY_MWHEEL_PREV then
            wpn:Scroll(-1)
            block = true
        end
    elseif wpn.State == ACT3_STATE_ININVMENU then
        if bind == ACT3_KEY_PRIMARY then
            wpn:InvPress_Next()
            block = true
        elseif bind == ACT3_KEY_SECONDARY then
            wpn:InvPress_Last()
            block = true
        elseif bind == ACT3_KEY_MENU_NEXT then
            wpn:InvPress_MenuNext()
            block = true
        elseif bind == ACT3_KEY_MENU_BACK then
            wpn:InvPress_MenuLast()
            block = true
        elseif bind == ACT3_KEY_MWHEEL_NEXT then
            wpn:InvPress_Scroll(1)
            block = true
        elseif bind == ACT3_KEY_MWHEEL_PREV then
            wpn:InvPress_Scroll(-1)
            block = true
        elseif bind == ACT3_KEY_CYCLE then
            wpn:InvPress_Cycle()
            block = true
        elseif bind == "+reload" then
            wpn:InvPress_Reload()
            block = true
        end
    end

    if block then return true end
end

hook.Add("PlayerBindPress", "ACT3_PlayerBindPress", ACT3_PlayerBindPress)