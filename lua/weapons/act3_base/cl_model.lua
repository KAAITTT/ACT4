function SWEP:GetViewModelPosition(pos, ang)
    pos = pos + ang:Forward() * -1000
    return pos, ang
end

function SWEP:GetModelPositionInSights()
    local pos = EyePos()
    local ang = self.Owner:EyeAngles() + (self.Owner:GetViewPunchAngles() * 0.5)

    local tiang = self.TrueIronsAng
    local tipos = self.TrueIronsPos

    if self.SightInstalled then
        tiang = self.SightedAimAng
        tipos = self.SightedAimPos 
    end

    if !self.SightInstalled then
        if self.InBipod then
            local delta = CurTime() - self.EnteredBipodTime
            delta = delta / 0.1
            if delta > 1 then
                delta = 1
            elseif delta <= 0 then
                delta = 0
            end
            pos = ACT3_VectorLerp( delta, pos, self.BipodPos - Vector(0, 0, 2 * delta))
        else
            if self.ExitedBipodTime then
                local delta = CurTime() - self.ExitedBipodTime
                delta = delta / 0.1
                if delta > 1 then
                    delta = 1
                elseif delta <= 0 then
                    delta = 0
                end
                delta = 1 - delta
                pos = ACT3_VectorLerp( delta, pos, self.BipodPos - Vector(0, 0, 2 * delta))
            end

            if ACT3NVG and ACT3NVG.NVGActive then
                tiang = tiang + Vector(0, 0, 30)
                tipos = tipos + Vector(2, 2, 0)
            end
        end
    end

    local delta = CurTime() - self.LastEnterSightsTime
    delta = delta / self.AimTime
    if delta > 1 then
        delta = 1
    elseif delta <= 0 then
        delta = 0
        lastang = ang
    end

    if self.State != ACT3_STATE_INSIGHTS then delta = 0 end

    local lowang = self.LowAng
    local lowpos = self.LowPos

    local cang = ACT3_VectorLerp( delta, lowang, tiang )
    local cpos = ACT3_VectorLerp( delta, lowpos, tipos )

    local firetime = self.NextRealFire - CurTime()

    if self.ManualAction and firetime > 0 then
        local firedelta = 0

        firedelta  = firetime / (self.ShootingDelay - self.ManualActionDelay)

        firedelta = 1 - math.abs((firedelta - 0.5) * 2)

        cang = ACT3_VectorLerp( firedelta, cang, self.ManualActionAng )
        cpos = ACT3_VectorLerp( firedelta, cpos, self.ManualActionPos )
    end

    local sway_amt = self.VisualSway

    local xcomp = math.sin(CurTime() * ACT3.SwayPeriodX) * sway_amt
    local ycomp = math.cos(CurTime() * ACT3.SwayPeriodY) * sway_amt

    cpos.x = cpos.x + xcomp
    cpos.z = cpos.z + ycomp

    ang:RotateAroundAxis( ang:Right(), cang.x )
    ang:RotateAroundAxis( ang:Up(), cang.y )
    ang:RotateAroundAxis( ang:Forward(), cang.z )

    pos = pos + cpos.x * ang:Right()
    pos = pos + cpos.y * ang:Forward()
    pos = pos + cpos.z * ang:Up()

    pos = pos - (self.Blowback * self.Owner:EyeAngles():Forward())
    pos = pos + (self.RollBlowback * 0.03 * self.Owner:EyeAngles():Right())
    pos = pos + (math.abs(self.RollBlowback) * 0.02 * self.Owner:EyeAngles():Up())

    local eyerelief = self.EyeRelief

    --eyerelief = eyerelief + ((self.Owner:EyePos().z - self.Owner:GetPos().z ) / 64)

    pos = pos + (eyerelief * self.Owner:EyeAngles():Forward())

    return pos, ang
end

function SWEP:KillWM()
    if !self.WM then return end
    for i, k in pairs(self.WM) do
        SafeRemoveEntity(k)
    end

    if !self.VM then return end
    for i, k in pairs(self.VM) do
        SafeRemoveEntity(k)
    end

    self:KillFlashlights()
end

