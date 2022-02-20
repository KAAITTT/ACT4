AddCSLuaFile()



-- the main object
ACT3 = {}

ACT3Installed = true

ACT3.GenerateMagEntities = true
ACT3.GenerateAttEntities = true
ACT3.GenerateAmmoEntities = true

for _, v in pairs(file.Find("act3/premod/*", "LUA")) do
    include("act3/premod/" .. v)
    AddCSLuaFile("act3/premod/" .. v)
end

for _, v in pairs(file.Find("act3/shared/*", "LUA")) do
    include("act3/shared/" .. v)
    AddCSLuaFile("act3/shared/" .. v)
end

for _, v in pairs(file.Find("act3/client/*", "LUA")) do
    include("act3/client/" .. v)
    AddCSLuaFile("act3/client/" .. v)
end

if SERVER or game.SinglePlayer() then
    for _, v in pairs(file.Find("act3/server/*", "LUA")) do
        include("act3/server/" .. v)
    end
end

-- if you want to override ACT3 functions, put your override files in the act3/mods directory so it will be guaranteed to override the base

for _, v in pairs(file.Find("act3/mods/shared/*", "LUA")) do
    include("act3/mods/shared/" .. v)
    AddCSLuaFile("act3/mods/shared/" .. v)
end

for _, v in pairs(file.Find("act3/mods/client/*", "LUA")) do
    include("act3/mods/client/" .. v)
    AddCSLuaFile("act3/mods/client/" .. v)
end

if SERVER or game.SinglePlayer() then
    for _, v in pairs(file.Find("act3/mods/server/*", "LUA")) do
        include("act3/mods/server/" .. v)
    end
end