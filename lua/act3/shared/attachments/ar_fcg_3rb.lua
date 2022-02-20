local att = {}

att.PrintName = "AR Burst/Semi FCG"
att.Name = "ar_fcg_3rb"
att.Slot = "ar_fcg"
att.Description = {"M16A2 3-burst/semi auto fire group."}
att.Icon = Material("attachments/3rb.png")

att.AttachFunc = function(wep)
    wep.Firemodes = {
        {
            Automatic = true,
            BurstLength = 3,
        },
        {
            Automatic = false,
            Safe = false
        },
        {
            Automatic = false,
            Safe = true
        }
    }
    wep:ChangeFiremodeTo(1)
end

att.DetachFunc = function(wep)
    local orig = weapons.Get(wep:GetClass())
    wep.Firemodes = orig.Firemodes
end

ACT3_LoadAttachment(att)