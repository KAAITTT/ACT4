local att = {}

att.PrintName = "M1-22 Cut Stock"
att.Name = "m122_stock_cut"
att.Slot = "m122_stock"
att.Description = {"+150% Recoil", "+100% Sway"}
att.Icon = Material("attachments/m122_stock_cut.png")

att.DescColors = {ACT3.BulletColors.Negative, ACT3.BulletColors.Negative}

att.BodygroupMods = {"m122_stock_cut"}

att.ExcludeFlags = {"bipinstalled"}
att.GivesFlags = {"nobipod"}

att.AttachFunc = function(wep)
    wep.Sway = wep.Sway * 2
    wep.Recoil = wep.Recoil * 2.5
end

att.DetachFunc = function(wep)
    wep.Sway = wep.Sway / 2
    wep.Recoil = wep.Recoil / 2.5
end

ACT3_LoadAttachment(att)