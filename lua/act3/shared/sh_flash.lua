ACT3 = ACT3 or {}
ACT3.FlashPower = 1024

function ACT3_FlashExplosion(flashorigin)
    local flashpower = ACT3.FlashPower
    local targets = ents.FindInSphere(flashorigin, flashpower)

    for _, k in pairs(targets) do
        if k:IsPlayer() then
            local dist = k:EyePos():Distance(flashorigin)
            local dp = (k:EyePos() - flashorigin):Dot(k:EyeAngles():Forward())

            local time = Lerp( dp, 2.5, 0.25 )

            time = Lerp( dist / flashpower, time, 0 )

            if k:VisibleVec( flashorigin ) then
                k:ScreenFade( SCREENFADE.IN, Color( 255, 255, 255, 255 ), 2.5, time )
            end

            k:SetDSP( 37, false )

        elseif k:IsNPC() then

            k:SetNPCState(NPC_STATE_PLAYDEAD)

            if timer.Exists( k:EntIndex() .. "_act3_flashtimer" ) then
                timer.Remove( k:EntIndex() .. "_act3_flashtimer" )
            end

            timer.Create( k:EntIndex() .. "_act3_flashtimer", 10, 1, function()
                if !k:IsValid() then return end
                k:SetNPCState(NPC_STATE_ALERT)
            end)

        end
    end
end