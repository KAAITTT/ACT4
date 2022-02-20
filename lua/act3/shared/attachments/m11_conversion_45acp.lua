local att = {}

att.PrintName = ".45 ACP Conversion"
att.Name = "m11_conversion_45acp"
att.Slot = "m11_conversion"
att.Description = {"Converts weapon to a .45 ACP configuration.", "Accepts M10 magazines."}
att.Icon = Material("attachments/m11_conversion_45acp.png")
att.MaterialMod = "models/weapons/act3/m11/w_smg_mac10_45"

att.AttachFunc = function(wep)
    wep:Unload()
    wep.Magazine = nil
    wep.DefaultMagazine = {Type = "m10_15", Rounds = {}}
    wep.DefaultLoad = "45acp_fmj"
    wep:RecalculateDefaultRounds()
    wep.MagazineType = "m10"
    wep.Calibre = "45acp"
    wep.PrintCalibre = ".45 ACP"
    wep.SoundShootVol = wep.SoundShootVol * 1.1
    wep.SoundShootPitch = wep.SoundShootPitch * 0.9
    wep.Recoil = wep.Recoil * 1.5
    wep.MuzzleVelocity = wep.MuzzleVelocity * 0.75
end

att.DetachFunc = function(wep)
    local orig = weapons.Get(wep:GetClass())
    wep:Unload()
    wep.Magazine = orig.Magazine
    wep.DefaultMagazine = orig.DefaultMagazine
    wep.DefaultLoad = orig.DefaultLoad
    wep:RecalculateDefaultRounds()
    wep.MagazineType = orig.MagazineType
    wep.Calibre = orig.Calibre
    wep.PrintCalibre = orig.PrintCalibre
    wep.SoundShootVol = wep.SoundShootVol / 1.1
    wep.SoundShootPitch = wep.SoundShootPitch / 0.9
    wep.Recoil = wep.Recoil / 1.5
    wep.MuzzleVelocity = wep.MuzzleVelocity / 0.75
end

ACT3_LoadAttachment(att)