function SWEP:BuildModel(asvm)
    asvm = asvm or false
    local WElements = {}
    local csmodel = {}

    if IsValid(self.Owner) and !self.Owner:IsNPC() then
        if self.InternalWeapon and self.Owner:ACT3_GetInternalWeaponAmount(self:GetClass()) <= 0 then
            return {}
        end
    end

    -- add the worldmodel base
    table.insert(WElements, 1, {
        model = self.WorldModelBase,
        bgs = self.WorldModelBodygroups,
        skin = self.WorldModelSkin,
        pos = Vector(0, 0, 0),
        ang = Angle(0, 0, 0),
        base = true,
        mat = self.WorldModelMaterial,
    })

    table.Add(WElements, self.WorldModelAttachments or {})

    -- add the magazine
    if self.Magazine and self.MagazineVisible then
        local magtype = ACT3_GetMagazineType(self.Magazine.Type)    
        table.insert(WElements, {
            model = magtype.Model,
            bgs = "",
            skin = magtype.Skin or 0,
            pos = self.MagazineOffsetPos,
            ang = self.MagazineOffsetAng,
            scale = self.MagazineScale or 1,
            mat = magtype.Material,
        })
    end


    --if !self.Magazine and self.MagazineVisible then
    --    magtypee = newmagtype
    --    table.insert(WElements, {
    --        model = magtypee.Model,
    --        bgs = "",
    --        skin = magtypee.Skin or 0,
    --        magleftpos = self.MagazineOffsetPos,
    --        magleftang = self.MagazineOffsetAng,
    --        scale = self.MagazineScale or 1,
    --        mat = magtypee.Material,
    --    })
    --end
    

    for i, k in pairs(self.Attachments or {}) do
        if !k.Installed then continue end
        local att = ACT3_GetAttachment(k.Installed)

        if !att then continue end

        if att.WMParts then
            local WMParts = table.Copy(att.WMParts)

            for j, l in pairs(WMParts) do
                if k.Pos then
                    l.pos = k.Pos + l.pos
                end
                if k.Ang then
                    l.ang = k.Ang + l.ang
                end

                l.slot = i
            end

            table.Add(WElements, WMParts)
        end

        if att.IsSight then
            self.SightedAimPos = Vector(0, 0, 0)
            local kpos = k.Pos or Vector(0, 0, 0)
            self.SightedAimPos.x = kpos.y
            self.SightedAimPos.y = kpos.x
            self.SightedAimPos.z = kpos.z
            self.SightedAimPos = -self.SightedAimPos + att.SightOffsetPos
            self.SightedAimAng = Vector(-(k.Ang or Angle(0, 0, 0)) + att.SightOffsetAng)
            if !att.NoEyeRelief then
                self.EyeRelief = (self.TrueIronsPos.y - self.SightedAimPos.y) + self.EyeReliefExtra
            else
                self.EyeRelief = 0
            end
            self.MuzzleElev = (self.TrueIronsPos.z - self.SightedAimPos.z) + self.MuzzleElevExtra
        end
    end

    for i, k in pairs(WElements) do
        if !k.model then continue end
        local model = ClientsideModel(k.model, RENDERGROUP_VIEWMODEL)
        if IsValid(model) then
            if k.bgs then
                model:SetBodyGroups(k.bgs)
            end
            if k.skin then
                model:SetSkin(k.skin)
            end
            model:SetParent(self)
            model:SetNoDraw(true)
            model:DrawShadow(true)
            model:SetPredictable(false)
            model.Weapon = self
            model.WMPos = k.pos or k.Pos
            model.WMAng = k.ang or k.Ang
            model.Slot = k.slot or ""
            model:SetSkin(k.skin or 0)

            if (asvm and k.asvmskin) then
                model:SetSkin(k.asvmskin)
            end

            if model.mat then
                model:SetMaterial(model.mat)
            end

            model.RenderFunc = k.renderfunc
            model.nodraw = k.nodraw or false
            model.base = k.base
            model:SetModelScale(k.scale or 1)
            table.insert(csmodel, model)
            table.insert(ACT3.CSModels, {model, self})
        end
    end

    local sindex = 1

    if self.ChamberedRound then
        sindex = 0
    end

    if self.BulletAffectsBodygroups then
        local to = self:RealClip1()

        if !self.Owner:IsPlayer() then
            to = table.Count(self.BulletAffectsBodygroups)
        end

        for i = sindex, to do
            if i > 0 and !self.Magazine then continue end
            local bulletid
            local bulletname
            if !self.Owner:IsPlayer() then
                bulletname = self.DefaultLoad
            else
                bulletid = self.Magazine.Rounds[i]
                if !bulletid then continue end
                bulletname = ACT3_GetBullet(bulletid).Name
            end
            if !bulletname then continue end
            if !self.BulletAffectsBodygroups[i] then continue end
            local bg = self.BulletAffectsBodygroups[i][bulletname]
            if !bg then
                bg = self.BulletAffectsBodygroups[i][""]
            end

            if bg then
                for _, bbg in pairs(bg) do
                    local bgm = self.AttachmentBodygroups[bbg]

                    if !bgm then continue end

                    csmodel[1]:SetBodygroup(bgm.ind, bgm.bg)
                end
            end
        end
    end

    for i, k in pairs(self.Attachments or {}) do
        if !k.Installed then continue end
        local att = ACT3_GetAttachment(k.Installed)

        if !att then continue end

        if att.SkinMod then
            csmodel[1]:SetSkin(att.SkinMod)
        end

        if att.MaterialMod then
            csmodel[1]:SetMaterial(att.MaterialMod)
        end

        if att.ColorMod then
            csmodel[1]:SetColor(att.ColorMod)
        end

        if att.BodygroupMods then
            for j, l in pairs(att.BodygroupMods or {}) do
                local bgm = self.AttachmentBodygroups[l]

                if !bgm then continue end

                csmodel[1]:SetBodygroup(bgm.ind, bgm.bg)
            end
        end
    end

    if self.Firemodes and self.Firemodes[self.CurrentFiremode] and self.Firemodes[self.CurrentFiremode].Bodygroups then
        for _, k in pairs(self.Firemodes[self.CurrentFiremode].Bodygroups) do
            local bgm = self.AttachmentBodygroups[k]

            if !bgm then continue end

            csmodel[1]:SetBodygroup(bgm.ind, bgm.bg)
        end
    end

    if self.ReloadAffectsBodygroups and self.State == ACT3_STATE_RELOAD then
        for j, l in pairs(self.ReloadAffectsBodygroup or {}) do
            local bgm = self.AttachmentBodygroups[l]

            if !bgm then continue end

            csmodel[1]:SetBodygroup(bgm.ind, bgm.bg)
        end
    end

    return csmodel
