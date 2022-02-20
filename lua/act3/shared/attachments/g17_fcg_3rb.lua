local att = {}

att.PrintName = "G17 3-Burst/Semi FCG"
att.Name = "g17_fcg_3rb"
att.Slot = "g17_fcg"
att.Description = {"Glock 17 burst-fire/semi automatic FCG.", "Who the hell came up with this thing?"}
att.Icon = Material("attachments/3rb.png")

att.AttachFunc = function(wep)
    wep.Firemodes = {
        {
            Automatic = true,
            BurstLength = 3,
        },
        {
            Automatic = false,
        },
    }
    wep:ChangeFiremodeTo(1)
end

att.DetachFunc = function(wep)
    local orig = weapons.Get(wep:GetClass())
    wep.Firemodes = orig.Firemodes
end

ACT3_LoadAttachment(att)