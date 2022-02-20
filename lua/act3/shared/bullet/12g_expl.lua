local bullet = table.Copy(ACT3.BulletBase)

bullet.Name = "12g_expl" -- the bullet's code name
bullet.PrintName = "12 Gauge EXPL" -- the displayed bullet name
bullet.Type = "EXPL"

bullet.Description = {"Explosive slug.", "Creates small explosion on impact."}

bullet.Calibre = "12g" -- determines what types of magazines this bullet can fit in

bullet.CaseEffect = "act3_case_12g_expl" -- the visual shell ejection effect of the bullet

bullet.BaseDamage = 0
bullet.HalfwayDist = 8200

bullet.Num = 1

bullet.AccuracyMult = 0.25

bullet.MuzzleVelocityMult = 1.5
bullet.AirDrag = 1.5
bullet.WaterDrag = 3

bullet.TracerBody = Material("particle/fire")
bullet.TracerTail = Material("effects/laser_tracer")
bullet.TracerHeadSize = 24
bullet.TracerLength = 128
bullet.TracerWidth = 12
bullet.TracerColor = Color(255, 242, 206)
bullet.Glow = true
bullet.TracerTPoint1 = 0.25
bullet.TracerTPoint2 = 1

bullet.Decal = "SmallScorch"

bullet.Pen_RHAe = 0

bullet.AlwaysPhysicalBullet = true

bullet.PitchMod = 1 -- multiplies the pitch of the gun
bullet.VolMod = 1 -- multiplies the vol of the gun (sound distance)

bullet.DamageType = DMG_BUCKSHOT -- damage type of bullet

bullet.MaxRicChance = 0

bullet.OnImpact = function(att, tr, dmg)
    local effectdata = EffectData()
        effectdata:SetOrigin( tr.HitPos )

    util.Effect( "act3_slugexplosion", effectdata)

    local attacker = att

    sound.Play("weapons/hegrenade/explode5.wav", tr.HitPos, 110, 125)
    util.BlastDamage(dmg:GetInflictor(), attacker, tr.HitPos, 64, 40)
end

bullet.ChemicalEffect = true

ACT3_LoadBullet(bullet)