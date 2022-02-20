local att = {}

att.PrintName = "M249S Semi-Auto FCG"
att.Name = "m249_fcg_249s"
att.Slot = "m249_fcg"
att.Description = {"Semi-auto-only M249 fire group."}
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