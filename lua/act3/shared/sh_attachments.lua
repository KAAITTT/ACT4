function ACT3_GetAttachmentsForSlot(slot)
    local atts = {}

    for i, k in pairs(ACT3.AttachmentTable) do
        if (slot == "any" and !k.Free and !k.InvAtt) or k.Slot == slot then
            table.insert(atts, i)
        end
    end

    return atts
end

function ACT3_GetAttachment(att)
    return ACT3.AttachmentTable[att]
end

local metaply = FindMetaTable("Player")

function ACT3_NetworkAttachments(ply)
    if CLIENT then return end

    local invlength = table.Count(ply.ACT3_Attachments)

    net.Start("ACT3_NetworkAttachments")
    net.WriteUInt(invlength, 32)
    for i, k in pairs(ply.ACT3_Attachments) do
        local sid = ACT3_GetAttachmentSID(i)
        net.WriteUInt(sid, 32)
        net.WriteUInt(k, 32)
    end
    net.Send(ply)
end

if CLIENT then

net.Receive("ACT3_NetworkAttachments", function(len, ply)
    local invlength = net.ReadUInt(32)

    for i = 1, invlength do
        local attsid = net.ReadUInt(32)
        local amt = net.ReadUInt(32)

        local attid = ACT3_GetAttachmentID(attsid)

        LocalPlayer().ACT3_Attachments = LocalPlayer().ACT3_Attachments or {}

        LocalPlayer().ACT3_Attachments[attid] = amt
    end
end)

end

function metaply:ACT3_DropAttachment(att)
    if GetConVar("act3_infinite_atts"):GetBool() then
        return
    end

    if !self:ACT3_GetHasAttachment(att) then return end

    local atttab = ACT3_GetAttachment(att)

    if SERVER then
        local name = att

        if atttab.InvAtt then
            name = atttab.InvAtt
        end

        local newent = ents.Create("act3_att_" .. name)

        if !newent then return end

        newent:SetPos(self:EyePos())
        newent:SetAngles(AngleRand())
        newent:Spawn()
    else
        net.Start("ACT3_SendDropAtt")
        net.WriteString(att)
        net.SendToServer()
    end

    self:ACT3_TakeAttachment(att)
end

function metaply:ACT3_GetAttachmentsForSlot(slot)
    local atts = ACT3_GetAttachmentsForSlot(slot)
    local ret_atts = {}

    for i, k in pairs(atts) do
        if self:ACT3_GetHasAttachment(k) then
            table.insert(ret_atts, k)
        end
    end

    table.sort(ret_atts, function(a, b)
        local att_a = ACT3_GetAttachment(a)
        local att_b = ACT3_GetAttachment(b)

        return att_b.PrintName > att_a.PrintName
    end)

    return ret_atts
end

function metaply:ACT3_GetHasAttachment(id)
    if GetConVar("act3_infinite_atts"):GetBool() then
        return true
    end

    local att = ACT3_GetAttachment(id)

    if att.Free then
        return true
    end

    local uid = id

    if att.InvAtt then
        uid = att.InvAtt
    end

    if !self.ACT3_Attachments then return false end

    if !self.ACT3_Attachments[uid] then return false end

    if self.ACT3_Attachments[uid] > 0 then
        return true
    else
        return false
    end
end

function metaply:ACT3_GetNumAttachment(id)
    local att = ACT3_GetAttachment(id)

    local uid = id

    if att.InvAtt then
        uid = att.InvAtt
    end

    if self.ACT3_Attachments then
        return self.ACT3_Attachments[uid] or 0
    else
        return 0
    end
end

function ACT3_GetAttachmentSID(id)
    local att = ACT3_GetAttachment(id)

    return att.id
end

function ACT3_GetAttachmentID(sid) -- gets the attachment string id from short id
    return ACT3.AttachmentIDTable[sid]
end

if SERVER then

function metaply:ACT3_NWGiveAttachments(id, quantity)
    local sid = ACT3_GetAttachmentSID(id)

    self:ACT3_GiveAttachments(id, quantity)
    net.Start("ACT3_NetworkAttachments")
    net.WriteUInt(1, 32)
    net.WriteUInt(sid, 32)
    net.WriteUInt(self:ACT3_GetNumAttachment(id), 32)
    net.Send(self)
end

end

function metaply:ACT3_GiveAttachments(id, quantity)
    if GetConVar("act3_infinite_atts"):GetBool() then
        return
    end

    if !self.ACT3_Attachments then
        self.ACT3_Attachments = {}
    end

    local att = ACT3_GetAttachment(id)

    local uid = id

    if att.InvAtt then
        uid = att.InvAtt
    end

    self.ACT3_Attachments[uid] = self:ACT3_GetNumAttachment(uid) + quantity
end

function metaply:ACT3_GiveAttachment(id)
    self:ACT3_GiveAttachments(id, 1)
end

function metaply:ACT3_TakeAttachment(id)
    if GetConVar("act3_infinite_atts"):GetBool() then
        return
    end

    if !self.ACT3_Attachments then
        self.ACT3_Attachments = {}
    end

    local att = ACT3_GetAttachment(id)

    local uid = id

    if att.InvAtt then
        uid = att.InvAtt
    end

    self.ACT3_Attachments[uid] = self:ACT3_GetNumAttachment(uid) - 1
end