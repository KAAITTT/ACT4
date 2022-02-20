function SWEP:UBGL_TakeAmmo()
   if game.SinglePlayer() then self:CallOnClient( "UBGL_TakeAmmo" ) end

   self.UBGL_Rounds = self.UBGL_Rounds - 1
end

function SWEP:UBGL_FiringRecoil()
   if game.SinglePlayer() then self:CallOnClient( "UBGL_FiringRecoil" ) end

   local recoilangles = 0

   local rec = self.UBGL_Recoil / 2
   local ycomp = math.cos(math.rad(recoilangles)) * rec
   local xcomp = math.sin(math.rad(recoilangles)) * rec

   local rxc = math.Rand(-xcomp, xcomp)

   if !(IsFirstTimePredicted() or game.SinglePlayer()) then return end

   if CLIENT or game.SinglePlayer() then
      self.RemainingRecoil = self:GetRecoilAmount()
      self.RecoilDir = math.Rand(-recoilangles, recoilangles) + 90

      local xcomp_roll = math.sin(math.rad(self.RecoilDir)) * math.Rand(-self.RollBlowbackAmount, self.RollBlowbackAmount)

      self.Blowback = math.Clamp(self.Blowback + self.UBGL_BlowbackAmount, 0, self.BlowbackMax)
      self.RollBlowback = math.Clamp(self.RollBlowback + xcomp_roll, -self.RollBlowbackMax, self.RollBlowbackMax)
   end

   if self.State == ACT3_STATE_INHIPFIRE then
      rxc = -rxc
   end

   self.Owner:ViewPunch( Angle(ycomp, rxc, 0) )
end

function SWEP:UBGL_Shoot()
   self.TriggerDown = true

   if self.UBGL_Automatic then
      self.TriggerDown = false
   end

   if self.UBGL_Is_Melee then
      self:SetNextPrimaryFire( CurTime() + self.UBGL_FireDelay )
      self:MeleeAttack()
      return
   end

   if self.UBGL_Rounds <= 0 then
      return
   end

   local bulletid = ACT3_GetBulletID(self.UBGL_Bullet)
   self:ShootRound(bulletid, true)

   self:EmitSound(self.UBGL_SoundShoot, 100, 100, 1, CHAN_WEAPON)
   self.Owner:DoAnimationEvent( self.UBGL_AnimShoot )

   self:UBGL_TakeAmmo()
   self:UBGL_FiringRecoil()

   self:SetNextPrimaryFire( CurTime() + self.UBGL_FireDelay )
end

function SWEP:UBGL_FinishReload()
   self.State = ACT3_STATE_IDLE
   if self.Owner:KeyDown(IN_ATTACK2) then
      self:EnterSights()
   elseif self.Owner:KeyDown(IN_ATTACK) then
      self:EnterHipfire()
   end

   self:SetShouldHoldType()

   local bulletid = ACT3_GetBulletID(self.UBGL_Bullet)
   local ubglammo = self.Owner:ACT3_GetBullets(bulletid)
   if self.UBGL_Rounds >= self.UBGL_MagazineSize then return end
   if ubglammo <= 0 then return end

   self.UBGL_Rounds = math.Clamp(self.UBGL_MagazineSize, 0, ubglammo)

   self.Owner:ACT3_TakeBullets(bulletid, self.UBGL_MagazineSize)

   self:SetNextPrimaryFire(CurTime() + self.PostReloadDelay)
end

function SWEP:UBGL_GetReloadTime()
    if self.ReloadTimeTable[self.UBGL_AnimReload] then
        return self.ReloadTimeTable[self.UBGL_AnimReload]
    end
end


function SWEP:UBGL_Reload()
   local bulletid = ACT3_GetBulletID(self.UBGL_Bullet)
   local ubglammo = self.Owner:ACT3_GetBullets(bulletid)
   if !self.UBGL_Enabled then return false end
   if self.UBGL_Is_Melee then return false end
   if self.UBGL_Rounds >= self.UBGL_MagazineSize then return false end
   if ubglammo <= 0 then return false end

   self.State = ACT3_STATE_RELOAD
   self:ExitSights()

   self.Owner:DoAnimationEvent(self.UBGL_AnimReload)

   self:PlaySoundTable(self.UBGL_ReloadSoundsTable)

   self.LastReloadTime = CurTime()

   self:SetTimer(self:UBGL_GetReloadTime(), function() self:UBGL_FinishReload() end)

   return true
end