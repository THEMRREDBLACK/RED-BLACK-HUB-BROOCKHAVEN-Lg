local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local Lighting = game:GetService("Lighting")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local MarketplaceService = game:GetService("MarketplaceService")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")

local player = Players.LocalPlayer
local GAMEPASS_ID = 1662810084

-- Configurações Supabase
local SUPABASE_URL = "https://earkwbgfwvearvrrlsbx.supabase.co"
local SUPABASE_KEY = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVhcmt3Ymdmd3ZlYXJ2cnJsc2J4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODg5NzAxMDIsImV4cCI6MjEwNDU0NjEwMn0.hTpTVQ7gOFsp9qGeARqS5l4PX3nmyzPKQiu4nuA2_7U"
local currentHWID = RbxAnalyticsService:GetClientId()

local DISCORD_LINK = "https://discord.gg/ffuFGauPdS"
local YOUTUBE_LINK = "https://www.youtube.com/@THE_MR_RED_BLACK_SCRIPTS_OWNER"
local TIKTOK_LINK = "https://www.tiktok.com/@the_mr_red_black_owner"

-- Configuração de tempo: 5 minutos (300 segundos)
local ANNOUNCEMENT_INTERVAL = 300 
local WAIT_TIME = 3
local COUNTDOWN_TIME = 5

local SOCIAL_IMAGE = "rbxassetid://116836698110493"
local httpRequest = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request

-- Função de tratamento de Data ISO
local function parseIsoDate(isoDate)
	local year, month, day, hour, min, sec = isoDate:match("(%d+)-(%d+)-(%d+)T(%d+):(%d+):(%d+)")
	if year then
		return os.time({
			year = tonumber(year),
			month = tonumber(month),
			day = tonumber(day),
			hour = tonumber(hour),
			min = tonumber(min),
			sec = tonumber(sec)
		})
	end
	return os.time()
end

-- Função para checar se a KEY no Supabase está ativa e válida
local function checkKeyStatus()
	if not httpRequest then return false end

	local url = string.format("%s/rest/v1/verified_users?hwid=eq.%s&status=eq.verified&select=hwid,expires_at", SUPABASE_URL, currentHWID)
	local success, response = pcall(function()
		return httpRequest({
			Url = url,
			Method = "GET",
			Headers = {
				["apikey"] = SUPABASE_KEY,
				["Authorization"] = "Bearer " .. SUPABASE_KEY
			}
		})
	end)

	if success and response and response.StatusCode == 200 then
		local bodySuccess, decoded = pcall(function()
			return HttpService:JSONDecode(response.Body)
		end)
		if bodySuccess and type(decoded) == "table" and #decoded > 0 then
			local record = decoded[1]
			if record.expires_at then
				local expireTime = parseIsoDate(record.expires_at)
				local currentTime = os.time()
				if (expireTime - currentTime) > 0 then
					return true -- Key é Válida
				end
			else
				return true
			end
		end
	end
	return false
end

-- Função de Checagem Unificada (Gamepass OU Key Válida)
local function shouldDisableAds()
	-- 1. Checa Gamepass
	local passSuccess, hasPass = pcall(function()
		return MarketplaceService:UserOwnsGamePassAsync(player.UserId, GAMEPASS_ID)
	end)
	
	if passSuccess and hasPass then
		print("----------------------------------------")
		print("[RBH]: GAMEPASS ENCONTRADA! Anúncios desativados.")
		print("----------------------------------------")
		return true
	end

	-- 2. Checa Key Válida no Banco de Dados
	if checkKeyStatus() then
		print("----------------------------------------")
		print("[RBH]: KEY ATIVA ENCONTRADA! Anúncios desativados.")
		print("----------------------------------------")
		return true
	end

	return false
end

-- Cancela a execução dos Anúncios caso o jogador tenha Key ativa ou Gamepass
if shouldDisableAds() then
	return
end

