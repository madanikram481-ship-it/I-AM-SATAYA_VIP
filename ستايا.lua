-- [[ ♛ SATAYA VIP - AUTO COLLECT & FULL FLIGHT ♛ ]] --
local player = game.Players.LocalPlayer
local core = game:GetService("CoreGui")
local RunService = game:GetService("RunService")

if core:FindFirstChild("SatayaGodMode") then core.SatayaGodMode:Destroy() end

local sg = Instance.new("ScreenGui", core)
sg.Name = "SatayaGodMode"
sg.ResetOnSpawn = false

-- [ زر SATAYA VIP الصغير ]
local OpenBtn = Instance.new("TextButton", sg)
OpenBtn.Text = "♛ SATAYA VIP ♛"
OpenBtn.Size = UDim2.new(0, 140, 0, 40)
OpenBtn.Position = UDim2.new(0, 10, 0.2, 0)
OpenBtn.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
OpenBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
OpenBtn.Visible = false
OpenBtn.Draggable = true

-- [ القائمة الرئيسية ]
local Main = Instance.new("Frame", sg)
Main.Size = UDim2.new(0, 240, 0, 420)
Main.Position = UDim2.new(0.5, -120, 0.5, -210)
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Main.BorderSizePixel = 2
Main.BorderColor3 = Color3.fromRGB(255, 0, 0)
Main.Visible = true -- للدخول المباشر
Main.Draggable = true

local function Create(txt, pos, clr, func)
    local b = Instance.new("TextButton", Main)
    b.Text = txt; b.Size = UDim2.new(0.9, 0, 0, 45)
    b.Position = UDim2.new(0.05, 0, 0, pos)
    b.BackgroundColor3 = clr; b.TextColor3 = Color3.fromRGB(255, 255, 255)
    b.Font = Enum.Font.SourceSansBold
    b.MouseButton1Click:Connect(func)
end

-- 1. صائد الديفان التلقائي (Auto Collect)
Create("صيد الديفان تلقائياً 💎", 50, Color3.fromRGB(0, 150, 255), function()
    task.spawn(function()
        while task.wait(0.1) do
            -- يبحث عن "ديفان" في كل الماب
            for _, v in pairs(workspace:GetDescendants()) do
                if v.Name == "Devan" or v.Name == "ديفان" or v.Name == "SpecialItem" then
                    if v:IsA("BasePart") then
                        -- انتقال فوري لمكان الغرض
                        player.Character.HumanoidRootPart.CFrame = v.CFrame
                        task.wait(0.2)
                    end
                end
            end
        end
    end)
end)

-- 2. فتح غرف الـ VIP
Create("فتح غرف الـ VIP 🔓", 110, Color3.fromRGB(255, 170, 0), function()
    for _, v in pairs(workspace:GetDescendants()) do
        if v.Name:lower():find("vip") or v.Name:lower():find("door") then
            if v:IsA("BasePart") then v.CanCollide = false; v.Transparency = 0.5 end
        end
    end
end)

-- 3. طيران كامل (صعود ونزول)
Create("طيران (صعود/نزول) 🦅", 170, Color3.fromRGB(150, 0, 0), function()
    local root = player.Character.HumanoidRootPart
    local hum = player.Character.Humanoid
    local bv = Instance.new("BodyVelocity", root)
    bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    
    task.spawn(function()
        while task.wait() do
            local yVel = 0
            if hum.Jump then yVel = 50 elseif hum.Sit then yVel = -50 end
            bv.Velocity = (hum.MoveDirection * 70) + Vector3.new(0, yVel, 0)
        end
    end)
end)

-- 4. ضد الغرق والموجات (حماية دائمة)
Create("حماية من الموت 🛡️", 230, Color3.fromRGB(0, 120, 0), function()
    RunService.Stepped:Connect(function()
        for _, w in pairs(workspace:GetDescendants()) do
            if (w.Name == "Water" or w.Name == "Wave") and w:IsA("BasePart") then
                w.CanTouch = false
            end
        end
    end)
end)

-- إخفاء القائمة
Create("إخفاء السكربت 👁️", 340, Color3.fromRGB(60, 60, 60), function()
    Main.Visible = false
    OpenBtn.Visible = true
end)

OpenBtn.MouseButton1Click:Connect(function()
    Main.Visible = true
    OpenBtn.Visible = false
end)
