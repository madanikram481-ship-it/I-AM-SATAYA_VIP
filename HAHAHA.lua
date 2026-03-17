-- [[ ♛ SATAYA VIP - ITACHI HUB V7 ♛ ]] --

local p = game.Players.LocalPlayer
local CorrectPassword = "1" -- الباسورد الآن هو "1" فقط كما طلبت

local ScreenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
ScreenGui.ResetOnSpawn = false

-- [ نافذة تسجيل الدخول بصورة إيتاتشي ]
local LoginFrame = Instance.new("Frame", ScreenGui)
LoginFrame.Size = UDim2.new(0, 320, 0, 350)
LoginFrame.Position = UDim2.new(0.5, -160, 0.5, -175)
LoginFrame.BackgroundColor3 = Color3.fromRGB(20, 0, 0)
LoginFrame.BorderSizePixel = 2
LoginFrame.BorderColor3 = Color3.fromRGB(255, 0, 0)
LoginFrame.Active = true
LoginFrame.Draggable = true

-- صورة إيتاتشي
local ItachiImg = Instance.new("ImageLabel", LoginFrame)
ItachiImg.Size = UDim2.new(1, 0, 0.6, 0)
ItachiImg.Image = "rbxassetid://12921506541" -- معرف صورة إيتاتشي
ItachiImg.BackgroundTransparency = 1

local PassBox = Instance.new("TextBox", LoginFrame)
PassBox.PlaceholderText = "Password is: 1"
PassBox.Size = UDim2.new(0.8, 0, 0, 40)
PassBox.Position = UDim2.new(0.1, 0, 0.65, 0)
PassBox.Text = ""

local EnterBtn = Instance.new("TextButton", LoginFrame)
EnterBtn.Text = "SHARINGAN ACTIVATE"
EnterBtn.Size = UDim2.new(0.8, 0, 0, 45)
EnterBtn.Position = UDim2.new(0.1, 0, 0.82, 0)
EnterBtn.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
EnterBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

-- [ اللوحة الرئيسية المتقدمة ]
local function OpenHub()
    local MainFrame = Instance.new("Frame", ScreenGui)
    MainFrame.Size = UDim2.new(0, 400, 0, 500)
    MainFrame.Position = UDim2.new(0.5, -200, 0.5, -250)
    MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
    MainFrame.BorderColor3 = Color3.fromRGB(255, 0, 0)
    MainFrame.Draggable = true

    local TabTitle = Instance.new("TextLabel", MainFrame)
    TabTitle.Text = "♛ SATAYA VIP - ITACHI HUB ♛"
    TabTitle.Size = UDim2.new(1, 0, 0, 50)
    TabTitle.BackgroundColor3 = Color3.fromRGB(40, 0, 0)
    TabTitle.TextColor3 = Color3.fromRGB(255, 255, 255)

    local Scroll = Instance.new("ScrollingFrame", MainFrame)
    Scroll.Size = UDim2.new(1, 0, 0.9, 0)
    Scroll.Position = UDim2.new(0, 0, 0.1, 0)
    Scroll.CanvasSize = UDim2.new(0, 0, 2.5, 0)
    Scroll.ScrollBarThickness = 4

    local UIList = Instance.new("UIListLayout", Scroll)
    UIList.Padding = UDim.new(0, 10); UIList.HorizontalAlignment = Enum.HorizontalAlignment.Center

    local function CreateBtn(text, func)
        local b = Instance.new("TextButton", Scroll)
        b.Text = text; b.Size = UDim2.new(0.9, 0, 0, 40)
        b.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        b.TextColor3 = Color3.fromRGB(255, 0, 0)
        b.MouseButton1Click:Connect(func)
    end

    -- 1. التحكم في السرعة (Speed Control)
    CreateBtn("زيادة السرعة (100) ⚡", function() 
        p.Character.Humanoid.WalkSpeed = 100 
    end)
    
    CreateBtn("سرعة عادية (16) 🚶", function() 
        p.Character.Humanoid.WalkSpeed = 16 
    end)

    -- 2. الطيران السلس (Smooth Fly)
    CreateBtn("طيران إيتاتشي 🦅", function()
        local c = p.Character
        local bv = Instance.new("BodyVelocity", c.HumanoidRootPart)
        bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        bv.Velocity = Vector3.new(0, 50, 0)
        task.wait(0.5)
        bv.Velocity = Vector3.new(0, 0, 0) -- يثبتك في مكانه
    end)

    -- 3. تجميع العملات (Auto Collect)
    CreateBtn("تجميع تلقائي (بدون لاق) 💰", function()
        _G.Auto = true
        while _G.Auto do task.wait(0.5)
            for _, v in pairs(workspace:GetDescendants()) do
                if v.Name == "Coin" or v.Name == "Cookie" or v.Name == "Beli" then
                    p.Character.HumanoidRootPart.CFrame = v.CFrame
                    break -- يأخذ واحدة ثم ينتظر لتقليل اللاق
                end
            end
        end
    end)

    -- 4. إخفاء القائمة
    CreateBtn("إخفاء السكربت ❌", function() MainFrame.Visible = false end)
end

-- برمجة الدخول
EnterBtn.MouseButton1Click:Connect(function()
    if PassBox.Text == CorrectPassword then
        LoginFrame:Destroy()
        OpenHub()
    end
end)
