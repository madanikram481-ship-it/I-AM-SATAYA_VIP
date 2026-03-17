-- [[ ♛ SATAYA VIP - FORCE VIP UNLOCK ♛ ]] --
local player = game.Players.LocalPlayer
local core = game:GetService("CoreGui")

if core:FindFirstChild("SatayaSystem") then core.SatayaSystem:Destroy() end

local sg = Instance.new("ScreenGui", core)
sg.Name = "SatayaSystem"
sg.ResetOnSpawn = false

-- [ زر SATAYA VIP الصغير للإظهار ]
local OpenBtn = Instance.new("TextButton", sg)
OpenBtn.Text = "♛ SATAYA VIP ♛"
OpenBtn.Size = UDim2.new(0, 140, 0, 40)
OpenBtn.Position = UDim2.new(0, 10, 0.2, 0)
OpenBtn.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
OpenBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
OpenBtn.Visible = false
OpenBtn.Draggable = true

-- [ واجهة تسجيل الدخول ]
local Login = Instance.new("Frame", sg)
Login.Size = UDim2.new(0, 260, 0, 180)
Login.Position = UDim2.new(0.5, -130, 0.5, -90)
Login.BackgroundColor3 = Color3.fromRGB(30, 0, 0)
Login.Draggable = true

local Box = Instance.new("TextBox", Login)
Box.PlaceholderText = "الباسورد: الهكر"
Box.Size = UDim2.new(0.8, 0, 0, 40)
Box.Position = UDim2.new(0.1, 0, 0.3, 0)

local Btn = Instance.new("TextButton", Login)
Btn.Text = "دخول"
Btn.Size = UDim2.new(0.8, 0, 0, 40)
Btn.Position = UDim2.new(0.1, 0, 0.65, 0)
Btn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)

-- [ القائمة الرئيسية ]
local Main = Instance.new("Frame", sg)
Main.Size = UDim2.new(0, 220, 0, 350)
Main.Position = UDim2.new(0.5, -110, 0.5, -175)
Main.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
Main.Visible = false
Main.Draggable = true

local function Create(txt, pos, clr, func)
    local b = Instance.new("TextButton", Main)
    b.Text = txt; b.Size = UDim2.new(0.9, 0, 0, 45)
    b.Position = UDim2.new(0.05, 0, 0, pos)
    b.BackgroundColor3 = clr; b.TextColor3 = Color3.fromRGB(255, 255, 255)
    b.MouseButton1Click:Connect(func)
end

-- 1. الفتح القسري لغرف الـ VIP (بدون نسيان!)
Create("فتح غرف الـ VIP 🔓", 50, Color3.fromRGB(255, 170, 0), function()
    for _, v in pairs(workspace:GetDescendants()) do
        -- البحث عن أي شيء يحمل اسم VIP أو بوابة أو باب
        if v.Name:lower():find("vip") or v.Name:lower():find("gate") or v.Name:lower():find("door") then
            if v:IsA("BasePart") then
                v.CanCollide = false -- إلغاء التصادم (تمر من جواه)
                v.Transparency = 0.6 -- تجعله شفافاً
            end
        end
    end
end)

-- 2. الطيران
Create("طيران 🦅", 110, Color3.fromRGB(150, 0, 0), function()
    local root = player.Character.HumanoidRootPart
    local bv = Instance.new("BodyVelocity", root)
    bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    task.spawn(function()
        while task.wait() do
            bv.Velocity = player.Character.Humanoid.MoveDirection * 70
            if player.Character.Humanoid.Jump then bv.Velocity = bv.Velocity + Vector3.new(0, 50, 0) end
        end
    end)
end)

-- 3. إخفاء القائمة (تتحول لزر يحمل اسمك)
Create("إخفاء القائمة 👁️", 250, Color3.fromRGB(60, 60, 60), function()
    Main.Visible = false
    OpenBtn.Visible = true
end)

OpenBtn.MouseButton1Click:Connect(function()
    Main.Visible = true
    OpenBtn.Visible = false
end)

Btn.MouseButton1Click:Connect(function()
    if Box.Text == "الهكر" or Box.Text == "1" then
        Login.Visible = false
        Main.Visible = true
    end
end)
