local att = {}

att.PrintName = "M249 Railed Upper"
att.Name = "m249_rail"
att.Slot = "m249_top"
att.Description = {"Allows for the attachment of sights."}
att.Icon = Material("attachments/m249_rail.png")

att.BodygroupMods = {"m249_rail"}

att.GivesSlots = {
    ["sight"] = {
        Type = "sight",
        PrintName = "Sight",
        Installed = nil,
        Required = false,
        Scale = 1,
        Pos = Vector(-4.804, 0, 11.092),
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