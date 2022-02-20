local att = {}

att.PrintName = "AR Binary FCG"
att.Name = "ar_fcg_bina"
att.Slot = "ar_fcg"
att.Description = {"AR-15 aftermarket binary trigger fire group."}
att.Icon = Material("attachments/bina.png")

att.AttachFunc = function(wep)
    wep.Firemodes = {
        {
            Automatic = true,
            BurstLength = 2,
            CustomFiremode = "BINA",
            RunAway = true,
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