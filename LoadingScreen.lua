-- LoadingScreen.lua
local Players = game:GetService("Players")
local Player = Players.LocalPlayer

local gui = Instance.new("ScreenGui", Player:WaitForChild("PlayerGui"))
gui.Name = "DarkNatchLoading"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0.4, 0, 0.2, 0)
frame.Position = UDim2.new(0.3, 0, 0.4, 0)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
frame.BorderSizePixel = 0
frame.BackgroundTransparency = 0.2

local label = Instance.new("TextLabel", frame)
label.Size = UDim2.new(1, 0, 1, 0)
label.Text = "DarkNatch Loading... 0%"
label.TextColor3 = Color3.fromRGB(255, 255, 255)
label.Font = Enum.Font.GothamBold
label.TextScaled = true
label.BackgroundTransparency = 1

-- Simulated loading
for i = 1, 100 do
    label.Text = "DarkNatch Loading... " .. i .. "%"
    wait(0.02)
end

gui:Destroy()
