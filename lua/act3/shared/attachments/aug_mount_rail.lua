local att = {}

att.PrintName = "AUG Rail"
att.Name = "aug_mount_rail"
att.Slot = "aug_mount"
att.Description = {"AUG sight rail.", "Allows for the attachment of sights."}
att.Icon = Material("attachments/aug_mount_rail.png")

att.BodygroupMods = {"aug_mount_rail"}

att.GivesSlots = {
    ["sight"] = {
        Type = "sight",
        PrintName = "Sight",
        Installed = nil,
        Required = false,
        Scale = 1,
        Pos = Vector(-5.619, 0, 10.788),
        Ang = Angle(0, 0, 0),
        Randomize = true,
        RandomizeChance = 40,
    }
}

att.AttachFunc = function(wep)
end

att.DetachFunc = function(wep)
end


ACT3_LoadAttachment(att)