-- [[ ♛ SATAYA VIP - MINIMIZE VERSION ♛ ]] --
local player = game.Players.LocalPlayer
local core = game:GetService("CoreGui")
local RunService = game:GetService("RunService")

-- تنظيف أي نسخة قديمة
if core:FindFirstChild("SatayaSystem") then core.SatayaSystem:Destroy() end

local sg = Instance.new("ScreenGui", core)
sg.Name = "SatayaSystem"
sg.ResetOnSpawn = false

-- [ زر الإظهار الصغير - يظهر بعد تسجيل الدخول ]
local OpenBtn = Instance.new("TextButton", sg)
OpenBtn.Name = "SatayaToggle"
OpenBtn.Text = "♛ SATAYA VIP ♛"
OpenBtn.Size = UDim2.new(0, 120, 0, 40)
OpenBtn.Position = UDim2.new(0, 10, 0.1, 0) -- مكانه في أعلى اليسار
OpenBtn.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
OpenBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
OpenBtn.Visible = false -- لا يظهر إلا بعد الدخول
OpenBtn.Draggable = true

-- [ واجهة تسجيل الدخول ]
local Login = Instance.new("Frame", sg)
Login.Size = UDim2.new(0, 260, 0, 200)
Login.Position = UDim2.new(0.5, -130, 0.5, -100)
Login.BackgroundColor3 = Color3.fromRGB(40, 0, 0)
Login.Draggable = true

local Box = Instance.new("TextBox", Login)
Box.PlaceholderText = "الباسورد: الهكر"
Box.Size = UDim2.new(0.8, 0, 0, 40)
Box.Position = UDim2.new(0.1, 0, 0.3, 0)
Box.Text = ""

local Btn = Instance.new("TextButton", Login)
Btn.Text = "دخول"
Btn.Size = UDim2.new(0.8, 0, 0, 40)
Btn.Position = UDim2.new(0.1, 0, 0.6, 0)
Btn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)

-- [ القائمة الرئيسية ]
local Main = Instance.new("Frame", sg)
Main.Size = UDim2.new(0, 230, 0, 380)
Main.Position = UDim2.new(0.5, -115, 0.5, -190)
Main.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Main.Visible = false -- مخفية في البداية
Main.Draggable = true

local function Create(txt, pos, clr, func)
    local b = Instance.new("TextButton", Main)
    b.Text = txt; b.Size = UDim2.new(0.9, 0, 0, 45)
    b.Position = UDim2.new(0.05, 0, 0, pos)
    b.BackgroundColor3 = clr; b.TextColor3 = Color3.fromRGB(255, 255, 255)
    b.MouseButton1Click:Connect(func)
end

-- الأزرار والمميزات
Create("فتح غرف الـ VIP 🔓", 50, Color3.fromRGB(255, 170, 0), function()
    for _, v in pairs(workspace:GetDescendants()) do
        if v.Name:lower():find("vip") or v.Name:lower():find("gate") then
            if v:IsA("BasePart") then v.CanCollide = false; v.Transparency = 0.5 end
        end
    end
end)

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

Create("كشف الكوكيز 🍪", 170, Color3.fromRGB(130, 80, 0), function()
    task.spawn(function()
        while task.wait(1) do
            for _, c in pairs(workspace:GetDescendants()) do
                if c.Name == "Cookie" and c:IsA("BasePart") then
                    if not c:FindFirstChild("Marker") then
                        local g = Instance.new("BillboardGui", c); g.Name = "Marker"; g.AlwaysOnTop = true; g.Size = UDim2.new(4,0,4,0)
                        local f = Instance.new("Frame", g); f.Size = UDim2.new(1,0,1,0); f.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
                    end
                end
            end
        end)
    end)
end)

-- زر "إخفاء القائمة" بدلاً من الإغلاق النهائي
Create("إخفاء السكربت 👁️", 280, Color3.fromRGB(50, 50, 50), function()
    Main.Visible = false
    OpenBtn.Visible = true
end)

-- عمل زر الإظهار (التوجل)
OpenBtn.MouseButton1Click:Connect(function()
    Main.Visible = true
    OpenBtn.Visible = false
end)

-- تفعيل تسجيل الدخول
Btn.MouseButton1Click:Connect(function()
    if Box.Text == "الهكر" or Box.Text == "1" then
        Login.Visible = false
        Main.Visible = true
    end
end)
