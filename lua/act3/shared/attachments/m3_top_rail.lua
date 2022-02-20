local att = {}

att.PrintName = "M3 Railed Upper"
att.Name = "m3_top_rail"
att.Slot = "m3_top"
att.Description = {"Allows for the attachment of sights."}
att.Icon = Material("attachments/m3_top_rail.png")

att.BodygroupMods = {"m3_top_rail"}

att.GivesSlots = {
    ["sight"] = {
        Type = "sight",
        PrintName = "Sight",
        Installed = nil,
        Required = false,
        Scale = 1,
        Pos = Vector(-4.23, 0.263, 9.086),
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