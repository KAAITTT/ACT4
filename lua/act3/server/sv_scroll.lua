net.Receive("ACT3_SyncScroll", function(len, ply)
    local scroll = net.ReadInt(3)

    if !IsValid(ply:GetActiveWeapon()) then return end
    local wpn = ply:GetActiveWeapon()
    if !wpn.ACT3Weapon then return end

    wpn:Scroll(scroll)
end)