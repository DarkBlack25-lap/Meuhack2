--[[ 
    SAB HUB - INTEGRAL
    Seguindo 100% o seu texto original.
]]

repeat task.wait() until game:IsLoaded()
task.wait(1)

local lp = game:GetService("Players").LocalPlayer
local sg = Instance.new("ScreenGui", lp:WaitForChild("PlayerGui"))
sg.Name = "SAB_HUB_INTEGRAL"
sg.ResetOnSpawn = false

-- Variáveis de Controle
local SENHA_REAL = "Dark123"
local noclipActive = false

-- TELA DE LOGIN (Retângulo com curva, abas Discord e Key)
local loginFrame = Instance.new("Frame", sg)
loginFrame.Size = UDim2.new(0, 450, 0, 300)
loginFrame.Position = UDim2.new(0.5, -225, 0.5, -150)
loginFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Instance.new("UICorner", loginFrame).CornerRadius = UDim.new(0, 15)

local loginSide = Instance.new("Frame", loginFrame)
loginSide.Size = UDim2.new(0, 120, 1, -20)
loginSide.Position = UDim2.new(0, 10, 0, 10)
loginSide.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Instance.new("UICorner", loginSide).CornerRadius = UDim.new(0, 10)

-- Categorias da Esquerda (Login)
local btnDisc = Instance.new("TextButton", loginSide)
btnDisc.Size = UDim2.new(1, -10, 0, 40); btnDisc.Position = UDim2.new(0, 5, 0, 10); btnDisc.Text = "Discord"
local btnKeyTab = Instance.new("TextButton", loginSide)
btnKeyTab.Size = UDim2.new(1, -10, 0, 40); btnKeyTab.Position = UDim2.new(0, 5, 0, 60); btnKeyTab.Text = "Key"

-- Conteúdo (Discord e Key)
local loginContent = Instance.new("Frame", loginFrame)
loginContent.Size = UDim2.new(1, -150, 1, -20); loginContent.Position = UDim2.new(0, 140, 0, 10); loginContent.BackgroundTransparency = 1

local pDisc = Instance.new("Frame", loginContent); pDisc.Size = UDim2.new(1,0,1,0); pDisc.Visible = false; pDisc.BackgroundTransparency = 1
local link = Instance.new("TextButton", pDisc); link.Size = UDim2.new(1,0,0,50); link.Position = UDim2.new(0,0,0.4,0)
link.Text = "https://discord.gg/rdmNBDYQX"; link.BackgroundTransparency = 1; link.TextColor3 = Color3.fromRGB(100,150,255)
link.MouseButton1Click:Connect(function() setclipboard("https://discord.gg/rdmNBDYQX") end)

local pKey = Instance.new("Frame", loginContent); pKey.Size = UDim2.new(1,0,1,0); pKey.Visible = true; pKey.BackgroundTransparency = 1
local kL = Instance.new("TextLabel", pKey); kL.Size = UDim2.new(0,50,0,40); kL.Position = UDim2.new(0,0,0.4,0); kL.Text = "Key:"; kL.BackgroundTransparency = 1; kL.TextColor3 = Color3.new(1,1,1)
local box = Instance.new("TextBox", pKey); box.Size = UDim2.new(0,180,0,40); box.Position = UDim2.new(0,60,0.4,0); box.PlaceholderText = "Digite a chave..."; box.Text = ""
Instance.new("UICorner", box).CornerRadius = UDim.new(0, 8)

-- MENU DE HACKS (Igual a tela de Key)
local main = Instance.new("Frame", sg)
main.Size = UDim2.new(0, 450, 0, 300); main.Position = UDim2.new(0.5, -225, 0.5, -150); main.BackgroundColor3 = Color3.fromRGB(20,20,20); main.Visible = false
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 15)

-- BOTÃO CÍRCULO DARKBLACK (Branco/Vermelho)
local circle = Instance.new("TextButton", sg)
circle.Size = UDim2.new(0, 80, 0, 80); circle.Position = UDim2.new(0, 20, 0.5, -40); circle.BackgroundColor3 = Color3.new(0,0,0); circle.Text = "DarkBlack"; circle.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", circle).CornerRadius = UDim.new(1,0)
task.spawn(function() while true do circle.TextColor3 = Color3.new(1,1,1); task.wait(0.5); circle.TextColor3 = Color3.new(1,0,0); task.wait(0.5) end end)

-- Lógica da Pílula (Exatamente como você descreveu)
local function createHack(parent, y, name, hasInput, callback)
    local f = Instance.new("Frame", parent); f.Size = UDim2.new(1, -10, 0, 45); f.Position = UDim2.new(0, 5, 0, y); f.BackgroundTransparency = 1
    local l = Instance.new("TextLabel", f); l.Size = UDim2.new(0, 100, 1, 0); l.Text = name; l.TextColor3 = Color3.new(1,1,1); l.BackgroundTransparency = 1; l.TextXAlignment = "Left"
    
    local input
    if hasInput then
        input = Instance.new("TextBox", f); input.Size = UDim2.new(0, 50, 0, 30); input.Position = UDim2.new(0, 110, 0.5, -15); input.Text = "16"; Instance.new("UICorner", input)
    end

    local pill = Instance.new("TextButton", f); pill.Size = UDim2.new(0, 44, 0, 22); pill.Position = UDim2.new(1, -50, 0.5, -11); pill.BackgroundColor3 = Color3.fromRGB(60,60,60); pill.Text = ""
    Instance.new("UICorner", pill).CornerRadius = UDim.new(1, 0)
    local dot = Instance.new("Frame", pill); dot.Size = UDim2.new(0, 18, 0, 18); dot.Position = UDim2.new(0, 2, 0.5, -9); dot.BackgroundColor3 = Color3.new(1,1,1)
    Instance.new("UICorner", dot).CornerRadius = UDim.new(1, 0)

    local active = false
    pill.MouseButton1Click:Connect(function()
        active = not active
        dot:TweenPosition(active and UDim2.new(0, 24, 0.5,
