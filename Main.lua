--[[ 
    CÓDIGO BASE V10 - DARK BLACK 
    ESSE CÓDIGO É OTIMIZADO PARA DELTA NO CELULAR
]]

local p = game.Players.LocalPlayer
local sg = Instance.new("ScreenGui", p:WaitForChild("PlayerGui"))
sg.Name = "SAB_HUB_V10"
sg.ResetOnSpawn = false

-- Função para criar janelas e botões de forma organizada
local function criar(classe, pai, tamanho, posicao, cor)
    local inst = Instance.new(classe, pai)
    inst.Size = tamanho
    inst.Position = posicao
    if cor then inst.BackgroundColor3 = cor end
    if not classe:find("Label") then Instance.new("UICorner", inst) end
    return inst
end

-- Janela Principal
local main = criar("Frame", sg, UDim2.new(0, 400, 0, 250), UDim2.new(0.5, -200, 0.5, -125), Color3.fromRGB(25, 25, 25))
local linha = criar("Frame", main, UDim2.new(1, 0, 0, 3), UDim2.new(0, 0, 0, 0), Color3.fromHSV(tick()%5/5, 1, 1))

-- Título
local titulo = Instance.new("TextLabel", main)
titulo.Size, titulo.Text = UDim2.new(1, 0, 0, 35), "DARK BLACK HUB - V10"
titulo.TextColor3, titulo.BackgroundTransparency = Color3.new(1, 1, 1), 1
titulo.TextSize = 18

-- Container das Abas (Categorias)
local menuAbas = criar("Frame", main, UDim2.new(0, 100, 1, -40), UDim2.new(0, 5, 0, 35), Color3.fromRGB(35, 35, 35))
local conteudo = criar("Frame", main, UDim2.new(1, -115, 1, -40), UDim2.new(0, 110, 0, 35), Color3.fromRGB(30, 30, 30))

-- Função para trocar de Aba
local function novaAba(nome, textoBotao)
    local abaFrame = criar("ScrollingFrame", conteudo, UDim2.new(1, 0, 1, 0), UDim2
