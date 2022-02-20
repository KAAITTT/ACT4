local att = {}

att.PrintName = "Bipod"
att.Name = "att_bipod"
att.Slot = "foregrip"
att.Description = {"Reduces recoil and sway when bipod is down."}
att.Icon = Material("attachments/att_bipod.png")

att.ExcludeFlags = {"nobipod"}
att.GivesFlags = {"bipinstalled"}

att.WMParts = {
    {
    model = "models/weapons/act3/atts/att_bipod.mdl",
    bgs = "",
    skin = 0,
    pos = Vector(5, 0, 0),
    ang = Angle(0, 90, 0),
    }
}

att.AttachFunc = function(wep)
    wep.BipodInstalled = true
end

att.DetachFunc = function(wep)
    local orig = weapons.Get(wep:GetClass())
    wep.BipodInstalled = orig.bipodInstalled
end

ACT3_LoadAttachment(att)