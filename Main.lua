--[[ 
    SAB HUB V26 - FIX DEFINITIVO (SEM NIL VALUE / SEM TABLE ERRORS)
]]

task.wait(1) -- Resolve o erro de 'nil value' no carregamento do Delta

local lp = game:GetService("Players").LocalPlayer
local sg = Instance.new("ScreenGui", lp:WaitForChild("PlayerGui"))
sg.Name = "SAB_HUB_V26"
sg.ResetOnSpawn = false

local SENHA_CORRETA = "Dark123"
local noclip = false

-- Funções Básicas
local function round(i) Instance.new("UICorner", i).CornerRadius = UDim.new(0, 10) end
local function rgb(i)
    task.spawn(function()
        while i and i.Parent do
            i.BackgroundColor3 = Color3.fromHSV(tick() % 5 / 5, 1, 1)
            task.wait()
        end
    end)
end

-- TELA DE KEY (420x280)
local key = Instance.new("Frame", sg)
key.Size = UDim2.new(0, 420, 0, 280)
key.Position = UDim2.new(0.5, -210, 0.5, -140)
key.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
key.ZIndex = 10
round(key)

local bKey = Instance.new("Frame", key)
bKey.Size = UDim2.new(1, 4, 1, 4)
bKey.Position = UDim2.new(0, -2, 0, -2)
bKey.ZIndex = 9
round(bKey)
rgb(bKey)

local box = Instance.new("TextBox", key)
box.Size = UDim2.new(0, 300, 0, 45)
box.Position = UDim2.new(0.5, -150, 0.35, 0)
box.PlaceholderText = "Digite a Key..."
box.Text = ""
box.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
box.TextColor3 = Color3.new(1,1,1)
round(box)

local btnV = Instance.new("TextButton", key)
btnV.Size = UDim2.new(0, 300, 0, 45)
btnV.Position = UDim2.new(0.5, -150, 0.6, 0)
btnV.Text = "VERIFICAR"
btnV.BackgroundColor3 = Color3.fromRGB(0, 180, 0)
btnV.TextColor3 = Color3.new(1, 1, 1)
round(btnV)

-- MENU PRINCIPAL (420x280)
local menu = Instance.new("Frame", sg)
menu.Size = UDim2.new(0, 420, 0, 280)
menu.Position = UDim2.new(0.5, -210, 0.5, -140)
menu.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
menu.Visible = false
round(menu)

local bMenu = Instance.new("Frame", menu)
bMenu.Size = UDim2.new(1, 4, 1, 4)
bMenu.Position = UDim2.new(0, -2, 0, -2)
round(bMenu)
rgb(bMenu)

-- Estrutura de Abas
local side = Instance.new("Frame", menu)
side.Size = UDim2.new(0, 110, 1, -10)
side.Position = UDim2.new(0, 5, 0, 5)
side.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
round(side)

local cont = Instance.new("Frame", menu)
cont.Size = UDim2.new(1, -125, 1, -10)
cont.Position = UDim2.new(0, 120, 0, 5)
cont.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
round(cont)

-- Páginas
local pP = Instance.new("ScrollingFrame", cont); pP.Size = UDim2.new(1,0,1,0); pP.BackgroundTransparency = 1; pP.Visible = true; pP.ScrollBarThickness = 0
local pD = Instance.new("Frame", cont); pD.Size = UDim2.new(1,0,1,0); pD.BackgroundTransparency = 1; pD.Visible = false
local pK = Instance.new("Frame", cont); pK.Size = UDim2.new(1,0,1,0); pK.BackgroundTransparency = 1; pK.Visible = false

-- Conteúdo Discord/Key
local dL = Instance.new("TextLabel", pD); dL.Size = UDim2.new(1,0,1,0); dL.Text = "DISCORD:\ndiscord.gg/SABHUB"; dL.TextColor3 = Color3.new(1,1,1); dL.BackgroundTransparency = 1
local kL = Instance.new("TextLabel", pK); kL.Size = UDim2.new(1,0,1,0); kL.Text = "KEY ATUAL:\nDark123"; kL.TextColor3 = Color3.new(1,1,1); kL.BackgroundTransparency = 1

-- Lógica das Abas (Fix Definitive)
local function setAba(txt, y, pag)
    local b = Instance.new("TextButton", side)
    b.Size = UDim2.new(0, 100, 0, 35)
    b.Position = UDim2.new(0, 5, 0, y)
    b.Text = txt
    b.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    b.TextColor3 = Color3.new(1, 1, 1)
    round(b)
    b.MouseButton1Click:Connect(function()
        pP.Visible = false; pD.Visible = false; pK.Visible = false
        pag.Visible = true
    end)
end

setAba("PLAYER", 10, pP)
setAba("DISCORD", 50, pD)
setAba("KEY INFO", 90, pK)

-- Botão DB (Abre/Fecha)
local db = Instance.new("TextButton", sg)
db.Size = UDim2.new(0, 55, 0, 55); db.Position = UDim2.new(0, 10, 0.5, 0); db.Text = "DB"; db.ZIndex = 100; round(db)
local bDB = Instance.new("Frame", db); bDB.Size = UDim2.new(1,6,1,6); bDB.Position = UDim2.new(0,-3,0,-3); bDB.ZIndex = 99; round(bDB); rgb(bDB)

db.MouseButton1Click:Connect(function() if not key.Parent then menu.Visible = not menu.Visible end end)

-- Verificação da Senha
btnV.MouseButton1Click:Connect(function()
    if box.Text == SENHA_CORRETA then
        key:Destroy()
        menu.Visible = true
    else
        box.Text = ""
        box.PlaceholderText = "SENHA INCORRETA!"
    end
end)

-- Toggle Noclip
local nF = Instance.new("Frame", pP); nF.Size = UDim2.new(1, -10, 0, 45); nF.Position = UDim2.new(0, 5, 0, 10); nF.BackgroundColor3 = Color3.fromRGB(35, 35, 35); round(nF)
local nL = Instance.new("TextLabel", nF); nL.Size = UDim2.new(0.6, 0, 1, 0); nL.Text = "NOCLIP"; nL.TextColor3 = Color3.new(1, 1, 1); nL.BackgroundTransparency = 1
local nB = Instance.new("TextButton", nF); nB.Size = UDim2.new(0, 40, 0, 20); nB.Position = UDim2.new(0.8, 0, 0.25, 0); nB.Text = ""; nB.BackgroundColor3 = Color3.fromRGB(150, 0, 0); round(nB)

nB.MouseButton1Click:Connect(function()
    noclip = not noclip
    nB.BackgroundColor3 = noclip and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(150, 0, 0)
end)

game:GetService("RunService").Stepped:Connect(function()
    if noclip and lp.Character then
        for _, v in pairs(lp.Character:GetDescendants()) do
            if v:IsA("BasePart") then v.CanCollide = false end
        end
    end
end)
