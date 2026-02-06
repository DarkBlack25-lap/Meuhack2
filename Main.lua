-- TRAVA DE SEGURANÇA: Impede o erro 'nil value' da Linha 1
repeat task.wait() until game:IsLoaded()
task.wait(1.5)

local lp = game:GetService("Players").LocalPlayer
local sg = Instance.new("ScreenGui", lp:WaitForChild("PlayerGui"))
sg.Name = "SAB_HUB_FINAL_FIX"; sg.ResetOnSpawn = false

-- Variáveis que você pediu
local SENHA_REAL = "Dark123"
local noclipActive = false

-- TELA DE LOGIN (Retângulo curvo com abas Discord e Key)
local login = Instance.new("Frame", sg)
login.Size = UDim2.new(0, 450, 0, 300) -- Escrita UDim2 correta para não dar 'got table'
login.Position = UDim2.new(0.5, -225, 0.5, -150)
login.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Instance.new("UICorner", login).CornerRadius = UDim.new(0, 15)

-- Lateral Esquerda (Categorias)
local side = Instance.new("Frame", login)
side.Size = UDim2.new(0, 120, 1, -20); side.Position = UDim2.new(0, 10, 0, 10); side.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Instance.new("UICorner", side).CornerRadius = UDim.new(0, 10)

local bDisc = Instance.new("TextButton", side); bDisc.Size = UDim2.new(1,-10,0,40); bDisc.Position = UDim2.new(0,5,0,10); bDisc.Text = "Discord"
local bKeyT = Instance.new("TextButton", side); bKeyT.Size = UDim2.new(1,-10,0,40); bKeyT.Position = UDim2.new(0,5,0,60); bKeyT.Text = "Key"

-- Área da Key
local cont = Instance.new("Frame", login); cont.Size = UDim2.new(1,-150,1,-20); cont.Position = UDim2.new(0,140,0,10); cont.BackgroundTransparency = 1
local pD = Instance.new("TextButton", cont); pD.Size = UDim2.new(1,0,0,50); pD.Position = UDim2.new(0,0,0.4,0); pD.Text = "https://discord.gg/rdmNBDYQX"; pD.Visible = false; pD.BackgroundTransparency = 1; pD.TextColor3 = Color3.fromRGB(100,150,255)
local pK = Instance.new("Frame", cont); pK.Visible = true; pK.Size = UDim2.new(1,0,1,0); pK.BackgroundTransparency = 1
local kL = Instance.new("TextLabel", pK); kL.Size = UDim2.new(0,50,0,40); kL.Position = UDim2.new(0,0,0.4,0); kL.Text = "Key:"; kL.TextColor3 = Color3.new(1,1,1); kL.BackgroundTransparency = 1
local box = Instance.new("TextBox", pK); box.Size = UDim2.new(0,180,0,40); box.Position = UDim2.new(0,60,0.4,0); box.PlaceholderText = "Digite a chave..."; box.Text = ""
Instance.new("UICorner", box).CornerRadius = UDim.new(0, 8)

-- MENU DE HACKS
local main = Instance.new("Frame", sg)
main.Size = UDim2.new(0, 450, 0, 300); main.Position = UDim2.new(0.5, -225, 0.5, -150); main.BackgroundColor3 = Color3.fromRGB(20, 20, 20); main.Visible = false
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 15)

-- BOTÃO CÍRCULO DARKBLACK (Branco/Vermelho pulsante)
local circle = Instance.new("TextButton", sg)
circle.Size = UDim2.new(0, 80, 0, 80); circle.Position = UDim2.new(0, 20, 0.5, -40); circle.BackgroundColor3 = Color3.new(0, 0, 0); circle.Text = "DarkBlack"; circle.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", circle).CornerRadius = UDim.new(1, 0)
task.spawn(function() while true do circle.TextColor3 = Color3.new(1, 1, 1); task.wait(0.5); circle.TextColor3 = Color3.new(1, 0, 0); task.wait(0.5) end end)

