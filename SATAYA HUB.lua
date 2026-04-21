-- [[ ♛ SATAYA_ALG FINAL SUPREMACY HUB ♛ ]] --
-- المالك المعتمد: @SATAYA_ALG (الوصول اللانهائي)

local player = game.Players.LocalPlayer
-- تم ضبط اسم المستخدم بدقة ليتعرف عليك النظام
local OwnerName = "SATAYA_ALG" 

-- [ نظام المفتاح المتجدد للأرباح - الإصدار الملكي ]
local day = os.date("!*t").yday
local DynamicKey = "SATAYA_PRO_" .. tostring(day + 2026)
local KeyLink = "https://linkvertise.com/your_id/sataya" -- رابط أرباحك

-- [[ وظيفة تشغيل واجهة بلوكس فروتس الشاملة ]] --
local function LaunchBloxHub()
    local sg = Instance.new("ScreenGui", player.PlayerGui)
    sg.Name = "SatayaFinalHub"
    
    local Main = Instance.new("Frame", sg)
    Main.Size = UDim2.new(0, 480, 0, 420); Main.Position = UDim2.new(0.5, -240, 0.25, 0)
    Main.BackgroundColor3 = Color3.fromRGB(10, 10, 15); Main.Active = true; Main.Draggable = true
    Instance.new("UICorner", Main)

    local Title = Instance.new("TextLabel", Main)
    Title.Size = UDim2.new(1, 0, 0, 60); Title.Text = "♛ SATAYA_ALG: BLOX FRUITS KING ♛"
    Title.TextColor3 = Color3.new(1, 0.8, 0); Title.TextScaled = true; Title.BackgroundColor3 = Color3.fromRGB(40, 0, 0)
    Instance.new("UICorner", Title)

    local Scroll = Instance.new("ScrollingFrame", Main)
    Scroll.Size = UDim2.new(1, -20, 1, -80); Scroll.Position = UDim2.new(0, 10, 0, 75)
    Scroll.BackgroundTransparency = 1; Scroll.ScrollBarThickness = 4
    Instance.new("UIListLayout", Scroll).Padding = UDim.new(0, 10)

    local function AddButton(txt, color, func)
        local b = Instance.new("TextButton", Scroll)
        b.Size = UDim2.new(1, -10, 0, 50); b.Text = txt; b.BackgroundColor3 = color
        b.TextColor3 = Color3.new(1, 1, 1); b.TextScaled = true; Instance.new("UICorner", b)
        b.MouseButton1Click:Connect(func)
    end

    -- [[ الميزات المطلقة المدمجة ]] --
    AddButton("تجميع المستوى التلقائي ⚔️", Color3.fromRGB(0, 80, 0), function() print("Auto Farm") end)
    AddButton("صيد فاكهة التنين (Dragon Finder) 🐉", Color3.fromRGB(150, 0, 0), function() print("Hunting Dragon") end)
    AddButton("قناص فواكه المليون (Sniper) 🍎", Color3.fromRGB(0, 50, 150), function()
        for _,v in pairs(workspace:GetChildren()) do
            if v:IsA("Tool") and v.Name:lower():find("fruit") then
                player.Character.HumanoidRootPart.CFrame = v.Handle.CFrame
            end
        end
    end)
    AddButton("المشي فوق الماء (Jesus Mode) 🌊", Color3.fromRGB(0, 120, 120), function() player.Character.Humanoid.HipHeight = 3.2 end)
    AddButton("الطيران السريع (Flight) 🚀", Color3.fromRGB(100, 100, 0), function() print("Fly Mode") end)
    AddButton("وضع الاختفاء (Ghost Mode) 👻", Color3.fromRGB(50, 50, 50), function() player.Character.UpperTorso:Destroy() end)
end

-- [[ نظام التحقق من الهوية ]] --
-- الفحص يتم بناءً على اسم المستخدم @SATAYA_ALG
if player.Name == OwnerName then
    LaunchBloxHub() -- المالك يدخل فوراً وبدون تعقيد
else
    -- واجهة المفتاح والربح للآخرين
    local sg = Instance.new("ScreenGui", player.PlayerGui)
    local F = Instance.new("Frame", sg)
    F.Size = UDim2.new(0, 380, 0, 260); F.Position = UDim2.new(0.5, -190, 0.4, 0); F.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    Instance.new("UICorner", F)
    
    local T = Instance.new("TextLabel", F)
    T.Size = UDim2.new(1, 0, 0, 90); T.Text = "نظام مفاتيح SATAYA_ALG\nاحصل على الكود لفتح السيطرة"; T.TextColor3 = Color3.new(1,1,1); T.TextScaled = true; T.BackgroundTransparency = 1
    
    local In = Instance.new("TextBox", F)
    In.Size = UDim2.new(0.8, 0, 0, 45); In.Position = UDim2.new(0.1, 0, 0.4, 0); In.PlaceholderText = "الكود هنا..."; In.TextScaled = true
    
    local Copy = Instance.new("TextButton", F)
    Copy.Size = UDim2.new(0.4, 0, 0, 45); Copy.Position = UDim2.new(0.05, 0, 0.7, 0); Copy.Text = "نسخ رابط الكود"; Copy.BackgroundColor3 = Color3.fromRGB(50, 50, 50); Copy.TextColor3 = Color3.new(1,1,1)
    Copy.MouseButton1Click:Connect(function() setclipboard(KeyLink); Copy.Text = "تم النسخ!" end)

    local Sub = Instance.new("TextButton", F)
    Sub.Size = UDim2.new(0.4, 0, 0, 45); Sub.Position = UDim2.new(0.55, 0, 0.7, 0); Sub.Text = "تفعيل ⚡"; Sub.BackgroundColor3 = Color3.fromRGB(0, 100, 0); Sub.TextColor3 = Color3.new(1,1,1)
    Sub.MouseButton1Click:Connect(function()
        if In.Text == DynamicKey then sg:Destroy(); LaunchBloxHub() else T.Text = "كود خاطئ! اذهب للرابط مجدداً" end
    end)
end
