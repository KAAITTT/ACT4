local att = {}

att.PrintName = "Stubby Foregrip"
att.Name = "att_foregrip_stubby"
att.Slot = "foregrip"
att.Description = {"-10% Recoil", "-10% Sway", "+10% Straighter Recoil"}
att.Icon = Material("attachments/att_foregrip_stubby.png")

att.DescColors = {ACT3.BulletColors.Positive, ACT3.BulletColors.Positive, ACT3.BulletColors.Positive}

att.WMParts = {
    {
    model = "models/weapons/act3/atts/att_foregrip_stubby.mdl",
    bgs = "",
    skin = 0,
    pos = Vector(7, 0, 0),
    ang = Angle(0, 0, 0),
    }
}

att.AttachFunc = function(wep)
    wep.Sway = wep.Sway * 0.9
    wep.RecoilAngles = wep.RecoilAngles * 0.9
    wep.Recoil = wep.Recoil * 0.9
    wep.HoldtypeSights = "smg"
end

att.DetachFunc = function(wep)
    local orig = weapons.Get(wep:GetClass())
    wep.Sway = wep.Sway / 0.9
    wep.Recoil = wep.Recoil / 0.9
    wep.RecoilAngles = wep.RecoilAngles / 0.9
   wep.HoldtypeSights = orig.HoldtypeSights
end

ACT3_LoadAttachment(att)