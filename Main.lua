--[[ 
    SAB HUB V10 - PLAYER UPDATE
]]

local p = game.Players.LocalPlayer
local sg = Instance.new("ScreenGui", p:WaitForChild("PlayerGui"))
sg.Name = "SAB_HUB_V10"
sg.ResetOnSpawn = false

local function criar(classe, pai, tamanho, posicao, cor)
    local inst = Instance.new(classe, pai)
    inst.Size = tamanho
    inst.Position = posicao
    if cor then inst.BackgroundColor3 = cor end
    local corner = Instance.new("UICorner", inst)
    return inst
end

-- Janela Principal
local main = criar("Frame", sg, UDim2.new(0, 400, 0, 250), UDim2.new(0.5, -200, 0.5, -125), Color3.fromRGB(25, 25, 25))
local titulo = Instance.new("TextLabel", main)
titulo.Size, titulo.Text = UDim2.new(1, 0, 0, 35), "DARK BLACK - PLAYER MENU"
titulo.TextColor3, titulo.BackgroundTransparency = Color3.new(1, 1, 1), 1

-- Container de Botões
local abaPlayer = criar("ScrollingFrame", main, UDim2.new(1, -20, 1, -50), UDim2.new(0, 10, 0, 40), Color3.fromRGB(30, 30, 30))
abaPlayer.ScrollBarThickness = 2

-- FUNÇÃO: ATRAVESSAR PAREDES (NOCLIP)
local noclip = false
local btnNoclip = criar("TextButton", abaPlayer, UDim2.new(0.9, 0, 0, 40), UDim2.new(0.05, 0, 0, 10), Color3.fromRGB(150, 0, 0))
btnNoclip.Text = "NOCLIP: OFF"
btnNoclip.MouseButton1Click:Connect(function()
    noclip = not noclip
    btnNoclip.Text = noclip and "NOCLIP: ON" or "NOCLIP: OFF"
    btnNoclip.BackgroundColor3 = noclip and Color3.fromRGB(0, 150, 0) or Color3.fromRGB(150, 0, 0)
end)

game:GetService("RunService").Stepped:Connect(function()
    if noclip then
        for _, v in pairs(p.Character:GetDescendants()) do
            if v:IsA("BasePart") then v.CanCollide = false end
        end
    end
end)

-- FUNÇÃO: VOAR (FLY)
local flying = false
local btnFly = criar("TextButton", abaPlayer, UDim2.new(0.9, 0, 0, 40), UDim2.new(0.05, 0, 0, 60), Color3.fromRGB(150, 0, 0))
btnFly.Text = "VOAR: OFF"
btnFly.MouseButton1Click:Connect(function()
    flying = not flying
    btnFly.Text = flying and "VOAR: ON" or "VOAR: OFF"
    btnFly.BackgroundColor3 = flying and Color3.fromRGB(0, 150, 0) or Color3.fromRGB(150, 0, 0)
    
    local char = p.Character
    if flying then
        local bv = Instance.new("BodyVelocity", char.PrimaryPart)
        bv.Name = "FlyVel"
        bv.MaxForce = Vector3.new(1e6, 1e6, 1e6)
        bv.Velocity = Vector3.new(0, 50, 0) -- Sobe um pouco ao ativar
    else
        if char.PrimaryPart:FindFirstChild("FlyVel") then
            char.PrimaryPart.FlyVel:Destroy()
        end
    end
end)

-- Botão Abrir/Fechar (DB)
local btnAbrir = criar("TextButton", sg, UDim2.new(0, 50, 0, 50), UDim2.new(0, 10, 0.5, -25), Color3.new(
