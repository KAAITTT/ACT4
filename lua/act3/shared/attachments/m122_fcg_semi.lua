local att = {}

att.PrintName = "M1-22 Semi-Auto FCG"
att.Name = "m122_fcg_semi"
att.Slot = "m122_fcg"
att.Description = {"Semi-Auto fire group."}
att.Icon = Material("attachments/semi.png")

att.AttachFunc = function(wep)
    wep.Firemodes = {
        {
            Automatic = false
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