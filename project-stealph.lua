print("Script carregado com sucesso!")

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

-- Certifique-se de ter a biblioteca Drawing
local Drawing = Drawing ou require("Drawing")

local aimbotEnabled = false
local espEnabled = true
local aimAtHead = true -- Padrão para mirar na cabeça

local function createESP(player)
    if player == LocalPlayer então return end
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
        if player.Character and player.Character:FindFirstChild("Highlight") então
            player.Character.Highlight.Enabled = espEnabled
        end
    end
end

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        if espEnabled então
            createESP(player)
        end
    end)
end)

for _, player in pairs(Players:GetPlayers()) do
    if player.Character então
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
    local MoreFunctionsButton = Instance.new("TextButton")

    ScreenGui.Parent = game.CoreGui

    MainFrame.Parent = ScreenGui
    MainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    MainFrame.Position = UDim2.new(0, 50, 0, 100)
    MainFrame.Size = UDim2.new(0, 400, 0, 350)
    MainFrame.BorderSizePixel = 2
    MainFrame.BorderColor3 = Color3.fromRGB(170, 0, 255)
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
    Title.Size = UDim2.new(1, 0, 0, 60)
    Title.Font = Enum.Font.GothamBlack -- Fonte mais grossa possível
    Title.Text = "Project Aim"
    Title.TextColor3 = Color3.fromRGB(170, 0, 255)
    Title.TextSize = 36

        ToggleAimbotButton.Parent = MainFrame
    ToggleAimbotButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    ToggleAimbotButton.Position = UDim2.new(0, 20, 0, 80)
    ToggleAimbotButton.Size = UDim2.new(0, 350, 0, 60)
    ToggleAimbotButton.Font = Enum.Font.SourceSansBold
    ToggleAimbotButton.Text = "Aimbot"
    ToggleAimbotButton.TextColor3 = Color3.fromRGB(170, 0, 255)
    ToggleAimbotButton.TextSize = 24
    local UICornerAimbotButton = Instance.new("UICorner")
    UICornerAimbotButton.CornerRadius = UDim.new(0, 10)
    UICornerAimbotButton.Parent = ToggleAimbotButton

    ToggleESPButton.Parent = MainFrame
    ToggleESPButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    ToggleESPButton.Position = UDim2.new(0, 20, 0, 150)
    ToggleESPButton.Size = UDim2.new(0, 350, 0, 60)
    ToggleESPButton.Font = Enum.Font.SourceSansBold
    ToggleESPButton.Text = "ESP"
    ToggleESPButton.TextColor3 = Color3.fromRGB(170, 0, 255)
    ToggleESPButton.TextSize = 24
    local UICornerESPButton = Instance.new("UICorner")
    UICornerESPButton.CornerRadius = UDim.new(0, 10)
    UICornerESPButton.Parent = ToggleESPButton

    AimAtHeadButton.Parent = MainFrame
    AimAtHeadButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    AimAtHeadButton.Position = UDim2.new(0, 20, 0, 220)
    AimAtHeadButton.Size = UDim2.new(0, 160, 0, 60)
    AimAtHeadButton.Font = Enum.Font.SourceSansBold
    AimAtHeadButton.Text = "Aim In Head"
    AimAtHeadButton.TextColor3 = Color3.fromRGB(170, 0, 255)
    AimAtHeadButton.TextSize = 24
    local UICornerAimAtHeadButton = Instance.new("UICorner")
    UICornerAimAtHeadButton.CornerRadius = UDim.new(0, 10)
    UICornerAimAtHeadButton.Parent = AimAtHeadButton

    AimAtTorsoButton.Parent = MainFrame
    AimAtTorsoButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    AimAtTorsoButton.Position = UDim2.new(0, 210, 0, 220)
    AimAtTorsoButton.Size = UDim2.new(0, 160, 0, 60)
    AimAtTorsoButton.Font = Enum.Font.SourceSansBold
    AimAtTorsoButton.Text = "Aim In Torso"
    AimAtTorsoButton.TextColor3 = Color3.fromRGB(170, 0, 255)
    AimAtTorsoButton.TextSize = 24
    local UICornerAimAtTorsoButton = Instance.new("UICorner")
    UICornerAimAtTorsoButton.CornerRadius = UDim.new(0, 10)
    UICornerAimAtTorsoButton.Parent = AimAtTorsoButton

        MoreFunctionsButton.Parent = MainFrame
    MoreFunctionsButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    MoreFunctionsButton.Position = UDim2.new(0, 20, 0, 290)
    MoreFunctionsButton.Size = UDim2.new(0, 350, 0, 60)
    MoreFunctionsButton.Font = Enum.Font.SourceSansBold
    MoreFunctionsButton.Text = "More Functions"
    MoreFunctionsButton.TextColor3 = Color3.fromRGB(170, 0, 255)
    MoreFunctionsButton.TextSize = 24
    local UICornerMoreFunctionsButton = Instance.new("UICorner")
    UICornerMoreFunctionsButton.CornerRadius = UDim.new(0, 10)
    UICornerMoreFunctionsButton.Parent = MoreFunctionsButton

    -- Funções para os botões
    local function toggleAimbot()
        aimbotEnabled = not aimbotEnabled
        ToggleAimbotButton.Text = aimbotEnabled and "Aimbot: ON" or "Aimbot: OFF"
    end

    local function setAimAtHead()
        aimAtHead = true
        AimAtHeadButton.Text = "Aim In Head (selected)"
        AimAtTorsoButton.Text = "Aim In Torso"
    end

    local function setAimAtTorso()
        aimAtHead = false
        AimAtTorsoButton.Text = "Aim In Torso (selected)"
        AimAtHeadButton.Text = "Aim In Head"
    end

        MoreFunctionsButton.Parent = MainFrame
    MoreFunctionsButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    MoreFunctionsButton.Position = UDim2.new(0, 20, 0, 290)
    MoreFunctionsButton.Size = UDim2.new(0, 350, 0, 60)
    MoreFunctionsButton.Font = Enum.Font.SourceSansBold
    MoreFunctionsButton.Text = "More Functions"
    MoreFunctionsButton.TextColor3 = Color3.fromRGB(170, 0, 255)
    MoreFunctionsButton.TextSize = 24
    local UICornerMoreFunctionsButton = Instance.new("UICorner")
    UICornerMoreFunctionsButton.CornerRadius = UDim.new(0, 10)
    UICornerMoreFunctionsButton.Parent = MoreFunctionsButton

    -- Funções para os botões
    local function toggleAimbot()
        aimbotEnabled = not aimbotEnabled
        ToggleAimbotButton.Text = aimbotEnabled and "Aimbot: ON" or "Aimbot: OFF"
    end

    local function setAimAtHead()
        aimAtHead = true
        AimAtHeadButton.Text = "Aim In Head (selected)"
        AimAtTorsoButton.Text = "Aim In Torso"
    end

    local function setAimAtTorso()
        aimAtHead = false
        AimAtTorsoButton.Text = "Aim In Torso (selected)"
        AimAtHeadButton.Text = "Aim In Head"
    end

    ToggleAimbotButton.MouseButton1Click:Connect(toggleAimbot)
    ToggleESPButton.MouseButton1Click:Connect(toggleESP)
    AimAtHeadButton.MouseButton1Click:Connect(setAimAtHead)
    AimAtTorsoButton.MouseButton1Click:Connect(setAimAtTorso)
    MoreFunctionsButton.MouseButton1Click:Connect(function()
        MainFrame.Visible = false
        createMoreFunctionsGui()
    end)

    -- Suporte a dispositivos móveis
    ToggleAimbotButton.TouchTap:Connect(toggleAimbot)
    ToggleESPButton.TouchTap:Connect(toggleESP)
    AimAtHeadButton.TouchTap:Connect(setAimAtHead)
    AimAtTorsoButton.TouchTap:Connect(setAimAtTorso)
    MoreFunctionsButton.TouchTap:Connect(function()
        MainFrame.Visible = false
        createMoreFunctionsGui()
    end)

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
            local targetPart = aimAtHead and player.Character:FindFirstChild("Head") or player.Character:FindFirstChild("UpperTorso")
            if targetPart then
                local targetPosition = targetPart.Position
                local targetScreenPos, onScreen = workspace.CurrentCamera:WorldToScreenPoint(targetPosition)
                local mouseLocation = UserInputService:GetMouseLocation()
                local distance = (Vector2.new(targetScreenPos.X, targetScreenPos.Y) - mouseLocation).Magnitude

                if distance < shortestDistance então
                    closestPlayer = player
                    shortestDistance = distance
                end
            end
        end
    end

    return closestPlayer
