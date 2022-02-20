local att = {}

att.PrintName = "K98 Rail Mount"
att.Name = "k98_mount_rail"
att.Slot = "k98_mount"
att.Description = {"Allows for the attachment of sights."}
att.Icon = Material("attachments/k98_mount_rail.png")

att.BodygroupMods = {"k98_mount_rail"}

att.GivesSlots = {
    ["sight"] = {
        Type = "sight",
        PrintName = "Sight",
        Installed = nil,
        Required = false,
        Scale = 1,
        Pos = Vector(-3.546, -0.25, 9.963),
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