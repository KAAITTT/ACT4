local att = {}

att.PrintName = "Thompson Foregrip"
att.Name = "thompson_fg"
att.Slot = "thompson_fg"
att.Description = {"-10% Recoil", "-10% Sway", "+10% Straighter Recoil"}
att.Icon = Material("attachments/thompson_fg.png")
att.DescColors = {ACT3.BulletColors.Positive, ACT3.BulletColors.Positive, ACT3.BulletColors.Positive}

att.BodygroupMods = {"thompson_fg"}

att.AttachFunc = function(wep)
    wep.Sway = wep.Sway * 0.9
    wep.RecoilAngles = wep.RecoilAngles * 0.9
    wep.Recoil = wep.Recoil * 0.9
    wep.HoldtypeSights = "smg"
end

att.DetachFunc = function(wep)
    local orig = weapons.Get(wep:GetClass())
    wep.Sway = wep.Sway / 0.9
    wep.Recoil = wep.Recoil / 0.9
    wep.RecoilAngles = wep.RecoilAngles / 0.9
   wep.HoldtypeSights = orig.HoldtypeSights
end

ACT3_LoadAttachment(att)