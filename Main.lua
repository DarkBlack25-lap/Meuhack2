-- DᴀʀᴋBʟᴀᴄᴋ HUB - VERSÃO FIEL AO DESIGN (BORDAS VERMELHAS)
repeat task.wait() until game:IsLoaded()

local lp = game:GetService("Players").LocalPlayer
local sg = Instance.new("ScreenGui", lp:WaitForChild("PlayerGui"))
sg.Name = "DarkBlack_Final_V1"; sg.ResetOnSpawn = false

local savedPos = nil -- Variável para guardar a posição

-- 1. MENU PRINCIPAL (Design idêntico à imagem)
local main = Instance.new("Frame", sg)
main.Size = UDim2.new(0, 220, 0, 320)
main.Position = UDim2.new(0.5, -110, 0.5, -160)
main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
main.Visible = true -- Começa visível para teste (pode fechar no círculo)
local mStroke = Instance.new("UIStroke", main)
mStroke.Color = Color3.fromRGB(255, 0, 0) -- Borda Vermelha
mStroke.Thickness = 2
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 10)

-- Título estilizado: DᴀʀᴋBʟᴀᴄᴋ Hub
local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, 0, 0, 40)
title.Position = UDim2.new(0, 0, 0, 5)
title.Text = "DᴀʀᴋBʟᴀᴄᴋ Hub"
title.TextColor3 = Color3.fromRGB(255, 0, 0)
title.BackgroundTransparency = 1
title.Font = Enum.Font.Code
title.TextSize = 20

-- Botões Superiores: Esp Best e Base Esp
local function createSmallBtn(txt, x, y, cb)
    local b = Instance.new("TextButton", main)
    b.Size = UDim2.new(0, 90, 0, 35)
    b.Position = UDim2.new(0.5, x, 0, y)
    b.Text = txt
    b.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    b.TextColor3 = Color3.new(1,1,1)
    b.Font = Enum.Font.Code
    b.TextSize = 13
    Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(cb)
end

createSmallBtn("Esp Best", -95, 65, function() 
    print("Ativando ESP Avançado...") 
    -- Lógica de ESP seria inserida aqui
end)

createSmallBtn("Base Esp", 5, 65, function() 
    print("Ativando ESP Básico...") 
end)

-- Botões Centrais: TP TO SAVED e SAVE POSITION
local function createBigBtn(txt, y, cb)
    local b = Instance.new("TextButton", main)
    b.Size = UDim2.new(0, 190, 0, 45)
    b.Position = UDim2.new(0.5, -95, 0, y)
    b.Text = txt
    b.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    b.TextColor3 = Color3.new(1,1,1)
    b.Font = Enum.Font.Code
    b.TextSize = 15
    Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(cb)
end

createBigBtn("TP TO SAVED", 115, function()
    if savedPos and lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") then
        lp.Character.HumanoidRootPart.CFrame = savedPos
        print("Teleportado para a posição salva!")
    else
        print("Nenhuma posição salva!")
    end
end)

createBigBtn("SAVE POSITION", 175, function()
    if lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") then
        savedPos = lp.Character.HumanoidRootPart.CFrame
        print("Posição atual salva com sucesso!")
    end
end)

-- Botão Discord (Link customizado)
local dBtn = Instance.new("TextButton", main)
dBtn.Size = UDim2.new(0, 190, 0, 40)
dBtn.Position = UDim2.new(0.5, -95, 0, 250)
dBtn.Text = "Discord"
dBtn.BackgroundColor3 = Color3.fromRGB(150, 0, 0) -- Vermelho escuro
dBtn.TextColor3 = Color3.new(1,1,1)
dBtn.Font = Enum.Font.Code
dBtn.TextSize = 16
Instance.new("UICorner", dBtn)
dBtn.MouseButton1Click:Connect(function() 
    setclipboard("https://discord.gg/rdmNBDYQX") 
    print("Link do Discord copiado!")
end)

-- 2. CÍRCULO FLUTUANTE (Arrastável com nome DarkBlack)
local circle = Instance.new("TextButton", sg)
circle.Size = UDim2.new(0, 65, 0, 65)
circle.Position = UDim2.new(0.1, 0, 0.7, 0)
circle.BackgroundColor3 = Color3.new(0,0,0)
circle.Text = "DarkBlack"
circle.TextColor3 = Color3.new(1,1,1)
circle.TextSize = 10
Instance.new("UICorner", circle).CornerRadius = UDim.new(1,0)
local cStroke = Instance.new("UIStroke", circle)
cStroke.Color = Color3.fromRGB(255, 0, 0)
cStroke.Thickness = 2

-- Lógica para arrastar o círculo (Mobile e PC)
local dS, sP, dragging
circle.InputBegan:Connect(function(i) 
    if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then 
        dragging = true; dS = i.Position; sP = circle.Position 
    end 
end)
circle.InputEnded:Connect(function(i) 
    if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then 
        dragging = false 
    end 
end)
game:GetService("UserInputService").InputChanged:Connect(function(i) 
    if dragging and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then 
        local delta = i.Position - dS
        circle.Position = UDim2.new(sP.X.Scale, sP.X.Offset + delta.X, sP.Y.Scale, sP.Y.Offset + delta.Y) 
    end 
end)

-- Abrir/Fechar Menu
circle.MouseButton1Click:Connect(function() 
    main.Visible = not main.Visible 
end)
