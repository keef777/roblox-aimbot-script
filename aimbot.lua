print("Script carregado com sucesso!")

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

-- Certifique-se de ter a biblioteca Drawing
local Drawing = Drawing or require("Drawing")

local aimbotEnabled = false
local espEnabled = true
local aimAtHead = true -- Padrão para mirar na cabeça

local function createESP(player)
    if player == LocalPlayer then return end
    local highlight = Instance.new("Highlight")
    highlight.Adornee = player.Character
    highlight.FillColor = Color3.new(1, 0, 0)
    highlight.FillTransparency = 0.5
    highlight.OutlineTransparency = 0
    highlight.Parent = player.Character
    return highlight
end

local function toggleESP()
    espEnabled = not espEnabled
    for _, player in pairs(Players:GetPlayers()) do
        if player.Character and player.Character:FindFirstChild("Highlight") then
            player.Character.Highlight.Enabled = espEnabled
        end
    end
end

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        if espEnabled then
            createESP(player)
        end
    end)
end)

for _, player in pairs(Players:GetPlayers()) do
    if player.Character then
        createESP(player)
    end
end

local function createGui()
    local ScreenGui = Instance.new("ScreenGui")
    local MainFrame = Instance.new("Frame")
    local LogoButton = Instance.new("TextButton")
    local ToggleAimbotButton = Instance.new("TextButton")
    local ToggleESPButton = Instance.new("TextButton")
    local AimAtHeadButton = Instance.new("TextButton")
    local AimAtTorsoButton = Instance.new("TextButton")
    local Title = Instance.new("TextLabel")

    ScreenGui.Parent = game.CoreGui

    MainFrame.Parent = ScreenGui
    MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    MainFrame.Position = UDim2.new(0, 50, 0, 100)
    MainFrame.Size = UDim2.new(0, 450, 0, 350)
    MainFrame.BorderSizePixel = 0
    MainFrame.BackgroundTransparency = 0 -- Fundo preto
    MainFrame.Active = true
    MainFrame.Draggable = true

    local UICornerMainFrame = Instance.new("UICorner")
    UICornerMainFrame.CornerRadius = UDim.new(0, 10)
    UICornerMainFrame.Parent = MainFrame

    LogoButton.Parent = ScreenGui
    LogoButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    LogoButton.Position = UDim2.new(0, 10, 0, 10)
    LogoButton.Size = UDim2.new(0, 50, 0, 50) -- Tamanho reduzido
    LogoButton.Text = ""
    LogoButton.Draggable = true
    local UICornerLogo = Instance.new("UICorner")
    UICornerLogo.CornerRadius = UDim.new(0, 25)
    UICornerLogo.Parent = LogoButton

        Title.Parent = MainFrame
    Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Title.BackgroundTransparency = 1
    Title.Size = UDim2.new(1, 0, 0, 50)
    Title.Font = Enum.Font.SourceSansBold
    Title.Text = "Painel de Controle"
    Title.TextColor3 = Color3.fromRGB(170, 0, 255)
    Title.TextSize = 24

    ToggleAimbotButton.Parent = MainFrame
    ToggleAimbotButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    ToggleAimbotButton.Position = UDim2.new(0, 20, 0, 60)
    ToggleAimbotButton.Size = UDim2.new(0, 350, 0, 50)
    ToggleAimbotButton.Font = Enum.Font.SourceSansBold
    ToggleAimbotButton.Text = "Toggle Aimbot"
    ToggleAimbotButton.TextColor3 = Color3.fromRGB(170, 0, 255)
    ToggleAimbotButton.TextSize = 18
    local UICornerAimbotButton = Instance.new("UICorner")
    UICornerAimbotButton.CornerRadius = UDim.new(0, 10)
    UICornerAimbotButton.Parent = ToggleAimbotButton

    ToggleESPButton.Parent = MainFrame
    ToggleESPButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    ToggleESPButton.Position = UDim2.new(0, 20, 0, 120)
    ToggleESPButton.Size = UDim2.new(0, 350, 0, 50)
    ToggleESPButton.Font = Enum.Font.SourceSansBold
    ToggleESPButton.Text = "Toggle ESP"
    ToggleESPButton.TextColor3 = Color3.fromRGB(170, 0, 255)
    ToggleESPButton.TextSize = 18
    local UICornerESPButton = Instance.new("UICorner")
    UICornerESPButton.CornerRadius = UDim.new(0, 10)
    UICornerESPButton.Parent = ToggleESPButton

    AimAtHeadButton.Parent = MainFrame
    AimAtHeadButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    AimAtHeadButton.Position = UDim2.new(0, 20, 0, 180)
    AimAtHeadButton.Size = UDim2.new(0, 160, 0, 50)
    AimAtHeadButton.Font = Enum.Font.SourceSansBold
    AimAtHeadButton.Text = "Aim at Head"
    AimAtHeadButton.TextColor3 = Color3.fromRGB(170, 0, 255)
    AimAtHeadButton.TextSize = 18
    local UICornerAimAtHeadButton = Instance.new("UICorner")
    UICornerAimAtHeadButton.CornerRadius = UDim.new(0, 10)
    UICornerAimAtHeadButton.Parent = AimAtHeadButton

    AimAtTorsoButton.Parent = MainFrame
    AimAtTorsoButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    AimAtTorsoButton.Position = UDim2.new(0, 210, 0, 180)
    AimAtTorsoButton.Size = UDim2.new(0, 160, 0, 50)
    AimAtTorsoButton.Font = Enum.Font.SourceSansBold
    AimAtTorsoButton.Text = "Aim at Torso"
    AimAtTorsoButton.TextColor3 = Color3.fromRGB(170, 0, 255)
    AimAtTorsoButton.TextSize = 18
    local UICornerAimAtTorsoButton = Instance.new("UICorner")
    UICornerAimAtTorsoButton.CornerRadius = UDim.new(0, 10)
    UICornerAimAtTorsoButton.Parent = AimAtTorsoButton

        -- Funções para os botões
    local function toggleAimbot()
        aimbotEnabled = not aimbotEnabled
        ToggleAimbotButton.Text = aimbotEnabled and "Aimbot: ON" or "Aimbot: OFF"
    end

    local function setAimAtHead()
        aimAtHead = true
        AimAtHeadButton.Text = "Aim at Head (selected)"
        AimAtTorsoButton.Text = "Aim at Torso"
    end

    local function setAimAtTorso()
        aimAtHead = false
        AimAtTorsoButton.Text = "Aim at Torso (selected)"
        AimAtHeadButton.Text = "Aim at Head"
    end

    ToggleAimbotButton.MouseButton1Click:Connect(toggleAimbot)
    ToggleESPButton.MouseButton1Click:Connect(toggleESP)
    AimAtHeadButton.MouseButton1Click:Connect(setAimAtHead)
    AimAtTorsoButton.MouseButton1Click:Connect(setAimAtTorso)

    -- Suporte a dispositivos móveis
    ToggleAimbotButton.TouchTap:Connect(toggleAimbot)
    ToggleESPButton.TouchTap:Connect(toggleESP)
    AimAtHeadButton.TouchTap:Connect(setAimAtHead)
    AimAtTorsoButton.TouchTap:Connect(setAimAtTorso)

    -- Função para abrir e fechar o painel
    local function toggleMainFrame()
        MainFrame.Visible = not MainFrame.Visible
    end

    LogoButton.MouseButton1Click:Connect(toggleMainFrame)
    LogoButton.TouchTap:Connect(toggleMainFrame)