-- Pool de Jogos Nostálgicos (2010 - 2023)
local NOSTALGIC_GAMES_POOL = {
	155615604,   -- Prison Life
	286090008,   -- Natural Disaster Survival
	230362888,   -- The Normal Elevator
	734159876,   -- SharkBite
	537413528,   -- Build A Boat For Treasure
	142823291,   -- Murder Mystery 2
	185655149,   -- Welcome to Bloxburg
	1378216323,  -- Speed Run 4
	192800,      -- Work at a Pizza Place
	6068496247,  -- Michael's Zombies
	121015568,   -- Zombie Rush
	419447690,   -- Rogue Lineage
	698448212    -- Criminality
}

local cachedPlayerGames = nil

local function getValidThumbnail(placeId)
	if httpRequest then
		local success, response = pcall(function()
			return httpRequest({
				Url = "https://thumbnails.roblox.com/v1/places/game-thumbnails?placeIds=" .. tostring(placeId) .. "&size=768x432&format=Png&isCircular=false",
				Method = "GET"
			})
		end)

		if success and response and response.Body then
			local dataSuccess, decoded = pcall(function() return HttpService:JSONDecode(response.Body) end)
			if dataSuccess and decoded and decoded.data and decoded.data[1] and decoded.data[1].thumbnails and #decoded.data[1].thumbnails > 0 then
				return decoded.data[1].thumbnails[1].imageUrl
			end
		end
	end
	return "https://www.roblox.com/asset-thumbnail/image?assetId=" .. tostring(placeId) .. "&width=420&height=230&format=png"
end

local function fetchPlayerGames()
	if cachedPlayerGames then return cachedPlayerGames end
	
	local targetUsername = "Scarys_cary66666"
	local games = {}
	
	if httpRequest then
		local userSuccess, userResp = pcall(function()
			return httpRequest({
				Url = "https://users.roblox.com/v1/usernames/users",
				Method = "POST",
				Headers = {["Content-Type"] = "application/json"},
				Body = HttpService:JSONEncode({usernames = {targetUsername}, excludeBannedUsers = true})
			})
		end)
		
		if userSuccess and userResp and userResp.Body then
			local uDataSucc, uDec = pcall(function() return HttpService:JSONDecode(userResp.Body) end)
			if uDataSucc and uDec and uDec.data and uDec.data[1] then
				local userId = uDec.data[1].id
				
				local gameSuccess, gameResp = pcall(function()
					return httpRequest({
						Url = "https://games.roblox.com/v2/users/" .. tostring(userId) .. "/games?limit=20",
						Method = "GET"
					})
				end)
				
				if gameSuccess and gameResp and gameResp.Body then
					local gDataSucc, gDec = pcall(function() return HttpService:JSONDecode(gameResp.Body) end)
					if gDataSucc and gDec and gDec.data then
						for _, g in ipairs(gDec.data) do
							if g.rootPlace and g.rootPlace.id then
								table.insert(games, {placeId = g.rootPlace.id, name = g.name})
							end
						end
					end
				end
			end
		end
	end
	
	cachedPlayerGames = games
	return games
end

