local att = {}

att.PrintName = "PS90 Semi FCG"
att.Name = "p90_fcg_semi"
att.Slot = "p90_fcg"
att.Description = {"PS90 civilian semi auto fire group."}
att.Icon = Material("attachments/semi.png")

att.AttachFunc = function(wep)
    wep.Firemodes = {
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