end

local function getClosestPlayerToCursor()
    local closestPlayer = nil
    local shortestDistance = math.huge

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local targetPart = player.Character:FindFirstChild("Head")
            if not aimAtHead then
                targetPart = player.Character:FindFirstChild("UpperTorso")
            end
            
            if targetPart then
                local targetPosition = targetPart.Position
                local targetScreenPos, onScreen = workspace.CurrentCamera:WorldToScreenPoint(targetPosition)
                local mouseLocation = UserInputService:GetMouseLocation()
                local distance = (Vector2.new(targetScreenPos.X, targetScreenPos.Y) - mouseLocation).Magnitude

                if distance < shortestDistance then
                    closestPlayer = player
                    shortestDistance = distance
                end
            end
        end
    end

    return closestPlayer
end

for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then
            local headPosition = player.Character.Head.Position
            local headScreenPos, onScreen = workspace.CurrentCamera:WorldToScreenPoint(headPosition)
            local mouseLocation = UserInputService:GetMouseLocation()
            local distance = (Vector2.new(headScreenPos.X, headScreenPos.Y) - mouseLocation).Magnitude

            if distance < shortestDistance then
                closestPlayer = player
                shortestDistance = distance
            end
        end
    end

    return closestPlayer
end

RunService.RenderStepped:Connect(function()
    if aimbotEnabled then
        local target = getClosestPlayerToCursor()
        if target and target.Character then
            local aimPosition
            if aimAtHead then
                aimPosition = target.Character.Head.Position
            else
                aimPosition = target.Character.UpperTorso.Position
            end

            local camera = workspace.CurrentCamera
            camera.CFrame = CFrame.new(camera.CFrame.Position, aimPosition)
            wait(5) -- Gruda no mesmo player por 5 segundos
        end
    end
end)

createGui()
print("Painel de controle criado.")
