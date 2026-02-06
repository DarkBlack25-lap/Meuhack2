-- Bloqueio contra erro de linha 1 (nil value)
repeat task.wait() until game:IsLoaded()
task.wait(0.5)

local lp = game:GetService("Players").LocalPlayer
local sg = Instance.new("ScreenGui", lp:WaitForChild("PlayerGui"))
sg.Name = "DarkBlack_Final"; sg.ResetOnSpawn = false

local SENHA = "Dark123"
local noclip = false

-- 1. LOGIN (Borda Vermelha)
local login = Instance.new("Frame", sg)
login.Size = UDim2.new(0, 250, 0, 320); login.Position = UDim2.new(0.5, -125, 0.5, -160); login.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
local lStroke = Instance.new("UIStroke", login); lStroke.Color = Color3.fromRGB(255, 0, 0); lStroke.Thickness = 2
Instance.new("UICorner", login).CornerRadius = UDim.new(0, 10)

local titleL = Instance.new("TextLabel", login)
titleL.Size = UDim2.new(1, 0, 0, 40); titleL.Text = "DᴀʀᴋBʟᴀᴄᴋ Hub"; titleL.TextColor3 = Color3.fromRGB(255, 0, 0); titleL.BackgroundTransparency = 1; titleL.Font = Enum.Font.Code; titleL.TextSize = 22

local keyBox = Instance.new("TextBox", login)
keyBox.Size = UDim2.new(0, 200, 0, 40); keyBox.Position = UDim2.new(0.5, -100, 0.35, 0); keyBox.PlaceholderText = "Insira a Key..."; keyBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40); keyBox.TextColor3 = Color3.new(1,1,1); Instance.new("UICorner", keyBox)

local verify = Instance.new("TextButton", login)
verify.Size = UDim2.new(0, 180, 0, 45); verify.Position = UDim2.new(0.5, -90, 0.65, 0); verify.Text = "Verificar Key"; verify.BackgroundColor3 = Color3.fromRGB(35, 35, 35); verify.TextColor3 = Color3.new(1,1,1)
local bGlow = Instance.new("UIStroke", verify); bGlow.Color = Color3.fromRGB(0, 150, 255); bGlow.Thickness = 2; bGlow.ApplyStrokeMode = "Border"
Instance.new("UICorner", verify)

-- 2. MENU PRINCIPAL (Bordas Vermelhas)
local main = Instance.new("Frame", sg)
main.Size = UDim2.new(0, 220, 0, 350); main.Position = UDim2.new(0.5, -110, 0.5, -175); main.BackgroundColor3 = Color3.fromRGB(15, 15, 15); main.Visible = false
local mStroke = Instance.new("UIStroke", main); mStroke.Color = Color3.fromRGB(255, 0, 0); mStroke.Thickness = 2
Instance.new("UICor
