--[[ 
    SAB HUB V23 - REPARO TOTAL DE ABAS E POSIÇÃO
]]

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local lp = Players.LocalPlayer
local sg = Instance.new("ScreenGui", lp:WaitForChild("PlayerGui"))
sg.Name = "SAB_HUB_V23"
sg.ResetOnSpawn = false

local SENHA_CORRETA = "Dark123"
local noclip = false

local function round(inst)
    Instance.new("UICorner", inst).CornerRadius = UDim.new(0, 10)
end

local function aplicarRGB(inst)
    task.spawn(function()
        while inst and inst.Parent do
            inst.BackgroundColor3 = Color3.fromHSV(tick() % 5 / 5, 1, 1)
            task.wait()
        end
    end)
end

-- TELA DE KEY (420x280)
local keyFrame = Instance.new("Frame", sg)
keyFrame.Size = UDim2.new(0, 420, 0, 280)
keyFrame.Position = UDim2.new(0.5, -210, 0.5, -140)
keyFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
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
input.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
input.TextColor3 = Color3.new(1, 1, 1)
input.PlaceholderText = "Digite a Key..."
input.Text = ""
input.ZIndex = 21
round(input)

local btnVerificar = Instance.new("TextButton", keyFrame)
btnVerificar.Size = UDim2.new(0, 300, 0, 45)
btnVerificar.Position = UDim2.new(0.5, -150, 0.6, 0)
btnVerificar.BackgroundColor3 = Color3.fromRGB(0, 180, 0)
btnVerificar.Text = "VERIFICAR"
btnVerificar.TextColor3 = Color3.new(1, 1, 1)
btnVerificar.ZIndex = 21
round(btnVerificar)

-- MENU PRINCIPAL (420x280)
local main = Instance.new("Frame", sg)
main.Size = UDim2.new(0, 420, 0, 280)
main.Position = UDim2.new(0.5, -210, 0.5, -140)
main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
main.Visible = false
main.ZIndex = 10
round(main)

local bordaMain = Instance.new("Frame", main)
bordaMain.Size = UDim2.new(1, 4, 1, 4)
bordaMain.Position = UDim2.new(0, -2, 0, -2)
round(bordaMain)
aplicarRGB(bordaMain)

-- ESTRUTURA DE ABAS FIXA
local side = Instance.new("Frame", main)
side.Size = UDim2.new(0, 110, 1, -10)
side.Position = UDim2.new(0, 5, 0, 5)
side.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
round(side)

local container = Instance.new("Frame", main)
container.Size = UDim2.new(1, -125, 1, -10)
container.Position = UDim2.new(0, 120, 0, 5)
container.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
round(container)

local pagPlayer = Instance.new("ScrollingFrame", container)
pagPlayer.Size = UDim2.new(1,0,1,0); pagPlayer.BackgroundTransparency = 1; pagPlayer.Visible = true; pagPlayer.ScrollBarThickness = 0

local pagDiscord = Instance.new("Frame", container)
pagDiscord.Size = UDim2.new(1,0,1,0); pagDiscord.BackgroundTransparency = 1; pagDiscord.Visible = false

local pagKey = Instance.new("Frame", container)
pagKey.Size = UDim2.new(1,0,1,0); pagKey.BackgroundTransparency = 1; pagKey.Visible = false

-- CRIADOR DE BOTÕES LATERAIS (POSIÇÃO CORRIGIDA)
local function novaAba(nome, yPos, pgn)
    local b = Instance.new("TextButton", side)
    b.Size = UDim2.new(0, 100, 0, 35)
    b.Position = UDim2.new(0, 5, 0, yPos)
    b.Text = nome
    b.BackgroundColor3 = Color3.fromRGB(50,50,50)
    b.TextColor3 = Color3.new(1,1,1)
    round(b)
    b.MouseButton1Click:
