function SWEP:RealClip1()
    if self.UBGL_Enabled then
        return self.UBGL_Rounds
    end

    if self.InternalWeapon then
        if self.Owner:IsNPC() then
            return 1
        else
            return self.Owner:ACT3_GetInternalWeaponAmount(self:GetClass())
        end
    else
        local clip = 0

        if self.Magazine then
            clip = #self.Magazine.Rounds
        end

        if self.ChamberedRound then
            clip = clip + 1
        end

        if self.Owner:IsNPC() then
            clip = self:Clip1()
        end

        return clip
    end
end

function SWEP:GetAmmoDisplay()
    return nil
end

function SWEP:GetRealMaxRealClip1()
    if self.UBGL_Enabled then
        return self.UBGL_MagazineSize
    end

    if self.Magazine then
        local magtype = ACT3_GetMagazineType(self.Magazine.Type)
        return magtype.MagSize
    else
        return 0
    end
end

function SWEP:Ammo1()
    if self.InternalWeapon then
        return self.Owner:ACT3_GetInternalWeaponAmount(self:GetClass())
    end

    if self.InternalMag then
        if GetConVar("act3_infinite_loose"):GetBool() then
            return "---"
        else
            local magtype = ACT3_GetMagazineType(self.Magazine.Type)
            return self.Owner:ACT3_GetBulletCountForCalibre(magtype.Calibre)
        end
    else
        if GetConVar("act3_infinite_mags"):GetBool() then
            return "---"
        else
            return self.Owner:ACT3_GetNumAvailableMagazines(self.MagazineType)
        end
    end
end

function SWEP:CustomAmmoDisplay()
    local clip = 0

    if self.Magazine then
        clip = #self.Magazine.Rounds
    end

    if self.ChamberedRound then
        clip = clip + 1
    end

    local ammo = {
        PrimaryClip = clip,
        PrimaryAmmo = self:Ammo1(),
    }

    if self.InfiniteAmmo then
        ammo = {
            PrimaryClip = -1,
            PrimaryAmmo = -1
        }
    end

    if self.InternalWeapon then
        ammo.PrimaryClip = ammo.PrimaryAmmo
        ammo.PrimaryAmmo = -1
    end

    return ammo
end


function SWEP:GetReloadTime()
    if self.AnimReloadEndTime and self.ShotgunReload and self.InternalMag then
        if !self:CanReload() then
            return self.AnimReloadEndTime + (self.AnimReloadExtraTimeAtEnd or 0)
        else
            return self.AnimReloadEndTime
        end
    end

    if self.ReloadTimeTable[self.AnimReload] then
        return self.ReloadTimeTable[self.AnimReload] * ((self.ShotgunReload and self.InternalMag and self.AnimReloadStartTime) or 1)
    else
        return self.ReloadTimeOverride
    end
end

function SWEP:GetFakeReloadTime(num)
    num = num or 0
    if self.AnimReloadEndTime and self.ShotgunReload and self.InternalMag then
        if num == 0 then
            return self.AnimReloadEndTime + (self.AnimReloadExtraTimeAtEnd or 0)
        else
            return self.AnimReloadEndTime
        end
    end

    if self.ReloadTimeTable[self.AnimReload] then
        return self.ReloadTimeTable[self.AnimReload] * ((self.ShotgunReload and self.InternalMag and self.AnimReloadStartTime) or 1)
    else
        return self.ReloadTimeOverride
    end
end

function SWEP:FinishFakeReload(num)
    num = num or 0
    self:SetShouldHoldType()

    if self.InternalMag and self.ShotgunReload and num > 1 then
        self:FakeReload(num - 1)
    else
        if self.Owner:KeyDown(IN_ATTACK2) then
            self.State = ACT3_STATE_INSIGHTS
            self.LastEnterSightsTime = CurTime()
        elseif self.Owner:KeyDown(IN_ATTACK) then
            self.State = ACT3_STATE_INHIPFIRE
            self.LastEnterHipfireTime = CurTime()
        else
            self.State = ACT3_STATE_IDLE
        end

        self.BoltLockedBack = false
    end

    if !self.ChamberedRound and !self.OpenBolt then
        self:CycleRound()
    end
end

