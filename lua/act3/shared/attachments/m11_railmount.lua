local att = {}

att.PrintName = "M11 Rail Mount"
att.Name = "m11_railmount"
att.Slot = "m11_mount"
att.Description = {"M11 rail.", "Allows for the attachment of sights."}
att.Icon = Material("attachments/m11_railmount.png")

att.InvAtt = "pistol_railmount"

att.GivesSlots = {
    ["sight"] = {
        Type = "sight",
        PrintName = "Sight",
        Installed = nil,
        Required = false,
        Scale = 1,
        Pos = Vector(-2.875, -0.234, 9.84),
        Ang = Angle(0, 0, 0),
        Randomize = true,
        RandomizeChance = 100,
    }
}

att.BodygroupMods = {"m11_railmount"}

att.AttachFunc = function(wep)
end

att.DetachFunc = function(wep)
end

ACT3_LoadAttachment(att)