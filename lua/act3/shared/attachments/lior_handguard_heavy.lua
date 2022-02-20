local att = {}

att.PrintName = "Lior Heavy Handguard"
att.Name = "lior_handguard_heavy"
att.Slot = "lior_handguard"
att.Description = {"-25% Recoil", "+25% Sway"}
att.Icon = Material("attachments/lior_handguard_heavy.png")

att.DescColors = {ACT3.BulletColors.Positive, ACT3.BulletColors.Negative}

att.BodygroupMods = {"lior_handguard_heavy"}

att.AttachFunc = function(wep)
    wep.Recoil = wep.Recoil * 0.75
    wep.Sway = wep.Sway * 1.25
end

att.DetachFunc = function(wep)
    wep.Recoil = wep.Recoil / 0.75
    wep.Sway = wep.Sway / 1.25
end

ACT3_LoadAttachment(att)