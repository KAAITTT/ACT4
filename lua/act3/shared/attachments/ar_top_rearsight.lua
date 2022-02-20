local att = {}

att.PrintName = "AR Flat Top Rail w/t Rear Sight"
att.Name = "ar_top_rearsight"
att.Slot = "ar_top"
att.Description = {"Flat railed upper receiver with rear sight.", "Allows for the attachment of sights."}
att.Icon = Material("attachments/ar_top_rearsight.png")

att.GivesSlots = {
    ["sight"] = {
        Type = "sight",
        PrintName = "Sight",
        Installed = nil,
        Required = false,
        Scale = 1,
        Pos = Vector(-4.599, 0.351, 9.496),
        Ang = Angle(0, 0, 0),
        Randomize = true,
        RandomizeChance = 40,
    }
}

att.BodygroupMods = {"ar_top_rearsight"}

att.AttachFunc = function(wep)
end

att.DetachFunc = function(wep)
end

ACT3_LoadAttachment(att)