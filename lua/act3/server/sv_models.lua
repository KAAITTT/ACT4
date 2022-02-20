net.Receive("ACT3_RequestWeaponData", function(len, ply)
    local wpn = net.ReadEntity()

    local shortatts = {}

    if !wpn then return end
    if !wpn.Attachments then return end

    for i, k in pairs(wpn.Attachments) do
        if k.Installed then
            local entry = {}

            entry.SID = ACT3_GetAttachmentSID(k.Installed)
            entry.SlotID = i

            if k.Pos then
                entry.Pos = k.Pos
            end

            if k.Ang then
                entry.Ang = k.Ang
            end

            table.insert(shortatts, entry)
        end
    end

    -- send mag too

    local magtype = ""

    if wpn.Magazine then
        magtype = wpn.Magazine.Type
    end

    if !wpn:IsValid() then return end

    net.Start("ACT3_SendWeaponData")
    net.WriteEntity(wpn)
    net.WriteTable(shortatts)
    net.WriteString(magtype or "")
    net.WriteBool(false)
    net.Send(ply)

    if wpn.BulletAffectsBodygroups then
        ACT3_SendMagazinePartial(ply, wpn.Magazine, wpn, #wpn.BulletAffectsBodygroups)
    end
end)

function ACT3_UpdateWeaponData(wpn, ply, forhold)
    forhold = forhold or false

    local shortatts = {}

    for i, k in pairs(wpn.Attachments) do
        if k.Installed then
            local entry = {}

            entry.SID = ACT3_GetAttachmentSID(k.Installed)

            if forhold then
                entry.SlotID = i
                entry.Order = k.InstalledOrder
            end

            if k.Pos then
                entry.Pos = k.Pos
            end

            if k.Ang then
                entry.Ang = k.Ang
            end

            table.insert(shortatts, entry)
        end
    end

    -- send mag too

    local magtype = ""

    if wpn.Magazine then
        magtype = wpn.Magazine.Type
    end

    net.Start("ACT3_SendWeaponData")
    net.WriteEntity(wpn)
    net.WriteTable(shortatts)
    net.WriteString(magtype or "")
    net.WriteBool(forhold)

    if forhold then
        net.WriteString(wpn.PrintName)
    end

    if ply then
        net.SendPVS(ply:GetPos())
    else
        net.SendPVS(wpn:GetPos())
    end

    wpn:NetworkFiremode()
end

net.Receive("ACT3_UpdateWeaponData", function(len, ply)
    local wpn = net.ReadEntity()

    ACT3_UpdateWeaponData(wpn, ply)
end)