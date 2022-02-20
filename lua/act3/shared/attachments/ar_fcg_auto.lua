local att = {}

att.PrintName = "AR Full/Semi FCG"
att.Name = "ar_fcg_auto"
att.Slot = "ar_fcg"
att.Description = {"M4A1 full auto/semi auto fire group."}
att.Icon = Material("attachments/auto.png")

att.AttachFunc = function(wep)
    wep.Firemodes = {
        {
            Automatic = true,
        },
        {
            Automatic = false,
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