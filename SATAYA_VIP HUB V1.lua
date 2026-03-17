-- [[ ♛ SATAYA VIP ELITE HUB V1 - FULL EDITION ♛ ]] --

-- 1. إعدادات الوصول
local CorrectPassword = "SATAYA_VIP"

-- 2. إنشاء الواجهة البرمجية (GUI)
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.Name = "SatayaHub_V1"

-- [ نافذة تسجيل الدخول الفخمة ]
local LoginFrame = Instance.new("Frame")
LoginFrame.Size = UDim2.new(0, 300, 0, 200)
LoginFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
LoginFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
LoginFrame.BorderSizePixel = 2
LoginFrame.BorderColor3 = Color3.fromRGB(255, 215, 0) -- ذهبي ملكي
LoginFrame.Active = true
LoginFrame.Draggable = true
LoginFrame.Parent = ScreenGui

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 12)
Corner.Parent = LoginFrame

local Title = Instance.new("TextLabel")
Title.Text = "♛ SATAYA VIP ACCESS ♛"
Title.Size = UDim2.new(1, 0, 0, 50)
Title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Title.TextColor3 = Color3.fromRGB(255, 215, 0)
Title.Font = Enum.Font.SpecialElite
Title.TextSize = 20
Title.Parent = LoginFrame

local PassBox = Instance.new("TextBox")
PassBox.PlaceholderText = "Enter Key: SATAYA_VIP"
PassBox.Size = UDim2.new(0.8, 0, 0, 40)
PassBox.Position = UDim2.new(0.1, 0, 0.4, 0)
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
EnterBtn.Parent = LoginFrame

-- [ وظيفة كاشف الكوكيز والماء ESP ]
local function StartESP()
    game:GetService("RunService").RenderStepped:Connect(function()
        for _, v in pairs(game.Workspace:GetDescendants()) do
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

-- [ القائمة الرئيسية للميزات ]
local function OpenMainMenu()
    local MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(0, 260, 0, 300)
    MainFrame.Position = UDim2.new(0.1, 0, 0.4, 0)
    MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
    MainFrame.BorderSizePixel = 2
    MainFrame.BorderColor3 = Color3.fromRGB(255, 215, 0)
    MainFrame.Active = true
    MainFrame.Draggable = true
    MainFrame.Parent = ScreenGui

    local MainTitle = Instance.new("TextLabel")
    MainTitle.Text = "♛ SATAYA HUB V1 ♛"
    MainTitle.Size = UDim2.new(1, 0, 0, 40)
    MainTitle.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    MainTitle.TextColor3 = Color3.fromRGB(255, 215, 0)
    MainTitle.Parent = MainFrame

    local function CreateBtn(text, pos, func)
        local b = Instance.new("TextButton")
        b.Text = text
        b.Size = UDim2.new(0.9, 0, 0, 40)
        b.Position = UDim2.new(0.05, 0, 0, pos)
        b.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        b.TextColor3 = Color3.fromRGB(255, 215, 0)
        b.Font = Enum.Font.SourceSansBold
        b.Parent = MainFrame
        b.MouseButton1Click:Connect(func)
    end

    CreateBtn("تشغيل كاشف الكوكيز ✅", 60, function()
        StartESP()
        game.StarterGui:SetCore("SendNotification", {Title = "SATAYA VIP", Text = "ESP Activated!", Duration = 5})
    end)

    CreateBtn("سرعة الـ VIP ⚡", 115, function()
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100
    end)

    CreateBtn("قفز خارق 🚀", 170, function()
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = 200
    end)

    CreateBtn("إخفاء القائمة ❌", 225, function()
        MainFrame:Destroy()
    end)
end

-- برمجة زر الدخول
EnterBtn.MouseButton1Click:Connect(function()
    if PassBox.Text == CorrectPassword then
        LoginFrame:Destroy()
        OpenMainMenu()
    else
        PassBox.Text = ""
        PassBox.PlaceholderText = "WRONG KEY!"
    end
end)
