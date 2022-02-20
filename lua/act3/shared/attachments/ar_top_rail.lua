local att = {}

att.PrintName = "AR Flat Top Rail"
att.Name = "ar_top_rail"
att.Slot = "ar_top"
att.Description = {"Flat railed upper receiver.", "Allows for the attachment of sights."}
att.Icon = Material("attachments/ar_top_rail.png")

att.GivesSlots = {
    ["sight"] = {
        Type = "sight",
        PrintName = "Sight",
        Installed = nil,
        Required = false,
        Scale = 1,
        Pos = Vector(-5.845, 0.351, 9.552),
        Ang = Angle(0, 0, 0),
        Randomize = true,
        RandomizeChance = 40,
        
    }
}

att.BodygroupMods = {"ar_top_rail"}

att.AttachFunc = function(wep)
end

att.DetachFunc = function(wep)
end

ACT3_LoadAttachment(att)