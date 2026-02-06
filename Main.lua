--[[ 
    SAB HUB V15 - ESTABILIDADE TOTAL + SENHA: Dark123
]]

local p = game.Players.LocalPlayer
local sg = Instance.new("ScreenGui", p:WaitForChild("PlayerGui"))
sg.Name = "SAB_HUB_V15"
sg.ResetOnSpawn = false

-- Configurações
local SENHA_CORRETA = "Dark123"
local noclip = false
local flying = false

-- Função para arredondar
local function round(inst)
    local corner = Instance.new("UICorner", inst)
    corner.CornerRadius = UDim.new(0, 10)
end

-- Função RGB
local function aplicarRGB(inst)
    spawn(function()
        while task.wait() do
            local hue = tick() % 5 / 5
            inst.BackgroundColor3 = Color3.fromHSV(hue, 1, 1)
        end
    end)
end

-- JANELA DE KEY
local keyFrame = Instance.new("Frame", sg)
keyFrame.Size = UDim2.new(0, 320, 0, 180)
keyFrame.Position = UDim2.new(0.5, -160, 0.5, -90)
keyFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
keyFrame.ZIndex = 20
round(keyFrame)

local bordaKey = Instance.new("Frame", keyFrame)
bordaKey.Size = UDim2.new(1, 4, 1, 4)
bordaKey.Position = UDim2.new(0, -2, 0, -2)
bordaKey.ZIndex = 19
round(bordaKey)
aplicarRGB(bordaKey)

local keyTitle = Instance.new("TextLabel", keyFrame)
keyTitle.Size = UDim2.new(1, 0, 0, 40)
keyTitle.Text = "SISTEMA DE KEY"
keyTitle.TextColor3 = Color3.new(1, 1, 1)
keyTitle.BackgroundTransparency = 1
keyTitle.ZIndex = 21

local input = Instance.new("TextBox", keyFrame)
input.Size = UDim2.new(0.8, 0, 0, 40)
input.Position = UDim2.new(0.1, 0, 0.35, 0)
input.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
input.TextColor3 = Color3.new(1, 1, 1)
input.PlaceholderText = "Digite: Dark123"
input.Text = ""
input.ZIndex = 21
round(input)

local btnKey = Instance.new("TextButton", keyFrame)
btnKey.Size = UDim2.new(0.8, 0, 0, 40)
btnKey.Position = UDim2.new(0.1, 0, 0.7, 0)
btnKey.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
btnKey.Text = "VERIFICAR"
btnKey.TextColor3 = Color3.new(1, 1, 1)
btnKey.ZIndex = 21
round(btnKey)

-- MENU PRINCIPAL
local main = Instance.new("Frame", sg)
main.Size = UDim2.new(0, 450, 0, 300)
main.Position = UDim2.new(0.5, -225, 0.5, -150)
main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
main.Visible = false
main.ZIndex = 10
round(main)

local bordaMain = Instance.new("Frame", main)
bordaMain.Size = UDim2.new(1, 4, 1, 4)
bordaMain.Position = UDim2.new(0, -2, 0, -2)
bordaMain.ZIndex = 9
round(bordaMain)
aplicarRGB(bordaMain)

-- SIDEBAR (CATEGORIAS)
local sidebar = Instance.new("Frame", main)
sidebar.Size = UDim2.new(0, 110, 1, -10)
sidebar.Position = UDim2.new(0, 5, 0, 5)
sidebar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
sidebar.ZIndex = 11
round(sidebar)

local container = Instance.new("Frame", main)
container.Size = UDim2.new(1, -125, 1, -10)
container.Position = UDim2.new(0, 120, 0, 5)
container.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
container.ZIndex = 11
round(container)

local function criarPagina()
    local pg = Instance.new("ScrollingFrame", container)
    pg.Size = UDim2.new(1, 0, 1, 0)
    pg.BackgroundTransparency = 1
    pg.Visible = false
    pg.ScrollBarThickness = 0
    pg.ZIndex = 12
    return pg
end

local pagPlayer = criarPagina()
local pagDiscord = criarPagina()
local pagKeyInfo = criarPagina()

local function btnCategoria(nome, pos, pag)
    local btn = Instance.new("TextButton", sidebar)
    btn.Size = UDim2.new(0.9, 0, 0, 35)
    btn.Position = UDim2.new(0.05, 0, 0, pos)
    btn.Text = nome
    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    btn.TextColor3 = Color3.new(1,1,1)
    btn.ZIndex = 12
    round(btn)
    btn.MouseButton1Click:Connect(function()
        pagPlayer.Visible = false
        pagDiscord.Visible = false
        pagKeyInfo.Visible = false
        pag.Visible = true
    end)
end

btnCategoria("PLAYER", 10, pagPlayer)
btnCategoria("DISCORD", 50, pagDiscord)
btnCategoria("KEY INFO", 90, pagKeyInfo)

