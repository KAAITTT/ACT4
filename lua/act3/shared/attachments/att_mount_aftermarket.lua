local att = {}

att.PrintName = "Aftermarket Rail"
att.Name = "att_mount_aftermarket"
att.Slot = "am_rail"
att.Description = {"Allows for the attachment of sights."}
att.Icon = Material("attachments/looserail.png")

att.WMParts = {
    {
    model = "models/weapons/act3/atts/att_looserail.mdl",
    bgs = "",
    skin = 0,
    pos = Vector(0, 0, 0),
    ang = Angle(0, 0, 0),
    }
}

att.GivesSlots = {
    ["sight"] = {
        Type = "sight",
        PrintName = "Sight",
        Installed = nil,
        Required = false,
        Scale = 1,
        Pos = Vector(0.331, 0.398, 0.663),
        Ang = Angle(0, 0, 0),
        Randomize = true,
        RandomizeChance = 100,
    }
}

att.AttachFunc = function(wep)
end

att.DetachFunc = function(wep)
end

ACT3_LoadAttachment(att)