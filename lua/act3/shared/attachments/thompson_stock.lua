local att = {}

att.PrintName = "Thompson Stock"
att.Name = "thompson_stock"
att.Slot = "thompson_stock"
att.Description = {"-25% Recoil", "-50% Sway", "-10% Sighted Speed"}
att.Icon = Material("attachments/thompson_stock.png")
att.DescColors = {ACT3.BulletColors.Positive, ACT3.BulletColors.Positive, ACT3.BulletColors.Negative}

att.BodygroupMods = {"thompson_stock"}

att.AttachFunc = function(wep)
    wep.Recoil = wep.Recoil * 0.75
    wep.Sway = wep.Sway * 0.5
    wep.SightedSpeedMult = wep.SightedSpeedMult * 0.9
end

att.DetachFunc = function(wep)
    wep.Recoil = wep.Recoil / 0.75
    wep.Sway = wep.Sway / 0.5
    wep.SightedSpeedMult = wep.SightedSpeedMult / 0.9
end

ACT3_LoadAttachment(att)