local att = {}

att.PrintName = "Garand Factory Stock"
att.Name = "garand_stock"
att.Slot = "garand_stock"
att.Description = {"Standard M1 Garand stock."}
att.Icon = Material("attachments/garand_stock.png")

att.AttachFunc = function(wep)
end

att.DetachFunc = function(wep)
end

ACT3_LoadAttachment(att)