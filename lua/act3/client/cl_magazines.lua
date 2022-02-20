local function reclaterrebuildmodels(wpn)
    if wpn.RebuildModels then
        wpn:RebuildModels()
    else
        timer.Simple(0.1, function()
            reclaterrebuildmodels(wpn)
        end)
    end
end

net.Receive("ACT3_NetworkMagazine", function(len, ply)
    local magazine = { -- this is the weapon's default magazine, this will be automatically given if the setting act3_instantaction is enabled
        Type = "",
        Rounds = {}, -- the actual bulletids that make up the ammo in the magazine
    }
    local slot = net.ReadUInt(16)
    magazine.Type = net.ReadString()
    local numrounds = net.ReadUInt(16)
    local wpn
    if net.ReadBool() then
        wpn = net.ReadEntity()
    end

    if magazine.Type == "nil" then
        magazine = nil
    else
        if numrounds > 0 then
            for i = 1, numrounds do
                magazine.Rounds[i] = net.ReadUInt(ACT3.NeededBits)
            end
        end
    end

    LocalPlayer().ACT3_MagazineInventory = LocalPlayer().ACT3_MagazineInventory or {}

    if slot == 0 then
        if wpn then
            wpn.Magazine = magazine
            reclaterrebuildmodels(wpn)
        else
            LocalPlayer():GetActiveWeapon().Magazine = magazine
        end
    else
        LocalPlayer().ACT3_MagazineInventory[slot] = magazine
    end
end)

net.Receive("ACT3_NetworkDefaultMagazine", function(len, ply)
    local magazine = {
        Type = "",
        Rounds = {},
    }
    magazine.Type = net.ReadString()
    local wpn = net.ReadEntity()
    local ammotype = net.ReadUInt(ACT3.NeededBits)

    wpn.DefaultLoad = ACT3_GetBullet(ammotype).Name
    wpn.DefaultMagazine = magazine

    if wpn.RecalculateDefaultRounds then
        wpn:RecalculateDefaultRounds()
    end
end)

net.Receive("ACT3_ResetMagazineInventory", function(len, ply)
    LocalPlayer().ACT3_MagazineInventory = {}
    LocalPlayer().ACT3_LooseRounds = {}
    LocalPlayer().ACT3_Attachments = {}
    LocalPlayer().ACT3_InternalWeapons = {}
end)

net.Receive("ACT3_SyncBulletInventory", function(len, ply)
    local index = net.ReadUInt(32)
    local amt = net.ReadUInt(32)

    LocalPlayer().ACT3_LooseRounds[index] = amt
end)

net.Receive("ACT3_SyncChamberedRound", function(len, ply)
    local bulletid = net.ReadUInt(32)
    local wpn = net.ReadEntity()

    if bulletid == 0 then
        wpn.ChamberedRound = nil
    else
        wpn.ChamberedRound = bulletid
    end
end)