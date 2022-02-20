function SWEP:RecalculateDefaultRounds()
    local bullet

    if !GetConVar("act3_mags_defaultload"):GetBool() then
        self.DefaultMagazine.Rounds = {}
        return
    end

    if self.DefaultLoad then
        bullet = ACT3_GetBulletID(self.DefaultLoad)

        local magtype = ACT3_GetMagazineType(self.DefaultMagazine.Type)

        if self.InternalMag then
            magtype = ACT3_GetMagazineType(self.Magazine.Type)
            self.Magazine.DefaultRounds = {}
        end

        for i = 1, magtype.MagSize do
            self.DefaultMagazine.Rounds[i] = bullet
            if self.InternalMag then
                self.Magazine.DefaultRounds[i] = bullet
            end
        end
    end
end

function SWEP:Initialize()
    self:DoInitialize()

    if CLIENT then
        net.Start("ACT3_RequestWeaponData")
        net.WriteEntity(self)
        net.SendToServer()
    end
end

function SWEP:OnInitialize()
    state = state_magout
end

function SWEP:DoInitialize()

    self.Weight = self.Desc_Weight and isnumber(self.Desc_Weight) or 5
    self.AutoSwitchTo = true
    self.AutoSwitchFrom = false

    if self.Owner:IsNPC() or !self.Owner:IsValid() then

        timer.Simple(0, function()
            self:NPC_Initialize()
        end)

    else

        self:InitTimers()
        self:ChangeFiremodeTo(self.CurrentFiremode)

        if self.Attachments then
            self.Attachments["BaseClass"] = nil
            self.Attachments[""] = nil
        end

        if self.DefaultAttachments then
            for i, k in pairs(self.DefaultAttachments) do
                if i == "BaseClass" then continue end
                self:Attach(k, i, true)
            end
        end

        if self.OrderedDefaultAttachments then -- ENTIRELY for backward compatibility
            for i, k in pairs(self.OrderedDefaultAttachments) do
                if i == "BaseClass" then continue end
                self:Attach(k[0], k[1], true)
            end
        end

        if self.DefaultAttachmentsOrdered then
            for i, k in pairs(self.DefaultAttachmentsOrdered) do
                if i == "BaseClass" then continue end
                self:Attach(k[1], k[2], true)
            end
        end

        self:OnInitialize()

        self.FirstLoad = false

        self.Primary.Delay = self.ShootingDelay

        self:SetShouldHoldType()

        if !(self.PrimaryMelee or self.InternalWeapon) then

            self:RecalculateDefaultRounds()

            if GetConVar("act3_givefreemagazine"):GetBool() and SERVER then
                if self.Owner:IsPlayer() then
                    if self.InternalMag then
                        if GetConVar("act3_mags_defaultload"):GetBool() then
                            local magtype = ACT3_GetMagazineType(self.Magazine.Type)
                            self.Owner:ACT3_NWGiveBullets(self.DefaultLoad, magtype.MagSize)
                        end
                    else
                        if SERVER then
                            self.Owner:ACT3_GiveMagazine(table.Copy(self.DefaultMagazine))
                        end
                    end
                end
            end

        elseif self.InternalWeapon then

            self.Owner:ACT3_GiveInternalWeapon(self:GetClass())

        end

        if CLIENT then
            self:RebuildModels()
        else
            ACT3_UpdateWeaponData(self, self.Owner)
        end

    end

    self:RebuildAttachments()
end

function SWEP:DeployHints()
    if SERVER then return end
    local key_toggleinv = ""
    local key_reload = ""
    local key_secondary = ""
    local key_primary = ""
    local key_firemode = ""
    local key_mwheelup = ""
    local key_mwheeldown = ""

    key_toggleinv = string.upper(input.LookupBinding( ACT3_KEY_TOGGLEINV )) or "BIND " .. string.upper(ACT3_KEY_TOGGLEINV)
    key_secondary = string.upper(input.LookupBinding( ACT3_KEY_SECONDARY )) or "BIND " .. string.upper(ACT3_KEY_SECONDARY)
    key_primary = string.upper(input.LookupBinding( ACT3_KEY_PRIMARY )) or "BIND " .. string.upper(ACT3_KEY_PRIMARY)
    key_reload = string.upper(input.LookupBinding( "+reload" )) or "BIND " .. string.upper("+reload")
    key_firemode = string.upper(input.LookupBinding( ACT3_KEY_SWITCHFIREMODE_2 )) or string.upper(input.LookupBinding( ACT3_KEY_SWITCHFIREMODE )) or "BIND " .. string.upper(ACT3_KEY_SWITCHFIREMODE_2)
    key_mwheelup = string.upper(input.LookupBinding( ACT3_KEY_MWHEEL_NEXT )) or "BIND " .. string.upper(ACT3_KEY_MWHEEL_NEXT)
    key_mwheeldown = string.upper(input.LookupBinding( ACT3_KEY_MWHEEL_PREV )) or "BIND " .. string.upper(ACT3_KEY_MWHEEL_PREV)

    if !self.Safe then
        ACT3_AddHint("[" .. key_primary .. "] Attack")
    end

    if self.UseTrueIrons then
        ACT3_AddHint("[" .. key_secondary .. "] Sights")
    end
    if !self.InternalWeapon then
        ACT3_AddHint("[" .. key_reload .. "] Reload")
    end
    if self.ScrollFunc != ACT3_FUNC_NOTHING then
        ACT3_AddHint("[" .. key_mwheelup .. "]/[" .. key_mwheeldown .. "] Sight Function")
    end
    if ACT3.EnableMenuAtAll then
        ACT3_AddHint("[" .. key_toggleinv .. "] Inventory")
    end
    if !self.CannotFiremodes then
        ACT3_AddHint("[" .. key_firemode .. "] Change Firemode")
    end

    if self.AdditionalHints then
        for i, k in pairs(self.AdditionalHints) do
            ACT3_AddHint(k)
        end
    end
end

function SWEP:OnDeploy()
end

function SWEP:Deploy()
    self:CallOnClient("Deploy")

    if SERVER then
        self:BuildShield()
        ACT3_UpdateWeaponData(self, self.Owner, true)
    end

    if CLIENT then
        self:RebuildModels()
        self:KillFlashlights()

        self.RemainingRecoil = 0
        self.RecoilAngle = 0
        self.Blowback = 0
    else
        if self.Owner:FlashlightIsOn() and GetConVar("act3_disable_default_fl"):GetBool() then
            self.Owner:Flashlight(false)
        end
    end

    if self.SoundDraw then
        self:EmitSound(self.SoundDraw, 65, 100, 1, CHAN_ITEM)
    end

    --self.Owner:DrawViewModel(false, 0)    
    self.Dropped = false
    self.State = ACT3_STATE_IDLE
    self.Heat = 0
    self:SetShouldHoldType()
    self:ChangeFiremodeTo(1)
    self:EnterHipfire()
    self:SetNextPrimaryFire(CurTime())

    self:OnDeploy()
end

function SWEP:OnOnRemove()
end

function SWEP:OnRemove()
    self:OnOnRemove()

    if CLIENT then
        self:KillWM()
        self:KillFlashlights()
    else
        self:KillShield()
    end
end

function SWEP:OnHolster()
end

function SWEP:Holster()
    self:OnHolster()

    if CLIENT then
        self:KillWM()
        self:KillFlashlights()

        local pt = GetConVar("prone_disabletransitions")

        if pt then
            pt:SetBool(false)
        end

        ACT3_InNightScope = false
        ACT3_InThermalVision = false
    else
        self:KillShield()
    end

    self:KillTimers()

    return true
end