local metaply = FindMetaTable("Player")

function metaply:ACT3_GetInternalWeaponAmount(wpn)
    if GetConVar("act3_infinite_nades"):GetBool() then
        return 999
    else
        if !self.ACT3_InternalWeapons then self.ACT3_InternalWeapons = {} end

        if self.ACT3_InternalWeapons[wpn] then
            return self.ACT3_InternalWeapons[wpn]
        else
            return 0
        end
    end
end

function metaply:ACT3_GiveInternalWeapon(wpn)
    if GetConVar("act3_infinite_nades"):GetBool() then
        return
    else
        self:ACT3_GiveInternalWeapons(wpn, 1)
    end
end

function metaply:ACT3_GiveInternalWeapons(wpn, amt)
    if GetConVar("act3_infinite_nades"):GetBool() then
        return
    else
        if !self.ACT3_InternalWeapons then self.ACT3_InternalWeapons = {} end

        self.ACT3_InternalWeapons[wpn] = self:ACT3_GetInternalWeaponAmount(wpn) + amt
    end
end

function metaply:ACT3_TakeInternalWeapons(wpn, amt)
    if GetConVar("act3_infinite_nades"):GetBool() then
        return
    else
        if !self.ACT3_InternalWeapons then self.ACT3_InternalWeapons = {} end

        self.ACT3_InternalWeapons[wpn] = math.Clamp(self:ACT3_GetInternalWeaponAmount(wpn) - amt, 0, 9999)
    end
end

function metaply:ACT3_TakeInternalWeapon(wpn)
    self:ACT3_TakeInternalWeapons(wpn, 1)
end

if CLIENT then

net.Receive("ACT3_NetworkThrowables", function(len, ply)
    local invlength = net.ReadUInt(32)

    for i = 1, invlength do
        local nadeid = net.ReadString()
        local amt = net.ReadUInt(32)

        LocalPlayer().ACT3_InternalWeapons[nadeid] = amt
    end
end)

end

if SERVER then

function metaply:ACT3_NWGiveInternalWeapons(id, quantity)
    self:ACT3_GiveInternalWeapons(id, quantity)
    net.Start("ACT3_NetworkThrowables")
    net.WriteUInt(1, 32)
    net.WriteString(id)
    net.WriteUInt(self:ACT3_GetInternalWeaponAmount(id), 32)
    net.Send(self)
end

end