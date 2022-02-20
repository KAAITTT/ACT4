local critsoundstable = {
    [ACT3_HIT_NORMAL] = {"player/kevlar1.wav", "player/kevlar2.wav", "player/kevlar3.wav", "player/kevlar4.wav", "player/kevlar5.wav"},
    [ACT3_HIT_CRIT] = {"player/headshot1.wav", "player/headshot2.wav"},
    [ACT3_HIT_DEFLECT] = {""},
}

local sounds_kill = {"ui/freeze_cam.wav"}

net.Receive( "ACT3_Hit", function( len, ply )
    if !GetConVar("act3_hitmarkers"):GetBool() then return end

    local critlevel = net.ReadUInt(3)
    local damagepos = net.ReadVector()
    local critsounds = critsoundstable[critlevel]

    if GetConVar("act3_hitmarker_time"):GetFloat() > 0 then
        table.insert(ACT3_ActiveHitmarkers, {critlevel, damagepos, CurTime()})
    end

    if GetConVar("act3_hitmarker_sounds"):GetBool() then
        surface.PlaySound(critsounds[math.random(#critsounds)])
    end
end )

net.Receive( "ACT3_Kill", function( len, ply )
    if GetConVar("act3_hitmarker_sounds"):GetBool() then
        surface.PlaySound(sounds_kill[math.random(#sounds_kill)])
    end
end )