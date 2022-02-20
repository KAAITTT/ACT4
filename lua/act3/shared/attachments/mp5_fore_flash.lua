local att = {}

att.PrintName = "MP5 Flashlight Fore"
att.Name = "mp5_fore_flash"
att.Slot = "mp5_fore"
att.Description = {"MP5 foreend with flashlight.", "Blinds enemies and provides light."}
att.Icon = Material("attachments/mp5_fore_flash.png")
att.Toggleable = true

local flashmat = "effects/flashlight001"

att.WMParts = {
    {
    model = "models/editor/axis_helper.mdl",
    nodraw = true,
    pos = Vector(9.711, -0.731, 7.671),
    ang = Angle(0, 0, 0),
    renderfunc = function(pos, ang, ent, slotid, asvm)
        ACT3_DoFlashlight(pos, ang, ent, slotid, flashmat)
    end
    }
}

att.BodygroupMods = {"mp5_handguard_flash"}

att.GivesSlots = {
    ["barrel"] = {
        Type = "mp5_barrel",
        PrintName = "Barrel",
        Installed = "mp5_barrel_factory",
        Required = true,
    }
}

att.RandomizeBlacklist = true -- Prohibit this attachment from being randomly given out

att.AttachFunc = function(wep)
end

att.DetachFunc = function(wep)
end

ACT3_LoadAttachment(att)