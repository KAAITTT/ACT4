local att = {}

att.PrintName = "M1014 7-Round Tube"
att.Name = "m1014_tube_7"
att.Slot = "m1014_tube"
att.Description = {"Tube with 7-round capacity."}
att.Icon = Material("attachments/m1014_tube_7.png")

att.BodygroupMods = {"m1014_tube_7"}

att.AttachFunc = function(wep)
    wep:Unload()
    wep.Magazine = {
        Type = "m1014_tube_7",
        Rounds = {}
    }
    wep:RecalculateDefaultRounds()
end

att.DetachFunc = function(wep)
end

ACT3_LoadAttachment(att)