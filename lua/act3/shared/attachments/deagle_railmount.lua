local att = {}

att.PrintName = "Deagle Rail Mount"
att.Name = "deagle_railmount"
att.Slot = "deagle_mount"
att.Description = {"Desert Eagle rail.", "Allows for the attachment of sights."}
att.Icon = Material("attachments/deagle_railmount.png")

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
        Pos = Vector(6.335, 0.31, 7.875),
        Ang = Angle(0, 0, 0),
        Randomize = true,
        RandomizeChance = 100,
    }
}

att.BodygroupMods = {"deagle_railmount"}

att.AttachFunc = function(wep)
end

att.DetachFunc = function(wep)
end

ACT3_LoadAttachment(att)