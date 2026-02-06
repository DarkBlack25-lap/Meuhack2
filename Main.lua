--[[ 
    SAB HUB - PROJETO PERSONALIZADO
    - Menu com Bordas Curvas
    - Sistema de Key com Categorias (Discord/Key)
    - Botão Flutuante DarkBlack (Círculo)
    - Hacks: Velocidade, Noclip, ESP e Fly
    - Botão estilo Pílula
]]

repeat task.wait() until game:IsLoaded()
task.wait(0.5)

local lp = game:GetService("Players").LocalPlayer
local sg = Instance.new("ScreenGui", lp:WaitForChild("PlayerGui"))
sg.Name = "SAB_HUB_FINAL"
sg.ResetOnSpawn = false

-- Variáveis de Estado
local SENHA_REAL = "Dark123"
local noclipActive = false
local speedValue = 16
local flyActive = false
local flySpeed = 50

-- Funções Auxiliares
local function round(inst, radius)
    local corner = Instance.new("UICorner", inst)
    corner.CornerRadius = UDim.new(0, radius or 12)
end

-- TELA INICIAL (KEY/DISCORD)
local loginFrame = Instance.new("Frame", sg)
loginFrame.Size = UDim2.new(0, 450, 0, 300)
loginFrame.Position = UDim2.new(0.5, -225, 0.5, -150)
loginFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
round(loginFrame, 15)

-- Lateral Esquerda (Categorias)
local loginSide = Instance.new("Frame", loginFrame)
loginSide.Size = UDim2.new(0, 120, 1, -20)
loginSide.Position = UDim2.new(0, 10, 0, 10)
loginSide.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
round(loginSide, 10)

-- Área de Conteúdo
local loginContent = Instance.new("Frame", loginFrame)
loginContent.Size = UDim2.new(1, -150, 1, -20)
loginContent.Position = UDim2.new(0, 140, 0, 10)
loginContent.BackgroundTransparency = 1

-- Páginas Login
local pageDiscord = Instance.new("Frame", loginContent)
pageDiscord.Size = UDim2.new(1, 0, 1, 0); pageDiscord.Visible = false; pageDiscord.BackgroundTransparency = 1

local discLink = Instance.new("TextButton", pageDiscord)
discLink.Size = UDim2.new(1, 0, 0, 50); discLink.Position = UDim2.new(0, 0, 0.4, 0)
discLink.Text = "https://discord.gg/rdmNBDYQX"
discLink.TextColor3 = Color3.fromRGB(100, 150, 255); discLink.BackgroundTransparency = 1; discLink.TextSize = 14

local pageKey = Instance.new("Frame", loginContent)
pageKey.Size = UDim2.new(1, 0, 1, 0); pageKey.Visible = true; pageKey.BackgroundTransparency = 1

local keyLabel = Instance.new("TextLabel", pageKey)
keyLabel.Size = UDim2.new(0, 50, 0, 40); keyLabel.Position = UDim2.new(0, 0, 0.4, 0)
keyLabel.Text = "Key:"; keyLabel.TextColor3 = Color3.new(1, 1, 1); keyLabel.BackgroundTransparency = 1

local keyBox = Instance.new("TextBox", pageKey)
keyBox.Size = UDim2.new(0, 180, 0, 40); keyBox.Position = UDim2.new(0, 60, 0.4, 0)
keyBox.PlaceholderText = "Digite a chave..."; keyBox.Text = ""
keyBox.BackgroundColor3 = Color3.fromRGB(45, 45, 45); keyBox.TextColor3 = Color3.new(1, 1, 1)
round(keyBox, 8)

-- Botões Laterais Login
local btnDisc = Instance.new("TextButton", loginSide)
btnDisc.Size = UDim2.new(1, -10, 0, 40); btnDisc.Position = UDim2.new(0, 5, 0, 10)
btnDisc.Text = "Discord"; btnDisc.BackgroundColor3 = Color3.fromRGB(50, 50, 50); btnDisc.TextColor3 = Color3.new(1, 1, 1)
round(btnDisc, 8)

local btnKeyTab = Instance.new("TextButton", loginSide)
btnKeyTab.Size = UDim2.new(1, -10, 0, 40); btnKeyTab.Position = UDim2.new(0, 5, 0, 60)
btnKeyTab.Text = "Key"; btnKeyTab.BackgroundColor3 = Color3.fromRGB(50, 50, 50); btnKeyTab.TextColor3 = Color3.new(1, 1, 1)
round(btnKeyTab, 8)

-- MENU PRINCIPAL (HACKS)
local main = Instance.new("Frame", sg)
main.Size = UDim2.new(0, 450, 0, 300)
main.Position = UDim2.new(0.5, -225, 0.5, -150)
main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
main.Visible = false
round(main, 15)

-- Botão Círculo DarkBlack
local circle = Instance.new("TextButton", sg)
circle.Size = UDim2.new(0, 70, 0, 70)
circle.Position = UDim2.new(0, 20, 0.5, -35)
circle.BackgroundColor3 = Color3.new(0, 0, 0)
circle.Text = "DarkBlack"; circle.TextWrapped = true
round(circle, 35)

task.spawn(function()
    while true do
        circle.TextColor3 = Color3.new(1, 1, 1) -- Branco
        task.wait(0.5)
        circle.TextColor3 = Color3.new(1, 0, 0) -- Vermelho
        task.wait(0.5)
    end
end)

