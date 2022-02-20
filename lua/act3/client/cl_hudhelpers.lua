ACT3_ALIGN_LEFT = 0
ACT3_ALIGN_CENTER = 1
ACT3_ALIGN_RIGHT = 2

function ACT3_HH_AlignText(t, align)

    if align == ACT3_ALIGN_CENTER then
        t.x = t.x - (surface.GetTextSize(t.text) / 2)
    elseif align == ACT3_ALIGN_RIGHT  then
        t.x = t.x - surface.GetTextSize(t.text)
    end

    return t
end

ACT3_ActiveHints = {} -- { {text = "", num time, a = 255} }

ACT3.HintTime = 5
ACT3.HintFadeTime = 5

function ACT3_DrawHints()
    local p_hint = {
        x = ScrW() - ScreenScale(4),
        y = ScrH() / 3,
        h = ScreenScale(10)
    }

    for i, hint in pairs(ACT3_ActiveHints) do

        p_hint.text = hint.text
        ACT3_HH_AlignText(p_hint, ACT3_ALIGN_RIGHT)

        local hudcol = Color(255, 255, 255)
        local shadowcol = Color(0, 0, 0)

        hudcol.a = hint.a
        shadowcol.a = hint.a

        surface.SetFont("ACT3_HUD_8")
        surface.SetTextColor(hudcol)
        surface.SetTextPos(p_hint.x, p_hint.y)
        surface.DrawText(p_hint.text)

        surface.SetFont("ACT3_HUD_8_Glow")
        surface.SetTextColor(shadowcol)
        surface.SetTextPos(p_hint.x, p_hint.y)
        surface.DrawText(p_hint.text)

        if hint.time + ACT3.HintTime <= CurTime() then
            hint.a = hint.a - (255 * FrameTime() / ACT3.HintFadeTime)
            if hint.a <= 0 then
                table.remove(ACT3_ActiveHints, i)
            end
        end

        p_hint.y = p_hint.y + p_hint.h
        p_hint.x = ScrW() - ScreenScale(4)
    end
end

ACT3_SeenHints = {}

function ACT3_AddHint(text)
    if SERVER then return end
    if !GetConVar("act3_showhints"):GetBool() then return end
    if !ACT3.EnableHints then return end
    if table.HasValue(ACT3_SeenHints, text) then return end

    table.insert(ACT3_SeenHints, text)

    local hint = {
        text = text,
        a = 255,
        time = CurTime()
    }

    table.insert(ACT3_ActiveHints, hint)
end