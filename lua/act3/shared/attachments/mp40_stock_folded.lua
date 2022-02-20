local att = {}

att.PrintName = "Folded"
att.Name = "mp40_stock_folded"
att.Slot = "mp40_stock"
att.Description = {"Folded stock."}
att.DescColors = {ACT3.BulletColors.Neutral}

att.Icon = Material("attachments/mp40_stock_folded.png")

att.BodygroupMods = {"mp40_stock_folded"}

att.Free = true

att.AttachFunc = function(wep)
end

att.DetachFunc = function(wep)
end

ACT3_LoadAttachment(att)