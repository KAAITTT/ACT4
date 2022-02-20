local att = {}

att.PrintName = "MP5A2 Fore"
att.Name = "mp5_fore_a2"
att.Slot = "mp5_fore"
att.Description = {"Standard polymer A2 foreend."}
att.Icon = Material("attachments/mp5_fore_a2.png")

att.GivesSlots = {
    ["barrel"] = {
        Type = "mp5_barrel",
        PrintName = "Barrel",
        Installed = "mp5_barrel_factory",
        Required = true,
    }
}

att.AttachFunc = function(wep)
end

att.DetachFunc = function(wep)
end

ACT3_LoadAttachment(att)