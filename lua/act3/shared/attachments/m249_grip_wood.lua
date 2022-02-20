local att = {}

att.PrintName = "M249 Wooden Grip"
att.Name = "m249_grip_wood"
att.Slot = "m249_grip"
att.Description = {"+10% Recoil", "-10% Sway"}
att.Icon = Material("attachments/m249_grip_wood.png")

att.DescColors = {ACT3.BulletColors.Positive, ACT3.BulletColors.Negative}

att.BodygroupMods = {"m249_grip_wood"}

att.AttachFunc = function(wep)
    wep.Recoil = wep.Recoil * 1.1
    wep.Sway = wep.Sway * 0.9
end

att.DetachFunc = function(wep)
    wep.Recoil = wep.Recoil / 1.1
    wep.Sway = wep.Sway / 0.9
end

ACT3_LoadAttachment(att)