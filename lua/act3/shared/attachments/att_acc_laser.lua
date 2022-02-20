local att = {}

att.PrintName = "Laser"
att.Name = "att_acc_laser"
att.Slot = "accessory"
att.Description = {"Red laser pointer.", "Blinds enemies and allows others to see where you're aimimg.", "Improves hip fire accuracy."}
att.Icon = Material("attachments/att_laser.png")

att.Toggleable = true

att.HipfireHelper = true

att.WMParts = {
    {
    model = "models/weapons/act3/atts/att_laser.mdl",
    bgs = "",
    skin = 0,
    pos = Vector(0, 0, 0),
    ang = Angle(0, 0, 0),
    renderfunc = function(pos, ang, ent, slotid, asvm)
        pos = pos + (ang:Forward() * 4) + (ang:Right() * -0.25)
        ACT3_DoLaser(pos, ang, ent, Color(255, 0, 0, 50), asvm)
    end
    }
}

att.SightOffsetPos = Vector(0, 0, 0)
att.SightOffsetAng = Angle(0, 0, 0)


att.AttachFunc = function(wep)
end

att.DetachFunc = function(wep)
end

ACT3_LoadAttachment(att)