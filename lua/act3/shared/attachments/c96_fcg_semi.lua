local att = {}

att.PrintName = "C96 Semi-Auto FCG"
att.Name = "c96_fcg_semi"
att.Slot = "c96_fcg"
att.Description = {"C96 pistol semi auto only fire group."}
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