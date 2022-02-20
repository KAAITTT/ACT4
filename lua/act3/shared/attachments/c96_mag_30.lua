local att = {}

att.PrintName = "C96 30-Round Magazine"
att.Name = "c96_mag_30"
att.Slot = "c96_mag"
att.Description = {"Magazine with 30-round capacity"}
att.Icon = Material("attachments/c96_mag_30.png")

att.BodygroupMods = {"c96_mag_30"}

att.AttachFunc = function(wep)
    wep:Unload()
    wep.Magazine = {
        Type = "c96_30",
        Rounds = {}
    }
    wep:RecalculateDefaultRounds()
end

att.DetachFunc = function(wep)
end

ACT3_LoadAttachment(att)