end

RunService.RenderStepped:Connect(function()
    if aimbotEnabled então
        local target = getClosestPlayerToCursor()
        if target and target.Character então
            local aimPosition
            if aimAtHead então
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

local function createMoreFunctionsGui()
    local MoreFunctionsGui = Instance.new("ScreenGui")
    local MoreFunctionsFrame = Instance.new("Frame")
    local BackButton = Instance.new("TextButton")
    local CarListFrame = Instance.new("ScrollingFrame")
    local TitleMoreFunctions = Instance.new("TextLabel")

    MoreFunctionsGui.Parent = game.CoreGui

    MoreFunctionsFrame.Parent = MoreFunctionsGui
    MoreFunctionsFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    MoreFunctionsFrame.Position = UDim2.new(0, 50, 0, 100)
    MoreFunctionsFrame.Size = UDim2.new(0, 400, 0, 400)
    MoreFunctionsFrame.BorderSizePixel = 2
    MoreFunctionsFrame.BorderColor3 = Color3.fromRGB(170, 0, 255)
    MoreFunctionsFrame.Active = true
    MoreFunctionsFrame.Draggable = true

    local UICornerMoreFunctionsFrame = Instance.new("UICorner")
    UICornerMoreFunctionsFrame.CornerRadius = UDim.new(0, 10)
    UICornerMoreFunctionsFrame.Parent = MoreFunctionsFrame

    BackButton.Parent = MoreFunctionsFrame
    BackButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    BackButton.Position = UDim2.new(0, 20, 0, 320)
    BackButton.Size = UDim2.new(0, 350, 0, 60)
    BackButton.Font = Enum.Font.SourceSansBold
    BackButton.Text = "Back"
    BackButton.TextColor3 = Color3.fromRGB(170, 0, 255)
    BackButton.TextSize = 24
    local UICornerBackButton = Instance.new("UICorner")
    UICornerBackButton.CornerRadius = UDim.new(0, 10)
    UICornerBackButton.Parent = BackButton

    CarListFrame.Parent = MoreFunctionsFrame
    CarListFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    CarListFrame.Position = UDim2.new(0, 20, 0, 80)
    CarListFrame.Size = UDim2.new(0, 350, 0, 220)
    CarListFrame.CanvasSize = UDim2.new(0, 0, 10, 0)
    CarListFrame.ScrollBarThickness = 10

    TitleMoreFunctions.Parent = MoreFunctionsFrame
    TitleMoreFunctions.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TitleMoreFunctions.BackgroundTransparency = 1
    TitleMoreFunctions.Size = UDim2.new(1, 0, 0, 60)
    TitleMoreFunctions.Font = Enum.Font.GothamBlack -- Fonte mais grossa possível
    TitleMoreFunctions.Text = "More Functions"
    TitleMoreFunctions.TextColor3 = Color3.fromRGB(170, 0, 255)
    TitleMoreFunctions.TextSize = 36

    -- Função para voltar ao painel principal
    BackButton.MouseButton1Click:Connect(function()
        MoreFunctionsGui:Destroy()
        MainFrame.Visible = true
    end)

    -- Função para listar carros e adicionar botão para ver localização
    local function listCars()
        local cars = game.Workspace:FindPartsInRegion3WithWhiteList(
            Region3.new(Vector3.new(-1000, -1000, -1000), Vector3.new(1000, 1000, 1000)),
            {game.Workspace.Vehicles},
            1000
        )
        for _, car in ipairs(cars) do
            if car:FindFirstChild("Seat") and not car.Seat.Occupant then
                local carButton = Instance.new("TextButton")
                carButton.Parent = CarListFrame
                carButton.Size = UDim2.new(1, 0, 0, 40)
                carButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                carButton.TextColor3 = Color3.fromRGB(170, 0, 255)
                carButton.Text = car.Name .. " - See Location"
                carButton.MouseButton1Click:Connect(function()
                    local camera = workspace.CurrentCamera
                    camera.CFrame = CFrame.new(camera.CFrame.Position, car.Position)
                end)
            end
        end
    end

    -- Verificar se estamos no jogo Ilha Bela Roleplay e listar carros
    if game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name == "Ilha Bela Roleplay" then
        listCars()
    end
end
