local att = {}

att.PrintName = "M3 7-Round Tube"
att.Name = "m3_tube_7"
att.Slot = "m3_tube"
att.Description = {"Tube with 7-round capacity."}
att.Icon = Material("attachments/m3_tube_7.png")

att.AttachFunc = function(wep)
    wep:Unload()
    wep.Magazine = {
        Type = "m3_tube_7",
        Rounds = {}
    }
    wep:RecalculateDefaultRounds()
end

att.DetachFunc = function(wep)
end

ACT3_LoadAttachment(att)