-- CONTEÚDO DISCORD
local dLabel = Instance.new("TextLabel", pagDiscord)
dLabel.Size = UDim2.new(1, 0, 0, 100)
dLabel.Position = UDim2.new(0, 0, 0, 20)
dLabel.Text = "DISCORD:\ndiscord.gg/SABHUB"
dLabel.TextColor3 = Color3.new(1,1,1)
dLabel.BackgroundTransparency = 1
dLabel.ZIndex = 13

-- CONTEÚDO KEY INFO
local kLabel = Instance.new("TextLabel", pagKeyInfo)
kLabel.Size = UDim2.new(1, 0, 0, 100)
kLabel.Position = UDim2.new(0, 0, 0, 20)
kLabel.Text = "SENHA ATUAL:\n" .. SENHA_CORRETA
kLabel.TextColor3 = Color3.new(1,1,1)
kLabel.BackgroundTransparency = 1
kLabel.ZIndex = 13

-- FUNÇÃO PÍLULA (TOGGLE)
local function toggle(nome, pai, pos, callback)
    local f = Instance.new("Frame", pai)
    f.Size = UDim2.new(0.95, 0, 0, 50)
    f.Position = UDim2.new(0.025, 0, 0, pos)
    f.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    f.ZIndex = 13
    round(f)

    local l = Instance.new("TextLabel", f)
    l.Size = UDim2.new(0.6, 0, 1, 0)
    l.Position = UDim2.new(0.05, 0, 0, 0)
    l.Text = nome
    l.TextColor3 = Color3.new(1,1,1)
    l.BackgroundTransparency = 1
    l.TextXAlignment = Enum.TextXAlignment.Left
    l.ZIndex = 14

    local bg = Instance.new("TextButton", f)
    bg.Size = UDim2.new(0, 50, 0, 25)
    bg.Position = UDim2.new(0.75, 0, 0.25, 0)
    bg.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
    bg.Text = ""
    bg.ZIndex = 14
    round(bg)

    local pilula = Instance.new("Frame", bg)
    pilula.Size = UDim2.new(0, 20, 0, 20)
    pilula.Position = UDim2.new(0, 3, 0.5, -10)
    pilula.BackgroundColor3 = Color3.new(1,1,1)
    pilula.ZIndex = 15
    round(pilula)

    local estado = false
    bg.MouseButton1Click:Connect(function()
        estado = not estado
        bg.BackgroundColor3 = estado and Color3.fromRGB(0, 180, 0) or Color3.fromRGB(150, 0, 0)
        pilula:TweenPosition(estado and UDim2.new(0, 27, 0.5, -10) or UDim2.new(0, 3, 0.5, -10), "Out", "Quad", 0.2)
        callback(estado)
    end)
end

toggle("ATRAVESSAR PAREDES", pagPlayer, 10, function(v) noclip = v end)
toggle("VOAR (FLY)", pagPlayer, 70, function(v)
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

-- LOOP NOCLIP
game:GetService("RunService").Stepped:Connect(function()
    if noclip and p.Character then
        for _, v in pairs(p.Character:GetDescendants()) do
            if v:IsA("BasePart") then v.CanCollide = false end
        end
    end
end)

-- BOTÃO DB MÓVEL
local btnAbrir = Instance.new("TextButton", sg)
btnAbrir.Size = UDim2.new(0, 60, 0, 60)
btnAbrir.Position = UDim2.new(0, 10, 0.5, 0)
btnAbrir.BackgroundColor3 = Color3.new(0,0,0)
btnAbrir.Text = "DB"
btnAbrir.TextColor3 = Color3.new(1,1,1)
btnAbrir.ZIndex = 100
round(btnAbrir)

local bordaAbrir = Instance.new("Frame", btnAbrir)
bordaAbrir.Size = UDim2.new(1, 6, 1, 6)
bordaAbrir.Position = UDim2.new(0, -3, 0, -3)
bordaAbrir.ZIndex = 99
round(bordaAbrir)
aplicarRGB(bordaAbrir)

-- Arrastar Botão
local dragging, startPos, dragStart
btnAbrir.InputBegan:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.Touch or i.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = i.Position
        startPos = btnAbrir.Position
    end
end)
game:GetService("UserInputService").InputChanged:Connect(function(i)
    if dragging and (i.UserInputType == Enum.UserInputType.Touch or i.UserInputType == Enum.UserInputType.MouseMovement) then
        local delta = i.Position - dragStart
        btnAbrir.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
btnAbrir.InputEnded:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.Touch or i.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
end)

btnAbrir.MouseButton1Click:Connect(function() 
    if not keyFrame.Parent then main.Visible = not main.Visible end 
end)

-- LOGICA VERIFICAÇÃO (SENHA: Dark123)
btnKey.MouseButton1Click:Connect(function()
