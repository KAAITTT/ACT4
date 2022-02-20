local att = {}

att.PrintName = "AR Carry Handle w/t Rail"
att.Name = "ar_top_railhandle"
att.Slot = "ar_top"
att.Description = {"Carry Handle with rear sight and fixed rail.", "Allows for the attachment of sights."}
att.Icon = Material("attachments/ar_top_handle_rail.png")

att.GivesSlots = {
    ["sight"] = {
        Type = "sight",
        PrintName = "Sight",
        Installed = nil,
        Required = false,
        Scale = 1,
        Pos = Vector(-4.599, 0.351, 11.453),
        Ang = Angle(0, 0, 0),
        Randomize = true,
        RandomizeChance = 40,
    }
}

att.BodygroupMods = {"ar_top_handle_railed"}

att.AttachFunc = function(wep)
end

att.DetachFunc = function(wep)
end

ACT3_LoadAttachment(att)