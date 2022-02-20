local att = {}

att.PrintName = "Hensoldt Light"
att.Name = "att_acc_flash_hensoldt"
att.Slot = "accessory"
att.Description = {"Attachable weapon flashlight.", "Blinds enemies and provides light.", "Comes with crosshair style insert for aiming.", "Improves hip fire accuracy."}
att.Icon = Material("attachments/att_flashlight.png")

att.Toggleable = true

local flashmat = "effects/fl_hensoldt"

att.RandomizeBlacklist = true -- Prohibit this attachment from being randomly given out

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

att.SightOffsetPos = Vector(0, 0, 0)
att.SightOffsetAng = Angle(0, 0, 0)


att.AttachFunc = function(wep)
end

att.DetachFunc = function(wep)
end

ACT3_LoadAttachment(att)