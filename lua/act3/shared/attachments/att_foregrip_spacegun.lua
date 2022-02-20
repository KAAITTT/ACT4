local att = {}

att.PrintName = "Spacegun Foregrip"
att.Name = "att_foregrip_spacegun"
att.Slot = "foregrip"
att.Description = {"+20% Straighter Recoil", "-20% Recoil"}
att.Icon = Material("attachments/att_foregrip_spacegun.png")

att.DescColors = {ACT3.BulletColors.Positive, ACT3.BulletColors.Positive, ACT3.BulletColors.Positive}

att.WMParts = {
    {
    model = "models/weapons/act3/atts/att_foregrip_spacegun.mdl",
    bgs = "",
    skin = 0,
    pos = Vector(0, 0, 0),
    ang = Angle(0, 90, 0),
    }
}

att.AttachFunc = function(wep)
    wep.Recoil = wep.Recoil / 1.2
    wep.RecoilAngles = wep.RecoilAngles * 0.8
    wep.HoldtypeSights = "smg"
end

att.DetachFunc = function(wep)
    local orig = weapons.Get(wep:GetClass())
    wep.Recoil = wep.Recoil * 1.2
    wep.RecoilAngles = wep.RecoilAngles / 0.8
    wep.HoldtypeSights = orig.HoldtypeSights
end

ACT3_LoadAttachment(att)