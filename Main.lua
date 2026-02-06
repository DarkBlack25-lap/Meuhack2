--[[ 
    SAB HUB V11 - MEGA UPDATE (RGB + KEY + MOBILE BUTTON)
]]

local p = game.Players.LocalPlayer
local sg = Instance.new("ScreenGui", p:WaitForChild("PlayerGui"))
sg.Name = "SAB_HUB_V11"
sg.ResetOnSpawn = false

-- Variáveis de Cores e Funções Base
local KeyCorreta = "SAB123" -- <--- MUDE SUA SENHA AQUI
local noclip = false
local flying = false

local function criar(classe, pai, tamanho, posicao, cor)
    local inst = Instance.new(classe, pai)
    inst.Size = tamanho
    inst.Position = posicao
    if cor then inst.BackgroundColor3 = cor end
    Instance.new("UICorner", inst).CornerRadius = UDim.new(0, 8)
    return inst
end

-- JANELA DE KEY (SENHA)
local keyFrame = criar("Frame", sg, UDim2.new(0, 300, 0, 150), UDim2.new(0.5, -150, 0.5, -75), Color3.fromRGB(20, 20, 20))
local keyTitulo = Instance.new("TextLabel", keyFrame)
keyTitulo.Size, keyTitulo.Text = UDim2.new(1, 0, 0, 40), "SISTEMA DE KEY"
keyTitulo.TextColor3, keyTitulo.BackgroundTransparency = Color3.new(1, 1, 1), 1

local inputKey = Instance.new("TextBox", keyFrame)
inputKey.Size, inputKey.Position = UDim2.new(0.8, 0, 0, 35), UDim2.new(0.1, 0, 0.4, 0)
inputKey.PlaceholderText, inputKey.Text = "Digite a Key...", ""
inputKey.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
inputKey.TextColor3 = Color3.new(1, 1, 1)

local btnVerify = criar("TextButton", keyFrame, UDim2.new(0.8, 0, 0, 35), UDim2.new(0.1, 0, 0.7, 0), Color3.fromRGB(0, 120, 0))
btnVerify.Text, btnVerify.TextColor3 = "VERIFICAR", Color3.new(1, 1, 1)

-- JANELA PRINCIPAL (ESCONDIDA ATÉ ACERTAR A KEY)
local main = criar("Frame", sg, UDim2.new(0, 450, 0, 280), UDim2.new(0.5, -225, 0.5, -140), Color3.fromRGB(15, 15, 15))
main.Visible = false

-- LINHA RGB AO REDOR
local rgbBorda = criar("Frame", main, UDim2.new(1, 4, 1, 4), UDim2.new(0, -2, 0, -2), Color3.new(1, 1, 1))
rgbBorda.ZIndex = 0
spawn(function()
    while task.wait() do
        local hue = tick() % 5 / 5
        rgbBorda.BackgroundColor3 = Color3.fromHSV(hue, 1, 1)
    end
end)

-- MENU DE CATEGORIAS (ESQUERDA)
local menuLat = criar("Frame", main, UDim2.new(0, 110, 1, -10), UDim2.new(0, 5, 0, 5), Color3.fromRGB(25, 25, 25))
local container = criar("Frame", main, UDim2.new(1, -125, 1, -10), UDim2.new(0, 120, 0, 5), Color3.fromRGB(20, 20, 20))

local abaPlayer = criar("ScrollingFrame", container, UDim2.new(1, 0, 1, 0), UDim2.new(0, 0, 0, 0), nil)
abaPlayer.BackgroundTransparency = 1
abaPlayer.ScrollBarThickness = 0

local abaExtra = criar("ScrollingFrame", container, UDim2.new(1, 0, 1, 0), UDim2.new(0, 0, 0, 0), nil)
abaExtra.BackgroundTransparency = 1
abaExtra.Visible = false

-- FUNÇÃO CRI
