local att = {}

att.PrintName = "AK Side Rail"
att.Name = "ak_mount_rail"
att.Slot = "ak_mount"
att.Description = {"Side-mounted rail.", "Allows for the attachment of sights."}
att.Icon = Material("attachments/ak_mount_rail.png")

att.GivesSlots = {
    ["sight"] = {
        Type = "sight",
        PrintName = "Sight",
        Installed = nil,
        Required = false,
        Scale = 1,
        Pos = Vector(-5.105, 0.356, 9.875),
        Ang = Angle(0, 0, 0),
        Randomize = true,
        RandomizeChance = 100,
    }
}

att.BodygroupMods = {"ak_mount_rail"}

att.AttachFunc = function(wep)
end

att.DetachFunc = function(wep)
end

ACT3_LoadAttachment(att)