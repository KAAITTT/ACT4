local att = {}

att.PrintName = "AUG Low Profile Rail"
att.Name = "aug_mount_rail_lp"
att.Slot = "aug_mount"
att.Description = {"Low profile AUG A3 sight rail.", "Allows for the attachment of sights."}
att.Icon = Material("attachments/aug_mount_rail_lp.png")

att.BodygroupMods = {"aug_mount_rail_lp"}

att.GivesSlots = {
    ["sight"] = {
        Type = "sight",
        PrintName = "Sight",
        Installed = nil,
        Required = false,
        Scale = 1,
        Pos = Vector(-2.79, 0.05, 8.784),
        Ang = Angle(0, 0, 0),
        Randomize = true,
        RandomizeChance = 40,
    }
}

att.AttachFunc = function(wep)
    wep.SightAboveBore = wep.SightAboveBore - 3
end

att.DetachFunc = function(wep)
    wep.SightAboveBore = wep.SightAboveBore + 3
end


ACT3_LoadAttachment(att)