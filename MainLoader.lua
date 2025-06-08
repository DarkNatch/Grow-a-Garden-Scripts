-- MainLoader.lua
local FeatureConfig = {
    Key = "DarkNatchKey", -- set to nil to disable key system
    LoadingScreen = true,

    PetSpawner = {
        Enabled = true,
        PetName = "Dog"
    },

    SeedSpawner = {
        Enabled = true,
        SeedName = "Wheat"
    },

    EggDetector = true,
    ServerManager = true
}

-- Key check
if FeatureConfig.Key and _G.UserKey ~= FeatureConfig.Key then
    return error("Invalid key. Access denied.")
end

local Features = {
    LoadingScreen = "https://raw.githubusercontent.com/DarkNatch/Grow-a-Garden-Scripts/refs/heads/main/LoadingScreen.lua",
    PetSpawner    = "https://raw.githubusercontent.com/DarkNatch/Grow-a-Garden-Scripts/refs/heads/main/PetSpawner.lua",
    SeedSpawner   = "https://raw.githubusercontent.com/DarkNatch/Grow-a-Garden-Scripts/refs/heads/main/SeedSpawner.lua",
    EggDetector   = "https://raw.githubusercontent.com/DarkNatch/Grow-a-Garden-Scripts/refs/heads/main/EggDetector.lua",
    ServerManager = "https://raw.githubusercontent.com/DarkNatch/Grow-a-Garden-Scripts/refs/heads/main/ServerMangaer.lua",
}

local function loadFeature(name, url)
    local success, err = pcall(function()
        loadstring(game:HttpGet(url))()
    end)
    if not success then
        warn("[DarkNatch] Failed to load", name, ":", err)
    else
        print("[DarkNatch] Loaded", name)
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
