local hide = {
    ["CHudHealth"] = true,
    ["CHudBattery"] = true,
    ["CHudAmmo"] = true,
}

hook.Add("HUDShouldDraw", "ACT3_HideHUD", function(name)
    if !hide[name] then return end
    if !GetConVar("act3_hud_enable"):GetBool() then return end
    if GetConVar("act3_hud_reduce"):GetBool() then return end
    if !LocalPlayer():IsValid() then return end
    if !LocalPlayer():GetActiveWeapon().ACT3Weapon then return end
    if name == "CHudHealth" and !GetConVar("act3_hud_drawhpanel"):GetBool() then return end

    return false
end)

local lastcrossimage = ""
local lastcrossmat = nil
local fadetime = 0.25
local delta = 0
local lastclip = 0
local lastwpn = ""
local bullet_offset = 0
local tri_alpha = 255
local last_frac = 1
local last_armor_frac = 1
ACT3_ActiveHitmarkers = {} -- {{critlevel, pos, time}}

local hud_tri = Material("act3hud/triangle.png", "mips")

local hitimagestable = {
    [ACT3_HIT_NORMAL] = Material("act3hud/hit_marker.png"),
    [ACT3_HIT_CRIT] = Material("act3hud/hit_marker.png"),
    [ACT3_HIT_DEFLECT] = Material("act3hud/hit_deflect.png"),
}

ACT3_InNightScope = false

