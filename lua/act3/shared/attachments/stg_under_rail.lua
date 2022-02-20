local att = {}

att.PrintName = "Aftermarket Rail"
att.Name = "stg_under_rail"
att.Slot = "stg_under"
att.Description = {"Allows for the attachment of foregrips."}
att.Icon = Material("attachments/looserail.png")

att.GivesFlags = {}
att.InvAtt = "att_mount_aftermarket"

att.GivesSlots = {
    ["foregrip"] = {
        Type = "foregrip",
        PrintName = "Foregrip",
        Installed = nil,
        Required = false,
        Pos = Vector(15, -0.5, 4.4),
        Ang = Angle(0, 0, 0),
        Randomize = true,
        RandomizeChance = 100,
    }
}

att.WMParts = {
    {
        model = "models/weapons/act3/atts/att_looserail.mdl",
        bgs = "",
        skin = 0,
        pos = Vector(15, -0.5, 4.5),
        ang = Angle(0, 0, 180),
    }
}

att.AttachFunc = function(wep)
end

att.DetachFunc = function(wep)
end

ACT3_LoadAttachment(att)