local att = {}

att.PrintName = "Garand Cut Stock"
att.Name = "garand_stock_cut"
att.Slot = "garand_stock"
att.Description = {"+10% Sighted Speed", "+25% Recoil", "+50% Sway"}
att.Icon = Material("attachments/garand_stock_cut.png")
att.DescColors = {ACT3.BulletColors.Positive, ACT3.BulletColors.Negative, ACT3.BulletColors.Negative}

att.BodygroupMods = {"garand_stock_cut"}

att.AttachFunc = function(wep)
   wep.Recoil = wep.Recoil / 0.75
   wep.Sway = wep.Sway / 0.5
   wep.SightedSpeedMult = wep.SightedSpeedMult / 0.9
end

att.DetachFunc = function(wep)
   wep.Recoil = wep.Recoil * 0.75
   wep.Sway = wep.Sway * 0.5
   wep.SightedSpeedMult = wep.SightedSpeedMult * 0.9
end

ACT3_LoadAttachment(att)