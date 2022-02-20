local att = {}

att.PrintName = "C96 10-Round Magazine"
att.Name = "c96_mag_10"
att.Slot = "c96_mag"
att.Description = {"Magazine with 10-round capacity"}
att.Icon = Material("attachments/c96_mag_10.png")

att.AttachFunc = function(wep)
    wep:Unload()
    wep.Magazine = {
        Type = "c96_10",
        Rounds = {}
    }
    wep:RecalculateDefaultRounds()
end

att.DetachFunc = function(wep)
end

ACT3_LoadAttachment(att)