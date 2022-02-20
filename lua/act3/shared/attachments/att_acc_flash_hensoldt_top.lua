local att = {}

att.PrintName = "Hensoldt Light"
att.Name = "att_acc_flash_hensoldt_top"
att.Slot = "sight"
att.Description = {"Attachable weapon flashlight.", "Blinds enemies and provides light.", "Comes with crosshair style insert for aiming.", "Improves hip fire accuracy."}
att.Icon = Material("attachments/att_flashlight.png")

att.InvAtt = "att_acc_flash_hensoldt"

att.Toggleable = true

local flashmat = "effects/fl_hensoldt"

att.HipfireHelper = true

att.WMParts = {
    {
    model = "models/weapons/act3/atts/att_flashlight.mdl",
    bgs = "",
    skin = 0,
    pos = Vector(0, 0, 0),
    ang = Angle(0, 0, 0),
    renderfunc = function(pos, ang, ent, slotid, asvm)
        pos = pos + (ang:Forward() * 6)

        ACT3_DoFlashlight(pos, ang, ent, slotid, flashmat)
    end
    }
}

att.RandomizeBlacklist = true -- Prohibit this attachment from being randomly given out

att.IsSight = true
att.SightOffsetPos = Vector(0, 6.953, -1.058)
att.SightOffsetAng = Angle(0, 0, 0)

att.AttachFunc = function(wep)
    wep.Magnification = 1.0
end

att.DetachFunc = function(wep)
    local orig = weapons.Get(wep:GetClass())
    wep.Magnification = orig.Magnification
end

ACT3_LoadAttachment(att)