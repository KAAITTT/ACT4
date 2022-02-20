local att = {}

att.PrintName = "M1-22 Auto FCG"
att.Name = "m122_fcg_auto"
att.Slot = "m122_fcg"
att.Description = {"Automatic/Semi-Auto fire group.", "Based on the M2 Carbine."}
att.Icon = Material("attachments/auto.png")

att.AttachFunc = function(wep)
    wep.Firemodes = {
        {
            Automatic = true,
        },
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