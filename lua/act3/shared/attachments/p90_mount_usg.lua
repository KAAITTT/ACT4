local att = {}

att.PrintName = "P90 USG Sight"
att.Name = "p90_mount_usg"
att.Slot = "p90_mount"
att.Description = {"Standard P90 USG reflex sight."}
att.Icon = Material("attachments/p90_mount_usg.png")

att.AttachFunc = function(wep)
    wep.TrueScopeImage = Material("scopes/act3/p90.png")
    wep.Magnification = 1.5
end

att.DetachFunc = function(wep)
    wep.TrueScopeImage = nil
    wep.Magnification = 1
end

ACT3_LoadAttachment(att)