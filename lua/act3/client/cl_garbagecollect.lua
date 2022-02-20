if SERVER then return end

ACT3.CSModels = {}

-- We can't always guarantee all CSEnts will get removed
-- this helps reduce pile-up

function ACT3_CollectGarbage()
    local remove = {}
    local keep = {}
    local removed = 0

    for i, k in pairs(ACT3.CSModels) do
        if !k[2] or !IsValid(k[2]) then
            table.insert(remove, k[1])
        else
            table.insert(keep, k)
        end
    end

    if GetConVar("act3_client_debug"):GetBool() then
        print("Total: " .. table.Count(ACT3.CSModels))
    end

    for i, k in pairs(remove) do
        if !k then continue end
        SafeRemoveEntity(k)
        removed = removed + 1
    end

    ACT3.CSModels = keep

    if GetConVar("act3_client_debug"):GetBool() then
        print("Removed: " .. removed)
    end
end

timer.Create("ACT3 CSModel Garbage Collector", 5, 0, ACT3_CollectGarbage)