local att = {}

att.PrintName = "Bipod Down"
att.Name = "scout_bipod_down"
att.Slot = "scout_bipod"
att.Description = {"Bipod for aiming.", "+10% Aim Time", "+15% Sway"}
att.DescColors = {ACT3.BulletColors.Positive, ACT3.BulletColors.Negative, ACT3.BulletColors.Negative}
att.Icon = Material("attachments/scout_bipod_down.png")

att.BodygroupMods = {"scout_bipod_down"}

att.Free = true

att.ExcludeFlags = {"bipinstalled"}
att.GivesFlags = {"nobipod"}

att.AttachFunc = function(wep)
    wep.BipodInstalled = true
    wep.AimTime = wep.AimTime * 1.1
    wep.Sway = wep.Sway * 1.15
end

att.DetachFunc = function(wep)
    wep.BipodInstalled = false
    wep.AimTime = wep.AimTime / 1.1
    wep.Sway = wep.Sway / 1.15
end

ACT3_LoadAttachment(att)