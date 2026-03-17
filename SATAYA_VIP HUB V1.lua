-- [[ ♛ SATAYA VIP ELITE HUB V1 ♛ ]] --

local CorrectPassword = "SATAYA_VIP"

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.Name = "SatayaV1System"

-- [ نافذة تسجيل الدخول الملكية ]
local LoginFrame = Instance.new("Frame")
LoginFrame.Size = UDim2.new(0, 300, 0, 200)
LoginFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
LoginFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
LoginFrame.BorderSizePixel = 3
LoginFrame.BorderColor3 = Color3.fromRGB(255, 215, 0) -- ذهبي ملكي
LoginFrame.Active = true
LoginFrame.Draggable = true
LoginFrame.Parent = ScreenGui

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 15)
Corner.Parent = LoginFrame

local LoginTitle = Instance.new("TextLabel")
LoginTitle.Text = "♛ SATAYA VIP ACCESS ♛"
LoginTitle.Size = UDim2.new(1, 0, 0, 50)
LoginTitle.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
LoginTitle.TextColor3 = Color3.fromRGB(255, 215, 0)
LoginTitle.Font = Enum.Font.SpecialElite
LoginTitle.TextSize = 20
LoginTitle.Parent = LoginFrame

local PassBox = Instance.new("TextBox")
PassBox.PlaceholderText = "Enter Access Key..."
PassBox.Size = UDim2.new(0.8, 0, 0, 40)
PassBox.Position = UDim2.new(0.1, 0, 0.38, 0)
PassBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
PassBox.TextColor3 = Color3.fromRGB(255, 255, 255)
PassBox.Parent = LoginFrame

local EnterBtn = Instance.new("TextButton")
EnterBtn.Text = "LOGIN"
EnterBtn.Size = UDim2.new(0.8, 0, 0, 40)
EnterBtn.Position = UDim2.new(0.1, 0, 0.7, 0)
EnterBtn.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
EnterBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
EnterBtn.Font = Enum.Font.SourceSansBold
EnterBtn.TextSize = 18
EnterBtn.Parent = LoginFrame

-- [ وظيفة كاشف الكوكيز والماء ESP المطور ]
local function StartESP()
    game:GetService("RunService").RenderStepped:Connect(function()
        for _, v in pairs(game.Workspace:GetDescendants()) do
            -- كشف الكوكيز والماء في ماب Tsunami Traders
            if (v.Name == "Cookie" or v.Name == "CookiePart" or v.Name == "Water") and not v:FindFirstChild("SatayaTag") then
                local Tag = Instance.new("BillboardGui", v)
                Tag.Name = "SatayaTag"
                Tag.Size = UDim2.new(0, 100, 0, 50)
                Tag.AlwaysOnTop = true
                
                local Icon = Instance.new("TextLabel", Tag)
                Icon.Size = UDim2.new(1, 0, 1, 0)
                Icon.BackgroundTransparency = 1
                Icon.Text = (v.Name == "Water") and "💧 WATER" or "🍪 COOKIE"
                Icon.TextColor3 = (v.Name == "Water") and Color3.fromRGB(0, 170, 255) or Color3.fromRGB(255, 215, 0)
                Icon.TextSize = 16
                Icon.Font = Enum.Font.SourceSansBold
                Icon.Parent = Tag
            end
        end
    end)
end

-- [ القائمة الرئيسية ]
local function OpenMainMenu()
    local MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(0, 250, 0, 320)
    MainFrame.Position
