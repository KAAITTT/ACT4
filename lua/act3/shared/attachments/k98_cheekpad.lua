local att = {}

att.PrintName = "K98 Cheek Pad"
att.Name = "k98_cheekpad"
att.Slot = "k98_cheekpad"
att.Description = {"-50% Sway", "-20% Less Straight Recoil"}
att.Icon = Material("attachments/k98_cheekpad.png")

att.DescColors = {ACT3.BulletColors.Positive, ACT3.BulletColors.Negative}

att.BodygroupMods = {"k98_cheekpad"}

att.AttachFunc = function(wep)
    wep.Sway = wep.Sway * 0.5
    wep.RecoilAngles = wep.RecoilAngles * 1.2
end

att.DetachFunc = function(wep)
    wep.Sway = wep.Sway / 0.5
    wep.RecoilAngles = wep.RecoilAngles / 1.2
end

ACT3_LoadAttachment(att)