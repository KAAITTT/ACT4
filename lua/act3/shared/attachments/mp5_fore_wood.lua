local att = {}

att.PrintName = "MP5 Wooden Fore"
att.Name = "mp5_fore_wood"
att.Slot = "mp5_fore"
att.Description = {"Wooden MP5 foreend."}
att.Icon = Material("attachments/mp5_fore_wood.png")

att.BodygroupMods = {"mp5_handguard_wood"}

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