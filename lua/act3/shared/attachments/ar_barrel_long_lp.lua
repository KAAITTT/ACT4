local att = {}

att.PrintName = "AR Factory Barrel (LP)"
att.Name = "ar_barrel_long_lp"
att.Slot = "ar_barrel"
att.Description = {"Standard AR Barrel.", "Has low profile gas block."}
att.Icon = Material("attachments/ar_barrel_long_lp.png")

att.GivesSlots = {
    ["muzzle"] = {
        Type = "rifle_muzzle",
        PrintName = "Muzzle",
        Installed = nil,
        Required = false,
        Scale = 1,
        Pos = Vector(22.423, 0, 7.706),
        Ang = Angle(0, 0, 0)
    }
}

att.BodygroupMods = {"ar_barrel_long_lp"}

att.AttachFunc = function(wep)
    wep.MuzzleOffset = Vector(33.784, 0.669, -7.856)
    wep.TrueIronsPos = Vector(-0.009, 15.887, -11.528)
    wep.TrueIronsAng = Vector(1.506, -0.076, -0.63)
end

att.DetachFunc = function(wep)
    local orig = weapons.Get(wep:GetClass())
    wep.MuzzleOffset = orig.MuzzleOffset
    wep.TrueIronsPos = orig.TrueIronsPos
    wep.TrueIronsAng = orig.TrueIronsAng
end

ACT3_LoadAttachment(att)