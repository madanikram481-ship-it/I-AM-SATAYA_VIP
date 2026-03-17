-- [[ ♛ SATAYA VIP - OFFICIAL YOUTUBE EDITION ♛ ]] --
-- حقوق الملكية: SATAYA VIP
-- القناة: @STAYAMODYT

local p = game.Players.LocalPlayer
local ScreenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
ScreenGui.ResetOnSpawn = false

-- [ واجهة تسجيل الدخول بصورة إيتاتشي ]
local LoginFrame = Instance.new("Frame", ScreenGui)
LoginFrame.Size = UDim2.new(0, 320, 0, 420)
LoginFrame.Position = UDim2.new(0.5, -160, 0.5, -210)
LoginFrame.BackgroundColor3 = Color3.fromRGB(15, 0, 0)
LoginFrame.BorderSizePixel = 2
LoginFrame.BorderColor3 = Color3.fromRGB(255, 0, 0)
LoginFrame.Active = true
LoginFrame.Draggable = true

local ItachiImg = Instance.new("ImageLabel", LoginFrame)
ItachiImg.Size = UDim2.new(1, 0, 0.5, 0)
ItachiImg.Image = "rbxassetid://12921506541"
ItachiImg.BackgroundTransparency = 1

local PassBox = Instance.new("TextBox", LoginFrame)
PassBox.PlaceholderText = "الباسورد: الهكر أو SATAYA_VIP"
PassBox.Size = UDim2.new(0.8, 0, 0, 40)
PassBox.Position = UDim2.new(0.1, 0, 0.55, 0)
PassBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
PassBox.TextColor3 = Color3.fromRGB(255, 255, 255)

local EnterBtn = Instance.new("TextButton", LoginFrame)
EnterBtn.Text = "دخول الهكر | LOGIN"
EnterBtn.Size = UDim2.new(0.8, 0, 0, 45)
EnterBtn.Position = UDim2.new(0.1, 0, 0.7, 0)
EnterBtn.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
EnterBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

-- [ اللوحة الرئيسية المدمجة ]
local function OpenHub()
    local MainFrame = Instance.new("Frame", ScreenGui)
    MainFrame.Size = UDim2.new(0, 380, 0, 520)
    MainFrame.Position = UDim2.new(0.5, -190, 0.5, -260)
    MainFrame.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
    MainFrame.BorderColor3 = Color3.fromRGB(255, 0, 0)
    MainFrame.Active = true
    MainFrame.Draggable = true

    local TabTitle = Instance.new("TextLabel", MainFrame)
    TabTitle.Text = "♛ SATAYA VIP - قائمة الهكر ♛"
    TabTitle.Size = UDim2.new(1, 0, 0, 50)
    TabTitle.BackgroundColor3 = Color3.fromRGB(80, 0, 0)
    TabTitle.TextColor3 = Color3.fromRGB(255, 255, 255)

    local Scroll = Instance.new("ScrollingFrame", MainFrame)
    Scroll.Size = UDim2.new(1, 0, 0.88, 0)
    Scroll.Position = UDim2.new(0, 0, 0.12, 0)
    Scroll.CanvasSize = UDim2.new(0, 0, 2.8, 0)
    Scroll.ScrollBarThickness = 4

    local UIList = Instance.new("UIListLayout", Scroll)
    UIList.Padding = UDim.new(0, 10); UIList.HorizontalAlignment = Enum.HorizontalAlignment.Center

    local function AddBtn(text, color, func)
        local b = Instance.new("TextButton", Scroll)
        b.Text = text; b.Size = UDim2.new(0.9, 0, 0, 45)
        b.BackgroundColor3 = color; b.TextColor3 = Color3.fromRGB(255, 255, 255)
        b.Font = Enum.Font.SourceSansBold
        b.MouseButton1Click:Connect(func)
    end

    -- زر اليوتيوب بحقوقك
    AddBtn("قناتي @STAYAMODYT 📺", Color3.fromRGB(255, 0, 0), function()
        setclipboard("https://www.youtube.com/@STAYAMODYT")
        game.StarterGui:SetCore("SendNotification", {
            Title = "SATAYA VIP",
            Text = "تم نسخ رابط القناة! اشترك الآن يا بطل",
            Duration = 5
        })
    end)

    -- ميزة السرعة المستمرة
    AddBtn("تفعيل السرعة ⚡", Color3.fromRGB(0, 102, 204), function()
        _G.SpeedEnabled = true
        task.spawn(function()
            while _G.SpeedEnabled do
                if p.Character and p.Character:FindFirstChild("Humanoid") then
                    p.Character.Humanoid.WalkSpeed = 150
                end
                task.wait(0.1)
            end
        end)
    end)

    -- ميزة الجمع التلقائي
    AddBtn("جمع تلقائي للعملات 💰", Color3.fromRGB(0, 120, 0), function()
        _G.AutoFarm = true
        task.spawn(function()
            while _G.AutoFarm do
                for _, v in pairs(workspace:GetDescendants()) do
                    if (v.Name == "Coin" or v.Name == "Cookie" or v.Name == "Beli") and v:IsA("BasePart") then
                        if p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                            p.Character.HumanoidRootPart.CFrame = v.CFrame
                            task.wait(0.1)
                        end
