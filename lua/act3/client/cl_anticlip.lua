ACT3.AntiClipBones = {
    "ValveBiped.Bip01_Head1"
}

ACT3.AntiClipped = false

function ACT3_DoAntiClip()
    local shouldanticlip = GetConVar("act3_anticlip"):GetBool()

    if LocalPlayer():ShouldDrawLocalPlayer() then
        shouldanticlip = false
    end

    local scale = Vector(1, 1, 1)

    if shouldanticlip then
        if ACT3.AntiClipped then return end
        for i, k in pairs(ACT3.AntiClipBones) do
            local bone = LocalPlayer():LookupBone(k)

            if !bone then continue end

            LocalPlayer():ManipulateBoneScale(bone, scale * 0.01)
        end

        ACT3.AntiClipped = true
    else
        if !ACT3.AntiClipped then return end
        for i, k in pairs(ACT3.AntiClipBones) do
            local bone = LocalPlayer():LookupBone(k)

            if !bone then continue end

            LocalPlayer():ManipulateBoneScale(bone, scale * 1)
        end

        ACT3.AntiClipped = false
    end
end