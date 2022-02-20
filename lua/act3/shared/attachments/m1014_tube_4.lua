local att = {}

att.PrintName = "M1014 4-Round Tube"
att.Name = "m1014_tube_4"
att.Slot = "m1014_tube"
att.Description = {"Tube with 4-round capacity."}
att.Icon = Material("attachments/m1014_tube_4.png")

att.BodygroupMods = {"m1014_tube_4"}

att.AttachFunc = function(wep)
    wep:Unload()
    wep.Magazine = {
        Type = "m1014_tube_4",
        Rounds = {}
    }
    wep:RecalculateDefaultRounds()
end

att.DetachFunc = function(wep)
end

ACT3_LoadAttachment(att)