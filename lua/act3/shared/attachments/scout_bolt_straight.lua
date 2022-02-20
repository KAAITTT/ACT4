local att = {}

att.PrintName = "Scout Straight Bolt"
att.Name = "scout_bolt_straight"
att.Slot = "scout_bolt"
att.Description = {"Scout factory bolt."}
att.Icon = Material("attachments/scout_bolt_straight.png")

att.BodygroupMods = {"scout_bolt_straight"}

att.AttachFunc = function(wep)
end

att.DetachFunc = function(wep)
end

ACT3_LoadAttachment(att)