local att = {}

att.PrintName = "MP5 Railed Upper"
att.Name = "mp5_top_rail"
att.Slot = "mp5_top"
att.Description = {"Allows for the attachment of sights."}
att.Icon = Material("attachments/mp5_top_rail.png")

att.BodygroupMods = {"mp5_top_rail"}

att.GivesSlots = {
    ["sight"] = {
        Type = "sight",
        PrintName = "Sight",
        Installed = nil,
        Required = false,
        Scale = 1,
        Pos = Vector(-0.362, 0.5, 11.666),
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