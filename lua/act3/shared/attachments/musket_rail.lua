local att = {}

att.PrintName = "Musket Rail"
att.Name = "musket_rail"
att.Slot = "musket_mount"
att.Description = {"Allows for the attachment of sights."}
att.Icon = Material("attachments/musket_rail.png")

att.BodygroupMods = {"musket_toprail"}

att.InvAtt = "att_mount_aftermarket"

att.GivesSlots = {
    ["sight"] = {
        Type = "sight",
        PrintName = "Sight",
        Installed = nil,
        Required = false,
        Scale = 1,
        Pos = Vector(0.479, 0.298, 8.762),
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