-- [[ ♛ SATAYA VIP ELITE - THE ULTIMATE HUB ♛ ]] --

-- 1. إعدادات الوصول (الباسورد)
local CorrectPassword = "SATAYA_VIP"

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.Name = "SatayaEliteSystem"

-- [ نافذة تسجيل الدخول الفخمة ]
local LoginFrame = Instance.new("Frame")
LoginFrame.Size = UDim2.new(0, 280, 0, 190)
LoginFrame.Position = UDim2.new(0.5, -140, 0.5, -95)
LoginFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
LoginFrame.BorderSizePixel = 2
LoginFrame.BorderColor3 = Color3.fromRGB(255, 215, 0) -- لون ذهبي ملكي
LoginFrame.Active = true
LoginFrame.Draggable = true
LoginFrame.Parent = ScreenGui

local LoginTitle = Instance.new("TextLabel")
LoginTitle.Text = "♛ SATAYA VIP ACCESS ♛"
LoginTitle.Size = UDim2.new(1, 0, 0, 45)
LoginTitle.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
LoginTitle.TextColor3 = Color3.fromRGB(255, 215, 0)
LoginTitle.Font = Enum.Font.SpecialElite
LoginTitle.TextSize = 18
LoginTitle.Parent = LoginFrame

local PassBox = Instance.new("TextBox")
PassBox.PlaceholderText = "أدخل مفتاح الدخول..."
PassBox.Size = UDim2.new(0.8, 0, 0, 40)
PassBox.Position = UDim2.new(0.1, 0, 0.35, 0)
PassBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
PassBox.TextColor3 = Color3.fromRGB(255, 255, 255)
PassBox.Parent = LoginFrame

local EnterBtn = Instance.new("TextButton")
EnterBtn.Text = "تفعيل السكربت الملكي"
EnterBtn.Size = UDim2.new(0.8, 0, 0, 40)
EnterBtn.Position = UDim2.new(0.1, 0, 0.65, 0)
EnterBtn.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
EnterBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
EnterBtn.Font = Enum.Font.SourceSansBold
EnterBtn.Parent = LoginFrame

-- [ وظيفة كشف الكوكيز (ESP) ]
local function StartCookieESP()
    game:GetService("RunService").RenderStepped:Connect(function()
        for _, v in pairs(game.Workspace:GetDescendants()) do
            -- الكشف عن الكوكيز والماء في ماب تسونامي تريدرز
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
                Icon.TextSize = 14
                Icon.Font = Enum.Font.SourceSansBold
            end
        end
    end)
end

-- [ القائمة الرئيسية للميزات ]
local function OpenEliteMenu()
    local MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(0, 240, 0, 300)
    MainFrame.Position = UDim2.new(0.1, 0, 0.4, 0)
    MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    MainFrame.BorderSizePixel = 2
    MainFrame.BorderColor3 = Color3.fromRGB(255, 215, 0)
    MainFrame.Active = true
    MainFrame.Draggable = true
    MainFrame.Parent = ScreenGui

    local MainTitle = Instance.new("TextLabel")
    MainTitle.Text = "♛ SATAYA ELITE HUB ♛"
    MainTitle.Size = UDim2.new(1, 0, 0, 40)
    MainTitle.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    MainTitle.TextColor3 = Color3.fromRGB(255, 215, 0)
    MainTitle.Parent = MainFrame

    local function CreateBtn(name, pos, color, func)
        local b = Instance.new("TextButton")
        b.Text = name
        b.Size = UDim2.new(0.9, 0, 0, 40)
        b.Position = UDim2.new(0.05, 0, 0, pos)
        b.BackgroundColor3 = color
        b.TextColor3 = Color3.fromRGB(255, 255, 255)
        b.Parent = MainFrame
        b.MouseButton1Click:Connect(func)
    end

    -- الميزات
    CreateBtn("تشغيل كاشف الكوكيز ✅", 50, Color3.fromRGB(0, 150
