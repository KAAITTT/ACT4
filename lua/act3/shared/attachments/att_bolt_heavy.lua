local att = {}

att.PrintName = "Heavy Bolt"
att.Name = "att_bolt_heavy"
att.Slot = "bolt_heavy"
att.Description = {"A weighted bolt to slow cyclic rate.", "-30% Fire Rate", "+20% Accuracy Recovery", "-30% Recoil", "-20% Precision"}
att.DescColors = {ACT3.BulletColors.Neutral, ACT3.BulletColors.Neutral, ACT3.BulletColors.Positive, ACT3.BulletColors.Positive, ACT3.BulletColors.Negative}
att.Icon = Material("attachments/bolt_heavy.png")


att.AttachFunc = function(wep)
    wep.ShootingDelay = wep.ShootingDelay / 0.7
    wep.Precision = wep.Precision * 1.2
    wep.Recoil = wep.Recoil * 0.7
    wep.HeatDissipation = wep.HeatDissipation * 0.8
end

att.DetachFunc = function(wep)
    local orig = weapons.Get(wep:GetClass())

    wep.ShootingDelay = wep.ShootingDelay * 0.7
    wep.Precision = wep.Precision / 1.2
    wep.Recoil = wep.Recoil / 0.7
    wep.HeatDissipation = wep.HeatDissipation / 0.8
end

ACT3_LoadAttachment(att)