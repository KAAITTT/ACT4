local att = {}

att.PrintName = "BUIS Front (Med)"
att.Name = "att_sight_buis_front_med"
att.Slot = "buis_fr"
att.Description = {"Backup Iron Sight.", "Front leaf."}
att.Icon = Material("attachments/att_sight_buis.png")
att.Free = true

att.WMParts = {
    {
    model = "models/weapons/act3/atts/att_sight_buis_front.mdl",
    bgs = "",
    skin = 0,
    pos = Vector(4, -0.35, -0.25),
    ang = Angle(0, 0, 0),
    scale = 0.75
    }
}

att.AttachFunc = function(wep)
end

att.DetachFunc = function(wep)
end

ACT3_LoadAttachment(att)