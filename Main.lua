--[[ 
    SAB HUB V17 - VERSÃO FINAL ESTABILIZADA
]]

local p = game.Players.LocalPlayer
local sg = Instance.new("ScreenGui", p:WaitForChild("PlayerGui"))
sg.Name = "SAB_HUB_V17"
sg.ResetOnSpawn = false

local SENHA_CORRETA = "Dark123"
local noclip, flying = false, false

-- Função de Criação Simples (Evita Erros de Nil)
local function criar(classe, pai, tam, pos, cor)
    local i = Instance.new(classe, pai)
    i.Size, i.Position = tam, pos
    if cor then i.BackgroundColor3 = cor end
    local corner = Instance.new("UICorner", i)
    corner.CornerRadius = UDim.new(0, 8)
    return i
end

-- TELA DE KEY
local keyFrame = criar("Frame", sg, UDim2.new(0, 300, 0, 160), UDim2.new(0.5, -150, 0.5, -80), Color3.fromRGB(20, 20, 20))
local kTitle = Instance.new("TextLabel", keyFrame)
kTitle.Size, kTitle.Text = UDim2.new(1, 0, 0, 40), "SISTEMA DE KEY"
kTitle.TextColor3, kTitle.BackgroundTransparency = Color3.new(1, 1, 1), 1

local input = Instance.new("TextBox", keyFrame)
input.Size, input.Position = UDim2.new(0.8, 0, 0, 35), UDim2.new(0.1, 0, 0.35, 0)
input.BackgroundColor3, input.TextColor3 = Color3.fromRGB(35, 35, 35), Color3.new(1, 1, 1)
input.PlaceholderText, input.Text = "Senha aqui...", ""

local btnVerify = criar("TextButton", keyFrame, UDim2.new(0.8, 0, 0, 35), UDim2.new(0.1, 0, 0.7, 0), Color3.fromRGB(0, 150, 0))
btnVerify.Text, btnVerify.TextColor3 = "VERIFICAR", Color3.new(1, 1, 1)

-- MENU PRINCIPAL
local main = criar("Frame", sg, UDim2.new(0, 420, 0, 280), UDim2.new(0.5, -210, 0.5, -140), Color3.fromRGB(15, 15, 15))
main.Visible = false

local side = criar("Frame", main, UDim2.new(0, 110, 1, -10), UDim2.new(0, 5, 0, 5), Color3.fromRGB(25, 25, 25))
local cont = criar("Frame", main, UDim2.new(1, -125, 1, -10), UDim2.new(0, 120, 0, 5), Color3.fromRGB(20, 20, 20))

local function criarPag()
    local g = Instance.new("ScrollingFrame", cont)
    g.Size, g.BackgroundTransparency, g.Visible, g.ScrollBarThickness = UDim2.new(1, 0, 1, 0), 1, false, 0
    return g
end

local pagPlayer = criarPag()
pagPlayer.Visible = true
local pagDiscord = criarPag()
local pagKeyInfo = criarPag()

-- BOTÕES DE CATEGORIA
local function aba(nome, pos, pgn)
    local b = criar("TextButton", side, UDim2.new(0.9, 0, 0, 35), UDim2.new(0.05, 0, 0, pos), Color3.fromRGB(40, 40, 40))
    b.Text, b.TextColor3 = nome, Color3.new(1,1,1)
    b.MouseButton1Click:Connect(function()
        pagPlayer.Visible, pagDiscord.Visible, pagKeyInfo.Visible = false, false, false
        pgn.Visible = true
    end)
end

aba("PLAYER", 10, pagPlayer)
aba("DISCORD", 50, pagDiscord)
aba("KEY INFO", 90, pagKeyInfo)

-- CONTEÚDO EXTRA
local dLab = Instance.new("TextLabel", pagDiscord)
dLab.Size, dLab.Text = UDim2.new(1, 0, 0, 100), "DISCORD:\ndiscord.gg/SABHUB"
dLab.TextColor3, dLab.BackgroundTransparency = Color3.new(1,1,1), 1

