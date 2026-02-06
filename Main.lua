--[[ 
    SAB HUB V27 - CORREÇÃO TOTAL (SEM ERRO DE POSIÇÃO E SEM NIL)
]]

-- Espera o jogo e o executor estabilizarem
repeat task.wait() until game:IsLoaded()
task.wait(2) 

local lp = game:GetService("Players").LocalPlayer
local sg = Instance.new("ScreenGui", lp:WaitForChild("PlayerGui"))
sg.Name = "SAB_HUB_V27"
sg.ResetOnSpawn = false

local SENHA = "Dark123"
local noclip = false

-- SISTEMA DE KEY (420x280)
local keyFrame = Instance.new("Frame", sg)
keyFrame.Size = UDim2.new(0, 420, 0, 280)
keyFrame.Position = UDim2.new(0.5, -210, 0.5, -140)
keyFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Instance.new("UICorner", keyFrame).CornerRadius = UDim.new(0, 10)

local box = Instance.new("TextBox", keyFrame)
box.Size = UDim2.new(0, 300, 0, 45)
box.Position = UDim2.new(0.5, -150, 0.4, 0)
box.Text = ""
box.PlaceholderText = "Digite a Key..."
box.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
box.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", box).CornerRadius = UDim.new(0, 10)

local btnV = Instance.new("TextButton", keyFrame)
btnV.Size = UDim2.new(0, 300, 0, 45)
btnV.Position = UDim2.new(0.5, -150, 0.65, 0)
btnV.Text = "VERIFICAR"
btnV.BackgroundColor3 = Color3.fromRGB(0, 180, 0)
btnV.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", btnV).CornerRadius = UDim.new(0, 10)

-- MENU PRINCIPAL (Escondido)
local main = Instance.new("Frame", sg)
main.Size = UDim2.new(0, 420, 0, 280)
main.Position = UDim2.new(0.5, -210, 0.5, -140)
main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
main.Visible = false
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 10)

-- ABAS LATERAIS FIXAS
local side = Instance.new("Frame", main)
side.Size = UDim2.new(0, 110, 1, -10)
side.Position = UDim2.new(0, 5, 0, 5)
side.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Instance.new("UICorner", side).CornerRadius = UDim.new(0, 10)

local cont = Instance.new("Frame", main)
cont.Size = UDim2.new(1, -125, 1, -10)
cont.Position = UDim2.new(0, 120, 0, 5)
cont.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Instance.new("UICorner", cont).CornerRadius = UDim.new(0, 10)

-- PAGINAS
local pP = Instance.new("Frame", cont); pP.Size = UDim2.new(1,0,1,0); pP.BackgroundTransparency = 1; pP.Visible = true
local pD = Instance.new("Frame", cont); pD.Size = UDim2.new(1,0,1,0); pD.BackgroundTransparency = 1; pD.Visible = false
local pK = Instance.new("Frame", cont); pK.Size = UDim2.new(1,0,1,0); pK.BackgroundTransparency = 1; pK.Visible = false

-- TEXTOS
local dL = Instance.new("TextLabel", pD); dL.Size = UDim2.new(1,0,1,0); dL.Text = "DISCORD:\ndiscord.gg/SABHUB"; dL.TextColor3 = Color3.new(1,1,1); dL.BackgroundTransparency = 1
local kL = Instance.new("TextLabel", pK); kL.Size = UDim2.new(1,0,1,0); kL.Text = "KEY:\nDark123"; kL.TextColor3 = Color3.new(1,1,1); kL.BackgroundTransparency = 1

-- BOTOES DE NAVEGAÇÃO
local function criarBotao(nome, y, pag)
    local b = Instance.new("TextButton", side)
    b.Size = UDim2.new(0, 100, 0, 35)
    b.Position = UDim2.new(0, 5, 0, y)
    b.Text = nome
    b.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    b.TextColor3 = Color3.new(1,1,1)
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 10)
    b.MouseButton1Click:Connect(function()
        pP.Visible = false; pD.Visible = false; pK.Visible = false
        pag.Visible = true
    end)
end

criarBotao("PLAYER", 10, pP)
criarBotao("DISCORD", 50, pD)
criarBotao("KEY INFO", 90, pK)

-- BOTÃO DB
local db = Instance.new("TextButton", sg)
db.Size = UDim2.new(0, 55, 0, 55); db.Position = UDim2.new(0, 10, 0.5, 0); db.Text = "DB"; db.BackgroundColor3 = Color3.new(0,0,0); db.TextColor3 = Color3.new(1,1,1); db.ZIndex = 100
Instance.new("UICorner", db).CornerRadius = UDim.new(0, 10)
db.MouseButton1Click:Connect(function() if not keyFrame.Parent then main.Visible = not main.Visible end end)

-- VERIFICAÇÃO
btnV.MouseButton1Click:Connect(function()
    if box.Text == SENHA then
        keyFrame:Destroy()
        main.Visible = true
    else
        box.Text = ""; box.PlaceholderText = "ERRO!"
    end
end)

-- NOCLIP SIMPLES NO PLAYER
local nB = Instance.new("TextButton", pP)
nB.Size = UDim2.new(0, 200, 0, 45); nB.Position = UDim2.new(0.5, -100, 0.1, 0); nB.Text = "NOCLIP: OFF"; nB.BackgroundColor3 = Color3.fromRGB(150,0,0); nB.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", nB).CornerRadius = UDim.new(0, 10)

nB.MouseButton1Click:Connect(function()
    noclip = not noclip
    nB.Text = noclip and "NOCLIP: ON" or "NOCLIP: OFF"
    nB.BackgroundColor3 = noclip and Color3.fromRGB(0, 180, 0) or Color3.fromRGB(150, 0, 0)
end)

game:GetService("RunService").Stepped:Connect(function()
    if noclip and lp.Character then
        for _, v in pairs(lp.Character:GetDescendants()) do
            if v:IsA("BasePart") then v.CanCollide = false end
        end
    end
end)
