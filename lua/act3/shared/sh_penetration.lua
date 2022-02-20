ACT3.MatPenMultTable = {
   [MAT_ANTLION] = 0.3,
   [MAT_BLOODYFLESH] = 1,
   [MAT_CONCRETE] = 0.45,
   [MAT_DIRT] = 0.2,
   [MAT_EGGSHELL] = 0.1,
   [MAT_FLESH] = 0.2,
   [MAT_GRATE] = 0.25,
   [MAT_ALIENFLESH] = 1,
   [MAT_CLIP] = 1000,
   [MAT_SNOW] = 0.2,
   [MAT_PLASTIC] = 0.1,
   [MAT_METAL] = 1,
   [MAT_SAND] = 0.2,
   [MAT_FOLIAGE] = 0.25,
   [MAT_COMPUTER] = 0.25,
   [MAT_SLOSH] = 0.25,
   [MAT_TILE] = 1,
   [MAT_GRASS] = 0.2,
   [MAT_VENT] = 0.5,
   [MAT_WOOD] = 0.25,
   [MAT_DEFAULT] = 0.2,
   [MAT_GLASS] = 0.2,
   [MAT_WARPSHIELD] = 1
}

ACT3.RicochetSounds = {
   "weapons/fx/rics/ric1.wav",
   "weapons/fx/rics/ric2.wav",
   "weapons/fx/rics/ric3.wav",
   "weapons/fx/rics/ric4.wav",
   "weapons/fx/rics/ric5.wav"
}

-- one millimeter of this material counts as X millimeters of RHA pen

ACT3.PenProbeLength = 2

function ACT3_GetBulletPen(bulletid, dist)
   if !bulletid then return nil end
   local bullet = ACT3_GetBullet(bulletid)

   if bullet.Pen_RHAe then return GetConVar("act3_penetration_mult"):GetFloat() * bullet.Pen_RHAe / ((dist / bullet.HalfwayDist or 25000) + 1) end

   local pen_RHAe = bullet.BaseDamage

   pen_RHAe = pen_RHAe / 9
   pen_RHAe = pen_RHAe * bullet.DamageMult_AP
   pen_RHAe = pen_RHAe * bullet.DamageMult_Materiel

   pen_RHAe = pen_RHAe / ((dist / bullet.HalfwayDist or 25000) + 1)

   pen_RHAe = GetConVar("act3_penetration_mult"):GetFloat() * pen_RHAe

   return pen_RHAe
end

function ACT3_GetRicochetChance(bulletid, tr)
   if !GetConVar("act3_ricochet"):GetBool() then return 0 end
   local bullet = ACT3_GetBullet(bulletid)
   local degree = tr.HitNormal:Dot((tr.StartPos - tr.HitPos):GetNormalized())

   local ricmult = ACT3.MatPenMultTable[tr.MatType] or 1

   -- 0 at 1
   -- 100 at 0

   return math.Clamp(Lerp(degree, (bullet.MaxRicChance or 45) * ricmult, 0), 0, 100)
end

function ACT3_DoPenetration(att, tr, dist, owner, inflictor, bulletid, vel, penleft, ss, dmgmult)
   if !GetConVar("act3_penetration"):GetBool() then return end
   penleft = penleft or ACT3_GetBulletPen(bulletid, dist) or 0

   if tr.HitSky then return end

   if vel <= 0 then return end

   -- NEVER penetrate or richochet from hits to NPCs or players
   if (tr.Entity:IsNPC() or tr.Entity:IsPlayer()) then return end

   -- detect ricochet

   if ACT3_GetRicochetChance(bulletid, tr) > math.random(0, 100) then
      local degree = tr.HitNormal:Dot((tr.StartPos - tr.HitPos):GetNormalized())
      if degree == 0 or degree == 1 then return end
      sound.Play(ACT3.RicochetSounds[math.random(#ACT3.RicochetSounds)], tr.HitPos)
      if (tr.Normal:Length() == 0) then return end
      ACT3_ShootPBullet(tr.HitPos, ((2 * degree * tr.HitNormal) + tr.Normal) * (vel * math.Rand(0.25, 0.75)), owner, inflictor, bulletid, ss, 1, dmgmult, penleft, dist)
      return
   end

   local penmult = ACT3.MatPenMultTable[tr.MatType] or 1
   local pentracelen = ACT3.PenProbeLength

   if tr.Entity.mmRHAe then
      penmult = tr.Entity.mmRHAe
   end

   if !tr.HitWorld then
      penmult = penmult * 1.5
   end

   penmult = penmult * math.random(0.9, 1.1) * math.random(0.9, 1.1)

   local dir = (tr.HitPos - tr.StartPos):GetNormalized()
   local endpos = tr.HitPos

   local ptr = util.TraceLine({
      start = endpos,
      endpos = endpos + (dir * pentracelen),
      mask = MASK_SHOT
   })

   while penleft > 0 and (!ptr.StartSolid or ptr.AllSolid) and ptr.Fraction < 1 do
      penleft = penleft - (pentracelen * penmult)

      ptr = util.TraceLine({
         start = endpos,
         endpos = endpos + (dir * pentracelen),
         mask = MASK_SHOT
      })

      debugoverlay.Line(endpos, endpos + (dir * pentracelen), 5, Color(255,255,255), true)

      endpos = endpos + (dir * pentracelen)

      dir = dir + (VectorRand() * 0.025 * penmult)
   end

   if penleft > 0 then
      --print("bullet penetrated with " .. penleft .. "mm pen left")
      --print(vel)
      if (dir:Length() == 0) then return end
      ACT3_ShootPBullet(endpos, dir:GetNormalized() * vel, owner, inflictor, bulletid, ss, 1, dmgmult, penleft, dist)

      owner:FireBullets({
         Damage = 0,
         Src = endpos,
         Dir = -dir,
         Distance = 8,
         Tracer = 0,
         Force = 0
      }, true)
   --else
      --print("bullet stopped")
   end
end