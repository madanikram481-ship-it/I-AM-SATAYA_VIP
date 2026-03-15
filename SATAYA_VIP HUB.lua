-- [[ SATAYA_VIP SYSTEM WITH PASSWORD ]] --

local CorrectPassword = "SATAYA_VIP" -- يمكنك تغيير كلمة السر من هنا

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.Name = "SatayaLoginSystem"

-- 1. تصميم نافذة تسجيل الدخول
local LoginFrame = Instance.new("Frame")
LoginFrame.Size = UDim2.new(0, 280, 0, 190)
LoginFrame.Position = UDim2.new(0.5, -140, 0.5, -95)
LoginFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
LoginFrame.BorderSizePixel = 2
LoginFrame.BorderColor3 = Color3.fromRGB(255, 0, 0)
LoginFrame.Active = true
LoginFrame.Draggable = true
LoginFrame.Parent = ScreenGui

local LoginTitle = Instance.new("TextLabel")
LoginTitle.Text = "نظام دخول SATAYA_VIP"
LoginTitle.Size = UDim2.new(1, 0, 0, 40)
LoginTitle.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
LoginTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
LoginTitle.Font = Enum.Font.SourceSansBold
LoginTitle.TextSize = 18
LoginTitle.Parent = LoginFrame

local PassBox = Instance.new("TextBox")
PassBox.PlaceholderText = "أدخل كلمة السر هنا..."
PassBox.Size = UDim2.new(0.8, 0, 0, 40)
PassBox.Position = UDim2.new(0.1, 0, 0.35, 0)
PassBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
PassBox.TextColor3 = Color3.fromRGB(255, 255, 255)
PassBox.Font = Enum.Font.SourceSans
PassBox.TextSize = 16
PassBox.Parent = LoginFrame

local EnterBtn = Instance.new("TextButton")
EnterBtn.Text = "تحقق من الكلمة"
EnterBtn.Size = UDim2.new(0.8, 0, 0, 40)
EnterBtn.Position = UDim2.new(0.1, 0, 0.65, 0)
EnterBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
EnterBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
EnterBtn.Font = Enum.Font.SourceSansBold
EnterBtn.TextSize = 18
EnterBtn.Parent = LoginFrame

-- 2. وظيفة إنشاء القائمة الرئيسية بعد الدخول
local function OpenMainMenu()
    local MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(0, 220, 0, 250)
    MainFrame.Position = UDim2.new(0.1, 0, 0.4, 0)
    MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    MainFrame.BorderSizePixel = 2
    MainFrame.BorderColor3 = Color3.fromRGB(255, 0, 0)
    MainFrame.Active = true
    MainFrame.Draggable = true
    MainFrame.Parent = ScreenGui

    local MainTitle = Instance.new("TextLabel")
    MainTitle.Text = "قائمة SATAYA VIP الكاملة"
    MainTitle.Size = UDim2.new(1, 0, 0, 40)
    MainTitle.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
    MainTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    MainTitle.Parent = MainFrame

    local Layout = Instance.new("UIListLayout")
    Layout.Parent = MainFrame
    Layout.Padding = UDim.new(0, 10)
    Layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    Layout.SortOrder = Enum.SortOrder.LayoutOrder

    local function CreateBtn(name, color, func)
        local b = Instance.new("TextButton")
        b.Text = name
        b.Size = UDim2.new(0.9, 0, 0, 35)
        b.BackgroundColor3 = color
        b.TextColor3 = Color3.fromRGB(255, 255, 255)
        b.Parent = MainFrame
        b.MouseButton1Click:Connect(func)
    end

    -- الميزات
    CreateBtn("سرعة الـ VIP", Color3.fromRGB(0, 120, 0), function()
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100
    end)
    CreateBtn("قفز خارق", Color3.fromRGB(0, 100, 200), function()
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = 150
    end)
    CreateBtn("تفعيل الهروب للفوز", Color3.fromRGB(200, 100, 0), function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 600, 0)
    end)
    CreateBtn("إغلاق السكربت", Color3.fromRGB(80, 80, 80), function()
        ScreenGui:Destroy()
    end)
end

-- برمجة زر التحقق
EnterBtn.MouseButton1Click:Connect(function()
    if PassBox.Text == CorrectPassword then
        LoginFrame:Destroy() -- حذف نافذة الباسورد
        OpenMainMenu() -- فتح القائمة الرئيسية
    else
        PassBox.Text = ""
        PassBox.PlaceholderText = "كلمة السر خاطئة!"
        PassBox.PlaceholderColor3 = Color3.fromRGB(255, 0, 0)
    end
end)
