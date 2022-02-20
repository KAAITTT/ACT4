local att = {}

att.PrintName = "Osa K7P"
att.Name = "att_sight_ochre"
att.Slot = "sight"
att.Description = {"Reflex sight.", "Provides green chevron reticle."}
att.Icon = Material("attachments/att_sight_ochre.png")

att.WMParts = {
    {
    model = "models/weapons/act3/atts/att_sight_okp.mdl",
    bgs = "",
    skin = 0,
    pos = Vector(0, 0, 0),
    ang = Angle(0, 0, 0),
    }
}

att.IsSight = true
att.SightOffsetPos = Vector(0.34, 11.112, -1.213)
att.SightOffsetAng = Angle(0, 0, 0)

att.AttachFunc = function(wep)
    wep.Magnification = 1.0
    wep.HolosightImage = Material("reticles/act3_mchev.png")
    wep.HolosightSize = 32
    wep.HolosightColor = Color(0, 255, 0)
end

att.DetachFunc = function(wep)
    local orig = weapons.Get(wep:GetClass())
    wep.Magnification = orig.Magnification
    wep.HolosightImage = orig.HolosightImage
    wep.HolosightSize = orig.HolosightSize
    wep.HolosightColor = orig.HolosightColor
end

ACT3_LoadAttachment(att)