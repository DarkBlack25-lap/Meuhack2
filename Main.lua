--[[ 
    SAB HUB V14 - SENHA: Dark123 + CORREÇÃO DE ABAS
]]

local p = game.Players.LocalPlayer
local sg = Instance.new("ScreenGui", p:WaitForChild("PlayerGui"))
sg.Name = "SAB_HUB_ULTRA_V14"
sg.ResetOnSpawn = false

-- Configurações
local SENHA_CORRETA = "Dark123" -- <--- SENHA ATUALIZADA
local noclip = false
local flying = false

-- Função para arredondar
local function round(inst)
    local corner = Instance.new("UICorner", inst)
    corner.CornerRadius = UDim.new(0, 10)
end

-- Função RGB
local function aplicarRGB(inst)
    spawn(function()
        while task.wait() do
            local hue = tick() % 5 / 5
            inst.BackgroundColor3 = Color3.fromHSV(hue, 1, 1)
        end
    end)
end

-- JANELA DE KEY
local keyFrame = Instance.new("Frame", sg)
keyFrame.Size, keyFrame.Position = UDim2.new(0, 320, 0, 180), UDim2.new(0.5, -160, 0.5, -90)
keyFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
keyFrame.ZIndex = 20