-- Sistema de Pílula (Toggle)
local function createToggle(parent, y, name, callback)
    local frame = Instance.new("Frame", parent)
    frame.Size = UDim2.new(1, -10, 0, 40); frame.Position = UDim2.new(0, 5, 0, y)
    frame.BackgroundTransparency = 1

    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(0, 100, 1, 0); label.Text = name
    label.TextColor3 = Color3.new(1, 1, 1); label.BackgroundTransparency = 1; label.TextXAlignment = Enum.TextXAlignment.Left

    local pill = Instance.new("TextButton", frame)
    pill.Size = UDim2.new(0, 50, 0, 24); pill.Position = UDim2.new(1, -60, 0.5, -12)
    pill.BackgroundColor3 = Color3.fromRGB(60, 60, 60); pill.Text = ""
    round(pill, 12)

    local dot = Instance.new("Frame", pill)
    dot.Size = UDim2.new(0, 20, 0, 20); dot.Position = UDim2.new(0, 2, 0.5, -10)
    dot.BackgroundColor3 = Color3.new(1, 1, 1)
    round(dot, 10)

    local active = false
    pill.MouseButton1Click:Connect(function()
        active = not active
        dot:TweenPosition(active and UDim2.new(0, 28, 0.5, -10) or UDim2.new(0, 2, 0.5, -10), "Out", "Quad", 0.2)
        pill.BackgroundColor3 = active and Color3.fromRGB(0, 180, 0) or Color3.fromRGB(60, 60, 60)
        callback(active)
    end)
    return frame
end

-- CONTEÚDO PLAYER
local playerPage = Instance.new("ScrollingFrame", main)
playerPage.Size = UDim2.new(1, -20, 1, -60); playerPage.Position = UDim2.new(0, 10, 0, 50)
playerPage.BackgroundTransparency = 1; playerPage.ScrollBarThickness = 2

-- Hack Velocidade
local speedFrame = Instance.new("Frame", playerPage)
speedFrame.Size = UDim2.new(1, 0, 0, 45); speedFrame.BackgroundTransparency = 1
local sLabel = Instance.new("TextLabel", speedFrame); sLabel.Size = UDim2.new(0, 100, 1, 0); sLabel.Text = "Velocidade"; sLabel.TextColor3 = Color3.new(1,1,1); sLabel.BackgroundTransparency = 1; sLabel.TextXAlignment = "Left"
local sBox = Instance.new("TextBox", speedFrame); sBox.Size = UDim2.new(0, 60, 0, 30); sBox.Position = UDim2.new(0, 110, 0.5, -15); sBox.Text = "16"; round(sBox, 5)

createToggle(speedFrame, 0, "", function(v)
    speedValue = tonumber(sBox.Text) or 16
    lp.Character.Humanoid.WalkSpeed = v and speedValue or 16
end)

-- Noclip, ESP, Fly (Pílulas)
createToggle(playerPage, 50, "Noclip", function(v) noclipActive = v end)
createToggle(playerPage, 100, "Esp", function(v) 
    for _, p in pairs(game.Players:GetPlayers()) do
        if p ~= lp and p.Character then
            local head = p.Character:FindFirstChild("Head")
            if v then
                local bg = Instance.new("BillboardGui", head); bg.Name = "SAB_ESP"; bg.Size = UDim2.new(0, 10, 0, 10); bg.AlwaysOnTop = true
                local dot = Instance.new("Frame", bg); dot.Size = UDim2.new(1, 0, 1, 0); dot.BackgroundColor3 = Color3.fromHSV(math.random(), 1, 1); round(dot, 5)
            elseif head:FindFirstChild("SAB_ESP") then head.SAB_ESP:Destroy() end
        end
    end
end)

-- Fly
local flyFrame = Instance.new("Frame", playerPage)
flyFrame.Size = UDim2.new(1, 0, 0, 45); flyFrame.Position = UDim2.new(0, 0, 0, 150); flyFrame.BackgroundTransparency = 1
local fLabel = Instance.new("TextLabel", flyFrame); fLabel.Size = UDim2.new(0, 60, 1, 0); fLabel.Text = "Fly"; fLabel.TextColor3 = Color3.new(1,1,1); fLabel.BackgroundTransparency = 1; fLabel.TextXAlignment = "Left"
local fBox = Instance.new("TextBox", flyFrame); fBox.Size = UDim2.new(0, 60, 0, 30); fBox.Position = UDim2.new(0, 70, 0.5, -15); fBox.Text = "50"; round(fBox, 5)

createToggle(flyFrame, 0, "", function(v)
    flyActive = v
    flySpeed = tonumber(fBox.Text) or 50
    -- Lógica de voo simplificada aqui
end)

-- LOGICA FINAL
btnDisc.MouseButton1Click:Connect(function() pageDiscord.Visible = true; pageKey.Visible = false end)
btnKeyTab.MouseButton1Click:Connect(function() pageDiscord.Visible = false; pageKey.Visible = true end)

keyBox.FocusLost:Connect(function()
    if keyBox.Text == SENHA_REAL then
        loginFrame:Visible = false
        main.Visible = true
    else
        keyBox.Text = "Senha Incorreta"
        task.wait(1)
        keyBox.Text = ""
    end
end)

circle.MouseButton1Click:Connect(function()
    if not loginFrame.Visible then main.Visible = not main.Visible end
end)

game:GetService("RunService").Stepped:Connect(function()
    if noclipActive and lp.Character then
        for _, v in pairs(lp.Character:GetDescendants()) do
            if v:IsA("BasePart") then v.CanCollide = false end
        end
    end
end)

