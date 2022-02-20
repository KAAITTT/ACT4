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

function SWEP:SyncMenu()
    net.Start("ACT3_ToggleInv")
    net.WriteBool(self.State == ACT3_STATE_ININVMENU)
    net.SendToServer()
end

function SWEP:InvIndexToBulletID(index)
    local selectedmag = self.Owner.ACT3_MagazineInventory[self.Inv_Select]

    if self.InternalMag then
        selectedmag = self.Magazine
    end

    local selectedmagtype = ACT3_GetMagazineType(selectedmag.Type)
    local bulletstable = self.Owner:ACT3_GetBulletInventoryForCalibre(selectedmagtype.Calibre)

    return bulletstable[index].id
end

function SWEP:InvIndexToAtt(index)
    local slot = self:InvIndexToSlot(self.Inv_Select)
    local atts = self.Owner:ACT3_GetAttachmentsForSlot(slot.Type)
    for _, j in pairs(slot.ExtraTypes or {}) do
        table.Add(atts, ACT3_GetAttachmentsForSlot(j))
    end

    return atts[index]
end

function SWEP:InvIndexToSlotID(index)
    local i = 0

    for k, slot in pairs(self.Attachments) do
        i = i + 1
        if i == index then
            return k
        end
    end
end

function SWEP:InvIndexToSlot(index)
    local i = 0

    for _, slot in pairs(self.Attachments) do
        i = i + 1
        if i == index then
            return slot
        end
    end
end

function SWEP:SlotToInvIndex(slot)
    local i = 0

    for k, _ in pairs(self.Attachments) do
        i = i + 1
        if k == slot then
            return i
        end
    end
end

function SWEP:InvPress_MenuNext()
    local nextpage = self.Inv_Page + 1
    if nextpage > #menupages then
        nextpage = 1
    end

    self.Inv_Page = nextpage
    self.Inv_Submenu = false
    self:InvPress_Scroll(-math.huge)
end

function SWEP:InvPress_MenuLast()
    local lastpage = self.Inv_Page - 1
    if lastpage <= 0 then
        lastpage = #menupages
    end

    self.Inv_Page = lastpage
    self.Inv_Submenu = false
    self:InvPress_Scroll(-math.huge)
end

function SWEP:InvPress_Next()
    local c_page = menupages[self.Inv_Page]

    if c_page == ACT3_PAGE_MAGS then
        if !self.Inv_Submenu and self.Owner:ACT3_GetMagazine(self.Inv_Select) then
            local mag = self.Owner:ACT3_GetMagazine(self.Inv_Select)

            if mag.Disposable then return end

            self.Inv_Submenu = true
            self:InvPress_Scroll(-math.huge)
        elseif self.Inv_Submenu then
            local mag = self.Owner:ACT3_GetMagazine(self.Inv_Select)

            local magtype = ACT3_GetMagazineType(mag.Type)
            local bulletinv = self.Owner:ACT3_GetBulletInventoryForCalibre(magtype.Calibre)

            local bullet = bulletinv[self.Inv_Submenu_Select]

            if !bullet then return end

            bullet = bullet.id

            self.Owner:ACT3_LoadRoundIntoMag(self.Inv_Select, bullet)
            mag.DefaultRounds = table.Copy(mag.Rounds)
        end
    elseif c_page == ACT3_PAGE_CUSTOMIZE then
        if !self.Inv_Submenu and table.Count(self.Attachments) > 0 then
            self.Inv_Submenu = true
            self:InvPress_Scroll(-math.huge)
        else
            local slotid = self:InvIndexToSlotID(self.Inv_Select)
            if !slotid then return end
            local att = self:InvIndexToAtt(self.Inv_Submenu_Select)
            if !att then return end

            self:RequestAttach(slotid, att)

            self.Inv_Select = self:SlotToInvIndex(slotid)
            self:InvPress_Scroll(0)
        end
    elseif c_page == ACT3_PAGE_SAVES then
        if table.Count(self.SavesData) > 0 then
            -- load save
            self:Load(self.SavesData[self.Inv_Select])
            self:InvPress_Scroll(-math.huge)
        end
    end
end

