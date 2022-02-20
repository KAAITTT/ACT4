function SWEP:PrimeAttack()
    if self.State == ACT3_STATE_PRIMED then return end

    self.State = ACT3_STATE_PRIMED
    self:SetShouldHoldType()

    self.OnPrimeTime = CurTime()

    self:SetNextSecondaryFire(CurTime() + 0.25)

    if self:RealClip1() <= 0 then return end

    self:OnPrimeAttack()

    self:EmitSound(self.SoundPrime)
end

function SWEP:OnPrimeAttack()
    -- your code goes here
end

function SWEP:MeleeAttack()
    if self.State == ACT3_STATE_SWING then return end
    self:EmitSound( self.SoundMelee )
    self:SetShouldHoldType()

    if self:InSights() then
        self.Owner:DoAnimationEvent( self.AnimMeleeAttackAimed or self.AnimMeleeAttack )
    else
        self.Owner:DoAnimationEvent( self.AnimMeleeAttack )
    end

    if SERVER then
        self.State = ACT3_STATE_SWING
    end

    self.SwingTime = CurTime()

    self:SetNextPrimaryFire( CurTime() + self.MeleeAttackTime )
end

function SWEP:MeleeHit( mtr )

    local backstab = false
    local hitplayer = false
    local critlevel = ACT3_HIT_NORMAL

    if mtr.Entity:IsPlayer() or mtr.Entity:IsNPC() then
        hitplayer = true

        if self.MeleeBackstab then
            local ang1 = Angle(0, mtr.Entity:EyeAngles().y, 0):Forward()
            local ang2 = Angle(0, self.Owner:EyeAngles().y, 0):Forward()

            local dot = ang1:Dot(ang2)

            if dot > 0.5 then
                backstab = true
                critlevel = ACT3_HIT_CRIT
            end
        end
    end

    local d = DamageInfo()

    if backstab then
        d:SetDamage( self.MeleeBackstabDamage )
    else
        d:SetDamage( self.MeleeDamage )
    end

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

    if backstab then
        sound.Play( self.SoundMeleeHitBackstab, mtr.HitPos )
    elseif hitplayer then
        sound.Play( self.SoundMeleeHitFlesh, mtr.HitPos )
    else
        sound.Play( self.SoundMeleeHit, mtr.HitPos )
    end

    self:OnMeleeHit( mtr )
end

function SWEP:OnMeleeHit( mtr )
    -- your code goes here
end

function SWEP:ProcessMeleeAttack()
    if CLIENT then return end
    local pos, ang = self:GetHandPos()
    local filters = self.Owner
    local mtr = util.TraceHull({
        start = pos,
        endpos = pos + (ang:Up() * self.MeleeTraceOffset.y) + (ang:Forward() * self.MeleeTraceOffset.x) + (ang:Right() * self.MeleeTraceOffset.z),
        maxs = Vector(4, 4, 4),
        mins = Vector(-4, -4, -4),
        filter = filters,
        mask = MASK_SHOT
    })

    if mtr.Hit then
        self:MeleeHit(mtr)
        self.State = ACT3_STATE_INHIPFIRE
        self:SetShouldHoldType()
    end

    if self.SwingTime + self.MeleeAttackTime <= CurTime() then
        self.State = ACT3_STATE_INHIPFIRE
        self:SetShouldHoldType()
    end
end