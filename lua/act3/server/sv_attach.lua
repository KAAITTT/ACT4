net.Receive("ACT3_Attach", function(len, ply)
    local attid = net.ReadString()
    local slotid = net.ReadString()

    if !IsValid(ply:GetActiveWeapon()) then return end
    local wpn = ply:GetActiveWeapon()
    if !wpn.ACT3Weapon then return end

    wpn:Attach(attid, slotid)
end)

net.Receive("ACT3_Detach", function(len, ply)
    local attid = net.ReadString()

    if !IsValid(ply:GetActiveWeapon()) then return end
    local wpn = ply:GetActiveWeapon()
    if !wpn.ACT3Weapon then return end

    wpn:Detach(attid)
end)

net.Receive("ACT3_NameChange", function(len, ply)
    local newname = net.ReadString()

    if !IsValid(ply:GetActiveWeapon()) then return end
    local wpn = ply:GetActiveWeapon()
    if !wpn.ACT3Weapon then return end

    wpn.PrintName = newname

    if wpn.PrintName == "" then
        wpn.PrintName = weapons.GetStored(wpn:GetClass()).PrintName
    end
end)

net.Receive("ACT3_ToggleAcc", function(len, ply)
    if !IsValid(ply:GetActiveWeapon()) then return end
    local wpn = ply:GetActiveWeapon()
    if !wpn.ACT3Weapon then return end

    wpn:ToggleAccessories()

    net.Start("ACT3_NetworkLightsOn")
    net.WriteEntity(wpn)
    net.WriteBool(wpn.LightsOn)
    net.SendOmit(ply)
end)

net.Receive("ACT3_SendDropAtt", function(len, ply)
    if !IsValid(ply:GetActiveWeapon()) then return end
    local wpn = ply:GetActiveWeapon()
    if !wpn.ACT3Weapon then return end

    local attid = net.ReadString()

    ply:ACT3_DropAttachment(attid)
end)

net.Receive("ACT3_Drop", function(len, ply)
    if !IsValid(ply:GetActiveWeapon()) then return end
    local wpn = ply:GetActiveWeapon()
    if !wpn.ACT3Weapon then return end

    ply:DropWeapon(wpn)
end)