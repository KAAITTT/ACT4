local att = {}

att.PrintName = "G17 Auto Sear"
att.Name = "g17_fcg_auto"
att.Slot = "g17_fcg"
att.Description = {"Glock 17 full-auto mod."}
att.Icon = Material("attachments/auto.png")

att.AttachFunc = function(wep)
    wep.Firemodes = {
        {
            Automatic = true,
        },
    }
    wep:ChangeFiremodeTo(1)
end

att.DetachFunc = function(wep)
    local orig = weapons.Get(wep:GetClass())
    wep.Firemodes = orig.Firemodes
end

ACT3_LoadAttachment(att)