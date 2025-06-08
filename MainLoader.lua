-- Feature Config: Customize your features here
local FeatureConfig = {
    LoadingScreen = true,

    PetSpawner = {
        Enabled = true,
        PetName = "Red Fox" -- Change to your pet name from RemoteSpy
    },

    SeedSpawner = {
        Enabled = true,
        SeedName = "Mango" -- Change to your seed name from RemoteSpy
    },

    EggDetector = true,
    ServerManager = true
}

local Features = {
    LoadingScreen = "https://raw.githubusercontent.com/DarkNatch/GaG-Script/main/LoadingScreen.lua",
    PetSpawner = "https://raw.githubusercontent.com/DarkNatch/GaG-Script/main/PetSpawner.lua",
    SeedSpawner = "https://raw.githubusercontent.com/DarkNatch/GaG-Script/main/SeedSpawner.lua",
    EggDetector = "https://raw.githubusercontent.com/DarkNatch/GaG-Script/main/EggDetector.lua",
    ServerManager = "https://raw.githubusercontent.com/DarkNatch/GaG-Script/main/ServerManager.lua"
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
