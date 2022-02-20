local att = {}

att.PrintName = "M249 STANAG Magwell"
att.Name = "m249_stanag"
att.Slot = "m249_conversion"
att.Description = {"Load the weapon using its STANAG magwell.", "Weapon takes STANAG magazines."}
att.Icon = Material("attachments/m249_stanag.png")

att.Free = true

att.AttachFunc = function(wep)
    wep:Unload()
    wep.DefaultMagazine = {Type = "stanag_30", Rounds = {}}
    wep:RecalculateDefaultRounds()
    wep.MagazineType = "stanag"
    wep.MagazineOffsetPos = Vector(-1.808, -1.17, 7.954)
    wep.MagazineOffsetAng = Angle(0, 0, 66.69)
    wep.ReloadSoundsTable = {
    {
        time = 0.1,
        path = "weapons/m4a1/m4a1_clipout.wav",
        comp = ACT3_STPART_MAGEJECT
    },
    {
        time = 1.0,
        path = "weapons/famas/famas_clipin.wav",
        comp = ACT3_STPART_MAGLOAD
    },
    {
        time = 1.45,
        path = "weapons/famas/famas_forearm.wav",
        comp = ACT3_STPART_EMPTYRACK
    },
}
end

att.DetachFunc = function(wep)
    local orig = weapons.Get(wep:GetClass())
    wep:Unload()
    wep.DefaultMagazine = {Type = "m249_150", Rounds = {}}
    wep:RecalculateDefaultRounds()
    wep.MagazineType = orig.MagazineType
    wep.MagazineOffsetPos = orig.MagazineOffsetPos
    wep.MagazineOffsetAng = orig.MagazineOffsetAng
    wep.ReloadSoundsTable = orig.ReloadSoundsTable
end

ACT3_LoadAttachment(att)