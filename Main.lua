--[[ 
    SAB HUB V25 - VERSÃO ULTRA COMPATÍVEL (MÓVEL/DELTA)
]]

local lp = game:GetService("Players").LocalPlayer
local sg = Instance.new("ScreenGui", lp:WaitForChild("PlayerGui"))
sg.Name = "SAB_HUB_V25"
sg.ResetOnSpawn = false

local SENHA = "Dark123"
local noclip = false

-- Arredondar cantos (Simples)
local function round(i) Instance.new("UICorner", i).CornerRadius = UDim.new(0, 10) end

-- Luz RGB (Estável)
local function rgb(i)
    task.spawn(function()
        while i and i.Parent do
            i.BackgroundColor3 = Color3.fromHSV(tick() % 5 / 5, 1, 1)
            task.wait()
        end
    end)
end

-- TELA DE KEY (420x280)
local keyFrame = Instance.new("Frame", sg)
keyFrame.Size = UDim2.new(0, 420, 0, 280)
keyFrame.Position = UDim2.new(0.5, -210, 0.5, -140)
keyFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
keyFrame.ZIndex = 50
round(keyFrame)

local bKey = Instance.new("Frame", keyFrame)
bKey.Size = UDim2.new(1, 4, 1, 4)
bKey.Position = UDim2.new(0, -2, 0, -2)
bKey.ZIndex = 49
round(bKey)
rgb(bKey)

local box = Instance.new("TextBox", keyFrame)
box.Size = UDim2.new(0, 300, 0, 45)
box.Position = UDim2.new(0.5, -150, 0.4, 0)
box.Text = ""
box.PlaceholderText = "Digite a Key..."
box.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
box.TextColor3 = Color3.new(1, 1, 1)
box.ZIndex = 51
round(box)

local btnV = Instance.new("TextButton", keyFrame)
btnV.Size = UDim2.new(0, 300, 0, 45)
btnV.Position = UDim2.new(0.5, -150, 0.65, 0)
btnV.Text = "VERIFICAR"
btnV.BackgroundColor3 = Color3.fromRGB(0, 180, 0)
btnV.TextColor3 = Color3.new(1, 1, 1)
btnV.ZIndex = 51
round(btnV)

-- MENU PRINCIPAL (420x280)
local main = Instance.new("Frame", sg)
main.Size = UDim2.new(0, 420, 0, 280)
main.Position = UDim2.new(0.5, -210, 0.5, -140)
main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
main.Visible = false
round(main)

local bMain = Instance.new("Frame", main)
bMain.Size = UDim2.new(1, 4, 1, 4)
bMain.Position = UDim2.new(0, -2, 0, -2)
round(bMain)
rgb(bMain)

-- LATERAIS E CONTEÚDO
local side = Instance.new("Frame", main)
side.Size = UDim2.new(0, 110, 1, -10)
side.Position = UDim2.new(0, 5, 0, 5)
side.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
round(side)

local cont = Instance.new("Frame", main)
cont.Size = UDim2.new(1, -125, 1, -10)
cont.Position = UDim2.new(0, 120, 0, 5)
cont.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
round(cont)

-- PÁGINAS (PLAYER, DISCORD, KEY)
local pP = Instance.new("ScrollingFrame", cont)
pP.Size = UDim2.new(1,0,1,0); pP.BackgroundTransparency = 1; pP.Visible = true; pP.ScrollBarThickness = 0

local pD = Instance.new("Frame", cont)
pD.Size = UDim2.new(1,0,1,0); pD.BackgroundTransparency = 1; pD.Visible = false
local dL = Instance.new("TextLabel", pD)
dL.Size = UDim2.new(1,0,1,0); dL.Text = "DISCORD:\ndiscord.gg/SABHUB"; dL.TextColor3 = Color3.new(1,1,1); dL.BackgroundTransparency = 1

local pK = Instance.new("Frame", cont)
pK.Size = UDim2.new(1,0,1,0); pK.BackgroundTransparency = 1; pK.Visible = false
local kL = Instance.new("TextLabel", pK)
k
