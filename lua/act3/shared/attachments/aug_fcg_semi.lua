local att = {}

att.PrintName = "AUG Semi FCG"
att.Name = "aug_fcg_semi"
att.Slot = "aug_fcg"
att.Description = {"AUG semi auto only fire group."}
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