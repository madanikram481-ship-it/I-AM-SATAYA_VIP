-- [[ ♛ SATAYA VIP - GOD MODE & HYPER SPEED PANEL ♛ ]] --
local player = game.Players.LocalPlayer
local root = player.Character:WaitForChild("HumanoidRootPart")
local hum = player.Character:WaitForChild("Humanoid")
local run = game:GetService("RunService")

-- إنشاء الواجهة المضمونة
if player:WaitForChild("PlayerGui"):FindFirstChild("SatayaGodPanel") then player.PlayerGui.SatayaGodPanel:Destroy() end
local sg = Instance.new("ScreenGui", player.PlayerGui)
sg.Name = "SatayaGodPanel"

-- اللوحة الرئيسية
local Main = Instance.new("Frame", sg)
Main.Size = UDim2.new(0, 260, 0, 420); Main.Position = UDim2.new(0.05, 0, 0.2, 0)
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15); Main.BorderColor3 = Color3.fromRGB(255, 0, 0)
Main.Active = true; Main.Draggable = true

local Title = Instance.new("TextLabel", Main)
Title.Text = "♛ SATAYA VIP FINAL ♛"; Title.Size = UDim2.new(1, 0, 0, 45)
Title.BackgroundColor3 = Color3.fromRGB(120, 0, 0); Title.TextColor3 = Color3.fromRGB(255, 255, 255)

local function CreateToggle(text, pos, callback)
    local state = false
    local btn = Instance.new("TextButton", Main)
    btn.Text = text .. ": OFF"; btn.Size = UDim2.new(0.9, 0, 0, 45); btn.Position = UDim2.new(0.05, 0, 0, pos)
    btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60); btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.MouseButton1Click:Connect(function()
        state = not state
        btn.Text = state and (text .. ": ON") or (text .. ": OFF")
        btn.BackgroundColor3 = state and Color3.fromRGB(0, 150, 0) or Color3.fromRGB(60, 60, 60)
        callback(state)
    end)
end

-- [ 1. ميزة عدم الموت VIP (God Mode) ]
-- منصة خفية تمنعك من لمس الماء أو الليزر
local platform = Instance.new("Part", workspace)
platform.Size = Vector3.new(15, 1, 15); platform.Anchored = true; platform.Transparency = 1
run.Heartbeat:Connect(function()
    platform.CFrame = root.CFrame * CFrame.new(0, -3.2, 0)
end)

-- [ 2. أزرار التحكم ]
CreateToggle("السرعة الخارقة (150)", 60, function(on)
    hum.WalkSpeed = on and 150 or 16
end)

CreateToggle("القفز الخارق", 115, function(on)
    hum.JumpPower = on and 120 or 50
end)

CreateToggle("صيد السماوي (Cyan)", 170, function(on)
    _G.CyanH = on
    task.spawn(function()
        while _G.CyanH do
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("BasePart") and v.Name:lower():find("cyan") then
                    root.CFrame = v.CFrame; task.wait(0.2)
                end
            end
            task.wait(0.5)
        end
    end)
end)

CreateToggle("صيد السري (Secret)", 225, function(on)
    _G.SecH = on
    task.spawn(function()
        while _G.SecH do
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("BasePart") and v.Name:lower():find("secret") then
                    root.CFrame = v.CFrame; task.wait(0.2)
                end
            end
            task.wait(0.5)
        end
    end)
end)

CreateToggle("كشف الكوكيز", 280, function(on)
    _G.CookieESP = on
    for _, v in pairs(workspace:GetDescendants()) do
        if v.Name:lower():find("cookie") and v:IsA("BasePart") then
            if on then
                local h = Instance.new("Highlight", v); h.Name = "ESP"; h.FillColor = Color3.fromRGB(255, 255, 0)
            else
                if v:FindFirstChild("ESP") then v.ESP:Destroy() end
            end
        end
    end
end)

CreateToggle("وضع الطيران (Fly)", 335, function(on)
    _G.Fly = on
    if on then
        local bv = Instance.new("BodyVelocity", root)
        bv.Name = "VIPFly"; bv.MaxForce = Vector3.new(1e6, 1e6, 1e6)
        task.spawn(function()
            while _G.Fly do
                bv.Velocity = player:GetMouse().Hit.lookVector * 100
                task.wait()
            end
            if root:FindFirstChild("VIPFly") then root.VIPFly:Destroy() end
        end)
    else
        if root:FindFirstChild("VIPFly") then root.VIPFly:Destroy() end
    end
end)
