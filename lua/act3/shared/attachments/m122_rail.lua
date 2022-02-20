local att = {}

att.PrintName = "M1-22 Rail"
att.Name = "m122_rail"
att.Slot = "m122_rail"
att.Description = {"Top mounted rail.", "Allows for the attachment of sights."}
att.Icon = Material("attachments/m122_rail.png")

att.InvAtt = "att_mount_aftermarket"

att.GivesSlots = {
    ["sight"] = {
        Type = "sight",
        PrintName = "Sight",
        Installed = nil,
        Required = false,
        Scale = 1,
        Pos = Vector(1.643, -0.227, 8.616),
        Ang = Angle(0, 0, 0),
        Randomize = true,
        RandomizeChance = 100,
    }
}

att.BodygroupMods = {"m122_forerail"}

att.AttachFunc = function(wep)
end

att.DetachFunc = function(wep)
end

ACT3_LoadAttachment(att)