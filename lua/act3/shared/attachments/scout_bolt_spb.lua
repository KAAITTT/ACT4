local att = {}

att.PrintName = "Scout Straight Pull Bolt"
att.Name = "scout_bolt_spb"
att.Slot = "scout_bolt"
att.Description = {"+10% Fire Rate", "+15% Aim Time"}
att.DescColors = {ACT3.BulletColors.Positive, ACT3.BulletColors.Negative}
att.Icon = Material("attachments/scout_bolt_spb.png")

att.BodygroupMods = {"scout_bolt_spb"}

att.AttachFunc = function(wep)
   wep.ShootingDelay = wep.ShootingDelay / 1.1
   wep.AimTime = wep.AimTime * 1.15
end

att.DetachFunc = function(wep)
   wep.ShootingDelay = wep.ShootingDelay * 1.1
   wep.AimTime = wep.AimTime / 1.15
end

ACT3_LoadAttachment(att)