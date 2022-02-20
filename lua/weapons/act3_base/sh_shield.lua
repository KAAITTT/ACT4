function SWEP:BuildShield()
    self:KillShield()

    if !self.Owner then return end
    if !IsValid(self.Owner) then return end

    self.SM = {}

    local SElements = {}

    table.Add(SElements, self.WorldModelAttachments or {})

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

            table.Add(SElements, WMParts)
        end
    end

    for i, k in pairs(SElements) do
        if k.shield then
            local pos, ang = self:GetHandPos()

            local wmpos = k.pos
            local wmang = k.ang

            pos = pos + ang:Forward() * wmpos.x
            pos = pos + ang:Right() * wmpos.y
            pos = pos + ang:Up() * wmpos.z

            local shield = ents.Create( "physics_prop" )
            if !shield then
                print("!!! Unable to spawn shield!")
                return
            end
            shield:SetModel( k.model )
            shield:FollowBone( self.Owner, self.Owner:LookupBone("ValveBiped.Bip01_R_Hand") )
            shield.mmRHAe = self.Shield_mmRHAe
            shield:SetPos( pos )
            shield:SetAngles( self.WorldModelAng + self.Owner:GetAngles() + wmang )
            shield:SetCollisionGroup( COLLISION_GROUP_DEBRIS )
            shield:SetModelScale(k.scale or 1)
            shield:SetColor( Color(0, 0, 0, 0) )
            if !GetConVar( "act3_server_debug" ):GetBool() then
                shield:SetMaterial("Models/effects/vol_light001")
            end
            table.insert(self.SM, shield)
            shield:Spawn()
        end
    end
end

function SWEP:KillShield()
    if !self.SM then return end

    for i, k in pairs(self.SM) do
        SafeRemoveEntity(k)
    end

    self.SM = {}
end