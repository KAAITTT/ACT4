local att = {}

att.PrintName = "M3 Flashlight Slide"
att.Name = "m3_slide_flash"
att.Slot = "m3_slide"
att.Description = {"Slide with integral flashlight.", "Blinds enemies and provides light."}
att.Icon = Material("attachments/m3_slide_flash.png")

att.BodygroupMods = {"m3_slide_flash"}

att.Toggleable = true

local flashmat = "effects/flashlight001"

att.WMParts = {
    {
    model = "models/editor/axis_helper.mdl",
    nodraw = true,
    pos = Vector(14.788, 0, 4.796),
    ang = Angle(0, 0, 0),
    renderfunc = function(pos, ang, ent, slotid, asvm)
        ACT3_DoFlashlight(pos, ang, ent, slotid, flashmat)
    end
    }
}

att.RandomizeBlacklist = true -- Prohibit this attachment from being randomly given out

att.AttachFunc = function(wep)
end

att.DetachFunc = function(wep)
end

ACT3_LoadAttachment(att)