local att = {}

att.PrintName = "MP5 4-Position FCG"
att.Name = "mp5_fcg_navy"
att.Slot = "mp5_fcg"
att.Description = {"MP5N 4-position fire selector.", "Comes with 3-round burst, full auto and semi-auto."}
att.Icon = Material("attachments/3rb.png")

att.AttachFunc = function(wep)
    wep.Firemodes = {
        {
            Automatic = true,
        },
        {
            Automatic = true,
            BurstLength = 3
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