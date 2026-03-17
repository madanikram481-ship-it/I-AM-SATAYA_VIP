-- [[ ♛ SATAYA VIP UNIVERSAL HUB - THE FINAL EDITION ♛ ]] --

local p = game.Players.LocalPlayer
local CorrectPassword = "SATAYA_VIP"

-- إنشاء الواجهة الشاملة
local ScreenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
ScreenGui.Name = "SatayaUltimate_Final"

-- [ نظام الدخول الاحترافي ]
local LoginFrame = Instance.new("Frame", ScreenGui)
LoginFrame.Size = UDim2.new(0, 300, 0, 200)
LoginFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
LoginFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
LoginFrame.BorderSizePixel = 2
LoginFrame.BorderColor3 = Color3.fromRGB(255, 215, 0)
LoginFrame.Active = true
LoginFrame.Draggable = true

local Corner = Instance.new("UICorner", LoginFrame)

local Title = Instance.new("TextLabel", LoginFrame)
Title.Text = "♛ SATAYA VIP ACCESS ♛"
Title.Size = UDim2.new(1, 0, 0, 50)
Title.TextColor3 = Color3.fromRGB(255, 215, 0)
Title.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Title.TextSize = 20
Title.Font = Enum.Font.SpecialElite

local PassBox = Instance.new("TextBox", LoginFrame)
PassBox.PlaceholderText = "Password: SATAYA_VIP"
PassBox.Size = UDim2.new(0.8, 0, 0, 40)
PassBox.Position = UDim2.new(0.1, 0, 0.4, 0)
PassBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
PassBox.TextColor3 = Color3.fromRGB(255, 255, 255)

local EnterBtn = Instance.new("TextButton", LoginFrame)
EnterBtn.Text = "ACTIVATE ELITE HUB"
EnterBtn.Size = UDim2.new(0.8, 0, 0, 40)
EnterBtn.Position = UDim2.new(0.1, 0, 0.7, 0)
EnterBtn.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
EnterBtn.Font = Enum.Font.SourceSansBold

-- [ اللوحة الرئيسية المدمجة ]
local function OpenMegaMenu()
    -- زر الإخفاء العائم (يظهر في كل الألعاب)
    local OpenBtn = Instance.new("TextButton", ScreenGui)
    OpenBtn.Text = "♛"
    OpenBtn.Size = UDim2.new(0, 60, 0, 60)
    OpenBtn.Position = UDim2.new(0, 15, 0.5, -30)
    OpenBtn.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
    OpenBtn.TextColor3 = Color3.fromRGB(255, 215, 0)
    OpenBtn.TextSize = 35
    OpenBtn.Visible = false
    local BC = Instance.new("UICorner", OpenBtn); BC.CornerRadius = UDim.new(1, 0)

    local MainFrame = Instance.new("Frame", ScreenGui)
    MainFrame.Size = UDim2.new(0, 350, 0, 500)
    MainFrame.Position = UDim2.new(0.5, -175, 0.5, -250)
    MainFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
    MainFrame.BorderSizePixel = 2
    MainFrame.BorderColor3 = Color3.fromRGB(255, 215, 0)
    MainFrame.Active = true
    MainFrame.Draggable = true

    local TabTitle = Instance.new("TextLabel", MainFrame)
    TabTitle.Text = "♛ SATAYA VIP UNIVERSAL ♛"
    TabTitle.Size = UDim2.new(1, 0, 0, 50)
    TabTitle.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    TabTitle.TextColor3 = Color3.fromRGB(255, 215, 0)

    local Scroll = Instance.new("ScrollingFrame", MainFrame)
    Scroll.Size = UDim2.new(1, 0, 0.88, 0)
    Scroll.Position = UDim2.new(0, 0, 0.12, 0)
    Scroll.CanvasSize = UDim2.new(0, 0, 3, 0)
    Scroll.ScrollBarThickness = 5

    local UIList = Instance.new("UIListLayout", Scroll)
    UIList.Padding = UDim.new(0, 12); UIList.HorizontalAlignment = Enum.HorizontalAlignment.Center

    local function CreateBtn(text, color, func)
        local b = Instance.new("TextButton", Scroll)
        b.Text = text; b.Size = UDim2.new(0.9, 0, 0, 45)
        b.BackgroundColor3 = color; b.TextColor3 = Color3.fromRGB(255, 255, 255)
        b.Font = Enum.Font.SourceSansBold; b.MouseButton1Click:Connect(func)
    end

    -- [[ الأقسام والوظائف ]] --
    
    CreateBtn("إخفاء القائمة ❌", Color3.fromRGB(60, 60, 60), function()
        MainFrame.Visible = false; OpenBtn.Visible = true
    end)

    CreateBtn("🛡️ وضع عدم الموت (Universal God)", Color3.fromRGB(180, 0, 0), function()
        _G.God = true
        game:GetService("RunService").RenderStepped:Connect(function()
            if _G.God and p.Character then
                for _, v in pairs(workspace:GetDescendants()) do
                    if v.Name == "Wave" or v.Name == "Water" or v.Name == "Lava" then
                        if v:IsA("BasePart") then v.CanTouch = false end
                    end
                end
            end
        end)
    end)

    CreateBtn("💰 جمع تلقائي (Coins/Cookies/Beli)", Color3.fromRGB(0, 150, 0), function()
        _G.AutoFarm = true
        while _G.AutoFarm do task.wait(0.2)
            for _, v in pairs(workspace:GetDescendants()) do
                if v.Name == "Cookie" or v.Name == "Coin" or v.Name == "Beli" or v.Name == "Money" then
                    if v:IsA("BasePart") and p.Character:FindFirstChild("HumanoidRootPart") then
                        p.Character.HumanoidRootPart.CFrame = v.CFrame
                        task.wait(0.1)
                    end
                end
            end
        end
    end)

    CreateBtn("🚀 طيران الـ VIP (Fly)", Color3.fromRGB(0, 100, 200), function()
        local bg = Instance.new("BodyGyro", p.Character.HumanoidRootPart)
        bg.P = 9e4; bg.maxTorque = Vector3.new(9e9, 9e9, 9e9); bg.cframe = p.Character.HumanoidRootPart.CFrame
        local bv = Instance.new("BodyVelocity", p.Character.HumanoidRootPart)
        bv.velocity = Vector3.new(0, 0, 0); bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
        -- الطيران يعمل عبر الضغط المستمر (يمكن تطويره)
    end)

    CreateBtn("⚡ سرعة VIP خارقة (150)", Color3.fromRGB(255, 180, 0), function()
        p.Character.Humanoid.WalkSpeed = 150
    end)

    CreateBtn("🏆 تختيم المهام (Instant Win)", Color3.fromRGB(150, 0, 150), function()
        local goal = workspace:FindFirstChild("Finish") or workspace:FindFirstChild("Win") or workspace:FindFirstChild("End")
        if goal then p.Character.HumanoidRootPart.CFrame = goal.CFrame end
    end)

    OpenBtn.MouseButton1Click:Connect(function()
        MainFrame.Visible = true; OpenBtn.Visible = false
    end)
end

-- برمجة الدخول
EnterBtn.MouseButton1Click:Connect(function()
    if PassBox.Text == CorrectPassword then
        LoginFrame:Destroy(); OpenMegaMenu()
    else
        PassBox.Text = ""; PassBox.PlaceholderText = "WRONG KEY!"
    end
end)
