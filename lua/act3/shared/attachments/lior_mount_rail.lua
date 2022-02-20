local att = {}

att.PrintName = "Lior Side Rail"
att.Name = "lior_mount_rail"
att.Slot = "lior_mount"
att.Description = {"Side-mounted rail.", "Allows for the attachment of sights."}
att.Icon = Material("attachments/lior_mount_rail.png")

att.InvAtt = "ak_mount_rail"

att.GivesSlots = {
    ["sight"] = {
        Type = "sight",
        PrintName = "Sight",
        Installed = nil,
        Required = false,
        Scale = 1,
        Pos = Vector(-3.067, 0, 10.267),
        Ang = Angle(0, 0, 0),
        Randomize = true,
        RandomizeChance = 100,
    }
}

att.BodygroupMods = {"ak_railmount"}

att.AttachFunc = function(wep)
end

att.DetachFunc = function(wep)
end

ACT3_LoadAttachment(att)