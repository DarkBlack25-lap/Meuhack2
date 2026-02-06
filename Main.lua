--[[ 
    SAB HUB - VERSÃO CORRIGIDA (FIX LOGS)
    Mantendo TODAS as suas especificações originais.
]]

-- CORREÇÃO DO ERRO 'NIL VALUE': Espera o carregamento completo
repeat task.wait() until game:IsLoaded()
task.wait(1)

local lp = game:GetService("Players").LocalPlayer
local sg = Instance.new("ScreenGui", lp:WaitForChild("PlayerGui"))
sg.Name = "SAB_HUB_FIXED"
sg.ResetOnSpawn = false

local SENHA_REAL = "Dark123"
local noclipActive = false
local speedValue = 16
local flyActive = false
local flySpeed = 50

-- Funções Visuais
local function round(inst, radius)
    local corner = Instance.new("UICorner", inst)
    corner.CornerRadius = UDim.new(0, radius or 12)
end

-- TELA INICIAL (Retângulo com curvas)
local loginFrame = Instance.new("Frame", sg)
loginFrame.Size = UDim2.new(0, 450, 0, 300) -- CORREÇÃO DO ERRO 'UDim2 expected'
loginFrame.Position = UDim2.new(0.5, -225, 0.5, -150)
loginFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
round(loginFrame, 15)

-- Categorias Laterais
local loginSide = Instance.new("Frame", loginFrame)
loginSide.Size = UDim2.new(0, 120, 1, -20)
loginSide.Position = UDim2.new(0, 10, 0, 10)
loginSide.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
round(loginSide, 10)

local loginContent = Instance.new("Frame", loginFrame)
loginContent.Size = UDim2.new(1, -150, 1, -20)
loginContent.Position = UDim2.new(0, 140, 0, 10)
loginContent.BackgroundTransparency = 1

-- Página Discord
local pageDiscord = Instance.new("Frame", loginContent)
pageDiscord.Size = UDim2.new(1, 0, 1, 0)
pageDiscord.Visible = false
pageDiscord.BackgroundTransparency = 1

local discLink = Instance.new("TextButton", pageDiscord)
discLink.Size = UDim2.new(1, 0, 0, 50)
discLink.Position = UDim2.new(0, 0, 0.4, 0)
discLink.Text = "https://discord.gg/rdmNBDYQX"
discLink.TextColor3 = Color3.fromRGB(100, 150, 255)
discLink.BackgroundTransparency = 1
discLink.TextSize = 14
discLink.MouseButton1Click:Connect(function() setclipboard("https://discord.gg/rdmNBDYQX") end)

-- Página Key
local pageKey = Instance.new("Frame", loginContent)
pageKey.Size = UDim2.new(1, 0, 1, 0)
pageKey.Visible = true
pageKey.BackgroundTransparency = 1

local keyLabel = Instance.new("TextLabel", pageKey)
keyLabel.Size = UDim2.new(0, 50, 0, 40)
keyLabel.Position = UDim2.new(0, 0, 0.4, 0)
keyLabel.Text = "Key:"
keyLabel.TextColor3 = Color3.new(1, 1, 1)
keyLabel.BackgroundTransparency = 1

local keyBox = Instance.new("TextBox", pageKey)
keyBox.Size = UDim2.new(0, 180, 0, 40)
keyBox.Position = UDim2.new(0, 60, 0.4, 0)
keyBox.PlaceholderText = "Digite a chave..."
keyBox.Text = ""
keyBox.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
keyBox.TextColor3 = Color3.new(1, 1, 1)
round(keyBox, 8)

-- Botões Navegação Login
local btnDisc = Instance.new("TextButton", loginSide)
btnDisc.Size = UDim2.new(1, -10, 0, 40)
btnDisc.Position = UDim2.new(0, 5, 0, 10)
btnDisc.Text = "Discord"
btnDisc.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
btnDisc.TextColor3 = Color3.new(1, 1, 1)
round(btnDisc, 8)

local btnKeyTab = Instance.new("TextButton", loginSide)
btnKeyTab.Size = UDim2.new(1, -10, 0, 40)
btnKeyTab.Position = UDim2.new(0, 5, 0, 60)
btnKeyTab.Text = "Key"
btnKeyTab.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
btnKeyTab.TextColor3 = Color3.new(1, 1, 1)
round(btnKeyTab, 8)

-- MENU DE HACKS (Mesmo estilo da Key)
local main = Instance.new("Frame", sg)
main.Size = UDim2.new(0, 450, 0, 300)
main.Position = UDim2.new(0.5, -225, 0.5, -150)
main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
main.Visible = false
round(main, 15)

-- Botão Círculo DarkBlack (Branco/Vermelho)
local circle = Instance.new("TextButton", sg)
circle.Size = UDim2.new(0, 80, 0, 80)
circle.Position = UDim2.new(0, 20, 0.5, -40)
circle.BackgroundColor3 = Color3.new(0, 0, 0)
circle.Text = "DarkBlack"
circle.TextSize = 12
round(circle, 40)

