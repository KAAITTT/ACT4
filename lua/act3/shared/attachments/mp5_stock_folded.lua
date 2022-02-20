local att = {}

att.PrintName = "Folded"
att.Name = "mp5_stock_folded"
att.Slot = "mp5_foldstock"
att.Description = {"Folded stock."}
att.Icon = Material("attachments/mp5_stock_folded.png")

att.DescColors = {ACT3.BulletColors.Neutral}

att.BodygroupMods = {"mp5_stock_folded"}

att.Free = true

att.AttachFunc = function(wep)
end

att.DetachFunc = function(wep)
end

ACT3_LoadAttachment(att)