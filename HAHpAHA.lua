-- [[ ♛ SATAYA VIP - ROYAL BANNER EDITION ♛ ]] --
-- مخصص لعرض بانر إيتاتشي فخم جداً

local player = game.Players.LocalPlayer
local core = game:GetService("CoreGui")
local RunService = game:GetService("RunService")

-- تنظيف أي نسخة قديمة
if core:FindFirstChild("SatayaRoyal") then core.SatayaRoyal:Destroy() end

local sg = Instance.new("ScreenGui", core)
sg.Name = "SatayaRoyal"
sg.ResetOnSpawn = false

-- [ واجهة تسجيل الدخول بفخامة ]
local Login = Instance.new("Frame", sg)
Login.Size = UDim2.new(0, 320, 0, 400)
Login.Position = UDim2.new(0.5, -160, 0.5, -200)
Login.BackgroundColor3 = Color3.fromRGB(10, 0, 0)
Login.BorderSizePixel = 2
Login.BorderColor3 = Color3.fromRGB(255, 0, 0)
Login.Active = true
Login.Draggable = true

-- بانر إيتاتشي في واجهة الدخول
local LoginBanner = Instance.new("ImageLabel", Login)
LoginBanner.Size = UDim2.new(1, 0, 0.6, 0)
LoginBanner.Position = UDim2.new(0, 0, 0, 0)
LoginBanner.Image = "rbxassetid://12921506541" -- صورة إيتاتشي فخمة
LoginBanner.BackgroundTransparency = 1

local Box = Instance.new("TextBox", Login)
Box.PlaceholderText = "الباسورد: الهكر"
Box.Size = UDim2.new(0.8, 0, 0, 40)
Box.Position = UDim2.new(0.1, 0, 0.65, 0)
Box.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Box.TextColor3 = Color3.fromRGB(255, 255, 255)
Box.Text = ""

local Btn = Instance.new("TextButton", Login)
Btn.Text = "دخول الملك | LOGIN"
Btn.Size = UDim2.new(0.8, 0, 0, 45)
Btn.Position = UDim2.new(0.1, 0, 0.8, 0)
Btn.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
Btn.Font = Enum.Font.SourceSansBold

-- [ القائمة الرئيسية الملكية ]
local function OpenMenu()
    local Main = Instance.new("Frame", sg)
    Main.Size = UDim2.new(0, 350, 0, 500)
    Main.Position = UDim2.new(0.5, -175, 0.5, -250)
    Main.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
    Main.BorderSizePixel = 2
    Main.BorderColor3 = Color3.fromRGB(255, 0, 0)
    Main.Active = true
    Main.Draggable = true

    -- ** بانر إيتاتشي الرئيسي (الفخامة هنا) **
    local MainBanner = Instance.new("ImageLabel", Main)
    MainBanner.Size = UDim2.new(1, 0, 0.5, 0) -- يغطي نصف القائمة
    MainBanner.Position = UDim2.new(0, 0, 0, 0)
    MainBanner.Image = "rbxassetid://12921506541" -- نفس الصورة الفخمة
    MainBanner.BackgroundTransparency = 1

    -- عنوان السكربت فوق البانر
    local Title = Instance.new("TextLabel", Main)
    Title.Text = "♛ SATAYA VIP HUB ♛"
    Title.Size = UDim2.new(1, 0, 0, 40)
    Title.Position = UDim2.new(0, 0, 0.45, 0)
    Title.BackgroundColor3 = Color3.fromRGB(80, 0, 0)
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.Font = Enum.Font.SourceSansBold
    Title.TextSize = 20

    -- حاوية الأزرار (لتكون مرتبة أسفل البانر)
    local ButtonFrame = Instance.new("Frame", Main)
    ButtonFrame.Size = UDim2.new(1, 0, 0.5, -40)
    ButtonFrame.Position = UDim2.new(0, 0, 0.5, 40)
    ButtonFrame.BackgroundTransparency = 1

    local function MakeBtn(txt, pos, clr, func)
        local b = Instance.new("TextButton", ButtonFrame)
        b.Text = txt; b.Size = UDim2.new(0.8, 0, 0, 40)
        b.Position = UDim2.new(0.1, 0, 0, pos)
        b.BackgroundColor3 = clr; b.BackgroundTransparency = 0.2 -- شفافة قليلاً
        b.TextColor3 = Color3.fromRGB(255, 255, 255)
        b.Font = Enum.Font.SourceSansBold; b.TextSize = 14
        b.MouseButton1Click:Connect(func)
    end

    -- 1. ميزة كشف الكوكيز
    MakeBtn("تفعيل كشف الكوكيز 🍪", 10, Color3.fromRGB(150, 75, 0), function()
        spawn(function()
            while wait(1) do
                for _, v in pairs(workspace:GetDescendants()) do
                    if v.Name == "Cookie" and v:IsA("BasePart") then
                        if not v:FindFirstChild("Marker") then
                            local g = Instance.new("BillboardGui", v)
                            g.Name = "Marker"; g.Size = UDim2.new(2,0,2,0); g.AlwaysOnTop = true
                            local f = Instance.new("Frame", g)
                            f.Size = UDim2.new(1,0,1,0); f.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
                        end
                    end
                end
            end
        end)
    end)

    -- 2. ضد الموجات
    MakeBtn("تفعيل ضد الموجات 🛡️", 60, Color3.fromRGB(0, 100, 200), function()
        RunService.Stepped:Connect(function()
            for _, w in pairs(workspace:GetDescendants()) do
                if (w.Name == "Wave" or w.Name == "Water") and w:IsA("BasePart") then
                    w.CanTouch = false
                end
            end
        end)
    end)

    -- 3. الطيران الاحترافي (مصلح وشغال 100%)
    MakeBtn("تفعيل الطيران الاحترافي 🦅", 110, Color3.fromRGB(100, 0, 0), function()
        local c = player.Character
        local h = c.Humanoid
        local root = c.HumanoidRootPart
        local speed = 60
        
        local bv = Instance.new("BodyVelocity", root)
        local bg = Instance.new("BodyGyro", root)
        bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        bg.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
        
        spawn(function()
            while wait() do
                bv.Velocity = h.MoveDirection * speed
                bg.CFrame = workspace.CurrentCamera.CFrame
                if h.Jump then bv.Velocity = bv.Velocity + Vector3.new(0, speed, 0) end
            end
        end)
    end)

    -- 4. إغلاق السكربت (لتنظيف الشاشة)
    MakeBtn("إغلاق السكربت نهائياً ❌", 170, Color3.fromRGB(50, 50, 50), function()
        sg:Destroy()
    end)
end

Btn.MouseButton1Click:Connect(function()
    if Box.Text == "الهكر" or Box.Text == "1" then
        Login:Destroy()
        OpenMenu()
    end
end)
