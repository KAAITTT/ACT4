local att = {}

att.PrintName = "G3 3-Position FCG"
att.Name = "g3_fcg_auto"
att.Slot = "g3_fcg"
att.Description = {"G3 full auto/semi auto fire group."}
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