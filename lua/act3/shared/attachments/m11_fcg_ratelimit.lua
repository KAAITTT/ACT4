local att = {}

att.PrintName = "M11 Heavy FCG"
att.Name = "m11_fcg_ratelimit"
att.Slot = "m11_fcg"
att.Description = {"Automatic fire group with rate limiter.", "-50% Fire Rate"}
att.Icon = Material("attachments/auto.png")

att.AttachFunc = function(wep)
    wep.Firemodes = {
        {
            Automatic = true,
        },
        {
            Automatic = false,
            Safe = true
        }
    }
    wep:ChangeFiremodeTo(1)
    wep.ShootingDelay = wep.ShootingDelay * 1.5
end

att.DetachFunc = function(wep)
    local orig = weapons.Get(wep:GetClass())
    wep.Firemodes = orig.Firemodes
    wep.ShootingDelay = wep.ShootingDelay / 1.5
end

ACT3_LoadAttachment(att)