concommand.Add( "act3_drop", function(ply, cmd, args, argsStr)
    if !IsValid(ply:GetActiveWeapon()) then return end
    local wpn = ply:GetActiveWeapon()
    if !wpn.ACT3Weapon then return end

    if CLIENT then
        net.Start("ACT3_Drop")
        net.SendToServer()
    else
        ply:DropWeapon(wpn)
    end
end)

concommand.Add( "act3_reloadallweapons", function(ply, cmd, args, argsStr)
    if CLIENT then return end

    for _, k in pairs(ents.GetAll()) do
        if k.ACT3Weapon then
            ACT3_UpdateWeaponData(k, nil, true)
        end
    end
end)

concommand.Add( "act3_switchfiremode", function(ply, cmd, args, argsStr)
    if !IsValid(ply:GetActiveWeapon()) then return end
    local wpn = ply:GetActiveWeapon()
    if !wpn.ACT3Weapon then return end

    wpn:ChangeFiremode()
end)

concommand.Add( "act3_toggleinv", function(ply, cmd, args, argsStr)
    if !IsValid(ply:GetActiveWeapon()) then return end
    local wpn = ply:GetActiveWeapon()
    if !wpn.ACT3Weapon then return end

    wpn:ToggleInventory()
end)

concommand.Add( "act3_switch_sides", function( ply, cmd, args )
    RunConsoleCommand( "act3_cam_shoulder", GetConVar("act3_cam_shoulder"):GetInt() * -1 )
end )

concommand.Add( "act3_printbgs", function(ply, cmd, args, argsStr)
    local model = ply:GetEyeTrace().Entity

    if !model then return end

    PrintTable(model:GetBodyGroups())
end)

concommand.Add( "act3_generatebgs", function(ply, cmd, args, argsStr)
    local model = ply:GetEyeTrace().Entity

    if !model then return end

    local bgs = model:GetBodyGroups()

    print("SWEP.AttachmentBodygroups = {")
    for _, ind in pairs(bgs) do
        if ind.num <= 1 then continue end
        for i, bg in pairs(ind.submodels) do
            if bg == "" then continue end
            print("[\"" .. string.Replace(bg, ".smd", "") .. "\"] = {ind = " .. ind.id .. ", bg = " .. tostring(i) .. "},")
        end
    end
    print("}")
end)

concommand.Add( "act3_printbones", function(ply, cmd, args, argsStr)
    local model = ply:GetEyeTrace().Entity

    if !model then return end

    local bonecount = model:GetBoneCount() - 1

    print("{")
    for i = 0, bonecount do
        print(" [\"" .. model:GetBoneName(i) .. "\"] = true,")
    end
    print("}")
end)

net.Receive( "ACT3_ToggleInv", function( len, ply )
    local index = net.ReadBool()

    if !IsValid(ply:GetActiveWeapon()) then return end
    local wpn = ply:GetActiveWeapon()
    if !wpn.ACT3Weapon then return end

    if index then
        wpn.State = ACT3_STATE_ININVMENU
    else
        wpn.State = ACT3_STATE_IDLE
    end

    wpn:SetShouldHoldType()
    wpn:TryFakeReload()
end )