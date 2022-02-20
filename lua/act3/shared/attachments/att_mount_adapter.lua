local att = {}

att.PrintName = "FS-Adapter"
att.Name = "att_mount_adapter"
att.Slot = "sight_pistol"
att.Description = {"Full-Size Adapter.", "Allows any pistol to mount full-size attachments."}
att.Icon = Material("attachments/looserail.png")

att.ExcludeFlags = {"prailinstalled"}
att.GivesFlags = {"rdsinstalled"}

att.WMParts = {
    {
    model = "models/weapons/act3/atts/att_looserail.mdl",
    bgs = "",
    skin = 0,
    pos = Vector(2, 0, -0.25),
    ang = Angle(0, 0, 0),
    }
}

att.GivesSlots = {
    ["r"] = {
        Type = "sight",
        PrintName = "Sight",
        Installed = nil,
        Required = false,
        Scale = 1,
        Pos = Vector(0, 0.25, 0.25),
        Ang = Angle(0, 0, 0),
        Randomize = true,
        RandomizeChance = 100,
    }
}

att.RandomizeBlacklist = true -- Prohibit this attachment from being randomly given out

att.AttachFunc = function(wep)
end

att.DetachFunc = function(wep)
end

ACT3_LoadAttachment(att)