local metaply = FindMetaTable("Player")

function metaply:ACT3_TrySetupBullets()
    if !self.ACT3_LooseRounds then
        self.ACT3_LooseRounds = {}
    end
end

function ACT3_GetBulletID(bulletname)
    return ACT3.BulletNameTable[bulletname]
end

function ACT3_GetBullet(bulletID)
    return ACT3.BulletTable[bulletID]
end

function metaply:ACT3_HasBullet(id)
    return self:ACT3_GetBullets(id) > 0
end

function metaply:ACT3_TakeBullet(id)
    self:ACT3_TakeBullets(id, 1)
end

function metaply:ACT3_TakeBullets(id, amt)
    if GetConVar("act3_infinite_loose"):GetBool() then
        return true
    else
        self:ACT3_TrySetupBullets()

        self.ACT3_LooseRounds[id] = self:ACT3_GetBullets(id) - amt

        if self.ACT3_LooseRounds[id] <= 0 then
            self.ACT3_LooseRounds[id] = 0
        end
    end

    if SERVER then
        net.Start("ACT3_NetworkBullet")
        net.WriteUInt(id, 32)
        net.WriteUInt(self.ACT3_LooseRounds[id], 32)
        net.Send(self)
    end
end

function metaply:ACT3_SetBullet(id, amt)
    self:ACT3_TrySetupBullets()

    self.ACT3_LooseRounds[id] = amt

    if SERVER then
        net.Start("ACT3_NetworkBullet")
        net.WriteUInt(id, 32)
        net.WriteUInt(amt, 32)
        net.Send(self)
    end
end

function metaply:ACT3_GiveBullets(id, amt)
    self:ACT3_TrySetupBullets()

    if !id then return end

    if !self.ACT3_LooseRounds[id] then
        self.ACT3_LooseRounds[id] = 0
    end
    self.ACT3_LooseRounds[id] = self.ACT3_LooseRounds[id] + amt

    if SERVER then
        net.Start("ACT3_NetworkBullet")
        net.WriteUInt(id, 32)
        net.WriteUInt(self.ACT3_LooseRounds[id], 32)
        net.Send(self)
    end
end

function metaply:ACT3_GetBullets(id)
    if GetConVar("act3_infinite_loose"):GetBool() then
        return 999
    else
        self:ACT3_TrySetupBullets()

        if self.ACT3_LooseRounds[id] then
            return self.ACT3_LooseRounds[id]
        else
            return 0
        end
    end
end

function metaply:ACT3_GetBulletCountForCalibre(cal)
    local amt = 0

    self:ACT3_TrySetupBullets()

    for i, k in pairs(self.ACT3_LooseRounds) do
        local bullet = ACT3_GetBullet(i)

        if !bullet then continue end

        if cal == "any" or bullet.MagazineCalibre == cal or bullet.Calibre == cal then
            amt = amt + k
        end
    end

    return amt
end

function metaply:ACT3_GetBulletInventoryForCalibre(cal)
    local bullets = {}

    for i, k in pairs(ACT3.BulletTable) do
        if cal == "any" or k.MagazineCalibre == cal or k.Calibre == cal then
            local returnbullet = {
                id = i,
                bullet = k,
                amt = 0
            }
            returnbullet.amt = self:ACT3_GetBullets(i)

            table.insert(bullets, returnbullet)
        end
    end

    return bullets
end

if CLIENT then

net.Receive("ACT3_NetworkBullet", function(len, ply)
    local bulletid = net.ReadUInt(32)
    local amt = net.ReadUInt(32)

    LocalPlayer():ACT3_TrySetupBullets()

    LocalPlayer().ACT3_LooseRounds[bulletid] = amt
end)

end

function metaply:ACT3_NWGiveBullets(name, amt)
    local id = ACT3_GetBulletID(name)
    self:ACT3_GiveBullets(id, amt)
    -- amt = self:ACT3_GetBullets(id)
    -- net.Start("ACT3_NetworkBullet")
    -- net.WriteUInt(id, 32)
    -- net.WriteUInt(amt, 32)
    -- net.Send(self)
end

net.Receive("ACT3_AttemptCycle", function(len, ply)
    local wpn = ply:GetActiveWeapon()
    if !wpn.ACT3Weapon then return end

    wpn:InvPress_Cycle()
end)