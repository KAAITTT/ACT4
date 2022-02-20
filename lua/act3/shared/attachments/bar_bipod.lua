local att = {}

att.PrintName = "BAR Bipod"
att.Name = "bar_bipod"
att.Slot = "bar_bipod"
att.Description = {"Reduces recoil and sway when bipod is down."}
att.Icon = Material("attachments/bar_bipod.png")

att.BodygroupMods = {"bar_bipod"}

att.AttachFunc = function(wep)
    wep.BipodInstalled = true
end

att.DetachFunc = function(wep)
    local orig = weapons.Get(wep:GetClass())
    wep.BipodInstalled = orig.bipodInstalled
end

ACT3_LoadAttachment(att)