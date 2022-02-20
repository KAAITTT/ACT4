local att = {}

att.PrintName = "AR Lightning Link"
att.Name = "ar_fcg_lightning"
att.Slot = "ar_fcg"
att.Description = {"Whoa there, kid!", "Illegal AR-15 automatic fire conversion.", "Functions like internal bumpfire device."}
att.Icon = Material("attachments/lightninglink.png")

att.AttachFunc = function(wep)
    wep.Firemodes = {
        {
            Automatic = true,
            CustomFiremode = "BUMP",
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