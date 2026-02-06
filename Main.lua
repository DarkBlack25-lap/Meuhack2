--[[ 
    SAB HUB V16 - VERSÃO BLINDADA (SEM ERROS)
]]

local p = game.Players.LocalPlayer
local sg = Instance.new("ScreenGui", p:WaitForChild("PlayerGui"))
sg.Name = "SAB_HUB_V16"
sg.ResetOnSpawn = false

local SENHA_CORRETA = "Dark123"
local noclip, flying = false, false

-- Função Base
local function criar(classe, pai, tam, pos, cor)
    local i = Instance.new(classe, pai)
    i.Size, i.Position = tam, pos
    if cor then i.BackgroundColor3 = cor end
    Instance.new("UICorner", i).CornerRadius = UDim.new(0, 8)
    return i
end

-- TELA DE KEY (SENHA)
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

-- MENU PRINCIPAL (ESCONDIDO)
local main = criar("Frame", sg, UDim2.new(0, 400, 0, 260), UDim2.new(0.5, -200, 0.5, -130), Color3.fromRGB(15, 15, 15))
main.Visible = false

-- SIDEBAR E CONTEÚDO
local side = criar("Frame", main, UDim2.new(0, 100, 1, -10), UDim2.new(0, 5, 0, 5), Color3.fromRGB(25, 25, 25))
local cont = criar("Frame", main, UDim2.new(1, -115, 1, -10), UDim2.new(0, 110, 0, 5), Color3.fromRGB(20, 20, 20))

local pagPlayer = Instance.new("ScrollingFrame", cont)
pagPlayer.Size, pagPlayer.BackgroundTransparency, pagPlayer.ScrollBarThickness = UDim2.new(1, 0, 1, 0), 1, 0

-- FUNÇÃO PÍLULA (TOGGLE)
local function toggle(nome, pos, callback)
    local f = criar("Frame", pagPlayer, UDim2.new(0.9, 0, 0, 45), UDim2.new(0.05, 0, 0, pos), Color3.fromRGB(30, 30, 30))
    local t = Instance.new("TextLabel", f)
    t.Size, t.Position, t.Text = UDim2.new(0.6, 0, 1, 0), UDim2.new(0.05, 0, 0, 0), nome
    t.TextColor3, t.BackgroundTransparency, t.TextXAlignment = Color3.new(1,1,1), 1, 0

    local b = criar("TextButton", f, UDim2.new(0, 45, 0, 22), UDim2.new(0.7, 0, 0.25, 0), Color3.fromRGB(150, 0, 0))
    b.Text = ""
    local pílula = criar("Frame", b, UDim2.new(0, 18, 0, 18), UDim2.new(0, 2, 0.5, -9), Color3.new(1, 1, 1))
    
    local lig = false
    b.MouseButton1Click:Connect(function()
        lig = not lig
        b.BackgroundColor3 = lig and Color3.fromRGB(0, 150, 0) or Color3.fromRGB(150, 0, 0)
        pílula.Position = lig and UDim2.new(0, 25, 0.5, -9) or UDim2.new(0, 2, 0.5, -9)
        callback(lig)
    end)
end

toggle("ATRAVESSAR PAREDES", 10, function(v) noclip = v end)
toggle("VOAR (FLY)", 60, function(v)
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
local btn = criar("TextButton", sg, UDim2.new(0, 50, 0, 50), UDim2.new(0, 10, 0.5, 0), Color3.new(0, 0, 0))
btn.Text, btn.TextColor3, btn.ZIndex = "DB", Color3.new(1, 1, 1), 100

-- Arrastar (Mobile)
local segurando = false
btn.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.Touch then segurando = true end end)
btn.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.Touch then segurando = false end end)
game:GetService("UserInputService").InputChanged:Connect(function(i)
    if segurando and i.UserInputType == Enum.UserInputType.Touch then
        btn.Position = UDim2.new(0, i.Position.X - 25, 0, i.Position.Y - 25)
    end
end)

btn.MouseButton1Click:Connect(function() if not keyFrame.Parent then main.Visible = not main.Visible end end)

-- VERIFICAÇÃO
btnVerify.MouseButton1Click:Connect(function()
    if input.Text == SENHA_CORRETA then
        keyFrame:Destroy()
        main.Visible = true
    else
        input.Text = ""
        input.PlaceholderText = "ERRO!"
    end
end)
