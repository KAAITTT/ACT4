local att = {}

att.PrintName = "MP5 Collapsible Stock"
att.Name = "mp5_stock_collapsible"
att.Slot = "mp5_stock"
att.Description = {"Retractable weapon stock."}
att.Icon = Material("attachments/mp5_stock_folded.png")

att.GivesSlots = {
    ["foldstock"] = {
        Type = "mp5_foldstock",
        PrintName = "Folding Stock",
        Installed = "mp5_stock_folded",
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