local att = {}

att.PrintName = "Folding Foregrip"
att.Name = "att_foregrip_folding"
att.Slot = "foregrip"
att.Description = {"-20% Sway", "+20% Straighter Recoil"}
att.Icon = Material("attachments/att_foregrip_folding.png")

att.DescColors = {ACT3.BulletColors.Positive, ACT3.BulletColors.Positive, ACT3.BulletColors.Positive}

att.WMParts = {
    {
    model = "models/weapons/act3/atts/att_foregrip_folding.mdl",
    bgs = "",
    skin = 0,
    pos = Vector(0, 0, 0),
    ang = Angle(0, 0, 0),
    }
}

att.AttachFunc = function(wep)
    wep.Sway = wep.Sway * 0.8
    wep.RecoilAngles = wep.RecoilAngles * 1.2
    wep.HoldtypeSights = "smg"
end

att.DetachFunc = function(wep)
    local orig = weapons.Get(wep:GetClass())
    wep.Sway = wep.Sway / 0.8
    wep.RecoilAngles = wep.RecoilAngles / 1.2
    wep.HoldtypeSights = orig.HoldtypeSights
end

ACT3_LoadAttachment(att)