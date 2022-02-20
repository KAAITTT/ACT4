local att = {}

att.PrintName = "AR Integral Magazine (30)"
att.Name = "ar_tardomag"
att.Slot = "ar_conversion"
att.Description = {"AR-15 integral magazine.", "- Takes forever to reload", "- Small", "+ California Compliant"}
att.DescColors = {ACT3.BulletColors.Neutral, ACT3.BulletColors.Negative, ACT3.BulletColors.Negative, ACT3.BulletColors.Positive}
att.Icon = Material("attachments/ar_tardomag.png")

att.AttachFunc = function(wep)
    wep:Unload()
    wep.Magazine = {
        Type = "ar_tardo_30",
        Rounds = {}
    }
    wep.ShotgunReload = true
    wep.InternalMag = true
    wep.ReloadSoundsTable = {
        {
            time = 0.1,
            path = "act3/weapons/k98/k98_clipin2.wav",
        },
        {
            time = 0.45,
            path = "weapons/m4a1/m4a1_boltpull.wav",
            comp = ACT3_STPART_EMPTYRACK
        },
    }
    wep:RecalculateDefaultRounds()
end

att.DetachFunc = function(wep)
    local orig = weapons.Get(wep:GetClass())

    wep:Unload()
    wep.Magazine = nil
    wep.ShotgunReload = false
    wep.InternalMag = false
    wep.ReloadSoundsTable = orig.ReloadSoundsTable
    wep:RecalculateDefaultRounds()
end

ACT3_LoadAttachment(att)