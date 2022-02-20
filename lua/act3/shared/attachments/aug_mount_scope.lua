local att = {}

att.PrintName = "AUG Sierpinski Scope (x1.5)"
att.Name = "aug_mount_scope"
att.Slot = "aug_mount"
att.Description = {"Standard AUG A1 scope.", "Provides fixed x1.5 magnification."}
att.Icon = Material("attachments/aug_mount_scope.png")

att.BodygroupMods = {"aug_mount_scope"}

att.AttachFunc = function(wep)
    wep.TrueScopeImage = Material("scopes/act3/swarovski.png")
    wep.Magnification = 1.5
end

att.DetachFunc = function(wep)
    wep.TrueScopeImage = nil
    wep.Magnification = 1
end


ACT3_LoadAttachment(att)