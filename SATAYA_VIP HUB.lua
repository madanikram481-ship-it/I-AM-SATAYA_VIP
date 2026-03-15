-- [[ SATAYA_VIP HUB - ماب تسونامي ]]

-- 1. نظام كلمة السر
local CorrectPassword = "SATAYA_VIP"

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.Name = "SatayaTsunamiHub"

-- [ نافذة تسجيل الدخول ]
local LoginFrame = Instance.new("Frame")
LoginFrame.Size = UDim2.new(0, 280, 0, 190)
LoginFrame.Position = UDim2.new(0.5, -140, 0.5, -95)
LoginFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
LoginFrame.BorderSizePixel = 2
LoginFrame.BorderColor3 = Color3.fromRGB(255, 0, 0)
LoginFrame.Active = true
LoginFrame.Draggable = true
LoginFrame.Parent = ScreenGui

local LoginTitle = Instance.new("TextLabel")
LoginTitle.Text = "نظام دخول ساتايا | تسونامي"
LoginTitle.Size = UDim2.new(1, 0, 0, 40)
LoginTitle.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
LoginTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
LoginTitle.Font = Enum.Font.SourceSansBold
LoginTitle.Parent = LoginFrame

local PassBox = Instance.new("TextBox")
PassBox.PlaceholderText = "أدخل الباسورد هنا..."
PassBox.Size = UDim2.new(0.8, 0, 0, 40)
PassBox.Position = UDim2.new(0.1, 0, 0.35, 0)
PassBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
PassBox.TextColor3 = Color3.fromRGB(255, 255, 255)
PassBox.Parent = LoginFrame

local EnterBtn = Instance.new("TextButton")
EnterBtn.Text = "تحقق ودخول"
EnterBtn.Size = UDim2.new(0.8, 0, 0, 40)
EnterBtn.Position = UDim2.new(0.1, 0, 0.65, 0)
EnterBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
EnterBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
EnterBtn.Parent = LoginFrame

-- [ القائمة الرئيسية لماب تسونامي ]
local function OpenTsunamiMenu()
    local MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(0, 230, 0, 320)
    MainFrame.Position = UDim2.new(0.1, 0, 0.3, 0)
    MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
    MainFrame.BorderSizePixel = 2
    MainFrame.BorderColor3 = Color3.fromRGB(0, 170, 255) -- لون أزرق مثل الماء
    MainFrame.Active = true
    MainFrame.Draggable = true
    MainFrame.Parent = ScreenGui

    local MainTitle = Instance.new("TextLabel")
    MainTitle.Text = "TSUNAMI VIP | SATAYA"
    MainTitle.Size = UDim2.new(1, 0, 0, 40)
    MainTitle.BackgroundColor3 = Color3.fromRGB(0, 85, 127)
    MainTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    MainTitle.Parent = MainFrame

    local function CreateButton(text, pos, color, func)
        local btn = Instance.new("TextButton")
        btn.Text = text
        btn.Size = UDim2.new(0.9, 0, 0, 38)
        btn.Position = UDim2.new(0.05, 0, 0, pos)
        btn.BackgroundColor3 = color
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.Font = Enum.Font.SourceSansBold
        btn.Parent = MainFrame
        btn.MouseButton1Click:Connect(func)
    end

    -- 1. فتح الـ VIP (تغيير الرتبة في السيرفر المحلي)
    CreateButton("فتح ميزات الـ VIP مجاناً 🔓", 50, Color3.fromRGB(0, 150, 0), function()
        -- محاولة الوصول لملفات الـ VIP في الماب
        local p = game.Players.LocalPlayer
        if p:FindFirstChild("IsVip") then p.IsVip.Value = true end
        if p:FindFirstChild("VipPass") then p.VipPass.Value = true end
        print("تمت محاولة فتح الـ VIP")
    end)

    -- 2. الانتقال للأماكن المرتفعة (للهرب من التسونامي)
    CreateButton("انتقال لمكان مرتفع (نجاة) 🏔️", 100, Color3.fromRGB(0, 100, 200), function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0, 100, 0))
