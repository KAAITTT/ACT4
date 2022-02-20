local att = {}

att.PrintName = "Folded"
att.Name = "g3_stock_folded"
att.Slot = "g3_foldstock"
att.Description = {"Folded stock."}
att.Icon = Material("attachments/g3_stock_folded.png")

att.DescColors = {ACT3.BulletColors.Positive}

att.BodygroupMods = {"g3_stock_folded"}

att.Free = true

att.AttachFunc = function(wep)
end

att.DetachFunc = function(wep)
end

ACT3_LoadAttachment(att)