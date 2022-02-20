ACT3 = ACT3 or {}

ACT3.SmokeRadius = 256
ACT3.SmokeTime = 15
ACT3.BillowTime = 5
ACT3.SmokeColor = Color(150, 150, 150)
ACT3.SmokeImages = {"particle/smokesprites_0001", "particle/smokesprites_0002", "particle/smokesprites_0003", "particle/smokesprites_0004", "particle/smokesprites_0005", "particle/smokesprites_0006", "particle/smokesprites_0007", "particle/smokesprites_0008", "particle/smokesprites_0009", "particle/smokesprites_0010", "particle/smokesprites_0011", "particle/smokesprites_0012", "particle/smokesprites_0013", "particle/smokesprites_0014", "particle/smokesprites_0015", "particle/smokesprites_0016"}

function ACT3_GetSmokeImage()
    return ACT3.SmokeImages[math.random(#ACT3.SmokeImages)]
end

function ACT3_SmokeExplosion(smokepos)
    local cloud = ents.Create( "act3_cloud_smoke" )

    if !IsValid( cloud ) then return end

    cloud:SetPos( smokepos )
    cloud:Spawn()
end

function ACT3_CalculateSmokeLevel()
    local ply = LocalPlayer()
    local nearest = ACT3.SmokeRadius + 1
    local plypos = ply:EyePos()

    for _, k in pairs(ents.FindInSphere(plypos, ACT3.SmokeRadius)) do

        if k.ACT3SmokeCloud then
            local dist = k:GetPos():Distance(plypos)

            if dist < nearest then
                nearest = dist
            end
        end
    end

    if nearest < ACT3.SmokeRadius then
        local smokecol = ACT3.SmokeColor
        local delta = nearest / ACT3.SmokeRadius

        smokecol.a = Lerp(delta, 255, 0)

        surface.SetDrawColor(smokecol)
        surface.DrawRect(0, 0, ScrW(), ScrH())
    end
end

hook.Add( "HUDPaintBackground", "ACT3_CalculateSmokeLevel", ACT3_CalculateSmokeLevel )