local kLab = Instance.new("TextLabel", pagKeyInfo)
kLab.Size, kLab.Text = UDim2.new(1, 0, 0, 100), "KEY ATUAL:\n" .. SENHA_CORRETA
kLab.TextColor3, kLab.BackgroundTransparency = Color3.new(1,1,1), 1

-- BOTÃO PÍLULA (TOGGLE)
local function toggle(nome, pai, pos, callback)
    local f = criar("Frame", pai, UDim2.new(0.95, 0, 0, 50), UDim2.new(0.025, 0, 0, pos), Color3.fromRGB(30, 30, 30))
    local t = Instance.new("TextLabel", f)
    t.Size, t.Position, t.Text = UDim2.new(0.6, 0, 1, 0), UDim2.new(0.05, 0, 0, 0), nome
    t.TextColor3, t.BackgroundTransparency, t.TextXAlignment = Color3.new(1,1,1), 1, 0

    local b = criar("TextButton", f, UDim2.new(0, 45, 0, 22), UDim2.new(0.75, 0, 0.25, 0), Color3.fromRGB(150, 0, 0))
    b.Text = ""
    local píl = criar("Frame", b, UDim2.new(0, 18, 0, 18), UDim2.new(0, 2, 0.5, -9), Color3.new(1, 1, 1))
    
    local lig = false
    b.MouseButton1Click:Connect(function()
        lig = not lig
        b.BackgroundColor3 = lig and Color3.fromRGB(0, 150, 0) or Color3.fromRGB(150, 0, 0)
        píl.Position = lig and UDim2.new(0, 25, 0.5, -9) or UDim2.new(0, 2, 0.5, -9)
        callback(lig)
    end)
end

toggle("NOCLIP", pagPlayer, 10, function(v) noclip = v end)
toggle("VOAR (FLY)", pagPlayer, 65, function(v)
    flying = v
    if flying then
        local bv = Instance.new("BodyVelocity", p.Character.PrimaryPart)
        bv.Name = "SAB_FLY"
        bv.MaxForce = Vector3.new(1e6, 1e6, 1e6)
        bv.Velocity = Vector3.new(0, 0, 0)
    else
        if p.Character.PrimaryPart:FindFirstChild("SAB_FLY") then p.Character.PrimaryPart.SAB_FLY:Destroy() end
    end
end)

-- LOOP MECÂNICO
game:GetService("RunService").Stepped:Connect(function()
    if noclip and p.Character then
        for _, v in pairs(p.Character:GetDescendants()) do
            if v:IsA("BasePart") then v.CanCollide = false end
        end
    end
end)

-- BOTÃO DB MÓVEL
local btnDB = criar("TextButton", sg, UDim2.new(0, 50, 0, 50), UDim2.new(0, 10, 0.5, 0), Color3.new(0, 0, 0))
btnDB.Text, btnDB.TextColor3 = "DB", Color3.new(1, 1, 1)

-- Arrastar (Toque)
local drag = false
btnDB.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.Touch then drag = true end end)
btnDB.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.Touch then drag = false end end)
game:GetService("UserInputService").InputChanged:Connect(function(i)
    if drag and i.UserInputType == Enum.UserInputType.Touch then
        btnDB.Position = UDim2.new(0, i.Position.X - 25, 0, i.Position.Y - 25)
    end
end)

btnDB.MouseButton1Click:Connect(function() if not keyFrame.Parent then main.Visible = not main.Visible end end)

-- LOGICA KEY
btnVerify.MouseButton1Click:Connect(function()
    if input.Text == SENHA_CORRETA then
        keyFrame:Destroy()
        main.Visible = true
    else
        input.Text = ""
        input.PlaceholderText = "SENHA INCORRETA"
    end
end)