function SWEP:InvPress_Last()
    local c_page = menupages[self.Inv_Page]

    if c_page == ACT3_PAGE_MAGS then
        if !self.Inv_Submenu and !self.InternalMag and self.Owner.ACT3_MagazineInventory[self.Inv_Select] then
            self.Owner:ACT3_TakeMagazineFromIndex(self.Inv_Select)
            net.Start("ACT3_DropMagazine")
            net.WriteUInt(self.Inv_Select, 16)
            net.SendToServer()
            self:InvPress_Scroll(0)
        elseif self.Inv_Submenu then
            self.Owner:ACT3_UnloadRoundFromMag(self.Inv_Select)
        end
    elseif c_page == ACT3_PAGE_CUSTOMIZE then
        local slotid = self:InvIndexToSlotID(self.Inv_Select)
        if !slotid then return end
        if !self.Inv_Submenu then
            if self.Attachments[slotid].Installed then
                self:RequestDetach(slotid)
            end

            self.Inv_Select = self:SlotToInvIndex(slotid)
            self:InvPress_Scroll(0)
        else
            local att = self:InvIndexToAtt(self.Inv_Submenu_Select)
            if !att then return end

            self.Owner:ACT3_DropAttachment(att)
            self.Inv_Select = self:SlotToInvIndex(slotid)
            self:InvPress_Scroll(0)
        end
    elseif c_page == ACT3_PAGE_SAVES then
        self:Save()
        self:InvPress_Scroll(0)
    end
end

function SWEP:InvPress_Scroll(val)
    local min = 1
    local max = 1
    local c_page = menupages[self.Inv_Page]

    if c_page == ACT3_PAGE_MAGS then
        if !self.Inv_Submenu then
            if self.InternalMag then
                min = 0
                max = 0
            else
                max = #self.Owner.ACT3_MagazineInventory
            end
        else
            local mag = self.Owner:ACT3_GetMagazine(self.Inv_Select)
            local magtype = ACT3_GetMagazineType(mag.Type)
            local bulletinv = self.Owner:ACT3_GetBulletInventoryForCalibre(magtype.Calibre)

            min = 1
            max = #bulletinv
        end
    elseif c_page == ACT3_PAGE_CUSTOMIZE then
        if !self.Inv_Submenu then
            min = 1
            max = table.Count(self.Attachments)
        else
            local slot = self:InvIndexToSlot(self.Inv_Select)
            local atts = self.Owner:ACT3_GetAttachmentsForSlot(slot.Type)
            for _, j in pairs(slot.ExtraTypes or {}) do
                table.Add(atts, ACT3_GetAttachmentsForSlot(j))
            end
            min = 1
            max = table.Count(atts)
        end
    elseif c_page == ACT3_PAGE_SAVES then
        min = 1
        max = table.Count(self.SavesData)
    end

    if !self.Inv_Submenu then
        self.Inv_Select = math.Clamp(self.Inv_Select + val, min, max)
    else
        self.Inv_Submenu_Select = math.Clamp(self.Inv_Submenu_Select + val, min, max)
    end
end

function SWEP:InvPress_Cycle()
    local c_page = menupages[self.Inv_Page]

    if c_page == ACT3_PAGE_SAVES then
        if table.Count(self.SavesData) > 0 then
            self:DeleteSave(self.SavesData[self.Inv_Select].Filename)
            self:InvPress_Scroll(0)
        end
    else
        if self.CannotCycle then return end
        if self.InternalWeapon then
            return
        end

        local seq = self.Owner:LookupSequence(self.SeqCycle or "reload_smg1_alt")
        self.Owner:AddVCDSequenceToGestureSlot( GESTURE_SLOT_ATTACK_AND_RELOAD, seq, 0.7, true )

        local lastbullet = nil

        if self.OpenBolt then
            if self.Magazine then
                lastbullet = table.remove(self.Magazine.Rounds, 1)
            end
        else
            lastbullet = self.ChamberedRound
            if self.Magazine then
                self.ChamberedRound = table.remove(self.Magazine.Rounds, 1)
            else
                self.ChamberedRound = nil
            end
        end

        if lastbullet then
            self.Owner:ACT3_GiveBullets(lastbullet, 1)
        end

        if CLIENT then
            surface.PlaySound(self.SoundCycle)

            net.Start("ACT3_AttemptCycle")
            net.SendToServer()
        end
    end
end

function SWEP:FullLoadIntoMag()
    local selectedmag = self.Owner:ACT3_GetMagazine(self.Inv_Select)
    local selectedmagtype = ACT3_GetMagazineType(selectedmag.Type)
    local bulletstable = self.Owner:ACT3_GetBulletInventoryForCalibre(selectedmagtype.Calibre)
    local bullets = #bulletstable

    if bullets > 0 then
        if #selectedmag.Rounds >= selectedmagtype.MagSize or bulletstable[self.Inv_Submenu_Select].amt <= 0 then
            self.Owner:ACT3_TotalUnloadFromMag(self.Inv_Select)
        else
            self.Owner:ACT3_FullLoadIntoMag(self.Inv_Select, bulletstable[self.Inv_Submenu_Select].id)
        end
    end
