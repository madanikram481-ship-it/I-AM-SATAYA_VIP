-- [[ ♛ SATAYA VIP - ALL-IN-ONE ULTIMATE SCRIPT ♛ ]] --
-- الإصدار: V15 (الأسرع والأشمل)

local player = game.Players.LocalPlayer
local core = game:GetService("CoreGui")
local RunService = game:GetService("RunService")

-- تنظيف النسخ القديمة لضمان عدم حدوث لاق أو تداخل
if core:FindFirstChild("SatayaUltimate") then core.SatayaUltimate:Destroy() end

local sg = Instance.new("ScreenGui", core)
sg.Name = "SatayaUltimate"
sg.ResetOnSpawn = false

-- [ واجهة تسجيل الدخول ]
local Login = Instance.new("Frame", sg)
Login.Size = UDim2.new(0, 300, 0, 250)
Login.Position = UDim2.new(0.5, -150, 0.5, -125)
Login.BackgroundColor3 = Color3.fromRGB(20, 0, 0)
Login.BorderSizePixel = 2
Login.BorderColor3 = Color3.fromRGB(255, 0, 0)
Login.Active = true
Login.Draggable = true

local Title = Instance.new("TextLabel", Login)
Title.Text = "♛ SATAYA VIP LOGIN ♛"
Title.Size = UDim2.new(1, 0, 0, 50)
Title.BackgroundColor3 = Color3.fromRGB(60, 0, 0)
Title.TextColor3 = Color3.fromRGB(255, 255, 255)

local Box = Instance.new("TextBox", Login)
Box.PlaceholderText = "الباسورد: الهكر"
Box.Size = UDim2.new(0.8, 0, 0, 40)
Box.Position = UDim2.new(0.1, 0, 0.4, 0)
Box.Text = ""

local Btn = Instance.new("TextButton", Login)
Btn.Text = "دخول"
Btn.Size = UDim2.new(0.8, 0, 0, 45)
Btn.Position = UDim2.new(0.1, 0, 0.7, 0)
Btn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
Btn.TextColor3 = Color3.fromRGB(255, 255, 255)

-- [ القائمة الرئيسية الشاملة ]
local function OpenMenu()
    local Main = Instance.new("Frame", sg)
    Main.Size = UDim2.new(0, 320, 0, 450)
    Main.Position = UDim2.new(0.5, -160, 0.5, -225)
    Main.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
    Main.BorderSizePixel = 2
    Main.BorderColor3 = Color3.fromRGB(255, 0, 0)
    Main.Active = true
    Main.Draggable = true

    local Scroll = Instance.new("ScrollingFrame", Main)
    Scroll.Size = UDim2.new(1, 0, 1, -10)
    Scroll.CanvasSize = UDim2.new(0, 0, 2, 0)
    Scroll.BackgroundTransparency = 1

    local List = Instance.new("UIListLayout", Scroll)
    List.Padding = UDim.new(0, 10); List.HorizontalAlignment = Enum.HorizontalAlignment.Center

    local function AddBtn(txt, clr, func)
        local b = Instance.new("TextButton", Scroll)
        b.Text = txt; b.Size = UDim2.new(0.9, 0, 0, 45)
        b.BackgroundColor3 = clr; b.TextColor3 = Color3.fromRGB(255, 255, 255)
        b.Font = Enum.Font.SourceSansBold; b.MouseButton1Click:Connect(func)
    end

    -- 1. كشف الكوكيز (ESP)
    AddBtn("كشف الكوكيز 🍪", Color3.fromRGB(150, 75, 0), function()
        task.spawn(function()
            while task.wait(1) do
                for _, v in pairs(workspace:GetDescendants()) do
                    if v.Name == "Cookie" and v:IsA("BasePart") then
                        if not v:FindFirstChild("Marker") then
                            local g = Instance.new("BillboardGui", v)
                            g.Name = "Marker"; g.Size = UDim2.new(3,0,3,0); g.AlwaysOnTop = true
                            local f = Instance.new("Frame", g)
                            f.Size = UDim2.new(1,0,1,0); f.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
                        end
                    end
                end
            end
        end)
    end)

    -- 2. ضد الموجات (God Mode)
    AddBtn("ضد الموجات 🛡️", Color3.fromRGB(0, 102, 204), function()
        RunService.Stepped:Connect(function()
            for _, w in pairs(workspace:GetDescendants()) do
                if (w.Name == "Wave" or w.Name == "Water") and w:IsA("BasePart") then
                    w.CanTouch = false
                end
            end
        end)
    end)

    -- 3. طيران احترافي (Fly)
    AddBtn("طيران (تحكم كامل) 🦅", Color3.fromRGB(100, 0, 0), function()
        local char = player.Character
        local root = char.HumanoidRootPart
        local bv = Instance.new("BodyVelocity", root)
        bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        task.spawn(function()
            while task.wait() do
                bv.Velocity = char.Humanoid.MoveDirection * 60
                if char.Humanoid.Jump then bv.Velocity = bv.Velocity + Vector3.new(0, 50, 0) end
            end
        end)
    end)

    -- 4. سرعة المشي (Speed)
    AddBtn("سرعة الـ VIP ⚡", Color3.fromRGB(0, 150, 0), function()
        player.Character.Humanoid.WalkSpeed = 100
    end)

    -- 5. قوة القفزة (Jump)
    AddBtn("قفزة خارقة 🚀", Color3.fromRGB(153, 0, 153), function()
        player.Character.Humanoid.JumpPower = 150
    end)

    -- 6. تختيم فوري (Win)
    AddBtn("تختيم الماب فوري 🏆", Color3.fromRGB(200, 100, 0), function()
        local win = workspace:FindFirstChild("Finish") or workspace:FindFirstChild("Win")
        if win then player.Character.HumanoidRootPart.CFrame = win.CFrame end
    end)

    -- 7. إغلاق السكربت
    AddBtn("إغلاق السكربت نهائياً ❌", Color3.fromRGB(50, 50, 50), function()
        sg:Destroy()
    end)
end

Btn.MouseButton1Click:Connect(function()
    if Box.Text == "الهكر" or Box.Text == "1" then
        Login:Destroy()
        OpenMenu()
    end
end)