end

function SWEP:RebuildModels()
    self:KillWM()
    self.WM = self:BuildModel()
    if !self.Owner:IsNPC() then
        self.VM = self:BuildModel(true)
    end
end

function SWEP:DrawCustomModel(origin_pos, origin_ang, asvm, invis)
    if IsValid(self.Owner) then
        if self:RealClip1() <= 0 and self.InternalWeapon then
            return
        end
    end

    invis = invis or false

    local model = self.WM

    if asvm then
        model = self.VM
    end

    if !model then return end

    for i, k in pairs(model) do

        local pos = Vector(0, 0, 0)
        local ang = Angle(0, 0, 0)

        pos:Set(origin_pos)
        ang:Set(origin_ang)

        local wmpos = k.WMPos
        local wmang = k.WMAng

        if !wmpos or !wmang then
            -- PANIC!
            self.WM = nil
            self.VM = nil
            return
        end

        if k.base then
            local delta = (self.NextRealFire - CurTime()) / self.ShootingDelay

            if self.ManualAction then
                delta = 1 - math.abs((delta - 0.5) * 2)
            end

            --delta = -delta

            if self.AnimatedBones_LastShootBoltLock and self.BoltLockedBack then
                delta = 1
            end

            delta = math.Clamp(delta, 0, 1)

            for _, animbone in pairs(self.AnimatedBones) do
                local bone = animbone.bone or ""
                local offset = animbone.offset or Vector(0, 0, 0)
                local angle = animbone.angle or Angle(0, 0, 0)

                offset = ACT3_VectorLerp(delta, Vector(0, 0, 0), offset)
                angle = ACT3_VectorLerp(delta, Angle(0, 0, 0), angle)

                angle = Angle(angle[1], angle[2], angle[3])

                local index = k:LookupBone(bone)

                if index == nil then continue end

                k:ManipulateBonePosition(index, offset)
                k:ManipulateBoneAngles(index, angle)
            end
        end

        pos = pos + ang:Forward() * wmpos.x
        pos = pos + ang:Right() * wmpos.y
        pos = pos + ang:Up() * wmpos.z

        ang:RotateAroundAxis(ang:Right(), wmang.p)
        ang:RotateAroundAxis(ang:Up(), wmang.y)
        ang:RotateAroundAxis(ang:Forward(), wmang.r)

        k:SetPos(pos)
        k:SetAngles(ang)
        k:SetRenderOrigin(pos)
        k:SetRenderAngles(ang)

        if !invis and !k.nodraw then
            k:DrawModel()
        end
    end

    for i, k in pairs(model) do
        local pos = Vector(0, 0, 0)
        local ang = Angle(0, 0, 0)

        pos:Set(origin_pos)
        ang:Set(origin_ang)

        local wmpos = k.WMPos
        local wmang = k.WMAng

        if !wmpos or !wmang then
            -- PANIC!
            self.WM = nil
            self.VM = nil
            return
        end

        pos = pos + ang:Forward() * wmpos.x
        pos = pos + ang:Right() * wmpos.y
        pos = pos + ang:Up() * wmpos.z

        ang:RotateAroundAxis(ang:Right(), wmang.p)
        ang:RotateAroundAxis(ang:Up(), wmang.y)
        ang:RotateAroundAxis(ang:Forward(), wmang.r)

        if k.RenderFunc then
            k.RenderFunc(pos, ang, self, k.Slot, asvm)
        end
    end
