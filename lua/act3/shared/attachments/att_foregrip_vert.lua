local att = {}

att.PrintName = "Vertical Foregrip"
att.Name = "att_foregrip_vert"
att.Slot = "foregrip"
att.Description = {"-20% Recoil", "-20% Sway"}
att.Icon = Material("attachments/att_foregrip_vert.png")

att.DescColors = {ACT3.BulletColors.Positive, ACT3.BulletColors.Positive, ACT3.BulletColors.Positive}

att.WMParts = {
    {
    model = "models/weapons/act3/atts/att_foregrip.mdl",
    bgs = "",
    skin = 0,
    pos = Vector(0, 0, 0),
    ang = Angle(0, 0, 0),
    }
}

att.AttachFunc = function(wep)
    wep.Recoil = wep.Recoil * 0.8
    wep.Sway = wep.Sway / 1.2
    wep.HoldtypeSights = "smg"
end

att.DetachFunc = function(wep)
    local orig = weapons.Get(wep:GetClass())
    wep.Recoil = wep.Recoil / 0.8
    wep.Sway = wep.Sway * 1.2
    wep.HoldtypeSights = orig.HoldtypeSights
end

ACT3_LoadAttachment(att)