end

function SWEP:ChangeName()
    local frame = vgui.Create("DFrame")
    frame:SetSize(ScreenScale(128), ScreenScale(18))
    frame:Center()
    frame:MakePopup()

    local namebox = vgui.Create("DTextEntry", frame)
    namebox:SetSize(ScreenScale(128), ScreenScale(18))
    namebox:SetPos(0, 0)
    namebox:SetText(self.PrintName)
    namebox:RequestFocus()
    namebox:SetFont("ACT3_HUD_16")

    namebox.OnEnter = function()
        self.PrintName = string.sub(namebox:GetText(), 1, ACT3.MaxNameLength)
        net.Start("ACT3_NameChange")
        net.WriteString(self.PrintName)
        net.SendToServer()

        if self.PrintName == "" then
            self.PrintName = weapons.GetStored(self:GetClass()).PrintName
        end

        frame:Close()
    end

    self:UpdateSaves()
end

function SWEP:InvPress_Reload()
    local c_page = menupages[self.Inv_Page]

    if c_page == ACT3_PAGE_MAGS then
        if self.Inv_Submenu then
            self:FullLoadIntoMag()
        elseif !self.Inv_Submenu and !self.InternalMag then
            local mag = self.Owner:ACT3_GetMagazine(self.Inv_Select)

            if !mag then return end

            local newmagtype = ACT3_GetMagazineType(mag.Type).Type

            if newmagtype != self.MagazineType then return end

            self.MagazineIndex = self.Inv_Select
            self:Reload()

            net.Start("ACT3_LoadIntoGun")
            net.WriteUInt(self.Inv_Select, 16)
            net.SendToServer()
        end
    elseif c_page == ACT3_PAGE_CUSTOMIZE or c_page == ACT3_PAGE_SAVES then
        self:ChangeName()
    end
end

function SWEP:InvPress_C()
    if self:InvDisabled() then return end

    if self.State == ACT3_STATE_ININVMENU then
        if !self.Inv_Submenu then
            self.State = ACT3_STATE_IDLE
            self:TryFakeReload()
            self:SyncMenu()
        else
            self.Inv_Submenu = false
        end
    else
        self.State = ACT3_STATE_ININVMENU
        self.PerformedSelfMagOperation = false
        self:InvPress_Scroll(-math.huge)
        self:SyncMenu()
        self:UpdateSaves()
    end
end