end

function SWEP:DrawWorldModel()
    if self.Owner != LocalPlayer() and !self.WM then
        -- Ask to send the data
        net.Start("ACT3_RequestWeaponData")
        net.WriteEntity(self)
        net.SendToServer()
    elseif !self.WM then
        self:RebuildModels()
    end

    if !IsValid(self.Owner) then
        if self.TraditionalWorldModel then self:DrawModel() return end
        if !self.WM then
            self:RebuildModels()
        end

        self:DrawCustomModel(self:GetPos(), self:GetAngles(), false)

        return
    end

    if self.TraditionalWorldModel then
        if self:RealClip1() <= 0 and self.InternalWeapon then
            return
        end

        self:DrawModel()
    else

        local lefthand = self.Owner:LookupBone("ValveBiped.Bip01_L_Hand")
        if IsValid(self.Owner) then
        local magleftpos, magleftang = self.Owner:GetBonePosition(lefthand)
        end
        local pos, ang = self:GetHandPos()

        pos = pos + ang:Forward() * self.WorldModelPos.x
        pos = pos + ang:Right() * self.WorldModelPos.y
        pos = pos + ang:Up() * self.WorldModelPos.z

        ang:RotateAroundAxis(ang:Right(), self.WorldModelAng.p)
        ang:RotateAroundAxis(ang:Up(), self.WorldModelAng.y)
        ang:RotateAroundAxis(ang:Forward(), self.WorldModelAng.r)

        self:DrawCustomModel(pos, ang, false)

        if GetConVar("act3_client_debug"):GetBool() then
            local mpos, mang = self:GetMuzzlePos()
            render.DrawLine(mpos, mpos + (mang:Forward() * 32), Color(0, 255, 0), false)

            mpos, mang = self:GetEjectPos()
            render.DrawLine(mpos, mpos + (mang:Forward() * 32), Color(255, 0, 0), false)

            pos, ang = self:GetHandPos()
            local endpos = pos + (ang:Up() * self.MeleeTraceOffset.y) + (ang:Forward() * self.MeleeTraceOffset.x) + (ang:Right() * self.MeleeTraceOffset.z)
            local startpos = pos + (ang:Up() * self.MeleeStartTraceOffset.y) + (ang:Forward() * self.MeleeStartTraceOffset.x) + (ang:Right() * self.MeleeStartTraceOffset.z)
            render.DrawLine(startpos, endpos, Color(0, 0, 255), false)
            
            
        end
    end
end

function SWEP:PostDrawViewModel(ent)
    if !self:ShouldDrawVM() then return end
    if !self.VM then
        self:RebuildModels()
    end
    local pos, ang = self:GetModelPositionInSights()

    self:DrawCustomModel(pos, ang, true, tobool(self.TrueScopeImage))

    if GetConVar("act3_client_debug"):GetBool() then
        local mpos, mang = self:GetMuzzlePos()
        render.DrawLine(mpos, mpos + (mang:Forward() * 32), Color(1, 0, 71), false)

        mpos, mang = self:GetEjectPos()
        render.DrawLine(mpos, mpos + (mang:Forward() * 32), Color(1, 0, 71), false)
    end
end