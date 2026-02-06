-- Travas para evitar erros de carregamento
repeat task.wait() until game:IsLoaded()
local lp = game:GetService("Players").LocalPlayer
local sg = Instance.new("ScreenGui", lp:WaitForChild("PlayerGui"))
sg.Name = "SAB_HUB_V3"; sg.ResetOnSpawn = false

local SENHA = "Dark123"
local noclip = false

-- TELA DE SENHA (Ajustada com botão Verificar)
local login = Instance.new("Frame", sg)
login.Size = UDim2.new(0, 450, 0, 300); login.Position = UDim2.new(0.5, -225, 0.5, -150); login.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Instance.new("UICorner", login).CornerRadius = UDim.new(0, 15)

local box = Instance.new("TextBox", login)
box.Size = UDim2.new(0, 250, 0, 45); box.Position = UDim2.new(0.5, -125, 0.4, -22); box.PlaceholderText = "Digite a Key..."; box.Text = ""; box.BackgroundColor3 = Color3.fromRGB(35, 35, 35); box.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", box)

-- Botão Verificar com Luz Azul (Stroke)
local verify = Instance.new("TextButton", login)
verify.Size = UDim2.new(0, 200, 0, 45); verify.Position = UDim2.new(0.5, -100, 0.7, 0); verify.Text = "Verificar Key"; verify.BackgroundColor3 = Color3.fromRGB(40, 40, 40); verify.TextColor3 = Color3.new(1,1,1)
local stroke = Instance.new("UIStroke", verify); stroke.Color = Color3.fromRGB(0, 170, 255); stroke.Thickness = 2; stroke.ApplyStrokeMode = "Border"
Instance.new("UICorner", verify)

-- MENU PRINCIPAL (Com Categorias Laterais)
local main = Instance.new("Frame", sg)
main.Size = UDim2.new(0, 500, 0, 320); main.Position = UDim2.new(0.5, -250, 0.5, -160); main.BackgroundColor3 = Color3.fromRGB(20, 20, 20); main.Visible = false
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 15)

local sideBar = Instance.new("Frame", main)
sideBar.Size = UDim2.new(0, 130, 1, -20); sideBar.Position = UDim2.new(0, 10, 0, 10); sideBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Instance.new("UICorner", sideBar).CornerRadius = UDim.new(0, 10)

-- Botões das Categorias
local function createTab(name, y)
    local b = Instance.new("TextButton", sideBar); b.Size = UDim2.new(1, -10, 0, 40); b.Position = UDim2.new(0, 5, 0, y); b.Text = name; b.BackgroundColor3 = Color3.fromRGB(45, 45, 45); b.TextColor3 = Color3.new(1,1,1)
    Instance.new("UICorner", b); return b
end
local btnPlayer = createTab("Player", 10)
local btnDev = createTab("Dev", 60)

-- BOTÃO CÍRCULO (Menor, Texto DᴀʀᴋBʟᴀᴄᴋ e Arrastável)
local circle = Instance.new("TextButton", sg)
circle.Size = UDim2.new(0, 60, 0, 60); circle.Position = UDim2.new(0, 20, 0.5, -30); circle.BackgroundColor3 = Color3.new(0,0,0); circle.Text = "DᴀʀᴋBʟᴀᴄᴋ"; circle.TextColor3 = Color3.new(1,1,1); circle.TextSize = 10
Instance.new("UICorner", circle).CornerRadius = UDim.new(1,0)

-- Tornar o círculo arrastável
local dragging, dragInput, dragStart, startPos
circle.InputBegan:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then dragging = true; dragStart = input.Position; startPos = circle.Position end end)
circle.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then dragging = false end end)
game:GetService("UserInputService").InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        circle.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- Lógica de abrir/fechar
circle.MouseButton1Click:Connect(function() if main.Visible or login.Visible then main.Visible = false; login.Visible = false else main.Visible = true end end)

-- Lógica do Botão Verificar
verify.MouseButton1Click:Connect(function()
    if box.Text == SENHA then login:Destroy(); main.Visible = true
    else box.Text = ""; box.PlaceholderText = "SENHA INCORRETA"; task.wait(1); box.PlaceholderText = "Digite a Key..." end
end)

-- Conteúdo (Exemplo de Categoria Player)
local container = Instance.new("ScrollingFrame", main); container.Size = UDim2.new(1, -160, 1, -20); container.Position = UDim2.new(0, 150, 0, 10); container.BackgroundTransparency = 1; container.ScrollBarThickness = 0
local function createHack(name, y, callback)
    local f = Instance.new("Frame", container); f.Size = UDim2.new(1, 0, 0, 45); f.Position = UDim2.new(0, 0, 0, y); f.BackgroundTransparency = 1
    local t = Instance.new("TextLabel", f); t.Size = UDim2.new(0.6, 0, 1, 0); t.Text = name; t.TextColor3 = Color3.new(1,1,1); t.BackgroundTransparency = 1; t.TextXAlignment = "Left"
    local p = Instance.new("TextButton", f); p.Size = UDim2.new(0, 40, 0, 20); p.Position = UDim2.new(1
