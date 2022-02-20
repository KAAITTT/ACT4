ACT3.NPC_Whitelist = {
    ["npc_combine_s"] = true,
    ["npc_metropolice"] = true,
    ["npc_citizen"] = true,
    ["npc_monk"] = true,
    ["npc_alyx"] = true,
    ["npc_barney"] = true,
}

ACT3.NPCS_Combine = {
    ["npc_combine_s"] = true,
    ["npc_metropolice"] = true
}

ACT3.NPCS_Rebel = {
    ["npc_citizen"] = true,
    ["npc_monk"] = true,
    ["npc_alyx"] = true,
    ["npc_barney"] = true,
}

hook.Add("PlayerSpawnedNPC", "ACT3_PlayerSpawnedNPC", function( ply, ent )
    if !GetConVar("act3_npc_give"):GetBool() then return end

    if ACT3.NPC_Whitelist[ent:GetClass()] then
        net.Start("ACT3_NPCGiveRequest")
        net.Send(ply)

        ply.ACT3_LastSpawnedNPC = ent
    end
end)

if SERVER then

net.Receive("ACT3_NPCGiveReturn", function(len, ply)
    local class = net.ReadString()
    local ent = ply.ACT3_LastSpawnedNPC

    if !ent then return end
    if !class then return end

    local wpn = weapons.Get(class)

    if weapons.IsBasedOn(class, "act3_base") and wpn.Spawnable and !wpn.NPCUnusable and (!wpn.AdminOnly or ply:IsAdmin()) then
        ent:Give(class)
    end
end)

elseif CLIENT then

net.Receive("ACT3_NPCGiveRequest", function(len, ply)
    local class = GetConVar("gmod_npcweapon"):GetString()

    net.Start("ACT3_NPCGiveReturn")
    net.WriteString(class)
    net.SendToServer()
end)

hook.Add("PopulateMenuBar", "ACT3_NPCWeaponMenu", function ( menubar )
    local m = menubar:AddOrGetMenu("ACT3 Weapon Override")
    local weaponlist = weapons.GetList()

    m:AddCVar("None", "gmod_npcweapon", "none")
    m:AddSpacer()

    local cats = {}

    table.SortByMember( weaponlist, "PrintName", true )

    for i, k in pairs(weaponlist) do
        if weapons.IsBasedOn(k.ClassName, "act3_base") and !k.PrimaryMelee and k.Spawnable and !k.NPCUnusable then
            local cat = k.Category or "Other"
            if !cats[cat] then
                cats[cat] = m:AddSubMenu(cat)
            end

            cats[cat]:SetDeleteSelf(false)

            cats[cat]:AddCVar(k.PrintName, "gmod_npcweapon", k.ClassName)
        end
    end
end)

end

hook.Add( "PlayerCanPickupWeapon", "ACT3_PlayerPickupWeapon", function( ply, wep )
    if !wep.ACT3Weapon then return end

    if ply:HasWeapon(wep:GetClass()) then
        -- if player has no slots; do not give the magazine.
        if !wep.Magazine then return false end
        local magslots = ACT3_GetMagazineType(wep.Magazine.Type).Slots

        if ply:ACT3_GetMagazineSlots() - ply:ACT3_GetMagazineSlotsUsed() < magslots then
            return false
        end
        -- try to take the magazine

        if wep.Magazine and !wep.InternalMag then
            wep:EmitSound("items/itempickup.wav")
            ply:ACT3_GiveMagazine(wep.Magazine)
            wep.Magazine = nil
            ACT3_UpdateWeaponData(wep, nil)
        end

        return false
    end
end )

ACT3.ReplacementsTable = {
    ["weapon_pistol"] = {
        [ACT3_CAT_PISTOL] = true,
        [ACT3_CAT_MACHINEPISTOL] = true,
        [ACT3_CAT_SHIELD] = true},
    ["weapon_357"] = {
        [ACT3_CAT_PISTOL] = true,
        [ACT3_CAT_MACHINEPISTOL] = true,},
    ["weapon_smg1"] = {
        [ACT3_CAT_SMG] = true,
        [ACT3_CAT_CARBINE] = true,
        [ACT3_CAT_ASSAULT] = true},
    ["weapon_alyxgun"] = {
        [ACT3_CAT_MACHINEPISTOL] = true
    },
    ["weapon_ar2"] = {
        [ACT3_CAT_CARBINE] = true,
        [ACT3_CAT_ASSAULT] = true,
        [ACT3_CAT_BATTLE] = true,
        [ACT3_CAT_LMG] = true,},
    ["weapon_crossbow"] = {
        [ACT3_CAT_BATTLE] = true,
        [ACT3_CAT_DMR] = true,
        [ACT3_CAT_SNIPER] = true,
        [ACT3_CAT_ANTIMATERIEL] = true,},
    ["weapon_shotgun"] = {
        [ACT3_CAT_SHOTGUN] = true,
        [ACT3_CAT_LMG] = true,
        [ACT3_CAT_GPMG] = true,},
    ["weapon_annabelle"] = {
        [ACT3_CAT_SHOTGUN] = true,
        [ACT3_CAT_SNIPER] = true,
        [ACT3_CAT_ANTIMATERIEL] = true,},
    ["weapon_rpg"] = {
        [ACT3_CAT_ANTITANK] = true,
        [ACT3_CAT_ANTIMATERIEL] = true,}
}

