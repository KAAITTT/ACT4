-- shows all properties an attachment can use

local att = {} -- initialize att table

att.PrintName = "" -- pretty name for the attachment, this is what shows up in menus
att.Name = "" -- short name ID for the attachment, should be but is not required to be the same as the file name
att.Slot = "" -- what slot type the attachment can fit on
att.Description = {"", "", "", ""} -- attachment description. Max 4 lines. Each table entry is a new line.
att.Icon = Material("") -- Material("path/to/icon") icon that shows up in the menu

att.WMParts = {} -- list of worldmodel parts the weapon has. See "base_WMPart"

att.RequiredFlags = {""} -- weapon needs ALL of these flags to attach.
att.ExcludeFlags = {""} -- if the weapon has ANY of these flags, you won't be able to attach this attachment.
att.GivesFlags = {""} -- this attachment gives these flags to the weapon.

att.GivesSlots = {} -- list of slots to give. See SWEP.Attachments.

att.BodygroupMods = {"", "", "..."} -- strings describing weapon bodygroup modifications. See SWEP.AttachmentBodygroups.
att.SkinMod = 0 -- Change the base model skin to this one. REMEMBER: Skin 0 is the default skin!
att.MaterialMod = nil
att.ColorMod = nil

att.Toggleable = false -- attachment is something affected by F toggle.

att.IsSight = false -- whether or not to switch to sighted aim position
att.SightOffsetPos = Vector(0, 0, 0) -- offset for sight position. Affects ironsights.
att.SightOffsetAng = Angle(0, 0, 0) -- All you have to do is line up the attachment model in SCK and put those iron sight values in here
att.NoEyeRelief = false -- whether to disable eye relief for this sight

att.RandomizeBlacklist = false -- Prohibit this attachment from being randomly given out

att.AttachFunc = function(wep) -- functions that are run on weapon attach or detach.
end

att.DetachFunc = function(wep)
end

ACT3_LoadAttachment(att)