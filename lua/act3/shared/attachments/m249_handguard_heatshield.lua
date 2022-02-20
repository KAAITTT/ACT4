local att = {}

att.PrintName = "M249 Handguard w/t Heatshield"
att.Name = "m249_handguard_heatshield"
att.Slot = "m249_handguard"
att.Description = {"-25% Heat Accumulation", "-25% Heat Dissipation"}
att.Icon = Material("attachments/m249_handguard_heatshield.png")

att.DescColors = {ACT3.BulletColors.Positive, ACT3.BulletColors.Negative}

att.BodygroupMods = {"m249_handguard_heatshield"}


att.AttachFunc = function(wep)
    wep.HeatAccumulation = wep.HeatAccumulation * 0.75
    wep.HeatDissipation = wep.HeatDissipation * 0.75
end

att.DetachFunc = function(wep)
    wep.HeatAccumulation = wep.HeatAccumulation / 0.75
    wep.HeatDissipation = wep.HeatDissipation / 0.75
end

ACT3_LoadAttachment(att)