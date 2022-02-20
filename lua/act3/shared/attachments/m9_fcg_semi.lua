local att = {}

att.PrintName = "M9 Semi-Auto FCG"
att.Name = "m9_fcg_semi"
att.Slot = "m9_fcg"
att.Description = {"M9 semi-automatic fire group."}
att.Icon = Material("attachments/semi.png")

att.AttachFunc = function(wep)
    wep.Firemodes = {
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