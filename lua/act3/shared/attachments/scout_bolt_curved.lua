local att = {}

att.PrintName = "Scout Curved Bolt"
att.Name = "scout_bolt_curved"
att.Slot = "scout_bolt"
att.Description = {"+20% Muzzle Velocity", "-5% Fire Rate"}
att.DescColors = {ACT3.BulletColors.Positive, ACT3.BulletColors.Negative}
att.Icon = Material("attachments/scout_bolt_curved.png")

att.BodygroupMods = {"scout_bolt_curved"}

att.AttachFunc = function(wep)
   wep.ShootingDelay = wep.ShootingDelay * 1.05
   wep.MuzzleVelocity = wep.MuzzleVelocity * 1.2
end

att.DetachFunc = function(wep)
   wep.ShootingDelay = wep.ShootingDelay / 1.05
   wep.MuzzleVelocity = wep.MuzzleVelocity / 1.2
end

ACT3_LoadAttachment(att)