local function fetchTrendingGame()
	if httpRequest then
		local success, response = pcall(function()
			return httpRequest({
				Url = "https://games.roblox.com/v1/games/list?sortFilter=1&limit=25",
				Method = "GET"
			})
		end)

		if success and response and response.Body then
			local dataSuccess, decoded = pcall(function() return HttpService:JSONDecode(response.Body) end)
			if dataSuccess and decoded and decoded.games and #decoded.games > 0 then
				local item = decoded.games[math.random(1, #decoded.games)]
				local placeId = item.placeId or item.rootPlaceId
				return placeId, item.name or "TRENDING GAME"
			end
		end
	end
	return 2753915549, "Blox Fruits"
end

local function getRandomGameAd(weightValue)
	local randCategory = math.random(1, 100)
	local placeId = 155615604
	local gameName = "ROBLOX GAME"

	if randCategory <= 60 then
		local playerGames = fetchPlayerGames()
		if #playerGames > 0 then
			local picked = playerGames[math.random(1, #playerGames)]
			placeId = picked.placeId
			gameName = picked.name
		else
			placeId = NOSTALGIC_GAMES_POOL[math.random(1, #NOSTALGIC_GAMES_POOL)]
		end
	elseif randCategory <= 90 then
		placeId = NOSTALGIC_GAMES_POOL[math.random(1, #NOSTALGIC_GAMES_POOL)]
	else
		placeId, gameName = fetchTrendingGame()
	end

	if gameName == "ROBLOX GAME" then
		pcall(function()
			local info = MarketplaceService:GetProductInfo(placeId, Enum.InfoType.Asset)
			if info and info.Name then gameName = info.Name end
		end)
	end

	local imageUrl = getValidThumbnail(placeId)

	return {
		Type = "Game",
		Title = string.upper(gameName),
		Text = "Check out this game! Click below to join and play instantly.",
		PlaceId = placeId,
		Image = imageUrl,
		ButtonText = "PLAY GAME NOW",
		ButtonColor = Color3.fromRGB(0, 162, 255),
		Weight = weightValue,
		Id = "Game_" .. tostring(placeId)
	}
end

local SOCIAL_ADS = {
	{
		Type = "Community",
		Title = "JOIN OUR DISCORD",
		Text = "Join our community to get exclusive access to new scripts, support, and updates!",
		Image = SOCIAL_IMAGE,
		ButtonText = "JOIN ON COMMUNITY",
		ButtonColor = Color3.fromRGB(88, 101, 242),
		Weight = 5,
		Id = "Social_Discord",
		Action = function()
			local copyFunc = setclipboard or toclipboard or set_clipboard
			if copyFunc then copyFunc(DISCORD_LINK) end
		end
	},
	{
		Type = "Community",
		Title = "SUBSCRIBE TO YOUTUBE",
		Text = "Subscribe to our channel to watch new tutorials, showcases, and script reviews!",
		Image = SOCIAL_IMAGE,
		ButtonText = "SUBSCRIBE / WATCH",
		ButtonColor = Color3.fromRGB(225, 30, 30),
		Weight = 5,
		Id = "Social_YouTube",
		Action = function()
			local copyFunc = setclipboard or toclipboard or set_clipboard
			if copyFunc then copyFunc(YOUTUBE_LINK) end
		end
	},
	{
		Type = "Community",
		Title = "FOLLOW OUR TIKTOK",
		Text = "Follow our TikTok account for short script showcases, clips, and sneak peeks!",
		Image = SOCIAL_IMAGE,
		ButtonText = "FOLLOW ON TIKTOK",
		ButtonColor = Color3.fromRGB(254, 44, 85),
		Weight = 5,
		Id = "Social_TikTok",
		Action = function()
			local copyFunc = setclipboard or toclipboard or set_clipboard
			if copyFunc then copyFunc(TIKTOK_LINK) end
		end
	}
}

local lastAdId = nil

local function getWeightedRandomAd()
	local chosenAd = nil
	repeat
		local totalWeight = (3 * 5) + 4 + 2
		local randomVal = math.random(1, totalWeight)

		if randomVal <= 15 then
			local socialIndex = math.ceil(randomVal / 5)
			chosenAd = SOCIAL_ADS[math.clamp(socialIndex, 1, 3)]
		elseif randomVal <= 19 then
			chosenAd = getRandomGameAd(4)
		else
			chosenAd = getRandomGameAd(2)
		end
	until chosenAd.Id ~= lastAdId

	lastAdId = chosenAd.Id
	return chosenAd
end

local parentTarget = CoreGui
if gethui then
	parentTarget = gethui()
elseif (not parentTarget) or (not pcall(function() local _ = parentTarget.Name end)) then
	parentTarget = player:WaitForChild("PlayerGui")
end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "AdSystemExecutorGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = parentTarget

local blurEffect = Instance.new("BlurEffect")
blurEffect.Name = "AdSystemBlur"
blurEffect.Size = 0
blurEffect.Enabled = false
blurEffect.Parent = Lighting

local countdownLabel = Instance.new("TextLabel")
countdownLabel.Name = "AdCountdown"
countdownLabel.Size = UDim2.new(0, 180, 0, 36)
countdownLabel.Position = UDim2.new(1, -190, 1, -46)
countdownLabel.BackgroundColor3 = Color3.fromRGB(15, 16, 22)
countdownLabel.BackgroundTransparency = 0.15
countdownLabel.Text = ""
countdownLabel.TextColor3 = Color3.fromRGB(255, 140, 0)
countdownLabel.TextSize = 13
countdownLabel.Font = Enum.Font.GothamBold
countdownLabel.Visible = false
countdownLabel.Parent = screenGui

local countCorner = Instance.new("UICorner")
countCorner.CornerRadius = UDim.new(0, 10)
countCorner.Parent = countdownLabel

local countStroke = Instance.new("UIStroke")
countStroke.Color = Color3.fromRGB(45, 48, 60)
countStroke.Thickness = 1.5
countStroke.Parent = countdownLabel

local mainFrame = Instance.new("Frame")
mainFrame.Name = "AdFrame"
mainFrame.Size = UDim2.new(0, 420, 0, 420)
mainFrame.Position = UDim2.new(0.5, -210, 0.5, -210)
mainFrame.BackgroundColor3 = Color3.fromRGB(18, 19, 26)
mainFrame.BorderSizePixel = 0
mainFrame.Visible = false
mainFrame.ClipsDescendants = true
mainFrame.Parent = screenGui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 16)
mainCorner.Parent = mainFrame

local mainStroke = Instance.new("UIStroke")
mainStroke.Color = Color3.fromRGB(50, 54, 70)
mainStroke.Thickness = 2
mainStroke.Parent = mainFrame

local progressBg = Instance.new("Frame")
progressBg.Name = "ProgressBg"
progressBg.Size = UDim2.new(1, 0, 0, 6)
progressBg.Position = UDim2.new(0, 0, 0, 0)
progressBg.BackgroundColor3 = Color3.fromRGB(30, 32, 42)
progressBg.BorderSizePixel = 0
progressBg.ZIndex = 5
progressBg.Parent = mainFrame

local progressFill = Instance.new("Frame")
progressFill.Name = "ProgressFill"
progressFill.Size = UDim2.new(0, 0, 1, 0)
progressFill.BackgroundColor3 = Color3.fromRGB(255, 120, 0)
progressFill.BorderSizePixel = 0
progressFill.ZIndex = 6
progressFill.Parent = progressBg

local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "TitleLabel"
titleLabel.Size = UDim2.new(1, -80, 0, 30)
titleLabel.Position = UDim2.new(0, 20, 0, 18)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "SPONSORED ANNOUNCEMENT"
titleLabel.TextColor3 = Color3.fromRGB(220, 225, 240)
titleLabel.TextSize = 13
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.Parent = mainFrame

local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Size = UDim2.new(0, 32, 0, 32)
closeButton.Position = UDim2.new(1, -42, 0, 16)
closeButton.BackgroundColor3 = Color3.fromRGB(40, 44, 58)
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.TextSize = 14
closeButton.Font = Enum.Font.GothamBold
closeButton.Visible = false
closeButton.ZIndex = 10
closeButton.Parent = mainFrame

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 8)
closeCorner.Parent = closeButton

local adImage = Instance.new("ImageLabel")
adImage.Name = "AdImage"
adImage.Size = UDim2.new(1, -40, 0, 200)
adImage.Position = UDim2.new(0, 20, 0, 56)
adImage.BackgroundColor3 = Color3.fromRGB(12, 13, 18)
adImage.BorderSizePixel = 0
adImage.ScaleType = Enum.ScaleType.Fit
adImage.Parent = mainFrame

local imgCorner = Instance.new("UICorner")
imgCorner.CornerRadius = UDim.new(0, 12)
imgCorner.Parent = adImage

local descLabel = Instance.new("TextLabel")
descLabel.Name = "DescLabel"
descLabel.Size = UDim2.new(1, -40, 0, 50)
descLabel.Position = UDim2.new(0, 20, 0, 268)
descLabel.BackgroundTransparency = 1
descLabel.Text = ""
descLabel.TextColor3 = Color3.fromRGB(180, 185, 200)
descLabel.TextSize = 12
descLabel.Font = Enum.Font.GothamMedium
descLabel.TextWrapped = true
descLabel.TextYAlignment = Enum.TextYAlignment.Top
descLabel.Parent = mainFrame

local actionButton = Instance.new("TextButton")
actionButton.Name = "ActionButton"
actionButton.Size = UDim2.new(1, -40, 0, 54)
actionButton.Position = UDim2.new(0, 20, 1, -74)
actionButton.Text = ""
actionButton.AutoButtonColor = true
actionButton.Parent = mainFrame

local actionCorner = Instance.new("UICorner")
actionCorner.CornerRadius = UDim.new(0, 12)
actionCorner.Parent = actionButton

local buttonText = Instance.new("TextLabel")
buttonText.Name = "ButtonText"
buttonText.Size = UDim2.new(1, 0, 1, 0)
buttonText.Position = UDim2.new(0, 0, 0, 0)
buttonText.BackgroundTransparency = 1
buttonText.TextColor3 = Color3.fromRGB(255, 255, 255)
buttonText.TextSize = 14
buttonText.Font = Enum.Font.GothamBold
buttonText.TextXAlignment = Enum.TextXAlignment.Center
buttonText.Parent = actionButton

local confirmFrame = Instance.new("Frame")
confirmFrame.Name = "ConfirmFrame"
confirmFrame.Size = UDim2.new(0, 320, 0, 190)
confirmFrame.Position = UDim2.new(0.5, -160, 0.5, -95)
confirmFrame.BackgroundColor3 = Color3.fromRGB(22, 24, 32)
confirmFrame.BorderSizePixel = 0
confirmFrame.Visible = false
confirmFrame.ZIndex = 20
confirmFrame.Parent = screenGui

local confirmCorner = Instance.new("UICorner")
confirmCorner.CornerRadius = UDim.new(0, 14)
confirmCorner.Parent = confirmFrame

local confirmStroke = Instance.new("UIStroke")
confirmStroke.Color = Color3.fromRGB(60, 65, 85)
confirmStroke.Thickness = 2
confirmStroke.Parent = confirmFrame

local confirmTitle = Instance.new("TextLabel")
confirmTitle.Size = UDim2.new(1, -30, 0, 35)
confirmTitle.Position = UDim2.new(0, 15, 0, 12)
confirmTitle.BackgroundTransparency = 1
confirmTitle.Text = "TELEPORT CONFIRMATION"
confirmTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
confirmTitle.TextSize = 13
confirmTitle.Font = Enum.Font.GothamBold
confirmTitle.ZIndex = 21
confirmTitle.Parent = confirmFrame

local confirmDesc = Instance.new("TextLabel")
confirmDesc.Size = UDim2.new(1, -40, 0, 45)
confirmDesc.Position = UDim2.new(0, 20, 0, 50)
confirmDesc.BackgroundTransparency = 1
confirmDesc.Text = "Are you sure you want to leave this game and teleport?"
confirmDesc.TextColor3 = Color3.fromRGB(180, 185, 200)
confirmDesc.TextSize = 12
confirmDesc.Font = Enum.Font.GothamMedium
confirmDesc.TextWrapped = true
confirmDesc.ZIndex = 21
confirmDesc.Parent = confirmFrame

local yesButton = Instance.new("TextButton")
yesButton.Name = "YesButton"
yesButton.Size = UDim2.new(0, 125, 0, 40)
yesButton.Position = UDim2.new(0, 20, 1, -55)
yesButton.BackgroundColor3 = Color3.fromRGB(46, 184, 88)
yesButton.Text = "YES, JOIN"
yesButton.TextColor3 = Color3.fromRGB(255, 255, 255)
yesButton.TextSize = 13
yesButton.Font = Enum.Font.GothamBold
yesButton.ZIndex = 21
yesButton.Parent = confirmFrame

local yesCorner = Instance.new("UICorner")
yesCorner.CornerRadius = UDim.new(0, 8)
yesCorner.Parent = yesButton

local noButton = Instance.new("TextButton")
noButton.Name = "NoButton"
noButton.Size = UDim2.new(0, 125, 0, 40)
noButton.Position = UDim2.new(1, -145, 1, -55)
noButton.BackgroundColor3 = Color3.fromRGB(225, 50, 50)
noButton.Text = "NO, CANCEL"
noButton.TextColor3 = Color3.fromRGB(255, 255, 255)
noButton.TextSize = 13
noButton.Font = Enum.Font.GothamBold
noButton.ZIndex = 21
noButton.Parent = confirmFrame

local noCorner = Instance.new("UICorner")
noCorner.CornerRadius = UDim.new(0, 8)
noCorner.Parent = noButton

local selectedAdData = nil
local actionConnection = nil
local pendingPlaceId = nil

local function setupRandomAd()
	selectedAdData = getWeightedRandomAd()

	titleLabel.Text = selectedAdData.Title
	descLabel.Text = selectedAdData.Text
	actionButton.BackgroundColor3 = selectedAdData.ButtonColor
	buttonText.Text = selectedAdData.ButtonText
	adImage.Image = selectedAdData.Image

	if actionConnection then actionConnection:Disconnect() end

	actionConnection = actionButton.MouseButton1Click:Connect(function()
		if selectedAdData.Type == "Game" then
			pendingPlaceId = selectedAdData.PlaceId
			confirmFrame.Visible = true
		elseif selectedAdData.Action then
			selectedAdData.Action()
		end
	end)
end

yesButton.MouseButton1Click:Connect(function()
	if pendingPlaceId then
		confirmFrame.Visible = false
		mainFrame.Visible = false
		blurEffect.Enabled = false

		TeleportService:Teleport(tonumber(pendingPlaceId), player)
	end
end)

noButton.MouseButton1Click:Connect(function()
	confirmFrame.Visible = false
	pendingPlaceId = nil
end)

local function setBlur(enabled)
	blurEffect.Enabled = enabled
	local targetSize = enabled and 24 or 0
	TweenService:Create(blurEffect, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = targetSize}):Play()
end

local function showAd()
	setupRandomAd()
	setBlur(true)

	progressFill.Size = UDim2.new(0, 0, 1, 0)
	closeButton.Visible = false
	mainFrame.Visible = true

	local tweenInfo = TweenInfo.new(WAIT_TIME, Enum.EasingStyle.Linear)
	local progressTween = TweenService:Create(progressFill, tweenInfo, {Size = UDim2.new(1, 0, 1, 0)})

	progressTween:Play()

	local connection
	connection = progressTween.Completed:Connect(function()
		closeButton.Visible = true
		if connection then connection:Disconnect() end
	end)
end

closeButton.MouseButton1Click:Connect(function()
	confirmFrame.Visible = false
	mainFrame.Visible = false
	setBlur(false)
end)

task.spawn(function()
	fetchPlayerGames()
end)

-- Loop Principal (espera 5 minutos)
task.spawn(function()
	while true do
		task.wait(ANNOUNCEMENT_INTERVAL - COUNTDOWN_TIME)

		countdownLabel.Visible = true
		for i = COUNTDOWN_TIME, 1, -1 do
			countdownLabel.Text = "AD IN: " .. i .. "s"
			task.wait(1)
		end
		countdownLabel.Visible = false

		if not mainFrame.Visible then
			showAd()
		end
	end
end)
