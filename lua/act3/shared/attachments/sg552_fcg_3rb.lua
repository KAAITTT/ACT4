local att = {}

att.PrintName = "SG552 Full/Burst/Semi FCG"
att.Name = "sg552_fcg_3rb"
att.Slot = "sg552_fcg"
att.Description = {"SG552 full auto/burst/semi auto fire group."}
att.Icon = Material("attachments/3rb.png")

att.AttachFunc = function(wep)
    wep.Firemodes = {
        {
            Automatic = true,
        },
        {
            Automatic = true,
            BurstLength = 3
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