function SWEP:FakeReload(num)
    if self.AnimReloadStartTime > 0 and self.ShotgunReload and self.InternalMag then
        local seq = self.Owner:SelectWeightedSequence(self.AnimReload)
        if seq then
            self.Owner:AddVCDSequenceToGestureSlot( GESTURE_SLOT_ATTACK_AND_RELOAD, seq, self.AnimReloadStartTime, true )
        end
    else
        self.Owner:DoAnimationEvent(self.AnimReload)
    end

    if self.RevolverEject and !self.RevolverEjectPerRound then
        for i, k in pairs(self.RevolverShellTable) do
            local fx = EffectData()
            fx:SetEntity(self)
            fx:SetMagnitude(0)
            util.Effect(k, fx)
        end

        self.RevolverShellTable = {}
    elseif self.RevolverEject and self.ShotgunReload and self.RevolverEjectPerRound and self.RevolverShellTable[1] then
        local shell = table.remove(self.RevolverShellTable, 1)
        local fx = EffectData()
        fx:SetEntity(self)
        fx:SetMagnitude(0)
        util.Effect(shell, fx)
    end

    self.State = ACT3_STATE_RELOAD
    self:ExitSights()

    self.BoltLockedBack = true

    self.LastReloadTime = CurTime()

    self.PerformedSelfMagOperation = false

    local soundtable = {}

    for i, k in pairs(self.ReloadSoundsTable) do
        local add = false

        if self.ShotgunReload and self.InternalMag then
            if k.comp != ACT3_STPART_EMPTYRACK or num == 1 then
                add = true
            end
        else
            add = true
        end

        if add then
            table.insert(soundtable, k)
        end
    end

    --self:KillTimer("reloadsounds")
    self:PlaySoundTable(soundtable, "reloadsounds")

    self:SetShouldHoldType()

    self:SetTimer(self:GetFakeReloadTime(num), function() self:FinishFakeReload(num) end)
end

function SWEP:TryFakeReload()
    if !self.PerformedSelfMagOperation then return end

    local num = 0

    if self.ShotgunReload and self.InternalMag then
        num = self:RealClip1()
    end

    self:FakeReload(num)

    if CLIENT then
        self:RebuildModels()
    else
        ACT3_UpdateWeaponData(self, self.Owner)
    end
end

function SWEP:GetMagazinePos()
    local pos, ang = self:GetHandPos()

    local magpos = self.MagazineOffsetPos + self.WorldModelPos + Vector(0, 0, -6)
    local magang = self.MagazineOffsetAng + self.WorldModelAng

    pos = pos + ang:Forward() * magpos.x
    pos = pos + ang:Right() * -magpos.y
    pos = pos + ang:Up() * -magpos.z

    ang:RotateAroundAxis(ang:Right(), magang.p)
    ang:RotateAroundAxis(ang:Up(), magang.y)
    ang:RotateAroundAxis(ang:Forward(), magang.r)

    return pos, ang
end

function SWEP:OnUnload()
end

function SWEP:Unload()
    if !self.Magazine then return end
    if !self.Owner:IsValid() then return end
    if self != self.Owner:GetActiveWeapon() then return end
    if self.Owner:IsNPC() then return end

    if self.ChamberedRound then
        self.Owner:ACT3_GiveBullets(self.ChamberedRound, 1)
        self.ChamberedRound = nil
    end

    if self.InternalMag then
        self.Owner:ACT3_TotalUnloadFromMag(0)
    else
        self.Owner:ACT3_GiveMagazine(self.Magazine)
        self.Magazine = nil
    end

    if CLIENT then
        self:RebuildModels()
    else
        ACT3_UpdateWeaponData(self, self.Owner)
    end

    self:OnUnload()
end

function SWEP:OnEjectMagazine()
end

