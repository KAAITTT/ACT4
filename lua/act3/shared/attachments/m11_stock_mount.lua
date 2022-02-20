local att = {}

att.PrintName = "M11 Folding Stock"
att.Name = "m11_stock_mount"
att.Slot = "m11_stock"
att.Description = {"Folding weapon stock."}
att.Icon = Material("attachments/m11_stock_mount.png")

att.BodygroupMods = {"m11_stock_mount"}

att.GivesSlots = {
    ["foldstock"] = {
        Type = "m11_foldstock",
        PrintName = "Folding Stock",
        Installed = "m11_stock_folded",
        Required = true,
        Randomize = true,
        RandomizeChance = 50,
    }
}

att.AttachFunc = function(wep)
end

att.DetachFunc = function(wep)
end

ACT3_LoadAttachment(att)