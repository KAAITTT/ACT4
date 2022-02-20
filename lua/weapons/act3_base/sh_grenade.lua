function SWEP:ThrowGrenade()
    self:SetNextPrimaryFire( CurTime() + self.ShootingDelay )

    self.State = ACT3_STATE_INHIPFIRE

    self:SetShouldHoldType()

    if self:RealClip1() <= 0 then return end

    self.Owner:ACT3_TakeInternalWeapon(self:GetClass())

    self.Owner:DoAnimationEvent( self.AnimThrow )

    if CLIENT then return end

    local dir = self.Owner:EyeAngles()
    local acc = self.Precision

    acc = acc * GetConVar("act3_mult_precision"):GetFloat()

    local delta = CurTime() - self.OnPrimeTime
    delta = delta / self.ProjectileChargeTime
    if delta > 1 then
        delta = 1
    elseif delta <= 0 then
        delta = 0
    end

    local force = Lerp(delta, self.ProjectileForce, self.ProjectileForceMax)

    self:PreThrowGrenade()

    for i = 1, self.ProjectileNum do
        dir = dir + (acc * Angle(math.Rand(-36, 36), math.Rand(-36, 36), math.Rand(-36, 36)))

        if SERVER then
            local proj = ents.Create( self.Projectile )
            if ( !IsValid( proj ) ) then print("!!!FAILED TO CREATE PROJECTILE") return end
            proj:SetPos( self:GetGrenadeSrcPos() )
            proj:SetAngles( self.Owner:EyeAngles() + self.ProjectileAngles )
            proj:SetOwner( self.Owner )
            proj.Weapon = self
            proj.DataForProjectiles = table.Copy(self.DataForProjectiles)
            proj:Spawn()
            local phys = proj:GetPhysicsObject()
            phys:ApplyForceCenter(dir:Forward() * force)

            if self.ProjectileTumble then
                phys:AddAngleVelocity( Vector(0, 750, 0) )
            end
        end
    end

    self:EmitSound(self.SoundThrow, 75, 100, 1, CHAN_WEAPON)
end

function SWEP:PreThrowGrenade()
end