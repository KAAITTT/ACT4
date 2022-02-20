local function reclaterrebuildmodels(wpn)
    if wpn.RebuildModels then
        wpn:RebuildModels()
    end
end

local function reclaterswd(wpn, shortatts, mag, ws)
    if !wpn then return end
    if !IsValid(wpn) then return end
    if wpn.Owner == LocalPlayer() then return end

    if mag != "" then
        wpn.Magazine = {
            Type = mag,
            Rounds = {}
        }
    else
        wpn.Magazine = nil
    end

    if !wpn.Attachments then
        wpn.Attachments = {}
    end

    for i, k in pairs(wpn.Attachments) do
        wpn:Detach(i)
    end

    if ws then

        local name = net.ReadString()

        if name != "" then
            wpn.PrintName = name
        end

        table.SortByMember(shortatts, "Order", true)

        for i, k in pairs(shortatts) do
            local id = ACT3_GetAttachmentID(k.SID)
            local slotid = k.SlotID

            if !wpn.Attachments[slotid] then continue end

            if k.Pos then
                wpn.Attachments[slotid].Pos = k.Pos
            end

            if k.Ang then
                wpn.Attachments[slotid].Ang = k.Ang
            end

            wpn:Attach(id, slotid, true)
        end

    else

        for i, k in pairs(shortatts) do
            local id = ACT3_GetAttachmentID(k.SID)
            wpn.Attachments[i] = {}
            wpn.Attachments[i].ProcGenAtt = true

            if k.Pos then
                wpn.Attachments[i].Pos = k.Pos
            end

            if k.Ang then
                wpn.Attachments[i].Ang = k.Ang
            end

            wpn:Attach(id, i, true)
        end

    end

    reclaterrebuildmodels(wpn)
end

net.Receive("ACT3_SendWeaponData", function(len, ply)
    local wpn = net.ReadEntity()
    local shortatts = net.ReadTable()
    local mag = net.ReadString()
    local ws = net.ReadBool()

    reclaterswd(wpn, shortatts, mag, ws)
end)

net.Receive("ACT3_SendMagSize", function(len, ply)
    local wpn = net.ReadEntity()
    local size = net.ReadUInt(16)
end)

net.Receive("ACT3_NetworkedAttach", function(len, ply)

end)

net.Receive("ACT3_NetworkedDetach", function(len, ply)

end)

net.Receive("ACT3_ForgetWeaponData", function(len, ply)
    local wpn = net.ReadEntity()
    wpn.WM = nil
end)

net.Receive("ACT3_NetworkFiremode", function(len, ply)
    local wpn = net.ReadEntity()
    local mode = net.ReadUInt(8)

    if !IsValid(wpn) then return end

    wpn:ChangeFiremodeTo(mode)
end)

net.Receive("ACT3_SendMoveBolt", function(len, ply)
    local wpn = net.ReadEntity()

    if !IsValid(wpn) then return end

    wpn.NextRealFire = CurTime() + wpn.ShootingDelay
end)