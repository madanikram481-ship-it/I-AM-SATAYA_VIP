-- [[ ♛ SATAYA VIP ULTIMATE HUB V5 - TOGGLE EDITION ♛ ]] --

local p = game.Players.LocalPlayer
local CorrectPassword = "SATAYA_VIP"

local ScreenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
ScreenGui.Name = "SatayaPro_V5"

-- [ نافذة تسجيل الدخول ]
local LoginFrame = Instance.new("Frame", ScreenGui)
LoginFrame.Size = UDim2.new(0, 280, 0, 180)
LoginFrame.Position = UDim2.new(0.5, -140, 0.5, -90)
LoginFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
LoginFrame.BorderSizePixel = 2
LoginFrame.BorderColor3 = Color3.fromRGB(255, 215, 0)

local LoginTitle = Instance.new("TextLabel", LoginFrame)
LoginTitle.Text = "♛ SATAYA ACCESS ♛"
LoginTitle.Size = UDim2.new(1, 0, 0, 40)
LoginTitle.TextColor3 = Color3.fromRGB(255, 215, 0)
LoginTitle.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

local PassBox = Instance.new("TextBox", LoginFrame)
PassBox.PlaceholderText = "Key: SATAYA_VIP"
PassBox.Size = UDim2.new(0.8, 0, 0, 35)
PassBox.Position = UDim2.new(0.1, 0, 0.4, 0)

local EnterBtn = Instance.new("TextButton", LoginFrame)
EnterBtn.Text = "ACTIVATE"
EnterBtn.Size = UDim2.new(0.8, 0, 0, 40)
EnterBtn.Position = UDim2.new(0.1, 0, 0.7, 0)
EnterBtn.BackgroundColor3 = Color3.fromRGB(255, 215, 0)

-- [ اللوحة الرئيسية وزر الإظهار ]
local function OpenMegaMenu()
    -- زر الإظهار العائم (يظهر عند إخفاء القائمة)
    local OpenBtn = Instance.new("TextButton", ScreenGui)
    OpenBtn.Text = "♛"
    OpenBtn.Size = UDim2.new(0, 50, 0, 50)
    OpenBtn.Position = UDim2.new(0, 10, 0.5, 0)
    OpenBtn.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    OpenBtn.TextColor3 = Color3.fromRGB(255, 215, 0)
    OpenBtn.TextSize = 30
    OpenBtn.Visible = false
    OpenBtn.BorderSizePixel = 2
    OpenBtn.BorderColor3 = Color3.fromRGB(255, 215, 0)
    
    local CornerBtn = Instance.new("UICorner", OpenBtn)
    CornerBtn.CornerRadius = UDim.new(1, 0) -- يجعله دائرياً

    local MainFrame = Instance.new("Frame", ScreenGui)
    MainFrame.Size = UDim2.new(0, 350, 0, 480)
    MainFrame.Position = UDim2.new(0.5, -175, 0.5, -240)
    MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
    MainFrame.BorderSizePixel = 2
    MainFrame.BorderColor3 = Color3.fromRGB(255, 215, 0)
    MainFrame.Active = true
    MainFrame.Draggable = true

    local TabTitle = Instance.new("TextLabel", MainFrame)
    TabTitle.Text = "♛ SATAYA VIP PANEL ♛"
    TabTitle.Size = UDim2.new(1, 0, 0, 45)
    TabTitle.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    TabTitle.TextColor3 = Color3.fromRGB(255, 215, 0)

    local ScrollingFrame = Instance.new("ScrollingFrame", MainFrame)
    ScrollingFrame.Size = UDim2.new(1, 0, 0.88, 0)
    ScrollingFrame.Position = UDim2.new(0, 0, 0.12, 0)
    ScrollingFrame.CanvasSize = UDim2.new(0, 0, 2.8, 0)
    ScrollingFrame.ScrollBarThickness = 6

    local UIListLayout = Instance.new("UIListLayout", ScrollingFrame)
    UIListLayout.Padding = UDim.new(0, 10)
    UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

    local function AddBtn(text, color, func)
        local b = Instance.new("TextButton", ScrollingFrame)
        b.Text = text
        b.Size = UDim2.new(0.9, 0, 0, 45)
        b.BackgroundColor3 = color
        b.TextColor3 = Color3.fromRGB(255, 255, 255)
        b.Font = Enum.Font.SourceSansBold
        b.MouseButton1Click:Connect(func)
    end

    -- وظيفة زر الإخفاء والإظهار
    OpenBtn.MouseButton1Click:Connect(function()
        MainFrame.Visible = true
        OpenBtn.Visible = false
    end)

    -- [[ ميزات السكربت ]] --
    
    AddBtn("إخفاء القائمة (تحت السطح) ❌", Color3.fromRGB(60, 60, 60), function()
        MainFrame.Visible = false
        OpenBtn.Visible = true
    end)

    AddBtn("🛡️ تفعيل ضد الموجات (God Mode)", Color3.fromRGB(200, 0, 0), function()
        _G.GodMode = true
        game:GetService("RunService").RenderStepped:Connect(function()
            if _G.GodMode then
                for _, v in pairs(workspace:GetDescendants()) do
                    if v.Name == "Wave" or v.Name == "Water" then
                        if v:IsA("BasePart") then v.CanTouch = false end
                    end
                end
            end
        end)
    end)

    AddBtn("💰 جمع تلقائي (Auto Collect)", Color3.fromRGB(0, 150, 0), function()
        _G.AutoCollect = true
        while _G.AutoCollect do task.wait(0.3)
            for _, v in pairs(game.Workspace:GetDescendants()) do
                if v.Name == "Cookie" or v.Name == "Coin" then
                    if v:IsA("BasePart") then p.Character.HumanoidRootPart.CFrame = v.CFrame task.wait(0.1) end
                end
            end
        end
    end)

    AddBtn("⚡ سرعة VIP خارقة", Color3.fromRGB(0, 120, 250), function()
        p.Character.Humanoid.WalkSpeed = 150
    end)

    AddBtn("🚀 قفز VIP عالي", Color3.fromRGB(150, 0, 150), function()
        p.Character.Humanoid.JumpPower = 200
        p.Character.Humanoid.UseJumpPower = true
    end)
end

-- برمجة الدخول
EnterBtn.MouseButton1Click:Connect(function()
    if PassBox.Text == CorrectPassword then
        LoginFrame:Destroy()
        OpenMegaMenu()
    end
end)
