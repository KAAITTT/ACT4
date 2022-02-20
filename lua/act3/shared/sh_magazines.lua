
ACT3 = ACT3 or {}

function ACT3_BulletFitsMagazine(bullet, magtype)
    if magtype.Calibre == "any" then
        return true
    end

    if bullet.Calibre == magtype.Calibre then
        return true
    end

    if bullet.MagazineCalibre == magtype.Calibre then
        return true
    end
end

function ACT3_BulletSizeFitsMagazine(bullet, magtype, rounds)
    local realcount = 0

    for _, i in pairs(rounds) do
        local magbullet = ACT3_GetBullet(i)

        if !magbullet then continue end

        if magtype.TubeMag then
            realcount = realcount + magbullet.TubeMagSizeMult
        else
            realcount = realcount + magbullet.SizeMult
        end
    end

    if magtype.TubeMag then
        realcount = realcount + bullet.TubeMagSizeMult
    else
        realcount = realcount + bullet.SizeMult
    end

    if realcount <= magtype.MagSize then
        return true
    else
        return false
    end
end

net.Receive( "ACT3_DropMagazine", function( len, ply )
    local index = net.ReadUInt(16)

    if ply.ACT3_MagazineInventory[index] then
        ply:ACT3_DropMagazineIndex(index)
    end
end )

net.Receive( "ACT3_LoadIntoGun", function( len, ply )
    local index = net.ReadUInt(16)

    if !IsValid(ply:GetActiveWeapon()) then return end
    local wpn = ply:GetActiveWeapon()
    if !wpn.ACT3Weapon then return end

    wpn.MagazineIndex = index
    wpn:Reload()
end )

net.Receive("ACT3_LoadIntoMag", function(len, ply)
    local index = net.ReadUInt(16)
    local bulletid = net.ReadUInt(ACT3.NeededBits)

    if ply:ACT3_GetBullets(bulletid) <= 0 then return end

    local bullet = ACT3_GetBullet(bulletid)
    -- get the magazine
    local mag
    local wpn = ply:GetActiveWeapon()

    if index == 0 then
        wpn.PerformedSelfMagOperation = true
        mag = ply:GetActiveWeapon().Magazine
    else
        mag = ply:ACT3_GetMagazineFromIndex(index)
    end

    local magtype = ACT3_GetMagazineType(mag.Type)

    -- do we have room?
    if !ACT3_BulletSizeFitsMagazine(bullet, magtype, mag.Rounds) then return end
    -- is it compatible?
    if !ACT3_BulletFitsMagazine(bullet, magtype) then return end
    -- if we have all that stuff, then FINALLY we can totally load the bullet
    table.insert(mag.Rounds, 1, bulletid)
    ply:ACT3_TakeBullet(bulletid)

    mag.DefaultRounds = table.Copy(mag.Rounds)
end)

net.Receive("ACT3_UnloadFromMag", function(len, ply)
    local index = net.ReadUInt(16)

    local mag
    local wpn = ply:GetActiveWeapon()

    if index == 0 then
        wpn.PerformedSelfMagOperation = true
        mag = ply:GetActiveWeapon().Magazine
    else
        mag = ply:ACT3_GetMagazineFromIndex(index)
    end

    local magtype = ACT3_GetMagazineType(mag.Type)

    if !mag then return end

    if #mag.Rounds <= 0 then return end

    local bullet = table.remove(mag.Rounds, 1)

    ply:ACT3_GiveBullets(bullet, 1)
end)

function ACT3_GetMagazineType(type)
    return ACT3.MagazineTable[type]
end

function ACT3_SendMagazinePartial(ply, magazine, wpn, num)
    if !wpn then return end
    if !magazine then return end

    if #magazine.Rounds < num then
        num = #magazine.Rounds
    end

    net.Start("ACT3_NetworkMagazine")
    net.WriteUInt(0, 16)
    net.WriteString(magazine.Type)
    net.WriteUInt(num, 16)
    net.WriteEntity(wpn)
    for i = 1,num do
        net.WriteUInt(magazine.Rounds[i], ACT3.NeededBits)
    end
    net.Send(ply)
end