function SWEP:EjectMagazine()
    if !self.Magazine then return end
    if self.InternalMag then return end
    if self.InternalWeapon then return end
    local magtype = ACT3_GetMagazineType(self.Magazine.Type)
    if (magtype.Disposable and #self.Magazine.Rounds == 0) then return end

    if SERVER then



        local pos, ang = self:GetMagazinePos()
        local pos = pos + self.MagazineDropOffsetPos
        local magazine = ents.Create(ACT3.MagazineEntity)

        if magazine then
            magazine.MagazineTable = self.Magazine
            magazine.Fresh = false
            magazine:SetPos(pos)
            magazine:SetAngles(ang)
            magazine:SetPos(pos)

            local magtype2 = ACT3_GetMagazineType(self.Magazine.Type)

            if #self.Magazine.Rounds == 0 then
                magazine.Full = false
                magazine.Empty = true
            elseif #self.Magazine.Rounds < magtype2.MagSize then
                magazine.Full = false
            end

            magazine:Spawn()

            local phys = magazine:GetPhysicsObject()
            phys:AddAngleVelocity(VectorRand() * 8)
            phys:SetVelocity(self.Owner:GetAbsVelocity())
        else
            print("!!! FAILED TO CREATE MAGAZINE")
        end
    end

    self.Magazine = nil

    if SERVER then
        ACT3_UpdateWeaponData(self, self.Owner)
    end

    if CLIENT then
        self:RebuildModels()
    end

    self:OnEjectMagazine()
end

function SWEP:OnFinishReload()
end

function SWEP:FinishReload(loadintomag)

    self.State = ACT3_STATE_IDLE

    if self.InternalMag and self.ShotgunReload and self:CanReload(false) then
        self:Reload(false)
    else
        if self.Owner:KeyDown(IN_ATTACK2) then
            self:EnterSights()
        elseif self.Owner:KeyDown(IN_ATTACK) then
            self:EnterHipfire()
        end
        self.BoltLockedBack = false
    end

    self:SetShouldHoldType()

    if self.InternalMag then
        if !self.ShotgunReload then
            self.Owner:ACT3_AutoRefill(self.Magazine, self.Magazine.DefaultRounds)
        end
    elseif loadintomag then
        self.Magazine = self.Owner:ACT3_GetMagazineFromIndex(loadintomag)
        self.Owner:ACT3_TakeMagazineFromIndex(loadintomag)
    elseif GetConVar("act3_infinite_mags"):GetBool() then
        self.Magazine = table.Copy(self.DefaultMagazine)
    end

    if self.Magazine then

        local magtype = ACT3_GetMagazineType(self.Magazine.Type)

        if magtype.AttachFunc then
            magtype.AttachFunc(self)
        end

        self.Sway = self.Sway * (magtype.SwayMult or 1)
        self.AimTime = self.AimTime * (magtype.AimTimeMult or 1)
        self.SightedSpeedMult = self.SightedSpeedMult * (magtype.SightedSpeedMult or 1)

    end

    if !self.ChamberedRound and !self.OpenBolt then
        self:CycleRound()
    end

    self:SetNextPrimaryFire(CurTime() + self.PostReloadDelay)

    if SERVER then
        ACT3_UpdateWeaponData(self, self.Owner)
        ACT3_SendMagazine(self.Owner, self.Magazine, 0, self)
    end

    if CLIENT then
        self:RebuildModels()
    end

    self:OnFinishReload()
end

function SWEP:CanReload(nextr, nextn)
    nextr = nextr or false
    nextn = nextn or 1
    if self.InternalWeapon then return false end
    --if self.Reload_Cancel then return false end

    if (!isstring(self:Ammo1()) and self:Ammo1() <= 0) and (!self.Magazine or self.InternalMag) then
        return false
    end

    if nextr then
        if self.InternalMag and !self.OpenBolt and (self:RealClip1() + nextn) >= (self:GetRealMaxRealClip1() + 1) then
            return false
        end

        if self.InternalMag and self.OpenBolt and (self:RealClip1() + nextn) >= (self:GetRealMaxRealClip1()) then
            return false
        end
    else
        if self.InternalMag and !self.OpenBolt and self:RealClip1() >= (self:GetRealMaxRealClip1() + 1) then
            return false
        end

        if self.InternalMag and self.OpenBolt and self:RealClip1() >= (self:GetRealMaxRealClip1()) then
            return false
        end
    end

    return true
end

function SWEP:OnReload()
end



function SWEP:Reload(coc)
    coc = coc or true
    if self.Owner and self.Owner:IsNPC() then
        self:AI_Reload()
        return
    end

    state_magin = true
    state_magout = false
    if self.Magazine then
        state = state_magin
    end
    
    
    if !self:SanityCheck() then return end
    if self:ReloadDisabled() then return end
    if self.CannotReload then return end
    if self.Owner:KeyDown(IN_RELOAD) and self.Magazine and GetConVar("act3_magdropreload"):GetBool() and !self.InternalMag then
        self.Owner:DoAnimationEvent(ACT_FLINCH_SHOULDER_LEFT) 
        
        self:EjectMagazine()
        self:EmitSound("weapons/uni_ads_in_01.wav", vol, pitch, 1, CHAN_WEAPON)
        timer.Simple( 0.6, function() 
            state = state_magout
        end)

    end 
    if !GetConVar("act3_magdropreload"):GetBool() then
        state = state_magout
    end
    if self.State != ACT3_STATE_ININVMENU and game.SinglePlayer() and coc then self:CallOnClient("Reload") end

    if self.UBGL_Enabled then
        self:UBGL_Reload()
        return
    end


    if state then return end

    local empty = false
    local loaded = false
    local havemagtoload = false
    local toload = nil

    self.Reload_Cancel = false

    if !self:CanReload() then return end

    if self.MagazineIndex then
        toload = self.MagazineIndex

        local newmagtype = ACT3_GetMagazineType(self.Owner:ACT3_GetMagazineFromIndex(toload).Type).Type

        if newmagtype != self.MagazineType then return end

        if GetConVar("act3_infinite_mags"):GetBool() then
            local newmag = self.Owner:ACT3_GetMagazine(toload)
            self.DefaultMagazine = table.Copy(newmag)
        end

        self.MagazineIndex = nil
    else
        if GetConVar("act3_infinite_mags"):GetBool() then
            toload = nil
            havemagtoload = true
        else
            toload = self.Owner:ACT3_GetMagazineToLoad(self.MagazineType)
        end
    end

    if self.InternalMag then
        toload = nil
    end

    self.State = ACT3_STATE_RELOAD
    self:ExitSights()
    self:UpdateZoom()

    self.BoltLockedBack = true

    if self.AnimReloadStartTime > 0 and self.ShotgunReload and self.InternalMag then
        local seq = self.Owner:SelectWeightedSequence(self.AnimReload)
        if seq then
            self.Owner:AddVCDSequenceToGestureSlot( GESTURE_SLOT_ATTACK_AND_RELOAD, seq, self.AnimReloadStartTime, true )
        end
    else
        self.Owner:DoAnimationEvent(self.AnimReload)
    end

    -- if SERVER then
    --     local speed = 0.5

    --     local gest = self.Owner:AddGesture(self.AnimReload, false)
    --     self.Owner:SetLayerPriority(gest, 100)
    --     self.Owner:SetLayerPlaybackRate(gest, speed)

    --     --print(self.Owner:IsPlayingGesture(self.AnimReload))
    -- end

    -- local seq = self.Owner:LookupSequence("reload_ar2")
    -- print(self.Owner:AddVCDSequenceToGestureSlot( GESTURE_SLOT_ATTACK_AND_RELOAD, seq, 0.5, true ))

    self.LastReloadTime = CurTime()

    if self.OpenBolt then
        if !self.Magazine or !self.Magazine.Rounds[1] then
            empty = true
        end
    else
        if !self.ChamberedRound then
            empty = true
        end
    end

    if self.Magazine then
        loaded = true

        local magtype = ACT3_GetMagazineType(self.Magazine.Type)

        if magtype.DetachFunc then
            magtype.DetachFunc(self)
        end

        self.Sway = self.Sway / (magtype.SwayMult or 1)
        self.AimTime = self.AimTime / (magtype.AimTimeMult or 1)
        self.SightedSpeedMult = self.SightedSpeedMult / (magtype.SightedSpeedMult or 1)

    end

    if toload and !self.InternalMag then
        havemagtoload = true
    end

    if GetConVar("act3_dropmags"):GetBool() then
        self:EjectMagazine()
    else
        if !self.InternalMag and self.Magazine then
            self.Owner:ACT3_GiveMagazine(self.Magazine)
            self.Magazine = nil
        end
    end

    if self.RevolverEject and !self.RevolverEjectPerRound then
        for i, k in pairs(self.RevolverShellTable) do
            local fx = EffectData()
            fx:SetEntity(self)
            fx:SetMagnitude(0)
            util.Effect(k, fx)
        end

        self.RevolverShellTable = {}
    elseif self.RevolverEject and self.ShotgunReload and self.RevolverEjectPerRound and self.RevolverShellTable[1] then
        local shell = table.remove(self.RevolverShellTable, 1)
        local fx = EffectData()
        fx:SetEntity(self)
        fx:SetMagnitude(0)
        util.Effect(shell, fx)
    end

    self:SyncChamberedRound()

    local soundtable = {}

    for i, k in pairs(self.ReloadSoundsTable) do
        local add = false

        if self.ShotgunReload and self.InternalMag then
            if k.comp != ACT3_STPART_EMPTYRACK or !self:CanReload(true) then
                add = true
            end
        else
            if k.comp == ACT3_STPART_EMPTYRACK and empty then
                add = true
            elseif k.comp == ACT3_STPART_MAGLOAD and havemagtoload then
                add = true
            elseif k.comp == ACT3_STPART_MAGEJECT and loaded then
                add = true
            elseif k.comp == ACT3_STPART_BASE or !k.comp then
                add = true
            end
        end

        if add then
            table.insert(soundtable, k)
        end
    end

    if self.ShotgunReload and self.InternalMag and self.Magazine then
        self.Owner:ACT3_AutoRefillOne(self.Magazine, self.Magazine.DefaultRounds)
    end

    --self:KillTimer("reloadsounds")
    self:PlaySoundTable(soundtable, "reloadsounds")

    self:SetShouldHoldType()

    self:SetTimer(self:GetReloadTime(), function() self:FinishReload(toload) end)

    self:OnReload()
end