function ACT3_GiveNPCRandomFromCats(cats, npc)
    npc = npc or ""
    local possibleweapons = {}

    for i, k in pairs(weapons.GetList()) do
        if !weapons.IsBasedOn(k.ClassName, "act3_base") then continue end
        if k.PrimaryMelee then continue end
        if !k.Spawnable then continue end
        if k.NPCUnusable then continue end

        if cats[k.ACT3Cat] then
            if !(k.GiveToCombine or true) and ACT3.NPCS_Combine[npc] then continue end
            if !(k.GiveToRebel or true) and ACT3.NPCS_Rebel[npc] then continue end
            table.insert(possibleweapons, k.ClassName)
        end
    end

    return possibleweapons[math.random(#possibleweapons)]
end

hook.Add( "OnEntityCreated", "ACT3_NPCWeaponReplacement", function(ent)
    if CLIENT then return end
    if !GetConVar("act3_npc_replace"):GetBool() then return end
    timer.Simple(0, function()
        if !ent:IsValid() then return end
        if !ent:IsNPC() then return end
        if !ACT3.NPC_Whitelist[ent:GetClass()] then return end
        if !IsValid(ent:GetActiveWeapon()) then return end

        local theirweapon = ent:GetActiveWeapon():GetClass()

        if ACT3.ReplacementsTable[theirweapon] then
            local wpn = ACT3_GiveNPCRandomFromCats(ACT3.ReplacementsTable[theirweapon], ent:GetClass())

            if wpn then
                ent:Give(wpn)
            end
        end
    end)
    timer.Simple(0, function()
        if !ent:IsValid() then return end
        if !ent:IsWeapon() then return end
        if ent:GetOwner() then return end

        local class = ent:GetClass()

        if ACT3.ReplacementsTable[class] then
            local wpn = ACT3_GiveNPCRandomFromCats(ACT3.ReplacementsTable[class])

            if wpn then
                local wpnent = ents.Create(wpn)
                wpnent:SetPos(ent:GetPos())
                wpnent:SetAngles(ent:GetAngles())

                wpnent:NPC_Initialize()

                wpnent:Spawn()

                timer.Simple(0, function()
                    if !ent:IsValid() then return end
                    wpnent:OnDrop(true)
                    ent:Remove()
                end)
            end
        end
    end)
end)

function ACT3_GiveWeaponToNPC(wpn, npc)
    if !ACT3.NPC_Whitelist[npc:GetClass()] then return end

    if !npc then return end
    if !npc:IsNPC() then return end

    npc.GunIsGivenByACT3 = true

    npc:Give(wpn:GetClass())

    local npcwpn = npc:GetActiveWeapon()

    -- now just transfer attachments..

    npcwpn.GivenAttachments = {}

    for i, k in pairs(wpn.Attachments) do
        table.insert(npcwpn.GivenAttachments, {Slot = i, Att = k.Installed, Order = k.InstalledOrder})
    end

    table.SortByMember(npcwpn.GivenAttachments, "Order", true)

    -- and transfer the ammo....

    if wpn.Magazine then
        npcwpn.Magazine = table.Copy(wpn.Magazine)
    end

    if npcwpn.ChamberedRound then
        npcwpn.ChamberedRound = wpn.ChamberedRound
    end
end

concommand.Add( "act3_give", function(ply, cmd, args, argsStr)
    if !IsValid(ply:GetActiveWeapon()) then return end
    if !GetConVar("act3_npc_give"):GetBool() then return end
    local wpn = ply:GetActiveWeapon()
    if wpn.PrimaryMelee or wpn.NPCUnusable then return end
    if !wpn.ACT3Weapon then return end

    local npc = ply:GetEyeTrace().Entity

    if !npc:IsNPC() then return end

    ACT3_GiveWeaponToNPC(wpn, npc)

    -- and get rid of the original
    if !GetConVar("act3_npc_dupe"):GetBool() then
        ply:StripWeapon(wpn:GetClass())
    end
end)