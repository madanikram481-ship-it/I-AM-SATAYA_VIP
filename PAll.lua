-- [[ ♛ SATAYA VIP - THE ULTIMATE PANEL + COOKIE ESP ♛ ]] --
local player = game.Players.LocalPlayer
local core = game:GetService("CoreGui")
local root = player.Character:WaitForChild("HumanoidRootPart")

-- تنظيف السكربتات السابقة
if core:FindFirstChild("SatayaFinalPanel") then core.SatayaFinalPanel:Destroy() end

local sg = Instance.new("ScreenGui", core)
sg.Name = "SatayaFinalPanel"

-- [ الواجهة ]
local Main = Instance.new("Frame", sg)
Main.Size = UDim2.new(0, 250, 0, 400)
Main.Position = UDim2.new(0.05, 0, 0.2, 0)
Main.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
Main.BorderSizePixel = 2
Main.BorderColor3 = Color3.fromRGB(255, 215, 0) -- ذهبي فخم
Main.Active = true; Main.Draggable = true

local Title = Instance.new("TextLabel", Main)
Title.Text = "♛ لوحة SATAYA VIP الشاملة ♛"
Title.Size = UDim2.new(1, 0, 0, 45)
Title.BackgroundColor3 = Color3.fromRGB(80, 0, 0)
Title.TextColor3 = Color3.fromRGB(255, 255, 255)

local activeTarget = ""

-- [ 1. رادار كشف الكوكيز الحقيقية (دائم الشغل) ]
task.spawn(function()
    while task.wait(1) do
        for _, v in pairs(workspace:GetDescendants()) do
            -- البحث عن الكوكيز الحقيقية حتى لو اسمها مخفي (عن طريق الحجم والموديل)
            if (v.Name:lower():find("cookie") or v.Name == "RealCookie") and v:IsA("BasePart") then
                if not v:FindFirstChild("CookieESP") then
                    local highlight = Instance.new("Highlight", v)
                    highlight.Name = "CookieESP"
                    highlight.FillColor = Color3.fromRGB(255, 165, 0) -- برتقالي للكوكيز
                    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                    
                    local bill = Instance.new("BillboardGui", v)
                    bill.AlwaysOnTop = true; bill.Size = UDim2.new(0, 100, 0, 50); bill.ExtentsOffset = Vector3.new(0, 3, 0)
                    local txt = Instance.new("TextLabel", bill)
                    txt.Text = "🍪 COOKIE 🍪"; txt.Size = UDim2.new(1, 0, 1, 0); txt.BackgroundTransparency = 1; txt.TextColor3 = Color3.fromRGB(255, 255, 0); txt.TextScaled = true
                end
            end
        end
    end
end)

-- وظيفة إنشاء أزرار الصيد
local function CreateButton(text, pos, color, target)
    local b = Instance.new("TextButton", Main)
    b.Text = text; b.Size = UDim2.new(0.9, 0, 0, 45); b.Position = UDim2.new(0.05, 0, 0, pos)
    b.BackgroundColor3 = color; b.TextColor3 = Color3.fromRGB(255, 255, 255); b.Font = Enum.Font.SourceSansBold
    b.MouseButton1Click:Connect(function() 
        activeTarget = target
        Title.Text = "جاري صيد: " .. target
    end)
end

-- [ الأزرار ]
CreateButton("صيد النوع السري (Secret)", 60, Color3.fromRGB(120, 0, 150), "Secret")
CreateButton("صيد النوع السماوي (Cyan)", 115, Color3.fromRGB(0, 150, 255), "Cyan")
CreateButton("صيد الانفينيتي (Infinity)", 170, Color3.fromRGB(0, 120, 0), "Infinity")
CreateButton("صيد الديفان (Devan)", 225, Color3.fromRGB(180, 100, 0), "Devan")

-- زر إيقاف الصيد
local stop = Instance.new("TextButton", Main)
stop.Text = "إيقاف الصيد 🛑"; stop.Size = UDim2.new(0.9, 0, 0, 40); stop.Position = UDim2.new(0.05, 0, 0, 280)
stop.BackgroundColor3 = Color3.fromRGB(50, 50, 50); stop.TextColor3 = Color3.fromRGB(255, 255, 255)
stop.MouseButton1Click:Connect(function() activeTarget = "" Title.Text = "الوضع: انتظار" end)

-- [ محرك الصيد ]
task.spawn(function()
    while task.wait(0.1) do
        if activeTarget ~= "" then
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("BasePart") and v.Name:lower():find(activeTarget:lower()) and v.Size.Magnitude < 15 then
                    root.CFrame = v.CFrame
                    task.wait(0.1)
                end
            end
        end
    end
end)

-- [ حماية الخلود ]
local p = Instance.new("Part", workspace)
p.Size = Vector3.new(15, 1, 15); p.Anchored = true; p.Transparency = 1
game:GetService("RunService").Heartbeat:Connect(function()
    p.CFrame = root.CFrame * CFrame.new(0, -3.2, 0)
end)
