function SWEP:QuickMeleeAttack()

    self:EmitSound( self.SoundMelee )
    self:SetShouldHoldType()
    self.Owner:DoAnimationEvent( self.AnimMeleeAttack )

    if SERVER then
        self.State = ACT3_STATE_SWING
    end

    self.SwingTime = CurTime()

    self:SetNextPrimaryFire( CurTime() + self.MeleeAttackTime )
end

function SWEP:QuickMeleeHit( mtr )

    local backstab = false
    local hitplayer = false
    local critlevel = ACT3_HIT_NORMAL

    if mtr.Entity:IsPlayer() or mtr.Entity:IsNPC() then
        hitplayer = true

    end

    local d = DamageInfo()

        d:SetDamage( self.MeleeDamage )

    d:SetDamageType( self.MeleeDamagetype )
    d:SetAttacker( self.Owner )
    d:SetInflictor( self )
    d:SetReportedPosition( mtr.HitPos )
    d:SetDamagePosition( mtr.HitPos )

    local phys = mtr.Entity:GetPhysicsObject()

    if IsValid(phys) then
        phys:ApplyForceCenter( self.Owner:EyeAngles():Forward() * self.MeleeForce )
    end

    if mtr.Entity:Health() > 0 and SERVER then
        ACT3_SendHitmarker(self.Owner, critlevel, mtr.HitPos)
    end

    mtr.Entity:TakeDamageInfo( d )

    if hitplayer then
        sound.Play( self.SoundMeleeHitFlesh, mtr.HitPos )
    else
        sound.Play( self.SoundMeleeHit, mtr.HitPos )
    end

    self:QuickOnMeleeHit( mtr )
end

function SWEP:QuickOnMeleeHit( mtr )
    -- your code goes here
end

function SWEP:ProcessQuickMeleeAttack()
    if CLIENT then return end
    local pos, ang = self:GetHandPos()
    local filters = self.Owner
    local mtr = util.TraceHull({
        start = pos + (ang:Up() * self.MeleeStartTraceOffset.y) + (ang:Forward() * self.MeleeStartTraceOffset.x) + (ang:Right() * self.MeleeStartTraceOffset.z),
        endpos = pos + (ang:Up() * self.MeleeTraceOffset.y) + (ang:Forward() * self.MeleeTraceOffset.x) + (ang:Right() * self.MeleeTraceOffset.z),
        maxs = Vector(4, 4, 4),
        mins = Vector(-4, -4, -4),
        filter = filters,
        mask = MASK_SHOT
    })

    if mtr.Hit then
        self:QuickMeleeHit(mtr)
        self.State = ACT3_STATE_INHIPFIRE
        self:SetShouldHoldType()
    end

    if self.SwingTime + self.MeleeAttackTime <= CurTime() then
        self.State = ACT3_STATE_INHIPFIRE
        self:SetShouldHoldType()
    end
end