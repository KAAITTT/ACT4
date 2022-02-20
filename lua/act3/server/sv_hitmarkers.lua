function ACT3_SendHitmarker(ply, crit, pos)
    if !GetConVar("act3_sendhitmarkers"):GetBool() then return end

    if IsValid(ply) and ply:IsPlayer() then
        net.Start( "ACT3_Hit" )
        net.WriteUInt(crit, 3)
        net.WriteVector(pos)
        net.Send(ply)
    end
end

function ACT3_SendKillmarker(ply)
    if !GetConVar("act3_sendhitmarkers"):GetBool() then return end

    if IsValid(ply) and ply:IsPlayer() then
        net.Start( "ACT3_Kill" )
        net.Send(ply)
    end
end

function ACT3_OnNPCKilled(npc, attacker, inflictor)
    if attacker:IsPlayer() then
        ACT3_SendKillmarker(attacker)
    end
end

hook.Add("OnNPCKilled", "ACT3_OnNPCKilled", ACT3_OnNPCKilled)