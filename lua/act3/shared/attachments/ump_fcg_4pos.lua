local att = {}

att.PrintName = "UMP 4-Position FCG"
att.Name = "ump_fcg_4pos"
att.Slot = "ump_fcg"
att.Description = {"4-position fire group.", "Has full auto, 2-burst, semi, and safe."}
att.Icon = Material("attachments/auto.png")

att.AttachFunc = function(wep)
    wep.Firemodes = {
        {
            Automatic = true,
        },
        {
            Automatic = true,
            BurstLength = 2
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