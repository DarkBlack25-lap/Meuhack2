--[[ 
    SAB HUB V21 - FIX DEFINITIVO (POSIÇÃO + RGB + TAMANHOS)
]]

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local lp = Players.LocalPlayer
local sg = Instance.new("ScreenGui", lp:WaitForChild("PlayerGui"))
sg.Name = "SAB_HUB_V21"
sg.ResetOnSpawn = false

local SENHA_CORRETA = "Dark123"
local noclip = false

-- Função para arredondar cantos
local function round(inst)
    local corner = Instance.new("UICorner", inst)
    corner.CornerRadius = UDim.new(0, 10)
end

-- Função RGB estável
local function aplicarRGB(inst)
    task.spawn(function()
        while task.wait() do
            local hue = (tick() % 5) / 5
            inst.BackgroundColor3 = Color3.fromHSV(hue, 1, 1)
        end
    end)
end

-- TELA DE KEY (420x280)
local keyFrame = Instance.new("Frame", sg)
keyFrame.Size = UDim2.new(0, 420, 0, 280)
keyFrame.Position = UDim2.new(0.5, -210, 0.5, -140)
keyFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
keyFrame.ZIndex = 20
round(keyFrame)

local bordaKey = Instance.new("Frame", keyFrame)
bordaKey.Size = UDim2.new(1, 4, 1, 4)
bordaKey.Position = UDim2.new(0, -2, 0, -2)
bordaKey.ZIndex = 19
round(bordaKey)
aplicarRGB(bordaKey)

local input = Instance.new("TextBox", keyFrame)
input.Size = UDim2.new(0, 300, 0, 45)
input.Position = UDim2.new(0.5, -150, 0.35, 0)
input.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
input.TextColor3 = Color3.new(1, 1, 1)
input.PlaceholderText = "Digite a Key..."
input.Text = ""
input.ZIndex = 21
round(input)

local btnKey = Instance.new("TextButton", keyFrame)
btnKey.Size = UDim2.new(0, 300, 0, 45)
btnKey.Position = UDim2.new(0.5, -150, 0.6, 0)
btnKey.BackgroundColor3 = Color3.fromRGB(0, 180, 0)
btnKey.Text = "VERIFICAR"
btnKey.TextColor3 = Color3.new(1, 1, 1)
btnKey.ZIndex = 21
round(btnKey)

-- MENU PRINCIPAL (420x280)
local main = Instance.new("Frame", sg)
main.Size = UDim2.new(0, 420, 0, 280)
main.Position = UDim2.new(0.5, -210, 0.5, -140)
main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
main.Visible = false
