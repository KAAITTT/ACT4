local att = {}

att.PrintName = "C96 Stock"
att.Name = "c96_stock"
att.Slot = "c96_stock"
att.Description = {"-25% Recoil", "-50% Sway", "-10% Sighted Speed"}
att.Icon = Material("attachments/c96_stock.png")

att.DescColors = {ACT3.BulletColors.Positive, ACT3.BulletColors.Positive, ACT3.BulletColors.Negative, ACT3.BulletColors.Negative}

att.BodygroupMods = {"c96_stock"}

att.AttachFunc = function(wep)
    wep.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_SMG1

    wep.Recoil = wep.Recoil * 0.75
    wep.Sway = wep.Sway * 0.5
    wep.SightedSpeedMult = wep.SightedSpeedMult * 0.9
end

att.DetachFunc = function(wep)
    wep.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_PISTOL

    wep.Recoil = wep.Recoil / 0.75
    wep.Sway = wep.Sway / 0.5
    wep.SightedSpeedMult = wep.SightedSpeedMult / 0.9
end

ACT3_LoadAttachment(att)