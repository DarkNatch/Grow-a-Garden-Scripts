-- PetSpawner.lua with Dropdown
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/GRPGaming/Key-System/refs/heads/Xycer-Hub-Script/ZusumeLib(Slider)"))()
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = game.Players.LocalPlayer

local petFolder = ReplicatedStorage:FindFirstChild("Pets")
if not petFolder then
    warn("[PetSpawner] Pets folder not found.")
    return
end

local availablePets = {}
for _, pet in ipairs(petFolder:GetChildren()) do
    if pet:IsA("Model") then
        table.insert(availablePets, pet.Name)
    end
end

local Window = OrionLib:MakeWindow({
    Name = "Pet Spawner",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "PetSpawnerConfig"
})

local Tab = Window:MakeTab({
    Name = "Pet Spawner",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Tab:AddDropdown({
    Name = "Select Pet",
    Default = availablePets[1],
    Options = availablePets,
    Callback = function(selected)
        local petModel = petFolder:FindFirstChild(selected)
        if petModel then
            local clone = petModel:Clone()
            clone.Parent = workspace
            clone:SetPrimaryPartCFrame(player.Character.HumanoidRootPart.CFrame * CFrame.new(3, 0, 2))
            print("[PetSpawner] Spawned:", selected)
        else
            warn("[PetSpawner] Not found:", selected)
        end
    end
})

OrionLib:Init()
