-- ServerManager.lua
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer

local function rejoinOldServer()
    local url = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
    local response = HttpService:JSONDecode(game:HttpGet(url))

    for _, server in ipairs(response.data) do
        if server.playing < server.maxPlayers and server.id ~= game.JobId then
            TeleportService:TeleportToPlaceInstance(game.PlaceId, server.id, Player)
            return
        end
    end
    warn("[ServerManager] No valid old servers found.")
end

-- Rejoin after 30 seconds if something fails
task.delay(30, rejoinOldServer)
