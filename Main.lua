--[[ 
    SAB HUB V10 - ATUALIZADO
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
    Instance.new("UICorner", inst)
    return inst
end

-- Janela Principal
local main = criar("Frame", sg, UDim2.new(0, 350, 0, 250), UDim2.new(0.5, -175, 0.5, -125), Color3.fromRGB(20, 20, 20))
local titulo = Instance.new("TextLabel", main)
titulo.Size, titulo.Text = UDim2.new(1, 0, 0, 40), "SAB HUB - PLAYER"
titulo.TextColor3, titulo.BackgroundTransparency = Color3.new(1, 1, 1), 1

-- Botão: Atravessar Paredes (Noclip)
local noclip = false
local btnNoc = criar("TextButton", main, UDim2.new(0.8, 0, 0, 40), UDim2.new(0.1, 0, 0.25, 0), Color3.fromRGB(150, 0, 0))
btnNoc.Text, btnNoc.TextColor3 = "NOCLIP: OFF", Color3.new(1, 1, 1)

btnNoc.MouseButton1Click:Connect(function()
    noclip = not noclip
    btnNoc.Text = noclip and "NOCLIP: ON" or "NOCLIP: OFF"
    btnNoc.BackgroundColor3 = noclip and Color3.fromRGB(0, 150, 0) or Color3.fromRGB(150, 0, 0)
end)

game:GetService("RunService").Stepped:Connect(function()
    if noclip then
        for _, v in pairs(p.Character:GetDescendants()) do
            if v:IsA("BasePart") then v.CanCollide = false end
        end
    end
end)

-- Botão: Voar (Fly)
local flying = false
local btnFly = criar("TextButton", main, UDim2.new(0.8, 0, 0, 40), UDim2.new(0.1, 0, 0.45, 0), Color3.fromRGB(150, 0, 0))
btnFly.Text, btnFly.TextColor3 = "FLY: OFF", Color3.new(1, 1, 1)

btnFly.MouseButton1Click:Connect(function()
    flying = not flying
    btnFly.Text = flying and "FLY: ON" or "FLY: OFF"
    btnFly.BackgroundColor3 = flying and Color3.fromRGB(0, 150, 0) or Color3.fromRGB(150, 0, 0)
    
    local char = p.Character
    if flying then
        local bv = Instance.new("BodyVelocity", char.PrimaryPart)
        bv.Name = "FlyVel"
        bv.MaxForce = Vector3.new(1e6, 1e6, 1e6)
        bv.Velocity = Vector3.new(0, 2, 0)
    else
        if char.PrimaryPart:FindFirstChild("FlyVel") then
            char.PrimaryPart.FlyVel:Destroy()
        end
    end
end)

-- Botão para fechar/abrir o menu
local btnAbrir = criar("TextButton", sg, UDim2.new(0, 50, 0, 50), UDim2.new(0, 10, 0.5, -25), Color3.new(0,0,0))
btnAbrir.Text, btnAbrir.TextColor3 = "DB", Color3.new(1,1,1)
btnAbrir.MouseButton1Click:Connect(function() main.Visible = not main.Visible end)
