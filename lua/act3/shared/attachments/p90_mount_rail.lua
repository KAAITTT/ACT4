local att = {}

att.PrintName = "P90 TR Mount"
att.Name = "p90_mount_rail"
att.Slot = "p90_mount"
att.Description = {"P90 TR rail.", "Allows for the attachment of sights."}
att.Icon = Material("attachments/p90_mount_rail.png")

att.BodygroupMods = {"p90_mount_rail"}

att.GivesSlots = {
    ["sight"] = {
        Type = "sight",
        PrintName = "Sight",
        Installed = nil,
        Required = false,
        Scale = 1,
        Pos = Vector(1.11, -0.275, 12.065),
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