-- Proteção contra carregamento incompleto
repeat task.wait() until game:IsLoaded()
local lp = game:GetService("Players").LocalPlayer
local sg = Instance.new("ScreenGui", lp:WaitForChild("PlayerGui"))
sg.Name = "SAB_HUB_V4"; sg.ResetOnSpawn = false

local SENHA = "Dark123"
local noclip = false

-- TELA DE SENHA (Ajustada com Botão Verificar)
local login = Instance.new("Frame", sg)
login.Size = UDim2.new(0, 450, 0, 300); login.Position = UDim2.new(0.5, -225, 0.5, -150); login.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Instance.new("UICorner", login).CornerRadius = UDim.new(0, 15)

local box = Instance.new("TextBox", login)
box.Size = UDim2.new(0, 280, 0, 45); box.Position = UDim2.new(0.5, -140, 0.35, 0); box.PlaceholderText = "Digite a Key..."; box.Text = ""; box.BackgroundColor3 = Color3.fromRGB(35, 35, 35); box.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", box)

-- Botão Verificar Key com Brilho Azul
local verify = Instance.new("TextButton", login)
verify.Size = UDim2.new(0, 200, 0, 50); verify.Position = UDim2.new(0.5, -100, 0.65, 0); verify.Text = "Verificar Key"; verify.BackgroundColor3 = Color3.fromRGB(40, 40, 40); verify.TextColor3 = Color3.new(1,1,1); verify.Font = Enum.Font.SourceSansBold; verify.TextSize = 18
local glow = Instance.new("UIStroke", verify); glow.Color = Color3.fromRGB(0, 150, 255); glow.Thickness = 2.5; glow.ApplyStrokeMode = "Border"
Instance.new("UICorner", verify)

-- MENU PRINCIPAL (Com Categorias Laterais)
local main = Instance.new("Frame", sg)