hook.Add( "HUDPaint", "ACT3_HUDPaint", function()
    if CurTime() < 1 then return end

    local wpn = LocalPlayer():GetActiveWeapon()

    if !wpn.ACT3Weapon then return end

    local key_use = ""

    key_use = input.LookupBinding( "+use" ) or "BIND +USE"

    key_use = string.upper(key_use)

    local insights = true
    local crosshair = true

    if wpn.ACT3Weapon then
        crosshair = wpn.CanShootStates[wpn.State]
        insights = wpn.State == ACT3_STATE_INSIGHTS
    end

    if (GetConVar("act3_trueirons_enabled"):GetBool() and wpn.UseTrueIrons and !wpn.TrueScopeImage) and insights then
        crosshair = false

        if wpn.InBipod and !wpn.SightInstalled then
            crosshair = true
        end
    end

    if (GetConVar("act3_truescopes_enabled"):GetBool() and wpn.TrueScopeImage) and insights then
        crosshair = false
    end

    if wpn.HideCrosshair then
        crosshair = false
    end

    local reloading = (wpn.State == ACT3_STATE_RELOAD)
    local delta_reload = 0

    if reloading then
        delta_reload = CurTime() - wpn.LastReloadTime
        delta_reload  = delta_reload / wpn:GetReloadTime()
        if delta_reload  > 1 then
            delta_reload  = 1
        end
    end

    if crosshair then
        delta = math.Approach(delta, 1, FrameTime() / fadetime)
    else
        delta = math.Approach(delta, 0, FrameTime() / fadetime)
    end

    if !GetConVar("act3_hud_crosshair_enable"):GetBool() then
        delta = 0
    end

    local heat = wpn.Heat

    if insights then
        heat = heat / 4
    end

    if delta > 0 then
        local sizemin = ScreenScale(GetConVar("act3_hud_crosshair_sizemin"):GetFloat())
        local sizemax = ScreenScale(GetConVar("act3_hud_crosshair_sizemax"):GetFloat())
        local size = Lerp(delta, sizemax, sizemin)
        local image = GetConVar("act3_hud_crosshair_image"):GetString()
        local src = LocalPlayer():EyePos()
        if wpn.ACT3Weapon then
            src = wpn:GetSrcPos()
            local acc = Lerp( heat / 100, sizemin, sizemax)
            size = wpn.CrosshairSizeMult * acc * size
        end
        local hit = util.TraceLine ({
            start = src,
            endpos = src + (wpn:GetShootAng():Forward() * 8196),
            filter = LocalPlayer(),
            mask = MASK_SHOT
        })


        cam.Start3D()
        local screenhit = hit.HitPos:ToScreen()
        cam.End3D()

        local x = screenhit.x
        local y = screenhit.y

        if wpn.CrosshairOverride then
            image = wpn.CrosshairOverride
        end

        if image != lastcrossimage then
            lastcrossimage = image
            lastcrossmat = Material(lastcrossimage)
        end

        surface.SetMaterial( lastcrossmat )

        local r = GetConVar("act3_hud_crosshair_r"):GetInt()
        local g = GetConVar("act3_hud_crosshair_g"):GetInt()
        local b = GetConVar("act3_hud_crosshair_b"):GetInt()
        local a = GetConVar("act3_hud_crosshair_a"):GetInt()
        local r_a = GetConVar("act3_hud_crosshair_a_r"):GetInt()
        local g_a = GetConVar("act3_hud_crosshair_a_g"):GetInt()
        local b_a = GetConVar("act3_hud_crosshair_a_b"):GetInt()
        local a_a = GetConVar("act3_hud_crosshair_a_a"):GetInt()

        local color = Color( r, g, b, a )

        if hit.Entity:IsNPC() or hit.Entity:IsPlayer() or (hit.Entity:IsValid() and scripted_ents.IsBasedOn( hit.Entity:GetClass(), "base_nextbot" )) then
            color = Color( r_a, g_a, b_a, a_a )
        end

        color.a = Lerp(delta, 0, color.a)

        surface.SetDrawColor( color )

        local prongsize = GetConVar("act3_hud_crosshair_prongsize"):GetInt()

        local t_x = x
        local t_y = y - size

        if GetConVar("act3_hud_crosshair_top"):GetBool() then
            surface.DrawTexturedRectRotated(t_x, t_y, prongsize, prongsize, 0)
        end

        local b_x = x
        local b_y = y + size

        if GetConVar("act3_hud_crosshair_bottom"):GetBool() then
            surface.DrawTexturedRectRotated(b_x, b_y, prongsize, prongsize, 180)
        end

        local l_x = x + size
        local l_y = y

        if GetConVar("act3_hud_crosshair_right"):GetBool() then
            surface.DrawTexturedRectRotated(l_x, l_y, prongsize, prongsize, -90)
        end

        local r_x = x - size
        local r_y = y

        if GetConVar("act3_hud_crosshair_left"):GetBool() then
            surface.DrawTexturedRectRotated(r_x, r_y, prongsize, prongsize, 90)
        end

    end

    local hitmarker_time = GetConVar("act3_hitmarker_time"):GetFloat()

    for i, k in pairs(ACT3_ActiveHitmarkers) do
        cam.Start3D()
        local screenhit = k[2]:ToScreen()
        cam.End3D()
        local x = screenhit.x
        local y = screenhit.y

        local hmdelta = 0

        hmdelta = CurTime() - k[3]
        hmdelta  = hmdelta / hitmarker_time
        if hmdelta > 1 then
            hmdelta = 1
        end

        local r = 255
        local g = 255
        local b = 255
        local a = 255

        if k[1] == ACT3_HIT_NORMAL then
            r = GetConVar("act3_hitmarker_norm_r"):GetInt()
            g = GetConVar("act3_hitmarker_norm_g"):GetInt()
            b = GetConVar("act3_hitmarker_norm_b"):GetInt()
            a = GetConVar("act3_hitmarker_norm_a"):GetInt()
        elseif k[1] == ACT3_HIT_CRIT then
            r = GetConVar("act3_hitmarker_crit_r"):GetInt()
            g = GetConVar("act3_hitmarker_crit_g"):GetInt()
            b = GetConVar("act3_hitmarker_crit_b"):GetInt()
            a = GetConVar("act3_hitmarker_crit_a"):GetInt()
        elseif k[1] == ACT3_HIT_DEFLECT then
            r = GetConVar("act3_hitmarker_defl_r"):GetInt()
            g = GetConVar("act3_hitmarker_defl_g"):GetInt()
            b = GetConVar("act3_hitmarker_defl_b"):GetInt()
            a = GetConVar("act3_hitmarker_defl_a"):GetInt()
        end

        local alpha = Lerp(hmdelta, a, 0)

        local hmsize = GetConVar("act3_hitmarker_size"):GetInt()

        surface.SetDrawColor(r, g, b, alpha)
        surface.SetMaterial(hitimagestable[k[1]])
        surface.DrawTexturedRect(x - (hmsize / 2), y - (hmsize / 2), hmsize, hmsize)

        if (k[3] + hitmarker_time) <= CurTime() then
            table.remove(ACT3_ActiveHitmarkers, i)
        end
    end

    if !GetConVar("act3_hud_enable"):GetBool() then return end

    if GetConVar("act3_hud_reduce"):GetBool() then
        local hudcol = Color(255, 235, 20, 255)

        local airgap = ScreenScale(24)

        local hud_p = {
            w = ScreenScale(96),
            h = ScreenScale(24)
        }

        hud_p.x = (ScrW() - hud_p.w) / 2
        hud_p.y = ScrH() - hud_p.h - airgap

        draw.RoundedBox(8, hud_p.x, hud_p.y, hud_p.w, hud_p.h, Color(0, 0, 0, 76))

        local hud_fire_text = {
            x = hud_p.x + (hud_p.w / 2),
            y = hud_p.y + ScreenScale(2),
            text = wpn:GetFiremodeText()
        }

        surface.SetTextColor(hudcol)
        surface.SetFont("HudDefault")
        ACT3_HH_AlignText(hud_fire_text, ACT3_ALIGN_CENTER)
        surface.SetTextPos(hud_fire_text.x, hud_fire_text.y)
        surface.DrawText(hud_fire_text.text)

        -- detecting bullet logic

        local clip = wpn:RealClip1()

        if lastclip > clip then
            bullet_offset = ScreenScale(24)
        end

        if lastwpn != wpn:GetClass() then
            bullet_offset = 0
        end

        lastwpn = wpn:GetClass()
        lastclip = clip

        local hud_bullets = {
            x = hud_p.x + ScreenScale(18),
            y = hud_p.y + hud_p.h - ScreenScale(12),
            w = ScreenScale(20),
            num = 4
        }

        hud_bullets.x = hud_bullets.x + bullet_offset

        local Rounds = {}

        if wpn.Magazine then
            Rounds = table.Copy(wpn.Magazine.Rounds)
        end

        if !wpn.OpenBolt then
            if wpn.ChamberedRound then
                table.insert(Rounds, 1, wpn.ChamberedRound)
            end
        end

        hudcol.a = 255

        for i, bulletid in pairs(Rounds) do
            if isstring(i) then continue end
            if i > hud_bullets.num then continue end

            local bullet = ACT3_GetBullet(bulletid)

            surface.SetFont("ACT3_HL2_8")

            local text = {}

            text.x = hud_bullets.x
            text.y = hud_bullets.y
            text.text = bullet.Type

            ACT3_HH_AlignText(text, ACT3_ALIGN_CENTER)

            hudcol.a = hudcol.a - (255 / (hud_bullets.num + 2))

            surface.SetTextColor(hudcol)
            surface.SetTextPos(text.x, text.y)
            surface.DrawText(text.text)

            hud_bullets.x = hud_bullets.x + hud_bullets.w
        end

        hud_bullets.x = hud_p.x + ScreenScale(27) + bullet_offset
        hud_bullets.w = ScreenScale(20)

        hudcol.a = 255

        for i = 1, hud_bullets.num - 1 do
            surface.SetFont("ACT3_HL2_8")

            hud_bullets.text = "|"

            surface.SetTextColor(hudcol)
            surface.SetTextPos(hud_bullets.x, hud_bullets.y)
            surface.DrawText(hud_bullets.text)

            hud_bullets.x = hud_bullets.x + hud_bullets.w
        end

        bullet_offset = math.Clamp(bullet_offset - (FrameTime() * ScreenScale(24) / wpn.ShootingDelay), 0, 24)

        -- draw the little "This is the current round" triangle

        local okaytoshoot = false

        okaytoshoot = wpn:RealClip1() > 0

        local target = 0

        if okaytoshoot then
            target = 255
        end

        tri_alpha = math.Approach(tri_alpha, target, FrameTime() * 255 * 3)

        local hud_bullettri = {
            x = hud_p.x + ScreenScale(18),
            y = hud_p.y + hud_p.h - ScreenScale(14),
            w = ScreenScale(2),
            h = ScreenScale(2)
        }

        surface.SetMaterial(hud_tri)
        surface.SetDrawColor(hudcol.r, hudcol.g, hudcol.b, tri_alpha)
        surface.DrawTexturedRect(hud_bullettri.x, hud_bullettri.y, hud_bullettri.w, hud_bullettri.h)

    else

    -- hud

    local hudcol = Color(225, 225, 225, 255)

    local airgap = ScreenScale(24)

    local hud_ab = {
        w = ScreenScale(132),
        h = ScreenScale(40)
    }

    hud_ab.x = ScrW() - hud_ab.w - airgap
    hud_ab.y = ScrH() - hud_ab.h - airgap

    surface.SetDrawColor(Color(25, 25, 25, 225))
    surface.DrawRect(hud_ab.x, hud_ab.y, hud_ab.w, hud_ab.h)

    local clip = wpn:RealClip1()

    -- clip

    local hud_clip = {
        x = hud_ab.x + ScreenScale(6),
        y = hud_ab.y,
        text = tostring(clip) .. " / " .. wpn:Ammo1()
    }

    if wpn.InfiniteAmmo then
        hud_clip.text = "---"
    end

    if wpn.InternalWeapon then
        if GetConVar("act3_infinite_nades"):GetBool() then
            hud_clip.text = "---"
        else
            hud_clip.text = wpn:RealClip1()
        end
    end

    local customammo = wpn:GetAmmoDisplay()

    if customammo then
        hud_clip.text = customammo
    end

    surface.SetFont("ACT3_HUD_20")
    surface.SetTextColor(hudcol)
    surface.SetTextPos(hud_clip.x, hud_clip.y)
    surface.DrawText(hud_clip.text)

    -- firemode bar

    surface.SetDrawColor(hudcol)

    local hud_firebar = {
        x = hud_ab.x + ScreenScale(4),
        y = hud_ab.y + ScreenScale(22),
        w = ScreenScale(23),
        h = ScreenScale(2),
        gap = ScreenScale(2),
        todraw = wpn:GetFiremodeBars()
    }

    for i = 1, 5 do

        if hud_firebar.todraw[i] then
            surface.DrawRect(hud_firebar.x, hud_firebar.y, hud_firebar.w, hud_firebar.h)
        else
            surface.DrawOutlinedRect(hud_firebar.x, hud_firebar.y, hud_firebar.w, hud_firebar.h)
        end

        hud_firebar.x = hud_firebar.x + hud_firebar.gap + hud_firebar.w
    end

    -- name

    local hud_name = {
        x = hud_ab.x + hud_ab.w - ScreenScale(6),
        y = hud_ab.y + ScreenScale(2),
        text = wpn:GetPrintName()
    }

    surface.SetFont("ACT3_HUD_8")

    ACT3_HH_AlignText(hud_name, ACT3_ALIGN_RIGHT)

    surface.SetTextColor(hudcol)
    surface.SetTextPos(hud_name.x, hud_name.y)
    surface.DrawText(hud_name.text)

    -- firemode

    local hud_fm = {
        x = hud_ab.x + hud_ab.w - ScreenScale(6),
        y = hud_ab.y + ScreenScale(10),
        text = wpn:GetFiremodeText()
    }

    surface.SetFont("ACT3_HUD_10")

    ACT3_HH_AlignText(hud_fm, ACT3_ALIGN_RIGHT)

    surface.SetTextColor(hudcol)
    surface.SetTextPos(hud_fm.x, hud_fm.y)
    surface.DrawText(hud_fm.text)

    -- bullets

    -- detecting bullet logic

    if lastclip > clip then
        bullet_offset = ScreenScale(24)
    end

    if lastwpn != wpn:GetClass() then
        bullet_offset = 0
    end

    -- drawing the bullets

    lastwpn = wpn:GetClass()
    lastclip = clip

    local hud_bullets = {
        x = hud_ab.x + ScreenScale(14),
        y = hud_ab.y + hud_ab.h - ScreenScale(12),
        w = ScreenScale(21),
        num = 6
    }

    hud_bullets.x = hud_bullets.x + bullet_offset

    local Rounds = {}

    if wpn.Magazine then
        Rounds = table.Copy(wpn.Magazine.Rounds)
    end

    if !wpn.OpenBolt then
        table.insert(Rounds, 1, wpn.ChamberedRound)
    end

    hudcol.a = 255

    for i, bulletid in pairs(Rounds) do
        if isstring(i) then continue end
        if i > hud_bullets.num then continue end

        local bullet = ACT3_GetBullet(bulletid)

        surface.SetFont("ACT3_HUD_8")

        local text = {}

        text.x = hud_bullets.x
        text.y = hud_bullets.y
        text.text = bullet.Type

        ACT3_HH_AlignText(text, ACT3_ALIGN_CENTER)

        hudcol.a = hudcol.a - (255 / (hud_bullets.num + 2))

        surface.SetTextColor(hudcol)
        surface.SetTextPos(text.x, text.y)
        surface.DrawText(text.text)

        hud_bullets.x = hud_bullets.x + hud_bullets.w
    end

    hud_bullets.x = hud_ab.x + ScreenScale(22) + bullet_offset

    hudcol.a = 255

    for i = 1, hud_bullets.num - 1 do
        surface.SetFont("ACT3_HUD_8")

        hud_bullets.text = "|"

        surface.SetTextColor(hudcol)
        surface.SetTextPos(hud_bullets.x, hud_bullets.y)
        surface.DrawText(hud_bullets.text)

        hud_bullets.x = hud_bullets.x + hud_bullets.w
    end

    bullet_offset = math.Clamp(bullet_offset - (FrameTime() * ScreenScale(24) / wpn.ShootingDelay), 0, 24)

    -- draw the little "This is the current round" triangle

    local okaytoshoot = false

    okaytoshoot = wpn:RealClip1() > 0

    local target = 0

    if okaytoshoot then
        target = 255
    end

    tri_alpha = math.Approach(tri_alpha, target, FrameTime() * 255 * 3)

    local hud_bullettri = {
        x = hud_ab.x + ScreenScale(14),
        y = hud_ab.y + hud_ab.h - ScreenScale(14),
        w = ScreenScale(2),
        h = ScreenScale(2)
    }

    surface.SetMaterial(hud_tri)
    surface.SetDrawColor(hudcol.r, hudcol.g, hudcol.b, tri_alpha)
    surface.DrawTexturedRect(hud_bullettri.x, hud_bullettri.y, hud_bullettri.w, hud_bullettri.h)

    if GetConVar("act3_hud_drawhpanel"):GetBool() then

        -- health/armor

        local hud_hb = {
            w = ScreenScale(132),
            h = ScreenScale(24)
        }

        hud_hb.x = airgap
        hud_hb.y = ScrH() - hud_hb.h - airgap

        surface.SetDrawColor(Color(25, 25, 25, 225))
        surface.DrawRect(hud_hb.x, hud_hb.y, hud_hb.w, hud_hb.h)

        -- player's name, in case they forget (lmao)

        /*
        local hud_pname = {
            x = hud_hb.x + (hud_hb.w / 2),
            y = hud_hb.y + ScreenScale(1),
            text = LocalPlayer():GetName() .. " | " .. string.NiceTime( CurTime() )
        }

        surface.SetFont("ACT3_HUD_6")

        surface.SetTextColor(hudcol)
        ACT3_HH_AlignText(hud_pname, ACT3_ALIGN_CENTER)
        surface.SetTextPos(hud_pname.x, hud_pname.y)
        surface.DrawText(hud_pname.text)
        */

        -- hp

        local hud_hp_symbol = {
            x = hud_hb.x + ScreenScale(4),
            y = hud_hb.y + ScreenScale(4),
            w = ScreenScale(8),
            h = ScreenScale(8)
        }

        surface.SetFont("ACT3_HUD_8")
        surface.SetTextPos(hud_hp_symbol.x, hud_hp_symbol.y)
        surface.SetTextColor(hudcol)
        surface.DrawText("HP :")

        local hud_hp_bar = {
            x = hud_hb.x + ScreenScale(20),
            y = hud_hp_symbol.y + ScreenScale(1),
            w = ScreenScale(92),
            h = ScreenScale(6)
        }

        local hp_frac = math.Clamp(LocalPlayer():Health() / LocalPlayer():GetMaxHealth(), 0, 1)

        last_frac = math.Approach(last_frac, hp_frac, FrameTime())

        hud_hp_bar.fw = hud_hp_bar.w * last_frac

        surface.SetDrawColor(hudcol)
        surface.DrawOutlinedRect(hud_hp_bar.x, hud_hp_bar.y, hud_hp_bar.w, hud_hp_bar.h)
        surface.DrawRect(hud_hp_bar.x, hud_hp_bar.y, hud_hp_bar.fw, hud_hp_bar.h)

        local hud_hp_text = {
            x = hud_hp_bar.x + hud_hp_bar.w + ScreenScale(2),
            y = hud_hp_bar.y - ScreenScale(2)
        }

        surface.SetFont("ACT3_HUD_10")
        surface.SetTextPos(hud_hp_text.x, hud_hp_text.y)
        surface.DrawText(LocalPlayer():Health())

        -- armor

        local hud_armor_symbol = {
            x = hud_hb.x + ScreenScale(4),
            y = hud_hb.y + ScreenScale(14),
            w = ScreenScale(8),
            h = ScreenScale(8)
        }

        surface.SetFont("ACT3_HUD_6")
        surface.SetTextPos(hud_armor_symbol.x, hud_armor_symbol.y)
        surface.SetTextColor(hudcol)
        surface.DrawText("ARMOR :")

        local hud_armor_bar = {
            x = hud_hb.x + ScreenScale(24),
            y = hud_armor_symbol.y + ScreenScale(2),
            w = ScreenScale(88),
            h = ScreenScale(2)
        }

        local armor_frac = math.Clamp(LocalPlayer():Armor() / 100, 0, 1)

        last_armor_frac = math.Approach(last_armor_frac, armor_frac, FrameTime())

        hud_armor_bar.fw = hud_armor_bar.w * last_armor_frac

        surface.DrawOutlinedRect(hud_armor_bar.x, hud_armor_bar.y, hud_armor_bar.w, hud_armor_bar.h)
        surface.DrawRect(hud_armor_bar.x, hud_armor_bar.y, hud_armor_bar.fw, hud_armor_bar.h)

        local hud_armor_text = {
            x = hud_armor_bar.x + hud_armor_bar.w + ScreenScale(2),
            y = hud_armor_bar.y - ScreenScale(3)
        }

        surface.SetFont("ACT3_HUD_8")
        surface.SetTextPos(hud_armor_text.x, hud_armor_text.y)
        surface.DrawText(LocalPlayer():Armor())

    end

    end

    ACT3_DrawHints()
end)