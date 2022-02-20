local att = {}

att.PrintName = "C96 20-Round Magazine"
att.Name = "c96_mag_20"
att.Slot = "c96_mag"
att.Description = {"Magazine with 20-round capacity"}
att.Icon = Material("attachments/c96_mag_20.png")

att.BodygroupMods = {"c96_mag"}

att.AttachFunc = function(wep)
    wep:Unload()
    wep.Magazine = {
        Type = "c96_20",
        Rounds = {}
    }
    wep:RecalculateDefaultRounds()
end

att.DetachFunc = function(wep)
end

ACT3_LoadAttachment(att)