function ACT3_SendMagazine(ply, magazine, slot, wpn)
    wpn = wpn or nil
    if !magazine then
        if IsValid(ply) and ply:IsPlayer() then
            net.Start("ACT3_NetworkMagazine")
            net.WriteUInt(slot, 16)
            net.WriteString("nil")
            net.WriteUInt(0, 16)
            if wpn then
                net.WriteBool(true)
                net.WriteEntity(wpn)
            else
                net.WriteBool(false)
            end
            net.Send(ply)
        end
    else
        if IsValid(ply) and ply:IsPlayer() then
            net.Start("ACT3_NetworkMagazine")
            net.WriteUInt(slot, 16)
            net.WriteString(magazine.Type)
            net.WriteUInt(#magazine.Rounds, 16)
            if wpn then
                net.WriteBool(true)
                net.WriteEntity(wpn)
            else
                net.WriteBool(false)
            end
            for i = 1,#magazine.Rounds do
                net.WriteUInt(magazine.Rounds[i], ACT3.NeededBits)
            end
            net.Send(ply)
        end
    end

    if !ply then
        net.Start("ACT3_NetworkMagazine")
        net.WriteUInt(slot, 16)
        net.WriteString(magazine.Type)
        net.WriteUInt(#magazine.Rounds, 16)
        if wpn then
            net.WriteBool(true)
            net.WriteEntity(wpn)
        else
            net.WriteBool(false)
        end
        for i = 1,#magazine.Rounds do
            net.WriteUInt(magazine.Rounds[i], ACT3.NeededBits)
        end
        net.Broadcast()
    end
end

function ACT3_SendDefaultMagazine(ply, magazine, wpn)
    if !magazine then
        return
    else
        if IsValid(ply) and ply:IsPlayer() then
            net.Start("ACT3_NetworkDefaultMagazine")
            net.WriteString(magazine.Type)
            net.WriteEntity(wpn)
            net.WriteUInt(ACT3_GetBulletID(wpn.DefaultLoad), ACT3.NeededBits)
            net.Send(ply)
        end
    end
end

function ACT3_ResetMagazineInventory(ply)
    net.Start("ACT3_ResetMagazineInventory")
    net.Send(ply)
end

local metaply = FindMetaTable("Player")

local function ACT3_SetupMagazines(ply)
    timer.Simple(0, function()
    ply.ACT3_MagazineInventory = {}
    ply.ACT3_LooseRounds = {}
    ply.ACT3_Attachments = {}
    ply.ACT3_InternalWeapons = {}
    ACT3_ResetMagazineInventory(ply)
    end)
end

hook.Add("PlayerSpawn", "ACT3_SetupMagazines", ACT3_SetupMagazines)

function metaply:ACT3_LoadRoundIntoMag(index, bulletid)
    -- do we have a bullet?
    if self:ACT3_GetBullets(bulletid) <= 0 then return end

    local bullet = ACT3_GetBullet(bulletid)
    -- get the magazine
    local mag

    local wpn = self:GetActiveWeapon()

    if index == 0 then
        wpn.PerformedSelfMagOperation = true
        mag = self:GetActiveWeapon().Magazine
    else
        mag = self:ACT3_GetMagazineFromIndex(index)
    end

    local magtype = ACT3_GetMagazineType(mag.Type)

    -- do we have room?
    if !ACT3_BulletSizeFitsMagazine(bullet, magtype, mag.Rounds) then return end
    -- is it compatible?

    if !ACT3_BulletFitsMagazine(bullet, magtype) then return end
    -- if we have all that stuff, then FINALLY we can totally load the bullet
    table.insert(mag.Rounds, 1, bulletid)
    self:ACT3_TakeBullet(bulletid)

    surface.PlaySound("act3/roundin.wav")

    net.Start("ACT3_LoadIntoMag")
    net.WriteUInt(index, 16)
    net.WriteUInt(bulletid, ACT3.NeededBits)
    net.SendToServer()
end

function metaply:ACT3_GetMagazine(index)
    local mag

    if index == 0 then
        mag = self:GetActiveWeapon().Magazine
    else
        mag = self:ACT3_GetMagazineFromIndex(index)
    end

    return mag
end

function metaply:ACT3_TotalUnloadFromMag(index)
    local mag
    local wpn = self:GetActiveWeapon()

    if index == 0 then
        wpn.PerformedSelfMagOperation = true
        mag = self:GetActiveWeapon().Magazine
    else
        mag = self:ACT3_GetMagazineFromIndex(index)
    end

    local tounload = #mag.Rounds

    for i = 1, tounload do
        self:ACT3_UnloadRoundFromMag(index)
    end
end

function metaply:ACT3_FullLoadIntoMag(index, bulletid)
    local mag
    local wpn = self:GetActiveWeapon()

    if index == 0 then
        wpn.PerformedSelfMagOperation = true
        mag = wpn.Magazine
    else
        mag = self:ACT3_GetMagazineFromIndex(index)
    end

    local magtype = ACT3_GetMagazineType(mag.Type)

    local toload = magtype.MagSize - #mag.Rounds

    for i = 1, toload do
        self:ACT3_LoadRoundIntoMag(index, bulletid)
    end

    mag.DefaultRounds = table.Copy(mag.Rounds)
end

function metaply:ACT3_UnloadRoundFromMag(index)
    if CLIENT then
        local mag
        local wpn = self:GetActiveWeapon()

        if index == 0 then
            wpn.PerformedSelfMagOperation = true
            mag = self:GetActiveWeapon().Magazine
        else
            mag = self:ACT3_GetMagazineFromIndex(index)
        end

        if #mag.Rounds <= 0 then return end

        local bullet = table.remove(mag.Rounds, 1)

        self:ACT3_GiveBullets(bullet, 1)

        surface.PlaySound("act3/roundout.wav")

        net.Start("ACT3_UnloadFromMag")
        net.WriteUInt(index, 16)
        net.SendToServer()
    end
end

function metaply:ACT3_GetMagazineFromIndex(index)
    if index == 0 then
        return self:GetActiveWeapon().Magazine
    else
        return self.ACT3_MagazineInventory[index]
    end
end

function metaply:ACT3_TakeMagazineFromIndex(index)
    if index == 0 then
        local wpn = self:GetActiveWeapon()

        if wpn.InternalMagazine then
            wpn.Magazine.Rounds = {}
        else
            wpn.Magazine = nil
        end
    else
        table.remove(self.ACT3_MagazineInventory, index)
    end
end

function metaply:ACT3_AutoRefillOne(mag, defaultload)
    -- automatically refill the magazine
    local magtype = ACT3_GetMagazineType(mag.Type)
    local defaultbullets = self:ACT3_GetBulletInventoryForCalibre(magtype.Calibre)

    if !defaultload then defaultload = {} end

    for i = 1, magtype.MagSize - #mag.Rounds do
        if #mag.Rounds >= magtype.MagSize then return end
        local index = magtype.MagSize - #mag.Rounds

        if defaultload[index] then
            print(defaultload[index])
            if self:ACT3_GetBullets(defaultload[index]) > 0 then
                table.insert(mag.Rounds, 1, defaultload[index])
                self:ACT3_TakeBullet(defaultload[index])
                return true
            end
        end

        local foundround = nil

        -- otherwise, load it with anything if possible
        for _, k in pairs(defaultbullets) do
            if foundround then continue end

            if self:ACT3_GetBullets(k.bullet.id) > 0 then
                foundround = k.bullet.id
            end
        end

        if foundround == nil then return false end

        table.insert(mag.Rounds, 1, foundround)
        self:ACT3_TakeBullet(foundround)
        return true
    end

    /*
    for i = 1, mag.magsize do
        if mag.Rounds[i] then continue end

        if defaultload[i] then
            if self:ACT3_GetBullets(i) > 0 then
                mag.Rounds[i] = defaultload[i]
                self:ACT3_TakeBullet(i)
                continue
            end
        end

        local foundround = nil

        -- otherwise, load it with anything if possible
        for _, k in pairs(defaultbullets) do
            if foundround then continue end

            if self:ACT3_GetBullets(k.bullet.id) then
                foundround = k.bullet.id
            end
        end

        mag.Rounds[i] = foundround
        self:ACT3_TakeBullet(i)
    end
    */
end

function metaply:ACT3_AutoRefill(mag, defaultload)
    -- automatically refill the magazine
    local magtype = ACT3_GetMagazineType(mag.Type)
    local defaultbullets = self:ACT3_GetBulletInventoryForCalibre(magtype.Calibre)

    if !defaultload then defaultload = {} end

    for i = 1, magtype.MagSize do
        local index = magtype.MagSize - #mag.Rounds

        if defaultload[index] then
            if !ACT3_BulletSizeFitsMagazine(ACT3_GetBullet(defaultload[index]), magtype, mag.Rounds) then return end
            if self:ACT3_GetBullets(defaultload[index]) > 0 then
                table.insert(mag.Rounds, 1, defaultload[index])
                self:ACT3_TakeBullet(defaultload[index])
                continue
            end
        end

        local foundround = nil

        -- otherwise, load it with anything if possible
        for _, k in pairs(defaultbullets) do
            if foundround then continue end

            if self:ACT3_GetBullets(k.bullet.id) > 0 then
                foundround = k.bullet.id
            end
        end

        if foundround then
            if !ACT3_BulletSizeFitsMagazine(ACT3_GetBullet(foundround), magtype, mag.Rounds) then return end
            table.insert(mag.Rounds, 1, foundround)
            self:ACT3_TakeBullet(foundround)
        end
    end

    /*
    for i = 1, mag.magsize do
        if mag.Rounds[i] then continue end

        if defaultload[i] then
            if self:ACT3_GetBullets(i) > 0 then
                mag.Rounds[i] = defaultload[i]
                self:ACT3_TakeBullet(i)
                continue
            end
        end

        local foundround = nil

        -- otherwise, load it with anything if possible
        for _, k in pairs(defaultbullets) do
            if foundround then continue end

            if self:ACT3_GetBullets(k.bullet.id) then
                foundround = k.bullet.id
            end
        end

        mag.Rounds[i] = foundround
        self:ACT3_TakeBullet(i)
    end
    */
end

function metaply:ACT3_UpdateMagazines() -- an expensive function in terms of bandwidth
    ACT3_ResetMagazineInventory(self)
    for i, k in pairs(self.ACT3_MagazineInventory) do
        ACT3_SendMagazine(self, k, i)
    end
end

function metaply:ACT3_DropMagazineIndex(index)
    local magazine = ents.Create("act3_magazine")

    local pos = self:EyePos() - Vector(0, 0, 8)
    local ang = AngleRand()

    if magazine then
        magazine:SetPos(pos)
        magazine:SetAngles(ang)
        magazine.Fresh = false
        magazine.MagazineTable = self.ACT3_MagazineInventory[index]

        local magtype = ACT3_GetMagazineType(magazine.MagazineTable.Type)

        if #magazine.MagazineTable.Rounds == 0 then
            magazine.Full = false
            magazine.Empty = true
        elseif #magazine.MagazineTable.Rounds < magtype.MagSize then
            magazine.Full = false
        end

        magazine:Spawn()

        local phys = magazine:GetPhysicsObject()
        phys:AddAngleVelocity(VectorRand() * 8)
        phys:SetVelocity(self:GetAbsVelocity())
    else
        print("!!! FAILED TO CREATE MAGAZINE")
    end

    table.remove(self.ACT3_MagazineInventory, index)
end

function metaply:ACT3_GetMagazineToLoad(type)
    local returnmagazine = nil
    local returnindex = nil

    if !self.ACT3_MagazineInventory then
        return returnindex
    end

    for i, k in pairs(self.ACT3_MagazineInventory) do
        local magtype = ACT3_GetMagazineType(k.Type)
        if magtype.Type == type then
            if !returnmagazine or #k.Rounds > #returnmagazine.Rounds then
                returnindex = i
                returnmagazine = k
            end
        end
    end

    -- pick the one with the most ammo
    return returnindex
end

function metaply:ACT3_GetNumAvailableMagazines(type)
    local available = 0

    if !self.ACT3_MagazineInventory then
        return 0
    end

    for i, k in pairs(self.ACT3_MagazineInventory) do
        local magtype = ACT3_GetMagazineType(k.Type)
        if !magtype then continue end
        if magtype.Type == type and #k.Rounds > 0 then
            available = available + 1
        end
    end

    return available
end

function metaply:ACT3_GetAvailableMagazines(type)
    local available = {}

    if !self.ACT3_MagazineInventory then
        return {}
    end

    for i, k in pairs(self.ACT3_MagazineInventory) do
        local magtype = ACT3_GetMagazineType(k.Type)
        if magtype.Type == type and #k.Rounds > 0 then
            table.insert(available, k)
        end
    end

    return available
end

function metaply:ACT3_GetMagazineSlotsUsed()
    local slotsused = 0

    if !self.ACT3_MagazineInventory then
        return 0
    end

    for i, k in pairs(self.ACT3_MagazineInventory) do
        local magtype = ACT3_GetMagazineType(k.Type)
        if !magtype then continue end
        slotsused = slotsused + magtype.Slots
    end

    return slotsused
end

function metaply:ACT3_GetMagazineSlots()
    return GetConVar("act3_magslots"):GetInt()
end

function metaply:ACT3_CanHoldMagazine(slots)
    if self:ACT3_GetMagazineSlotsUsed() + slots <= self:ACT3_GetMagazineSlots() then
        return true
    else
        return false
    end
end

function metaply:ACT3_GiveMagazine(mag)
    local magtype = ACT3_GetMagazineType(mag.Type)
    if !self:ACT3_CanHoldMagazine(magtype.Slots) then return end
    if CLIENT then return end

    local index = table.insert(self.ACT3_MagazineInventory, mag)
    ACT3_SendMagazine(self, mag, index)
end

function metaply:ACT3_GetMagazines()
    return self.ACT3_MagazineInventory
end

function metaply:ACT3_AddRounds(type, amount)
    self.ACT3_LooseRounds[type] = math.Clamp(self:ACT3_GetRounds(type) + amount, 0, ACT3.MaxLooseRounds)
end

function metaply:ACT3_GetRounds(type)
    if self.ACT3_LooseRounds[type] then
        return self.ACT3_LooseRounds[type]
    else
        return 0
    end
end