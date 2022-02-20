local att = {}

att.PrintName = "Folded"
att.Name = "m11_stock_folded"
att.Slot = "m11_foldstock"
att.Description = {"Folded stock."}
att.Icon = Material("attachments/m11_stock_folded.png")

att.DescColors = {ACT3.BulletColors.Neutral}

att.BodygroupMods = {"m11_stock_folded"}

att.Free = true

att.AttachFunc = function(wep)
end

att.DetachFunc = function(wep)
end

ACT3_LoadAttachment(att)