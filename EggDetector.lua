-- EggDetector.lua
local targetEggName = "Ex. Mythical Egg" -- Change to exact egg name you're targeting

local function checkEgg()
    for _, obj in pairs(workspace:GetChildren()) do
        if obj:IsA("Model") and obj.Name == targetEggName then
            return true
        end
    end
    return false
end

print("[EggDetector] Looking for egg:", targetEggName)
local found = false
for _ = 1, 30 do
    if checkEgg() then
        found = true
        print("[EggDetector] Egg hatched!")
        break
    end
    wait(1)
end

if not found then
    warn("[EggDetector] Egg not found. Rejoining...")
    game:GetService("TeleportService"):Teleport(game.PlaceId)
end
