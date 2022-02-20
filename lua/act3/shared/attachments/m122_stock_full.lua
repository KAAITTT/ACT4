local att = {}

att.PrintName = "M1-22 Full Stock"
att.Name = "m122_stock_full"
att.Slot = "m122_stock"
att.Description = {"Standard M1-22 stock.", "-10% Sighted Speed"}
att.Icon = Material("attachments/m122_stock_full.png")

att.DescColors = {ACT3.BulletColors.Neutral, ACT3.BulletColors.Negative}


att.AttachFunc = function(wep)
   wep.SightedSpeedMult = wep.SightedSpeedMult * 0.9
end

att.DetachFunc = function(wep)
   wep.SightedSpeedMult = wep.SightedSpeedMult / 0.9
end

ACT3_LoadAttachment(att)