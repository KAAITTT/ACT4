local att = {}

att.PrintName = "M3 Solid Stock"
att.Name = "m3_stock_solid"
att.Slot = "m3_stock"
att.Description = {"-25% Recoil", "-10% Sway", "-25% Less Straight Recoil"}
att.Icon = Material("attachments/m3_stock_solid.png")

att.DescColors = {ACT3.BulletColors.Positive, ACT3.BulletColors.Positive, ACT3.BulletColors.Negative}

att.BodygroupMods = {"m3_stock_solid"}

att.AttachFunc = function(wep)
    wep.Recoil = wep.Recoil * 0.75
    wep.RecoilAngles = wep.RecoilAngles * 1.25
    wep.Sway = wep.Sway * 0.9
end

att.DetachFunc = function(wep)
    wep.Recoil = wep.Recoil / 0.75
    wep.RecoilAngles = wep.RecoilAngles / 1.25
    wep.Sway = wep.Sway / 0.9
end

ACT3_LoadAttachment(att)