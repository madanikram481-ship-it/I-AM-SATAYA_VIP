-- [[ ♛ SATAYA VIP - FIXED GUI ON/OFF ♛ ]] --
local player = game.Players.LocalPlayer
local root = player.Character:WaitForChild("HumanoidRootPart")
local run = game:GetService("RunService")

-- إنشاء الواجهة في مكان مضمون (PlayerGui)
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SatayaPanelV2"
screenGui.Parent = player:WaitForChild("PlayerGui")
screenGui.ResetOnSpawn = false

-- [ الإطار الرئيسي ]
local Main = Instance.new("Frame", screenGui)
Main.Size = UDim2.new(0, 230, 0, 320)
Main.Position = UDim2.new(0.1, 0, 0.3, 0)
Main.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Main.BorderSizePixel = 2
Main.BorderColor3 = Color3.fromRGB(255, 0, 0)
Main.Active = true
Main.Draggable = true -- سحب القائمة بالماوس

local Title = Instance.new("TextLabel", Main)
Title.Text = "♛ SATAYA VIP PANEL ♛"
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
Title.TextColor3 = Color3.fromRGB(255, 255, 255)

-- وظيفة إنشاء الأزرار ON/OFF
local function CreateButton(name, pos, callback)
    local state = false
    local btn = Instance.new("TextButton", Main)
    btn.Text = name .. ": OFF"
    btn.Size = UDim2.new(0.9, 0, 0, 45)
    btn.Position = UDim2.new(0.05, 0, 0, pos)
    btn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.SourceSansBold

    btn.MouseButton1Click:Connect(function()
        state = not state
        btn.Text = state and (name .. ": ON") or (name .. ": OFF")
        btn.BackgroundColor3 = state and Color3.fromRGB(0, 180, 0) or Color3.fromRGB(100, 100, 100)
        callback(state)
    end)
end

-- 1. زر صيد السماوي
CreateButton("صيد السماوي", 50, function(on)
    _G.CyanLoop = on
    task.spawn(function()
        while _G.CyanLoop do
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("BasePart") and v.Name:lower():find("cyan") then
                    root.CFrame = v.CFrame
                    task.wait(0.2)
                end
            end
            task.wait(0.5)
        end
    end)
end)

-- 2. زر صيد السري (Secret)
CreateButton("صيد السري", 105, function(on)
    _G.SecretLoop = on
    task.spawn(function()
        while _G.SecretLoop do
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("BasePart") and v.Name:lower():find("secret") then
                    root.CFrame = v.CFrame
                    task.wait(0.2)
                end
            end
            task.wait(0.5)
        end
    end)
end)

-- 3. زر الطيران (Fly)
CreateButton("وضع الطيران", 160, function(on)
    if on then
        local bv = Instance.new("BodyVelocity", root)
        bv.Name = "SatayaFly"
        bv.MaxForce = Vector3.new(1e6, 1e6, 1e6)
        task.spawn(function()
            while on do
                bv.Velocity = player:GetMouse().Hit.lookVector * 80
                task.wait()
            end
        end)
    else
        if root:FindFirstChild("SatayaFly") then root.SatayaFly:Destroy() end
    end
end)

-- 4. زر السرعة (Speed)
CreateButton("سرعة خارقة", 215, function(on)
    player.Character.Humanoid.WalkSpeed = on and 120 or 16
end)

-- منصة حماية تحتك دائماً
local p = Instance.new("Part", workspace)
p.Size = Vector3.new(12, 1, 12); p.Anchored = true; p.Transparency = 1
run.Heartbeat:Connect(function() p.CFrame = root.CFrame * CFrame.new(0, -3.2, 0) end)
