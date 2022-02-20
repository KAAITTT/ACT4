local att = {}

att.PrintName = "M3 9-Round Tube"
att.Name = "m3_tube_9"
att.Slot = "m3_tube"
att.Description = {"Tube with 9-round capacity."}
att.Icon = Material("attachments/m3_tube_9.png")

att.BodygroupMods = {"m3_tube_long"}

att.AttachFunc = function(wep)
    wep:Unload()
    wep.Magazine = {
        Type = "m3_tube_9",
        Rounds = {}
    }
    wep:RecalculateDefaultRounds()
end

att.DetachFunc = function(wep)
end

ACT3_LoadAttachment(att)