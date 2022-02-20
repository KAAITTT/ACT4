local att = {}

att.PrintName = "G17 Rail Mount"
att.Name = "g17_railmount"
att.Slot = "g17_mount"
att.Description = {"G17 rail.", "Allows for the attachment of sights."}
att.Icon = Material("attachments/g17_railmount.png")

att.ExcludeFlags = {"rdsinstalled"}
att.GivesFlags = {"prailinstalled"}

att.InvAtt = "pistol_railmount"

att.GivesSlots = {
    ["sight"] = {
        Type = "sight",
        PrintName = "Sight",
        Installed = nil,
        Required = false,
        Scale = 1,
        Pos = Vector(6.335, 0.31, 5.689),
        Ang = Angle(0, 0, 0),
        Randomize = true,
        RandomizeChance = 100,
    }
}

att.BodygroupMods = {"g17_railmount"}

att.AttachFunc = function(wep)
end

att.DetachFunc = function(wep)
end

ACT3_LoadAttachment(att)