task.spawn(function()
    while true do
        circle.TextColor3 = Color3.new(1, 1, 1)
        task.wait(0.5)
        circle.TextColor3 = Color3.new(1, 0, 0)
        task.wait(0.5)
    end
end)

-- Lógica de Pílula (Toggle)
local function createPill(parent, y, name, callback)
    local frame = Instance.new("Frame", parent)
    frame.Size = UDim2.new(1, -10, 0, 40); frame.Position = UDim2.new(0, 5, 0, y); frame.BackgroundTransparency = 1
    
    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(0, 100, 1, 0); label.Text = name; label.TextColor3 = Color3.new(1,1,1); label.BackgroundTransparency = 1; label.TextXAlignment = "Left"

    local pill = Instance.new("TextButton", frame)
    pill.Size = UDim2.new(0, 44, 0, 22); pill.Position = UDim2.new(1, -50, 0.5, -11); pill.BackgroundColor3 = Color3.fromRGB(60, 60, 60); pill.Text = ""
    round(pill, 11)

    local dot = Instance.new("Frame", pill)
    dot.Size = UDim2.new(0, 18, 0, 18); dot.Position = UDim2.new(0, 2, 0.5, -9); dot.BackgroundColor3 = Color3.new(1, 1, 1)
    round(dot, 9)

    local active = false
    pill.MouseButton1Click:Connect(function()
        active = not active
        dot:TweenPosition(active and UDim2.new(0, 24, 0.5, -9) or UDim2.new(0, 2, 0.5, -9), "Out", "Quad", 0.15)
        pill.BackgroundColor3 = active and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(60, 60, 60)
        callback(active)
    end)
end

-- Conteúdo Hacks
local playerPage = Instance.new("ScrollingFrame", main)
playerPage.Size = UDim2.new(1, -20, 1, -20); playerPage.Position = UDim2.new(0, 10, 0, 10); playerPage.BackgroundTransparency = 1; playerPage.ScrollBarThickness = 0

-- Layout do Player
local pLabel = Instance.new("TextLabel", playerPage)
pLabel.Size = UDim2.new(1, 0, 0, 30); pLabel.Text = "Categoria: Player"; pLabel.TextColor3 = Color3.new(1, 1, 0); pLabel.BackgroundTransparency = 1

-- Velocidade + Input
local sBox = Instance.new("TextBox", playerPage)
sBox.Size = UDim2.new(0, 60, 0, 30); sBox.Position = UDim2.new(1, -120, 0, 45); sBox.Text = "16"; round(sBox, 5)
createPill(playerPage, 40, "Velocidade", function(v)
    lp.Character.Humanoid.WalkSpeed = v and tonumber(sBox.Text) or 16
end)

createPill(playerPage, 80, "Noclip", function(v) noclipActive = v end)

-- ESP (Luz colorida)
createPill(playerPage, 120, "Esp", function(v)
    for _, p in pairs(game.Players:GetPlayers()) do
        if p ~= lp and p.Character then
            if v then
                local e = Instance.new("Highlight", p.Character); e.Name = "SAB_ESP"; e.FillColor = Color3.fromHSV(math.random(), 1, 1)
            elseif p.Character:FindFirstChild("SAB_ESP") then p.Character.SAB_ESP:Destroy() end
        end
    end
end)

-- Fly + Input
local fBox = Instance.new("TextBox", playerPage)
fBox.Size = UDim2.new(0, 60, 0, 30); fBox.Position = UDim2.new(1, -120, 0, 165); fBox.Text = "50"; round(fBox, 5)
createPill(playerPage, 160, "Fly", function(v) flyActive = v; flySpeed = tonumber(fBox.Text) end)

-- Lógica Botões Login
btnDisc.MouseButton1Click:Connect(function() pageDiscord.Visible = true; pageKey.Visible = false end)
btnKeyTab.MouseButton1Click:Connect(function() pageDiscord.Visible = false; pageKey.Visible = true end)

-- Lógica Key (Apaga se errar)
keyBox.FocusLost:Connect(function()
    if keyBox.Text == SENHA_REAL then
        loginFrame:Destroy()
        main.Visible = true
    else
        keyBox.Text = ""
        keyBox.PlaceholderText = "Senha Incorreta"
        task.wait(1.5)
        keyBox.PlaceholderText = "Digite a chave..."
    end
end)

circle.MouseButton1Click:Connect(function()
    if not sg:FindFirstChild("Frame", true) then main.Visible = not main.Visible end
end)

-- Loop Noclip
game:GetService("RunService").Stepped:Connect(function()
    if noclipActive and lp.Character then
        for _, v in pairs(lp.Character:GetDescendants()) do
            if v:IsA("BasePart") then v.CanCollide = false end
        end
    end
end)