/*

function SWEP:MenuInv()
    if self:InvDisabled() then return end

    if !self.Owner.ACT3_MagazineInventory then
        self.Owner.ACT3_MagazineInventory = {}
    end

    if self.State == ACT3_STATE_ININVMENU then
        if self.InvMenuState == ACT3_INVSTATE_MAGLOAD then
            if self.MagazineSelected then
                self.MagazineSelected = false
            else
                self.State = ACT3_STATE_IDLE
                self:TryFakeReload()
                self:SyncState()
            end
        elseif self.InvMenuState == ACT3_INVSTATE_CUSTOMIZE then
            if self.AttachmentSelected then
                self.AttachmentSelected = false
            else
                self.State = ACT3_STATE_IDLE
                self:SyncState()
            end
        else
            self.State = ACT3_STATE_IDLE
            self:SyncState()
        end
    else
        self.State = ACT3_STATE_ININVMENU
        self.PerformedSelfMagOperation = false
        self:SwitchMenuOffset(0)
        local eyeangles = self.Owner:EyeAngles()
        eyeangles.x = 0
        self.Owner:SetEyeAngles(eyeangles)
        self:SyncState()
    end

    if self.InternalMag then
        self.InvMenuSelection = 0
    end

end

function SWEP:MenuPageNext()
    if self.State != ACT3_STATE_ININVMENU then return end

    self:SwitchMenu(1)
end

function SWEP:MenuPageLast()
    if self.State != ACT3_STATE_ININVMENU then return end

    self:SwitchMenu(-1)
end

function SWEP:SwitchMenu(val)
    if self.State != ACT3_STATE_ININVMENU then return end

    self.InvMenuState = self.InvMenuState + val

    if self.InvMenuState < 0 then
        self.InvMenuState = ACT3_MAX_INVMENU_PAGE
    end

    if self.InvMenuState > ACT3_MAX_INVMENU_PAGE then
        self.InvMenuState = 0
    end
end

function SWEP:SendLoadIntoGun()
    net.Start("ACT3_LoadIntoGun")
    net.WriteUInt(self.InvMenuSelection, 16)
    net.SendToServer()

    self.MagazineIndex = self.InvMenuSelection
    self:Reload()
end

function SWEP:MenuScrollUp()
end

function SWEP:MenuScrollDown()
end

function SWEP:FullLoadIntoMag()
    local selection = self.InvMenuSelection
    local selectedmag = self.Owner.ACT3_MagazineInventory[selection]
    local selectedmagtype = ACT3_GetMagazineType(selectedmag.Type)
    if self.InternalMag then
        selection = 0
        selectedmag = self.Magazine
    end
    local bulletstable = self.Owner:ACT3_GetBulletInventoryForCalibre(selectedmagtype.Calibre)
    local bullets = #bulletstable

    if bullets > 0 then
        if #selectedmag.Rounds >= selectedmagtype.MagSize or bulletstable[self.AmmoTypeSelection].amt == 0 then
            self.Owner:ACT3_TotalUnloadFromMag(selection)
        else
            self.Owner:ACT3_FullLoadIntoMag(selection, bulletstable[self.AmmoTypeSelection].bullet.id)
        end
    end
end

function SWEP:MenuNext()
    if self.State != ACT3_STATE_ININVMENU then return end

    if self.InvMenuState == ACT3_INVSTATE_MAGLOAD then
        if self.InternalWeapon then
            return
        end

        local mags = #self.Owner.ACT3_MagazineInventory

        if self.InternalMag then
            mags = 1
            self.InvMenuSelection = 0
        end

        if !self.MagazineSelected and mags > 0 then
            local selection = self.InvMenuSelection
            local selectedmag = self.Owner.ACT3_MagazineInventory[selection]
            if self.InternalMag then
                selection = 0
                selectedmag = self.Magazine
            end
            local selectedmagtype = ACT3_GetMagazineType(selectedmag.Type)

            if !selectedmagtype.Disposable then
                self.MagazineSelected = true
            end
        elseif self.MagazineSelected then
            local selection = self.InvMenuSelection
            local selectedmag = self.Owner.ACT3_MagazineInventory[selection]
            if self.InternalMag then
                selection = 0
                selectedmag = self.Magazine
            end
            local selectedmagtype = ACT3_GetMagazineType(selectedmag.Type)
            local bulletstable = self.Owner:ACT3_GetBulletInventoryForCalibre(selectedmagtype.Calibre)
            local bullets = #bulletstable

            if bullets > 0 then
                self.Owner:ACT3_LoadRoundIntoMag(selection, bulletstable[self.AmmoTypeSelection].bullet.id)
                selectedmag.DefaultRounds = table.Copy(selectedmag.Rounds)
            end
        end
    elseif self.InvMenuState == ACT3_INVSTATE_CUSTOMIZE then
        if #self.Attachments == 0 then return end
    end
end

function SWEP:MenuBack()
    if self.State != ACT3_STATE_ININVMENU then return end

    if self.InvMenuState == ACT3_INVSTATE_MAGLOAD then
        if self.InternalWeapon then
            return
        end

        local mags = #self.Owner.ACT3_MagazineInventory

        if self.InternalMag then
            mags = 1
            self.InvMenuSelection = 0
        end

        if !self.MagazineSelected and mags > 0 then
            local index = self.InvMenuSelection
            if self.Owner.ACT3_MagazineInventory[index] then
                self.Owner:ACT3_TakeMagazineFromIndex(index)
                net.Start("ACT3_DropMagazine")
                net.WriteUInt(index, 16)
                net.SendToServer()
            end
            self:SwitchMenuOffset(0)
        elseif self.MagazineSelected then
            local selection = self.InvMenuSelection

            self.Owner:ACT3_UnloadRoundFromMag(selection)
        end
    elseif self.InvMenuState == ACT3_INVSTATE_CUSTOMIZE then
        if #self.Attachments == 0 then return end
    end
end

function SWEP:AttemptCycle()

    if self.CannotCycle then return end
    if self.InternalWeapon then
        return
    end

    local lastbullet = nil

    if self.OpenBolt then
        if self.Magazine then
            lastbullet = table.remove(self.Magazine.Rounds, 1)
        end
    else
        lastbullet = self.ChamberedRound
        if self.Magazine then
            self.ChamberedRound = table.remove(self.Magazine.Rounds, 1)
        else
            self.ChamberedRound = nil
        end
    end

    if lastbullet then
        self.Owner:ACT3_GiveBullets(lastbullet, 1)
    end

    if CLIENT then
        surface.PlaySound(self.SoundCycle)

        net.Start("ACT3_AttemptCycle")
        net.SendToServer()
    end
end
*/