local att = {}

att.PrintName = "G3 Rail Mount"
att.Name = "g3_railmount"
att.Slot = "g3_mount"
att.Description = {"G3 rail.", "Allows for the attachment of sights."}
att.Icon = Material("attachments/g3_railmount.png")

att.GivesSlots = {
    ["sight"] = {
        Type = "sight",
        PrintName = "Sight",
        Installed = nil,
        Required = false,
        Scale = 1,
        Pos = Vector(-6.062, 0.319, 11.559),
        Ang = Angle(0, 0, 0),
        Randomize = true,
        RandomizeChance = 100,
    }
}

att.BodygroupMods = {"g3_mount_rail"}

att.AttachFunc = function(wep)
end

att.DetachFunc = function(wep)
end

ACT3_LoadAttachment(att)