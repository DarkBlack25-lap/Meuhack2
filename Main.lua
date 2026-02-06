--[[ 
    SAB HUB V24 - FIX TOTAL PARA DELTA (SEM TABELAS)
]]

local lp = game:GetService("Players").LocalPlayer
local sg = Instance.new("ScreenGui", lp:WaitForChild("PlayerGui"))
sg.Name = "SAB_HUB_V24"
sg.ResetOnSpawn = false

local SENHA_CORRETA = "Dark123"
local noclip = false

-- Função de arredondar e RGB simplificadas para evitar erros
local function fix(inst) Instance.new("UICorner", inst).CornerRadius = UDim.new(0, 10) end
local function luz(inst)
    task.spawn(function()
        while inst and inst.Parent do
            inst.BackgroundColor3 = Color3.fromHSV(tick() % 5 / 5, 1, 1)
            task.wait()
        end
    end)
end

-- TELA DE KEY (420x280)
local key = Instance.new("Frame", sg)
key.Size = UDim2.new(0, 420, 0, 280)
key.Position = UDim2.new(0.5, -210, 0.5, -140)
key.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
key.ZIndex = 50
fix(key)

local bKey = Instance.new("Frame", key)
bKey.Size = UDim2.new(1, 4, 1, 4)
bKey.Position = UDim2.new(0, -2, 0, -2)
bKey.ZIndex = 49
fix(bKey)
luz(bKey)

local box = Instance.new("TextBox", key)
box.Size = UDim2.new(0, 300, 0, 45)
box.Position = UDim2.new(0.5, -150, 0.35, 0)
box.PlaceholderText = "Digite a Key..."
box.Text = ""
box.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
box.TextColor3 = Color3.new(1,1,1)
fix(box)

local btnV = Instance.new("TextButton", key)
btnV.Size = UDim2.new(0, 300, 0, 45)
btnV.Position = UDim2.new(0.5, -150, 0.6, 0)
btnV.Text = "VERIFICAR"
btnV.BackgroundColor3 = Color3.fromRGB(0, 180, 0)
btnV.TextColor3 = Color3.new(1,1,1)
fix(btnV)

-- MENU PRINCIPAL (420x280)
local menu = Instance.new("Frame", sg)
menu.Size = UDim2.new(0, 420, 0, 280)
menu.Position = UDim2.new(0.5, -210, 0.5, -140)
menu.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
menu.Visible = false
fix(menu)

local bMenu = Instance.new("Frame", menu)
bMenu.Size = UDim2.new(1, 4, 1, 4)
bMenu.Position = UDim2.new(0, -2, 0, -2)
fix(bMenu)
luz(bMenu)

-- CATEGORIAS (Discord e Key)
local side = Instance.new("Frame", menu)
side.Size = UDim2.new(0, 110, 1, -10)
side.Position = UDim2.new(0, 5, 0, 5)
side.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
fix(side)

local cont = Instance.new("Frame", menu)
cont.Size = UDim2.new(1, -125, 1, -10)
cont.Position = UDim2.new(0, 120, 0, 5)
cont.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
fix(cont)

-- PÁGINAS
local pP = Instance.new("ScrollingFrame", cont)
pP.Size = UDim2.new(1,0,1,0); pP.BackgroundTransparency = 1; pP.Visible = true; pP.ScrollBarThickness = 0

local pD = Instance.new("Frame", cont)
pD.Size = UDim2.new(1,0,1,0); pD.BackgroundTransparency = 1; pD.Visible = false
local dL = Instance.new("TextLabel", pD)
dL.Size = UDim2.new(1,0,1,0); dL.Text = "DISCORD:\ndiscord.gg/SABHUB"; dL.TextColor3 = Color3.new(1,1,1); dL.BackgroundTransparency = 1

local pK = Instance.new("Frame", cont)
pK.Size = UDim2.new(1,0,1,0); pK.BackgroundTransparency = 1; pK.Visible = false
local kL = Instance.new("TextLabel", pK)
kL.Size = UDim2.new(1,0,1,0); kL.Text = "KEY ATUAL:\nDark123"; kL.TextColor3 = Color3.new(1,1,1); kL.BackgroundTransparency = 1

-- BOTÕES DAS CATEGORIAS (Sem usar tabelas ou funções complexas)
local b1 = Instance.new("TextButton", side)
b1.Size = UDim2.new(0, 100, 0, 35); b1.Position = UDim2.new(0, 5, 0, 10); b1.Text = "PLAYER"; fix(b1)
b1.MouseButton1Click:Connect(function() pP.Visible = true; pD.Visible = false; pK.Visible = false end)

local b2 = Instance.new("TextButton", side)
b2.Size = UDim2.new(0, 100, 0, 35); b2.Position = UDim2.new(0, 5, 0, 50); b2.Text = "DISCORD"; fix(b2)
b2.MouseButton1Click:Connect(function() pP.Visible = false; pD.Visible = true; pK.Visible = false end)

local b3 = Instance.new("TextButton", side)
b3.Size = UDim2.new(0, 100, 0, 35); b3.Position = UDim2.new(0, 5, 0, 90); b3.Text = "KEY INFO"; fix(b3)
b3.MouseButton1Click:Connect(function() pP.Visible = false; pD.Visible = false; pK.Visible = true end)

-- FUNÇÃO DE VERIFICAR (FIX DEFINITIVO)
btnV.MouseButton1Click:Connect(function()
    if box.Text == SENHA_CORRETA then
        key:Destroy()
        menu.Visible = true
    else
        box.Text = ""
        box.PlaceholderText = "SENHA ERRADA!"
    end
end)

-- BOTÃO DB (Luz RGB inclusa)
local db = Instance.new("TextButton", sg)
db.Size = UDim2.new(0, 55, 0, 55); db.Position = UDim2.new(0, 10, 0.5, 0); db.Text = "DB"; db.ZIndex = 100; fix(db)
local bDB = Instance.new("Frame", db); bDB.Size = UDim2.new(1,6,1,6); bDB.Position = UDim2.new(0,-3,0,-3); bDB.ZIndex = 99; fix(bDB); luz(bDB)

db.MouseButton1Click:Connect(function() if not key.Parent then menu.Visible = not menu.Visible end end)

-- TOGGLE NOCLIP SIMPLES
local tF = Instance.new("Frame", pP)
tF.Size = UDim2.new(0, 270, 0, 45); tF.Position = UDim2.new(0, 5, 0, 10); tF.BackgroundColor3 = Color3.fromRGB(35,35,35); fix(tF)
local tL = Instance.new("TextLabel", tF); tL.Size = UDim2.new(0.6,0,1,0); tL.Text = "ATRAVESSAR"; tL.TextColor3 = Color3.new(1,1,1); tL.BackgroundTransparency = 1
local tB = Instance.new("TextButton", tF
