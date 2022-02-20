local menupages = {
    ACT3_PAGE_MAGS,
    ACT3_PAGE_CUSTOMIZE,
    ACT3_PAGE_STATS,
    ACT3_PAGE_SAVES
}

if !ACT3.EnableCustomizeMenu then
    menupages = {
        ACT3_PAGE_MAGS,
        ACT3_PAGE_STATS,
    }
end

local img_block = Material("attachments/att_block.png")
local hud_tri = Material("act3hud/triangle.png", "mips")

function SWEP:DrawInventory()
    local key_lastpage = ""
    local key_nextpage = ""
    local key_toggleinv = ""
    local key_reload = ""
    local key_secondary = ""
    local key_primary = ""
    local key_cycle = ""
    local key_mwheelup = ""
    local key_mwheeldown = ""


    key_lastpage = string.upper(input.LookupBinding( ACT3_KEY_MENU_BACK ) or "BIND " .. ACT3_KEY_MENU_BACK)
    key_nextpage = string.upper(input.LookupBinding( ACT3_KEY_MENU_NEXT ) or "BIND " .. ACT3_KEY_MENU_NEXT)
    key_toggleinv = string.upper(input.LookupBinding( ACT3_KEY_TOGGLEINV ) or "BIND " .. ACT3_KEY_TOGGLEINV)
    key_secondary = string.upper(input.LookupBinding( ACT3_KEY_SECONDARY ) or "BIND " .. ACT3_KEY_SECONDARY)
    key_primary = string.upper(input.LookupBinding( ACT3_KEY_PRIMARY ) or "BIND " .. ACT3_KEY_PRIMARY)
    key_reload = string.upper(input.LookupBinding( "+reload" ) or "BIND " .. "+reload")
    key_cycle = string.upper(input.LookupBinding( ACT3_KEY_CYCLE ) or "BIND " .. ACT3_KEY_CYCLE)
    key_mwheelup = string.upper(input.LookupBinding( ACT3_KEY_MWHEEL_NEXT ) or "BIND " .. ACT3_KEY_MWHEEL_NEXT)
    key_mwheeldown = string.upper(input.LookupBinding( ACT3_KEY_MWHEEL_PREV ) or "BIND " .. ACT3_KEY_MWHEEL_PREV)

    local hints = ""

    local hudcol = Color(255, 255, 255)
    local hudbg = Color(25, 25, 25, 225)
    local blockcol = Color(255, 50, 50)
    local blockoutline = Color(255, 150, 150)
    local widegap = ScreenScale(24)

    -- draw main panel

    local main = {
        x = widegap,
        y = widegap,
        w = ScreenScale(128),
        h = ScreenScale(256)
    }

    surface.SetDrawColor(hudbg)
    surface.DrawRect(main.x, main.y, main.w, main.h)

    local c_page = menupages[self.Inv_Page]

    -- title text

    local p_title = {
        x = main.x + (main.w / 2),
        y = main.y,
        text = ACT3.Inv_PageNames[c_page]
    }

    surface.SetFont("ACT3_HUD_16")
    ACT3_HH_AlignText(p_title, ACT3_ALIGN_CENTER)
    surface.SetTextColor(hudcol)
    surface.SetTextPos(p_title.x, p_title.y)
    surface.DrawText(p_title.text)

    -- toggle text

    local nextpage = self.Inv_Page + 1
    if nextpage > #menupages then
        nextpage = 1
    end

    local p_nextpage = {
        x = main.x + main.w - ScreenScale(2),
        y = main.y + ScreenScale(16),
        text = ACT3.Inv_PageNames[menupages[nextpage]] .. " [" .. key_nextpage .. "]"
    }

    surface.SetFont("ACT3_HUD_8")
    ACT3_HH_AlignText(p_nextpage, ACT3_ALIGN_RIGHT)
    surface.SetTextColor(hudcol)
    surface.SetTextPos(p_nextpage.x, p_nextpage.y)
    surface.DrawText(p_nextpage.text)

    local lastpage = self.Inv_Page - 1
    if lastpage <= 0 then
        lastpage = #menupages
    end

    local p_lastpage = {
        x = main.x + ScreenScale(2),
        y = main.y + ScreenScale(16),
        text = "[" .. key_lastpage .. "] " .. ACT3.Inv_PageNames[menupages[lastpage]]
    }

    surface.SetFont("ACT3_HUD_8")
    surface.SetTextColor(hudcol)
    surface.SetTextPos(p_lastpage.x, p_lastpage.y)
    surface.DrawText(p_lastpage.text)

    local p_sepbar = {
        x = main.x + ScreenScale(2),
        y = main.y + ScreenScale(28),
        w = main.w - ScreenScale(4),
        h = ScreenScale(0.5)
    }

    surface.SetDrawColor(hudcol)
    surface.DrawRect(p_sepbar.x, p_sepbar.y, p_sepbar.w, p_sepbar.h)

    if c_page == ACT3_PAGE_MAGS then

        -- Magazine loading UI

        -- 

        -- 

        --

        -- 

        local pa_slots = {
            x = main.x + ScreenScale(4),
            y = p_sepbar.y + ScreenScale(2),
            text = self.Owner:ACT3_GetMagazineSlotsUsed() .. "/" .. self.Owner:ACT3_GetMagazineSlots() .. " Slots"
        }

        surface.SetFont("ACT3_HUD_8")
        surface.SetTextColor(hudcol)
        surface.SetTextPos(pa_slots.x, pa_slots.y)
        surface.DrawText(pa_slots.text)

        local loaded = "None"

        if self.Magazine then
            loaded = ACT3_GetMagazineType(self.Magazine.Type).PrintName
        end

        local pa_loaded = {
            x = main.x + ScreenScale(4),
            y = p_sepbar.y + ScreenScale(10),
            text = "Mag: " .. loaded
        }

        surface.SetFont("ACT3_HUD_8")
        surface.SetTextColor(hudcol)
        surface.SetTextPos(pa_loaded.x, pa_loaded.y)
        surface.DrawText(pa_loaded.text)

        local printtype = ACT3.PrintTypeTable[self.MagazineType] or string.upper(self.MagazineType)

        local pa_type = {
            x = main.x + main.w - ScreenScale(4),
            y = p_sepbar.y + ScreenScale(2),
            text = "Type: " .. printtype
        }

        surface.SetFont("ACT3_HUD_6")
        ACT3_HH_AlignText(pa_type, ACT3_ALIGN_RIGHT)
        surface.SetTextColor(hudcol)
        surface.SetTextPos(pa_type.x, pa_type.y)
        surface.DrawText(pa_type.text)

        local printtext = "No Chamber"

        if !self.OpenBolt then
            local chamber = self.ChamberedRound

            printtext = "Chambered: "

            if chamber then
                printtext = printtext .. ACT3_GetBullet(chamber).PrintName
            else
                printtext = printtext .. "None"
            end
        end

        local pa_chambered = {
            x = main.x + ScreenScale(4),
            y = p_sepbar.y + ScreenScale(18),
            text = printtext
        }

        surface.SetFont("ACT3_HUD_8")
        surface.SetTextColor(hudcol)
        surface.SetTextPos(pa_chambered.x, pa_chambered.y)
        surface.DrawText(pa_chambered.text)

        local pa_sepbar = {
            x = main.x + ScreenScale(2),
            y = p_sepbar.y + ScreenScale(28),
            w = main.w - ScreenScale(4),
            h = ScreenScale(0.5)
        }

        surface.SetDrawColor(hudcol)
        surface.DrawRect(pa_sepbar.x, pa_sepbar.y, pa_sepbar.w, pa_sepbar.h)

        if self.Inv_Submenu then

            local pa_ammo = {
                x = main.x + ScreenScale(4),
                y = pa_sepbar.y + ScreenScale(4),
                h = ScreenScale(24),
            }

            hints = "[" .. key_toggleinv .. "] Back / [" .. key_primary .. "] Load / [" .. key_secondary .. "] Unload [" .. key_reload .. "] Full Load/Unload"

            if !self.CannotCycle then
                hints = hints .. " / [" .. key_cycle .. "] Cycle"
            end

            local mag = self.Owner:ACT3_GetMagazine(self.Inv_Select)
            local magtype = ACT3_GetMagazineType(mag.Type)
            local bulletinv = self.Owner:ACT3_GetBulletInventoryForCalibre(magtype.Calibre)

            local toshow = 8

            while self.Inv_Submenu_Offset + toshow < self.Inv_Submenu_Select do
                self.Inv_Submenu_Offset = self.Inv_Submenu_Offset + 1
            end

            while self.Inv_Submenu_Offset >= self.Inv_Submenu_Select do
                self.Inv_Submenu_Offset = self.Inv_Submenu_Offset - 1
            end

            local more = false

            for i, k in pairs(bulletinv) do
                if i - self.Inv_Submenu_Offset < 1 then continue end
                if i - self.Inv_Submenu_Offset > toshow then more = true continue end

                if i == self.Inv_Submenu_Select then
                    local pa_highlight = {
                        x = main.x + ScreenScale(2),
                        y = pa_ammo.y,
                        w = main.w - ScreenScale(4),
                        h = pa_ammo.h - ScreenScale(1)
                    }

                    surface.SetDrawColor(Color(255, 255, 255, 50))
                    surface.DrawRect(pa_highlight.x, pa_highlight.y, pa_highlight.w, pa_highlight.h)
                end

                local bullet = k.bullet

                local ammo_name = bullet.PrintName

                if !GetConVar("act3_infinite_loose"):GetBool() then
                    ammo_name = ammo_name .. " (x" .. self.Owner:ACT3_GetBullets(k.id) .. ")"
                end

                surface.SetFont("ACT3_HUD_10")
                surface.SetTextColor(hudcol)
                surface.SetTextPos(pa_ammo.x, pa_ammo.y)
                surface.DrawText(ammo_name)

                local pa_ammo_desc = {
                    x = main.x + ScreenScale(4),
                    y = pa_ammo.y + ScreenScale(10),
                    text = bullet.Description,
                    h = ScreenScale(6)
                }

                for j, l in pairs(pa_ammo_desc.text) do
                    surface.SetFont("ACT3_HUD_6")

                    surface.SetTextColor(hudcol)

                    if bullet.DescColors then
                        surface.SetTextColor(bullet.DescColors[j] or hudcol)
                    end

                    surface.SetTextPos(pa_ammo_desc.x, pa_ammo_desc.y)
                    surface.DrawText(l)
                    pa_ammo_desc.y = pa_ammo_desc.y + pa_ammo_desc.h
                end

                pa_ammo.y = pa_ammo.y + pa_ammo.h
            end

            if more then
                surface.SetMaterial(hud_tri)
                surface.SetDrawColor(hudcol)
                surface.DrawTexturedRect(main.x + (main.w - ScreenScale(24)) / 2, main.y + main.h - ScreenScale(9), ScreenScale(24), ScreenScale(8))
            end

            local pa_mag_view = {
                x = ScrW() - widegap,
                y = widegap,
                w = ScreenScale(128),
                h = ScreenScale(256)
            }

            pa_mag_view.x = pa_mag_view.x - pa_mag_view.w

            surface.SetDrawColor(hudbg)
            surface.DrawRect(pa_mag_view.x, pa_mag_view.y, pa_mag_view.w, pa_mag_view.h)

            local pam_title = {
                x = pa_mag_view.x + ScreenScale(8),
                y = pa_mag_view.y + ScreenScale(14),
                text = magtype.PrintName
            }

            surface.SetFont("ACT3_HUD_10")
            surface.SetTextColor(hudcol)
            surface.SetTextPos(pam_title.x, pam_title.y)
            surface.DrawText(pam_title.text)
            surface.SetTextPos(pam_title.x, pam_title.y - ScreenScale(10))
            surface.DrawText("Magazine (" .. #mag.Rounds .. "/" .. magtype.MagSize .. ")")


            local pam_sepbar = {
                x = pa_mag_view.x + ScreenScale(2),
                y = pa_mag_view.y + ScreenScale(28),
                w = pa_mag_view.w - ScreenScale(4),
                h = ScreenScale(0.5)
            }

            surface.SetDrawColor(hudcol)
            surface.DrawRect(pam_sepbar.x, pam_sepbar.y, pam_sepbar.w, pam_sepbar.h)

            local pam_round = {
                x = pa_mag_view.x + ScreenScale(4),
                y = pam_sepbar.y + ScreenScale(6),
                h = ScreenScale(12)
            }

            toshow = 18

            for i, k in pairs(mag.Rounds) do
                if i == "BaseClass" then continue end
                if i > toshow then continue end

                local bullet = ACT3_GetBullet(k)

                surface.SetFont("ACT3_HUD_10")
                surface.SetTextColor(hudcol)
                pam_round.text = " - " .. bullet.PrintName
                surface.SetTextPos(pam_round.x, pam_round.y)
                surface.DrawText(pam_round.text)

                pam_round.x = pa_mag_view.x + ScreenScale(4)
                pam_round.y = pam_round.y + pam_round.h
            end

        else

            local pa_mag = {
                x = main.x + ScreenScale(4),
                y = pa_sepbar.y + ScreenScale(4),
                h = ScreenScale(24),
            }

            hints = "[" .. key_toggleinv .. "] Exit / ["  .. key_primary .. "] Select"

            if !self.CannotCycle then
                hints = hints .. " / [" .. key_cycle .. "] Cycle"
            end

            if self.InternalMag then

                local mag = self.Magazine

                local magtype = ACT3_GetMagazineType(mag.Type)

                if 0 == self.Inv_Select then
                    local pa_highlight = {
                        x = main.x + ScreenScale(2),
                        y = pa_mag.y,
                        w = main.w - ScreenScale(4),
                        h = pa_mag.h - ScreenScale(2)
                    }

                    surface.SetDrawColor(Color(255, 255, 255, 50))
                    surface.DrawRect(pa_highlight.x, pa_highlight.y, pa_highlight.w, pa_highlight.h)
                end

                surface.SetFont("ACT3_HUD_10")
                surface.SetTextColor(hudcol)
                surface.SetTextPos(pa_mag.x, pa_mag.y)
                surface.DrawText(magtype.PrintName)

                local amt = #mag.Rounds .. "/" .. magtype.MagSize

                surface.SetFont("ACT3_HUD_8")
                surface.SetTextColor(hudcol)
                surface.SetTextPos(pa_mag.x, pa_mag.y + ScreenScale(10))
                surface.DrawText(amt)

                local topofmag = ""

                for j = 1, 5 do
                    if !mag.Rounds[j] then continue end

                    local bullet = ACT3_GetBullet(mag.Rounds[j])

                    if mag.Rounds[j - 1] then
                        topofmag = bullet.Type .. ", " .. topofmag
                    else
                        topofmag = bullet.Type .. topofmag
                    end
                end

                if topofmag != "" and mag.Rounds[6] then
                    topofmag = topofmag .. "..."
                end

                local pa_rounds = {
                    x = main.x + main.w - ScreenScale(4),
                    y = pa_mag.y + ScreenScale(10),
                    text = topofmag
                }

                surface.SetFont("ACT3_HUD_6")
                ACT3_HH_AlignText(pa_rounds, ACT3_ALIGN_RIGHT)
                surface.SetTextColor(hudcol)
                surface.SetTextPos(pa_rounds.x, pa_rounds.y)
                surface.DrawText(pa_rounds.text)

            else

                hints = hints .. " / [" .. key_secondary .. "] Drop / [" .. key_mwheelup .. "] Next / [" .. key_mwheeldown .. "] Last / [" .. key_reload .. "] Load Mag"

                local toshow = 8

                while self.Inv_Offset + toshow < self.Inv_Select do
                    self.Inv_Offset = self.Inv_Offset + 1
                end

                while self.Inv_Offset >= self.Inv_Select do
                    self.Inv_Offset = self.Inv_Offset - 1
                end

                local more = false

                for i, mag in pairs(self.Owner.ACT3_MagazineInventory) do

                    if i - self.Inv_Offset < 1 then continue end
                    if i - self.Inv_Offset > toshow then more = true continue end

                    if i == self.Inv_Select then
                        local pa_highlight = {
                            x = main.x + ScreenScale(2),
                            y = pa_mag.y,
                            w = main.w - ScreenScale(4),
                            h = pa_mag.h - ScreenScale(2)
                        }

                        surface.SetDrawColor(Color(255, 255, 255, 50))
                        surface.DrawRect(pa_highlight.x, pa_highlight.y, pa_highlight.w, pa_highlight.h)
                    end

                    local magtype = ACT3_GetMagazineType(mag.Type)

                    surface.SetFont("ACT3_HUD_10")
                    surface.SetTextColor(hudcol)
                    surface.SetTextPos(pa_mag.x, pa_mag.y)
                    surface.DrawText(magtype.PrintName)

                    local amt = #mag.Rounds .. "/" .. magtype.MagSize .. " | " .. magtype.Slots .. " Slots"

                    surface.SetFont("ACT3_HUD_8")
                    surface.SetTextColor(hudcol)
                    surface.SetTextPos(pa_mag.x, pa_mag.y + ScreenScale(10))
                    surface.DrawText(amt)

                    local topofmag = ""

                    for j = 1, 5 do
                        if !mag.Rounds[j] then continue end

                        local bullet = ACT3_GetBullet(mag.Rounds[j])

                        if mag.Rounds[j - 1] then
                            topofmag = bullet.Type .. ", " .. topofmag
                        else
                            topofmag = bullet.Type .. topofmag
                        end
                    end

                    if topofmag != "" and mag.Rounds[6] then
                        topofmag = topofmag .. "..."
                    end

                    local pa_rounds = {
                        x = main.x + main.w - ScreenScale(4),
                        y = pa_mag.y + ScreenScale(10),
                        text = topofmag
                    }

                    surface.SetFont("ACT3_HUD_6")
                    ACT3_HH_AlignText(pa_rounds, ACT3_ALIGN_RIGHT)
                    surface.SetTextColor(hudcol)
                    surface.SetTextPos(pa_rounds.x, pa_rounds.y)
                    surface.DrawText(pa_rounds.text)

                    pa_mag.y = pa_mag.y + pa_mag.h

                end

                if more then
                    surface.SetMaterial(hud_tri)
                    surface.SetDrawColor(hudcol)
                    surface.DrawTexturedRect(main.x + (main.w - ScreenScale(24)) / 2, main.y + main.h - ScreenScale(9), ScreenScale(24), ScreenScale(8))
                end

            end

        end

        hints = hints .. " / Scroll To Select"

    elseif c_page == ACT3_PAGE_CUSTOMIZE then

        hints = "[" .. key_toggleinv .. "] Exit / [" .. key_reload .. "] Change Name"

        if table.Count(self.Attachments) <= 0 then

            hints = "[" .. key_toggleinv .. "] Exit / [" .. key_reload .. "] Change Name"

            local pat_nocustomize = {
                x = main.x + ScreenScale(4),
                y = p_sepbar.y + ScreenScale(6),
                text = "This weapon is not customizable."
            }

            surface.SetFont("ACT3_HUD_10")
            surface.SetTextColor(hudcol)
            surface.SetTextPos(pat_nocustomize.x, pat_nocustomize.y)
            surface.DrawText(pat_nocustomize.text)

        else

            local slot = self:InvIndexToSlot(self.Inv_Select)
            local required = slot.Required

            if !required then
                hints = hints .. " / [" .. key_secondary .. "] Detach"
            end

            if self.Inv_Submenu then

                hints = hints .. " / [" .. key_primary .. "] Attach / [" .. key_secondary .. "] Drop"

                local pat_attop = {
                    x = main.x + ScreenScale(4),
                    y = p_sepbar.y + ScreenScale(6),
                    h = ScreenScale(42)
                }

                local toshow = 5

            while self.Inv_Submenu_Offset + toshow < self.Inv_Submenu_Select do
                    self.Inv_Submenu_Offset = self.Inv_Submenu_Offset + 1
                end

                while self.Inv_Submenu_Offset >= self.Inv_Submenu_Select do
                    self.Inv_Submenu_Offset = self.Inv_Submenu_Offset - 1
                end

                local i = 0

                local slotatts = self.Owner:ACT3_GetAttachmentsForSlot(slot.Type)
                for _, j in pairs(slot.ExtraTypes or {}) do
                    table.Add(slotatts, ACT3_GetAttachmentsForSlot(j))
                end

                if #slotatts == 0 then

                    surface.SetFont("ACT3_HUD_10")
                    surface.SetTextColor(hudcol)
                    surface.SetTextPos(pat_attop.x, pat_attop.y)
                    surface.DrawText("No options available.")
                end

                local more = false

                for _, attid in pairs(slotatts) do
                    i = i + 1
                    if i - self.Inv_Submenu_Offset < 1 then continue end
                    if i - self.Inv_Submenu_Offset > toshow then more = true continue end

                    local att = ACT3_GetAttachment(attid)

                    local pat_image = {
                        x = pat_attop.x,
                        y = pat_attop.y + ScreenScale(2),
                        w = main.w - ScreenScale(4),
                        h = pat_attop.h - ScreenScale(4)
                    }

                    if i == self.Inv_Submenu_Select then
                        local pat_highlight = {
                            x = main.x + ScreenScale(2),
                            y = pat_attop.y,
                            w = main.w - ScreenScale(4),
                            h = pat_attop.h - ScreenScale(2)
                        }

                        surface.SetDrawColor(Color(255, 255, 255, 50))
                        surface.DrawRect(pat_highlight.x, pat_highlight.y, pat_highlight.w, pat_highlight.h)
                    end

                    if att.Icon then
                        surface.SetDrawColor(Color(255, 255, 255, 200))
                        surface.SetMaterial(att.Icon)
                        surface.DrawTexturedRect(pat_image.x, pat_image.y, pat_image.w, pat_image.h)
                    end

                    if !self:AttachFlagsOkay(att) then
                        surface.SetDrawColor(Color(255, 255, 255, 200))
                        surface.SetMaterial(img_block)
                        surface.DrawTexturedRect(pat_image.x, pat_image.y, pat_image.w, pat_image.h)
                    end

                    local printname = att.PrintName

                    if !att.Free and !GetConVar("act3_infinite_atts"):GetBool() then
                        printname = printname .. " (x" .. self.Owner:ACT3_GetNumAttachment(att.Name) .. ")"
                    end

                    surface.SetFont("ACT3_HUD_10")
                    surface.SetTextColor(hudcol)
                    surface.SetTextPos(pat_attop.x, pat_attop.y)
                    surface.DrawText(printname)

                    local pat_desc = {
                        x = pat_attop.x,
                        y = pat_attop.y + ScreenScale(10),
                        h = ScreenScale(6)
                    }

                    if att.Description then
                        for _, line in pairs(att.Description) do
                            surface.SetFont("ACT3_HUD_6")

                            surface.SetTextColor(hudcol)

                            if att.DescColors then
                                surface.SetTextColor(att.DescColors[_] or hudcol)
                            end

                            surface.SetTextPos(pat_desc.x, pat_desc.y)
                            surface.DrawText(line)

                            pat_desc.y = pat_desc.y + pat_desc.h
                        end
                    end

                    pat_attop.y = pat_attop.y + pat_attop.h
                end

                if more then
                    surface.SetMaterial(hud_tri)
                    surface.SetDrawColor(hudcol)
                    surface.DrawTexturedRect(main.x + (main.w - ScreenScale(24)) / 2, main.y + main.h - ScreenScale(9), ScreenScale(24), ScreenScale(8))
                end
            else
                hints = hints .. " / [" .. key_primary .. "] Select"

                local pat_slot = {
                    x = main.x + ScreenScale(4),
                    y = p_sepbar.y + ScreenScale(6),
                    h = ScreenScale(42)
                }

                local toshow = 5

                while self.Inv_Offset + toshow < self.Inv_Select do
                    self.Inv_Offset = self.Inv_Offset + 1
                end

                while self.Inv_Offset >= self.Inv_Select do
                    self.Inv_Offset = self.Inv_Offset - 1
                end

                local i = 0

                local more = false

                for _, slot in pairs(self.Attachments) do
                    i = i + 1
                    if i - self.Inv_Offset < 1 then continue end
                    if i - self.Inv_Offset > toshow then more = true continue end

                    local pat_image = {
                        x = pat_slot.x,
                        y = pat_slot.y + ScreenScale(2),
                        w = main.w - ScreenScale(4),
                        h = pat_slot.h - ScreenScale(4)
                    }

                    local att = ACT3_GetAttachment(slot.Installed) or {}

                    if i == self.Inv_Select then
                        local pat_highlight = {
                            x = main.x + ScreenScale(2),
                            y = pat_slot.y,
                            w = main.w - ScreenScale(4),
                            h = pat_slot.h - ScreenScale(2)
                        }

                        surface.SetDrawColor(Color(255, 255, 255, 50))
                        surface.DrawRect(pat_highlight.x, pat_highlight.y, pat_highlight.w, pat_highlight.h)
                    end

                    if att.Icon then
                        surface.SetDrawColor(Color(255, 255, 255, 200))
                        surface.SetMaterial(att.Icon)
                        surface.DrawTexturedRect(pat_image.x, pat_image.y, pat_image.w, pat_image.h)
                    end

                    local slotname = slot.PrintName

                    if slot.Installed then
                        slotname = slotname .. ": " .. att.PrintName
                    end

                    surface.SetFont("ACT3_HUD_10")
                    surface.SetTextColor(hudcol)
                    surface.SetTextPos(pat_slot.x, pat_slot.y)
                    surface.DrawText(slotname)

                    pat_slot.y = pat_slot.y + pat_slot.h
                end

                if more then
                    surface.SetMaterial(hud_tri)
                    surface.SetDrawColor(hudcol)
                    surface.DrawTexturedRect(main.x + (main.w - ScreenScale(24)) / 2, main.y + main.h - ScreenScale(9), ScreenScale(24), ScreenScale(8))
                end
            end

        end

        hints = hints .. " / Scroll To Select"

    elseif c_page == ACT3_PAGE_STATS then

        local precision = self.Precision * ACT3.Conversions.GMBP_To_MOA
        local rof = 60 / self.ShootingDelay
        local magcapacity = "N/A"

        if self.Magazine then
            local magtype = ACT3_GetMagazineType(self.Magazine.Type)

            magcapacity = tostring(magtype.MagSize)
        end

        local muzzlevel = math.Round(self.MuzzleVelocity * ACT3.Conversions.HutoM, 0)

        rof = math.Round(rof, 0)
        precision = math.Truncate(precision, 1)

        local recoil = math.Truncate(self.Recoil * ACT3.Conversions.RecoilToLBFPS, 1)

        local bullet = ACT3_GetBullet(self.LastShotBullet or self.DefaultLoad or "")

        local damage = ((bullet and bullet.BaseDamage) or 0) * 10

        local ps_desc = {
            x = main.x + ScreenScale(2),
            y = p_sepbar.y + ScreenScale(2),
            h = ScreenScale(8)
        }

        if !self.PrimaryMelee then
            ps_desc.text = {
                "Name: " .. self.PrintName,
                "Country: " .. self.Desc_Country or "Unknown",
                "Manufacturer: " .. self.Desc_Manufacturer or "Unknown",
                "Mechanism: " .. self.Desc_Mechanism or "Unknown",
                "Year: " .. tostring(self.Desc_Year or "Unknown"),
                "Weight: " .. tostring(self.Desc_Weight or "Unknown") .. " KG",
                "Muzzle Velocity: " .. tostring(muzzlevel) .. " m/s",
                "Precision: " .. tostring(precision) .. " MOA",
                "ROF: " .. tostring(rof) .. " RPM",
                "Calibre: " .. self.PrintCalibre,
                "Magazine Capacity: " .. magcapacity,
                "Noise: " .. self.SoundShootVol .. "dB",
                "Effective Recoil Momentum: " .. recoil .. " lb-fps",
            }
        else
            ps_desc.text = {
                "Name: " .. self.PrintName,
                "Country: " .. self.Desc_Country or "Unknown",
                "Manufacturer: " .. self.Desc_Manufacturer or "Unknown",
                "Mechanism: " .. self.Desc_Mechanism or "Unknown",
                "Year: " .. tostring(self.Desc_Year or "Unknown"),
                "Weight: " .. tostring(self.Desc_Weight or "Unknown") .. " KG",
            }
        end

        if damage and damage > 0 then
            table.insert(ps_desc.text, "Impact Energy: " .. damage .. "J")
        end

        if self.Desc_Extra then
            table.Add(ps_desc.text, self.Desc_Extra)
        end

        for i, k in pairs(ps_desc.text) do
            surface.SetFont("ACT3_HUD_8")
            surface.SetTextColor(hudcol)
            surface.SetTextPos(ps_desc.x, ps_desc.y)
            surface.DrawText(k)

            ps_desc.y = ps_desc.y + ps_desc.h
        end

    elseif c_page == ACT3_PAGE_SAVES then

        hints = "[" .. key_toggleinv .. "] Exit / [" .. key_reload .. "] Change Name / [" .. key_primary .. "] Load Save / [" .. key_secondary .. "] Save Gun / [" .. key_cycle .. "] Delete Save"

        if table.Count(self.SavesData) <= 0 then
            hints = "[" .. key_toggleinv .. "] Exit / [" .. key_reload .. "] Change Name / [" .. key_secondary .. "] Save Gun"

            local pat_nocustomize = {
                x = main.x + ScreenScale(4),
                y = p_sepbar.y + ScreenScale(6),
                text = "This weapon has no saves."
            }

            surface.SetFont("ACT3_HUD_10")
            surface.SetTextColor(hudcol)
            surface.SetTextPos(pat_nocustomize.x, pat_nocustomize.y)
            surface.DrawText(pat_nocustomize.text)
        else

            local pa_mag = {
                x = main.x + ScreenScale(4),
                y = p_sepbar.y + ScreenScale(4),
                h = ScreenScale(24),
            }

            local toshow = 9

            while self.Inv_Offset + toshow < self.Inv_Select do
                self.Inv_Offset = self.Inv_Offset + 1
            end

            while self.Inv_Offset >= self.Inv_Select do
                self.Inv_Offset = self.Inv_Offset - 1
            end

            local i = 0

            local more = false

            for _, save in pairs(self.SavesData) do
                i = i + 1
                if i - self.Inv_Offset < 1 then continue end
                if i - self.Inv_Offset > toshow then more = true continue end

                if i == self.Inv_Select then
                    local pa_highlight = {
                        x = main.x + ScreenScale(2),
                        y = pa_mag.y,
                        w = main.w - ScreenScale(4),
                        h = pa_mag.h - ScreenScale(2)
                    }

                    surface.SetDrawColor(Color(255, 255, 255, 50))
                    surface.DrawRect(pa_highlight.x, pa_highlight.y, pa_highlight.w, pa_highlight.h)
                end

                surface.SetFont("ACT3_HUD_10")
                surface.SetTextColor(hudcol)
                surface.SetTextPos(pa_mag.x, pa_mag.y)
                surface.DrawText(save.Name)

                local atts = ""

                for s, a in pairs(save.Attachments) do
                    if !a.Att then continue end
                    local name = ACT3_GetAttachment(a.Att).PrintName

                    if string.len(atts .. name) > 40 then
                        atts = atts .. "..."
                        break
                    else
                        if s > 1 then
                            atts = atts .. ", " .. name
                        else
                            atts = atts .. name
                        end
                    end
                end

                surface.SetFont("ACT3_HUD_8")
                surface.SetTextColor(hudcol)
                surface.SetTextPos(pa_mag.x, pa_mag.y + ScreenScale(10))
                surface.DrawText(atts)

                pa_mag.y = pa_mag.y + pa_mag.h

            end

        end

        hints = hints .. " / Scroll To Select"

    end

    local pa_hint = {
        x = ScreenScale(4),
        y = ScreenScale(4),
        text = hints
    }

    surface.SetFont("ACT3_HUD_10_Glow")
    ACT3_HH_AlignText(pa_hint, ACT3_ALIGN_LEFT)
    surface.SetTextColor(Color(0, 0, 0))
    surface.SetTextPos(pa_hint.x, pa_hint.y)
    surface.DrawText(pa_hint.text)

    surface.SetFont("ACT3_HUD_10")
    surface.SetTextColor(hudcol)
    surface.SetTextPos(pa_hint.x, pa_hint.y)
    surface.DrawText(pa_hint.text)

end