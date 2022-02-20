local att = {}

att.PrintName = "G17 Semi-Auto FCG"
att.Name = "g17_fcg_semi"
att.Slot = "g17_fcg"
att.Description = {"Glock 17 semi-automatic fire group."}
att.Icon = Material("attachments/semi.png")

att.AttachFunc = function(wep)
    wep.Firemodes = {
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