-- FUNÇÃO DA PÍLULA (Design exato do seu texto)
local function createPill(parent, y, name, hasInp, callback)
    local f = Instance.new("Frame", parent); f.Size = UDim2.new(1,-10,0,45); f.Position = UDim2.new(0,5,0,y); f.BackgroundTransparency = 1
    local l = Instance.new("TextLabel", f); l.Size = UDim2.new(0,100,1,0); l.Text = name; l.TextColor3 = Color3.new(1,1,1); l.BackgroundTransparency = 1; l.TextXAlignment = "Left"
    local inp
    if hasInp then
        inp = Instance.new("TextBox", f); inp.Size = UDim2.new(0,50,0,30); inp.Position = UDim2.new(0,110,0.5,-15); inp.Text = (name == "velocidade" and "16" or "50"); Instance.new("UICorner", inp)
    end
    local pill = Instance.new("TextButton", f); pill.Size = UDim2.new(0,44,0,22); pill.Position = UDim2.new(1,-50,0.5,-11); pill.BackgroundColor3 = Color3.fromRGB(60,60,60); pill.Text = ""
    Instance.new("UICorner", pill).CornerRadius = UDim.new(1,0)
    local dot = Instance.new("Frame", pill); dot.Size = UDim2.new(0,18,0,18); dot.Position = UDim2.new(0,2,0.5,-9); dot.BackgroundColor3 = Color3.new(1,1,1); Instance.new("UICorner", dot).CornerRadius = UDim.new(1,0)
    local act = false
    pill.MouseButton1Click:Connect(function()
        act = not act
        dot:TweenPosition(act and UDim2.new(0,24,0.5,-9) or UDim2.new(0,2,0.5,-9), "Out", "Quad", 0.15)
        pill.BackgroundColor3 = act and Color3.fromRGB(0,200,0) or Color3.fromRGB(60,60,60)
        callback(act, inp and tonumber(inp.Text) or nil)
    end)
end

-- CATEGORIAS
local scroll = Instance.new("ScrollingFrame", main); scroll.Size = UDim2.new(1,-20,1,-20); scroll.Position = UDim2.new(0,10,0,10); scroll.BackgroundTransparency = 1; scroll.ScrollBarThickness = 0
Instance.new("TextLabel", scroll).Size = UDim2.new(1,0,0,30); scroll.TextLabel.Text = "Player"; scroll.TextLabel.TextColor3 = Color3.new(1,1,0); scroll.TextLabel.BackgroundTransparency = 1

createPill(scroll, 40, "velocidade", true, function(v, val) lp.Character.Humanoid.WalkSpeed = v and (val or 16) or 16 end)
createPill(scroll, 90, "noclip", false, function(v) noclipActive = v end)
createPill(scroll, 140, "Esp", false, function(v)
    for _, p in pairs(game.Players:GetPlayers()) do
        if p ~= lp and p.Character then
            if v then local h = Instance.new("Highlight", p.Character); h.Name = "SAB_ESP"; h.FillColor = Color3.fromHSV(math.random(),1,1)
            elseif p.Character:FindFirstChild("SAB_ESP") then p.Character.SAB_ESP:Destroy() end
        end
    end
end)
createPill(scroll, 190, "Fly", true, function(v, val) --[[ Voo ]] end)

for i=1, 2 do
    local d = Instance.new("TextLabel", scroll); d.Size = UDim2.new(1,0,0,40); d.Position = UDim2.new(0,0,0,230+(i*40)); d.Text = "desenvolvimento"; d.TextColor3 = Color3.new(0.5,0.5,0.5); d.BackgroundTransparency = 1
end

-- LÓGICA DE SENHA (Apaga se errar)
box.FocusLost:Connect(function()
    if box.Text == SENHA_REAL then login:Destroy(); main.Visible = true
    else box.Text = ""; box.PlaceholderText = "senha incorreta"; task.wait(1); box.PlaceholderText = "Digite a chave..." end
end)
bDisc.MouseButton1Click:Connect(function() pD.Visible = true; pK.Visible = false end)
bKeyT.MouseButton1Click:Connect(function() pD.Visible = false; pK.Visible = true end)
circle.MouseButton1Click:Connect(function() if not sg:FindFirstChild("Frame") then main.Visible = not main.Visible end end)

game:GetService("RunService").Stepped:Connect(function()
    if noclipActive and lp.Character then for _, v in pairs(lp.Character:GetDescendants()) do if v:IsA("BasePart") then v.CanCollide = false end end end
end)
