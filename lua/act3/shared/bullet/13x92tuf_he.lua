local bullet = table.Copy(ACT3.BulletBase)

bullet.Name = "13x92tuf_he" -- the bullet's code name
bullet.PrintName = "13.2x92mm TuF HE" -- the displayed bullet name
bullet.Type = "HE"

bullet.Description = ACT3.Descriptions.HE -- {"line1", "line2"...}

bullet.Calibre = "13x92tuf" -- determines what types of magazines this bullet can fit in

bullet.CaseEffect = "act3_case_13x92tuf" -- the visual shell ejection effect of the bullet

bullet.BaseDamage = 50
bullet.HalfwayDist = 100000

bullet.Num = 1 -- how many bullets are fired

bullet.DamageMult_Materiel = 1.0 -- default: 0.75
-- damage multiplier for materiel targets, i.e. props, vehicles, robots, machines
bullet.DamageMult_AP = 1.0 -- damage multiplier to help defeat armoured targets

bullet.AirDrag = 3
bullet.WaterDrag = 4

bullet.Pen_RHAe = 0

bullet.TracerBody = Material("particle/fire")
bullet.TracerTail = Material("effects/laser_tracer")
bullet.TracerHeadSize = 24
bullet.TracerLength = 128
bullet.TracerWidth = 16
bullet.TracerColor = Color(255, 242, 206)
bullet.Glow = true
bullet.TracerTPoint1 = 0.25
bullet.TracerTPoint2 = 1

bullet.Decal = "SmallScorch"

bullet.AlwaysPhysicalBullet = true

bullet.MaxRicChance = 0

bullet.OnImpact = function(att, tr, dmg)
    local effectdata = EffectData()
        effectdata:SetOrigin( tr.HitPos )

    util.Effect( "act3_slugexplosion", effectdata)

    local attacker = att

    sound.Play("weapons/hegrenade/explode5.wav", tr.HitPos, 110, 125)
    util.BlastDamage(dmg:GetInflictor(), attacker, tr.HitPos, 64, 40)
end

ACT3_LoadBullet(bullet)