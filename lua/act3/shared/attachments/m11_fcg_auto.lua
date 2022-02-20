local att = {}

att.PrintName = "M11 Auto FCG"
att.Name = "m11_fcg_auto"
att.Slot = "m11_fcg"
att.Description = {"Automatic fire group."}
att.Icon = Material("attachments/auto.png")

att.AttachFunc = function(wep)
    wep.Firemodes = {
        {
            Automatic = true,
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