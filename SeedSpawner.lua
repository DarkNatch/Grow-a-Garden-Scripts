-- SeedSpawner.lua with Dropdown
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/GRPGaming/Key-System/refs/heads/Xycer-Hub-Script/ZusumeLib(Slider)"))()
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = game.Players.LocalPlayer

local seedFolder = ReplicatedStorage:FindFirstChild("Seeds")
if not seedFolder then
    warn("[SeedSpawner] Seeds folder not found.")
    return
end

local availableSeeds = {}
for _, seed in ipairs(seedFolder:GetChildren()) do
    if seed:IsA("Model") then
        table.insert(availableSeeds, seed.Name)
    end
end

local Window = OrionLib:MakeWindow({
    Name = "Seed Spawner",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "SeedSpawnerConfig"
})

local Tab = Window:MakeTab({
    Name = "Seed Spawner",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Tab:AddDropdown({
    Name = "Select Seed",
    Default = availableSeeds[1],
    Options = availableSeeds,
    Callback = function(selected)
        local seedModel = seedFolder:FindFirstChild(selected)
        if seedModel then
            local clone = seedModel:Clone()
            clone.Parent = workspace
            clone:SetPrimaryPartCFrame(player.Character.HumanoidRootPart.CFrame * CFrame.new(-3, 0, 2))
            print("[SeedSpawner] Spawned:", selected)
        else
            warn("[SeedSpawner] Not found:", selected)
        end
    end
})

OrionLib:Init()
