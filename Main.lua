--[[ 
    SAB HUB V18 - VERSÃO ANTI-ERRO DEFINITIVA
]]

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local lp = Players.LocalPlayer
local sg = Instance.new("ScreenGui", lp:WaitForChild("PlayerGui"))
sg.Name = "SAB_HUB_FINAL"
sg.ResetOnSpawn = false

local SENHA_CORRETA = "Dark123"
local noclip = false

-- Função de interface estável
local function criarElemento(classe, pai, props)
    local inst = Instance.new(classe)
    for i, v in pairs(props) do inst[i] = v end
    inst.Parent = pai
    Instance.new("UICorner", inst).CornerRadius = UDim.new(0, 8)
    return inst
end

-- TELA DE KEY (Aparece Primeiro)
local keyFrame = criarElemento("Frame", sg, {
    Size = UDim2.new(0, 300, 0, 160),
    Position = UDim2.new(0.5, -150, 0.5, -80),
    BackgroundColor3 = Color3.fromRGB(25, 25, 25),
    BorderSizePixel = 0,
    ZIndex = 10
})

local txtKey = criarElemento("TextBox", keyFrame, {
    Size = UDim2.new(0.8, 0, 0, 40),
    Position = UDim2.new(0.1, 0, 0.3, 0),
    BackgroundColor3 = Color3.fromRGB(40, 40, 40),
    TextColor3 = Color3.new(1, 1, 1),
    PlaceholderText = "Senha aqui...",
    Text = "",
    ZIndex = 11
})

local btnKey = criarElemento("TextButton", keyFrame, {
    Size = UDim2.new(0.8, 0, 0, 40),
    Position = UDim2.new(0.1, 0, 0.65, 0),
    BackgroundColor3 = Color3.fromRGB(0, 180, 0),
    Text = "VERIFICAR",
    TextColor3 = Color3.new(1, 1, 1),
    ZIndex = 11
})

-- MENU PRINCIPAL (Inicia Invisível)
local main = criarElemento("Frame", sg, {
    Size = UDim2.new(0, 400, 0, 250),
    Position = UDim2.new(0.5, -200, 0.5, -125),
    BackgroundColor3 = Color3.fromRGB(15, 15, 15),
    Visible = false,
    ZIndex = 5
})

-- ABAS (Discord e Info inclusos aqui)
local side = criarElemento("Frame", main, {
    Size = UDim2.new(0, 100, 1, -10),
    Position = UDim2.new(0, 5, 0, 5),
    BackgroundColor3 = Color3.fromRGB(30, 30, 30),
    ZIndex = 6
})

local container = criarElemento("Frame", main, {
    Size = UDim2.new(1, -115, 1, -10),
    Position = UDim2.new(0, 110, 0, 5),
    BackgroundColor3 = Color3.fromRGB(20, 20, 20),
    ZIndex = 6
})

local pagPlayer = criarElemento("ScrollingFrame", container, {Size = UDim2.new(1,0,1,0), BackgroundTransparency = 1, Visible = true, CanvasSize = UDim2.new(0,0,2,0), ScrollBarThickness = 0, ZIndex = 7})
local pagExtra = criarElemento("Frame", container, {Size = UDim2.new(1,0,1,0), BackgroundTransparency = 1, Visible = false, ZIndex = 7})

-- Botões de Aba
local function criarAba(txt, pos, pgn)
    local b = criarElemento("TextButton", side, {Size = UDim2.new(0.9,0,0,30), Position = UDim2.new(0.05,0,0,pos), Text = txt, BackgroundColor3 = Color3.fromRGB(50,50,50), TextColor3 = Color3.new(1,1,1), ZIndex = 8})
    b.MouseButton1Click:Connect(function() pagPlayer.Visible = false; pagExtra.Visible = false; pgn.Visible = true end)
end
criarAba("PLAYER", 10, pagPlayer)
criarAba("INFO", 45, pagExtra)

-- Conteúdo da Aba INFO (Discord e Key)
local infoText = criarElemento("TextLabel", pagExtra, {Size = UDim2.new(1,0,1,0), Text = "DISCORD: discord.gg/SABHUB\n\nKEY: Dark123", TextColor3 = Color3.new(1,1,1), BackgroundTransparency = 1, ZIndex = 8})

-- Toggle Estilo Pílula
local function toggle(txt, pos, callback)
    local f = criarElemento("Frame", pagPlayer, {Size = UDim2.new(0.95,0,0,45), Position = UDim2.new(0,5,0,pos), BackgroundColor3 = Color3.fromRGB(35,35,35), ZIndex = 8})
    local l = criarElemento("TextLabel", f, {Size = UDim2.new(0.6,0,1,0), Position = UDim2.new(0.05,0,0,0), Text = txt, TextColor3 = Color3.new(1,1,1), BackgroundTransparency = 1, TextXAlignment = 0, ZIndex = 9})
    local b = criarElemento("TextButton", f, {Size = UDim2.new(0, 45, 0, 22), Position = UDim2.new(0.75,0,0.25,0), Text = "", BackgroundColor3 = Color3.fromRGB(150,0,0), ZIndex = 9})
    local p = criarElemento("Frame", b, {Size = UDim2.new(0, 18, 0, 18), Position = UDim2.new(0, 2, 0.5, -9), BackgroundColor3 = Color3.new(1,1,1), ZIndex = 10})
    
    local state = false
    b.MouseButton1Click:Connect(function()
        state = not state
        b.BackgroundColor3 = state and Color3.fromRGB(0, 180, 0) or Color3.fromRGB(150, 0, 0)
        p.Position = state and UDim2.new(0, 25, 0.5, -9) or UDim2.new(0, 2, 0.5, -9)
        callback(state)
    end)
end

toggle("NOCLIP", 10, function(v) noclip = v end)

-- Loop Noclip
RunService.Stepped:Connect(function()
    if noclip and lp.Character then
        for _, v in pairs(lp.Character:GetDescendants()) do
            if v:IsA("BasePart") then v.CanCollide = false end
        end
    end
end)

-- Botão DB Arrastável
local btnDB = criarElemento("TextButton", sg, {Size = UDim2.new(0, 50, 0, 50), Position = UDim2.new(0, 10, 0.5, 0), Text = "DB", BackgroundColor3 = Color3.new(0,0,0), TextColor3 = Color3.new(1,1,1), ZIndex = 100})
local dragging = false
btnDB.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.Touch then dragging = true end end)
btnDB.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.Touch then dragging = false end end)
UserInputService.InputChanged:Connect(function(i)
    if dragging and i.UserInputType == Enum.UserInputType.Touch then
        btnDB.Position = UDim2.new(0, i.Position.X - 25, 0, i.Position.Y - 25)
    end
end)
btnDB.MouseButton1Click:Connect(function() if not keyFrame.Parent then main.Visible = not main.Visible end end)

-- Verificação de Key
btnKey.MouseButton1Click:Connect(function()
    if txtKey.Text == SENHA_CORRETA then
        keyFrame:Destroy()
        main.Visible = true
    else
        txtKey.Text = ""; txtKey.PlaceholderText = "ERRO!"
    end
end)
