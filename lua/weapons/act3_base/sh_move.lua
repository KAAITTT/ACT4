
function ACT3_Move(ply, mv)
    local wpn = ply:GetActiveWeapon()

    if !wpn.ACT3Weapon then return false end
    if !wpn.SlowStates[wpn.State] then return false end

    local maxspeed = ply:GetWalkSpeed()
    maxspeed = maxspeed * wpn.SightedSpeedMult

    if ply:Crouching() then
        maxspeed = maxspeed * ply:GetCrouchedWalkSpeed()
    end

    if wpn:IsProne() then
        maxspeed = maxspeed * ply:GetCrouchedWalkSpeed() * 0.75
    end

    mv:SetMaxSpeed(maxspeed)
    mv:SetMaxClientSpeed(maxspeed)

end

hook.Add("Move", "ACT3_Move", ACT3_Move)