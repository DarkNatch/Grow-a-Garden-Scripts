local petName = _G.PetName or "Red Fox"

local RS = game:GetService("ReplicatedStorage")
local petEvent = RS:FindFirstChild("SpawnPet") or RS:FindFirstChild("PetSpawnEvent")

if petEvent and petEvent:IsA("RemoteEvent") then
    petEvent:FireServer(petName)
    print("[DarkNatch] PetSpawner: Requested pet:", petName)
else
    warn("[DarkNatch] PetSpawner: RemoteEvent not found!")
end
