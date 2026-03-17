-- [[ ♛ SATAYA VIP - DEVAN/DIWANIA HUNTER ♛ ]] --
local player = game.Players.LocalPlayer
local core = game:GetService("CoreGui")
local RunService = game:GetService("RunService")

-- تنظيف النسخ القديمة
if core:FindFirstChild("SatayaDiwania") then core.SatayaDiwania:Destroy() end

local sg = Instance.new("ScreenGui", core)
sg.Name = "SatayaDiwania"
sg.ResetOnSpawn = false

-- [ زر SATAYA VIP للإظهار ]
local OpenBtn = Instance.new("TextButton", sg)
OpenBtn.Text = "♛ SATAYA VIP ♛"
OpenBtn.Size = UDim2.new(0, 150, 0, 45)
OpenBtn.Position = UDim2.new(0, 10, 0.2, 0)
OpenBtn.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
OpenBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
OpenBtn.Visible = false
OpenBtn.Draggable = true

-- [ القائمة الرئيسية ]
local Main = Instance.new("Frame", sg)
Main.Size = UDim2.new(0, 250, 0, 400)
Main.Position = UDim2.new(0.5, -125, 0.5, -200)
Main.BackgroundColor3 = Color3.fromRGB(20, 0, 0)
Main.BorderSizePixel = 2
Main.BorderColor3 = Color3.fromRGB(255, 0, 0)
Main.Draggable = true

local function Create(txt, pos, clr, func)
    local b = Instance.new("TextButton", Main)
    b.Text = txt; b.Size = UDim2.new(0.9, 0, 0, 45)
    b.Position = UDim2.new(0.05, 0, 0, pos)
    b.BackgroundColor3 = clr; b.TextColor3 = Color3.fromRGB(255, 255, 255)
    b.Font = Enum.Font.SourceSansBold
    b.MouseButton1Click:Connect(func)
end

-- 1. تجميع الديوانية/الديفان (تحديث قسري)
Create("تجميع الديوانية تلقائياً 💎⚡", 60, Color3.fromRGB(0, 120, 255), function()
    task.spawn(function()
        while task.wait(0.1) do
            for _, v in pairs(workspace:GetDescendants()) do
                -- البحث عن أي غرض يحمل اسم ديفان أو ديوانية أو حتى كود برمجي مخفي
                if v.Name:lower():find("devan") or v.Name:lower():find("diwan") or v.Name == "SpecialItem" then
                    if v:IsA("BasePart") or v:IsA("MeshPart") then
                        -- انتقال فوري فوق الغرض مباشرة
                        player.Character.HumanoidRootPart.CFrame = v.CFrame + Vector3.new(0, 2, 0)
                        task.wait(0.2)
                    end
                end
            end
        end
    end)
end)

-- 2. كشف مكان الديوانية (رادار)
Create("كشف مكان الديوانية 👁️", 120, Color3.fromRGB(0, 150, 0), function()
    task.spawn(function()
        while task.wait(1) do
            for _, v in pairs(workspace:GetDescendants()) do
                if v.Name:lower():find("devan") or v.Name:lower():find("diwan") then
                    if not v:FindFirstChild("DiwanESP") then
                        local g = Instance.new("BillboardGui", v)
                        g.Name = "DiwanESP"; g.AlwaysOnTop = true; g.Size = UDim2.new(4,0,4,0)
                        local f = Instance.new("Frame", g); f.Size = UDim2.new(1,0,1,0); f.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
                    end
                end
            end
        end
    end)
end)

-- 3. عدم الموت (لضمان الجمع بسلام)
Create("تفعيل الخلود 🛡️", 180, Color3.fromRGB(150, 0, 0), function()
    RunService.Stepped:Connect(function()
        pcall(function()
            if player.Character and player.Character:FindFirstChild("Humanoid") then
                player.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
            end
            for _, p in pairs(workspace:GetDescendants()) do
                if p.Name == "Water" or p.Name == "Wave" then p.CanTouch = false end
            end
        end)
    end)
end)

-- 4. إخفاء القائمة
Create("إخفاء السكربت 👁️", 320, Color3.fromRGB(60, 60, 60), function()
    Main.Visible = false
    OpenBtn.Visible = true
end)

OpenBtn.MouseButton1Click:Connect(function()
    Main.Visible = true; OpenBtn.Visible = false
end)
