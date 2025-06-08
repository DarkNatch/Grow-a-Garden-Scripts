-- Feature Config: Customize your features here
local FeatureConfig = {
    LoadingScreen = true,

    PetSpawner = {
        Enabled = true,
        PetName = "Ex.Red Fox" -- Change to your pet name from RemoteSpy
    },

    SeedSpawner = {
        Enabled = true,
        SeedName = "Ex.Mango" -- Change to your seed name from RemoteSpy
    },

    EggDetector = true,
    ServerManager = true
}

local Features = {
    LoadingScreen = "https://github.com/DarkNatch/Grow-a-Garden-Scripts/blob/78e1208056fed2270a85917bedb7c064474dc131/LoadingScreen.lua",
    PetSpawner = "https://github.com/DarkNatch/Grow-a-Garden-Scripts/blob/78e1208056fed2270a85917bedb7c064474dc131/ServerMangaer.lua",
    SeedSpawner = "https://github.com/DarkNatch/Grow-a-Garden-Scripts/blob/78e1208056fed2270a85917bedb7c064474dc131/SeedSpawner.lua",
    EggDetector = "https://github.com/DarkNatch/Grow-a-Garden-Scripts/blob/108a8186f1ee9e61ae13629049d34a052b01c31f/EggDetector.lua",
    ServerManager = "https://github.com/DarkNatch/Grow-a-Garden-Scripts/blob/78e1208056fed2270a85917bedb7c064474dc131/ServerMangaer.lua"
}

local function loadFeature(name, url)
    local success, err = pcall(function()
        loadstring(game:HttpGet(url))()
    end)
    if success then
        print("[DarkNatch] Loaded:", name)
    else
        warn("[DarkNatch] Failed to load:", name, err)
    end
end

if FeatureConfig.LoadingScreen then
    loadFeature("LoadingScreen", Features.LoadingScreen)
end

if FeatureConfig.PetSpawner.Enabled then
    _G.PetName = FeatureConfig.PetSpawner.PetName
    loadFeature("PetSpawner", Features.PetSpawner)
end

if FeatureConfig.SeedSpawner.Enabled then
    _G.SeedName = FeatureConfig.SeedSpawner.SeedName
    loadFeature("SeedSpawner", Features.SeedSpawner)
end

if FeatureConfig.EggDetector then
    loadFeature("EggDetector", Features.EggDetector)
end

if FeatureConfig.ServerManager then
    loadFeature("ServerManager", Features.ServerManager)
end
