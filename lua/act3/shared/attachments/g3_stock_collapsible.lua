local att = {}

att.PrintName = "G3 Collapsible Stock"
att.Name = "g3_stock_collapsible"
att.Slot = "g3_stock"
att.Description = {"Retractable weapon stock."}
att.Icon = Material("attachments/g3_stock_folded.png")

att.GivesSlots = {
    ["foldstock"] = {
        Type = "g3_foldstock",
        PrintName = "Folding Stock",
        Installed = "g3_stock_folded",
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