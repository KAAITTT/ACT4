local att = {}

att.PrintName = "M93R Semi/Burst FCG"
att.Name = "m9_fcg_93r"
att.Slot = "m9_fcg"
att.Description = {"M93R burst/semi fire group."}
att.Icon = Material("attachments/3rb.png")

att.AttachFunc = function(wep)
    wep.Firemodes = {
        {
            Automatic = true,
            BurstLength = 3
        },
        {
            Automatic = false,
        },
        {
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