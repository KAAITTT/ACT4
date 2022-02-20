local att = {}

att.PrintName = "Folded"
att.Name = "m1014_stock_folded"
att.Slot = "m1014_stock"
att.Description = {"Folded stock."}
att.Icon = Material("attachments/m1014_stock_folded.png")

att.DescColors = {ACT3.BulletColors.Neutral}

att.BodygroupMods = {"m1014_stock_folded"}

att.Free = true

att.AttachFunc = function(wep)
end

att.DetachFunc = function(wep)
end

ACT3_LoadAttachment(att)