--[[ 
    SAB HUB V19 - AJUSTES DE TAMANHO + RGB + CATEGORIAS
]]

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local lp = Players.LocalPlayer
local sg = Instance.new("ScreenGui", lp:WaitForChild("PlayerGui"))
sg.Name = "SAB_HUB_V19"
sg.ResetOnSpawn = false

local SENHA_CORRETA = "Dark123"
local noclip = false

-- Função para arredondar
local function round(inst)
    Instance.new("UICorner", inst).CornerRadius = UDim.new(0, 10)
end

-- Função RGB para as bordas
local function aplicarRGB(inst)
    spawn(function()
        while task.wait() do
            local hue = tick() % 5 / 5
            inst.BackgroundColor3 = Color3.fromHSV(hue, 1, 1)
        end
    end)
end

-- TELA DE KEY (Agora do mesmo tamanho do Menu: 420x280)
local keyFrame = Instance.new("Frame", sg)
keyFrame.Size = UDim2.new(0, 420, 0, 280)
keyFrame.Position = UDim2.new(0.5, -210, 0.5, -140)
keyFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
keyFrame.ZIndex = 20
round(keyFrame)

local bordaKey = Instance.new("Frame", keyFrame)
bordaKey.Size = UDim2.new(1, 4, 1, 4)
bordaKey.Position = UDim
