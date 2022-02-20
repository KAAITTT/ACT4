local att = {}

att.PrintName = "M3 4-Round Tube"
att.Name = "m3_tube_4"
att.Slot = "m3_tube"
att.Description = {"Tube with 4-round capacity."}
att.Icon = Material("attachments/m3_tube_4.png")

att.BodygroupMods = {"m3_tube_short"}

att.AttachFunc = function(wep)
    wep:Unload()
    wep.Magazine = {
        Type = "m3_tube_4",
        Rounds = {}
    }
    wep:RecalculateDefaultRounds()
end

att.DetachFunc = function(wep)
end

ACT3_LoadAttachment(att)