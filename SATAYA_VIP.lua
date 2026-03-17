-- [[ ♛ SATAYA VIP - FINAL FIX ♛ ]] --
local player = game.Players.LocalPlayer
local core = game:GetService("CoreGui")

-- مسح أي نسخة قديمة معلقة
if core:FindFirstChild("SatayaFinal") then core.SatayaFinal:Destroy() end

local sg = Instance.new("ScreenGui", core)
sg.Name = "SatayaFinal"
sg.ResetOnSpawn = false

-- [ واجهة تسجيل الدخول ]
local Login = Instance.new("Frame", sg)
Login.Size = UDim2.new(0, 300, 0, 300)
Login.Position = UDim2.new(0.5, -150, 0.5, -150)
Login.BackgroundColor3 = Color3.fromRGB(30, 0, 0)
Login.BorderSizePixel = 3
Login.BorderColor3 = Color3.fromRGB(255, 0, 0)
Login.Active = true
Login.Draggable = true

local Title = Instance.new("TextLabel", Login)
Title.Text = "♛ SATAYA VIP LOGIN ♛"
Title.Size = UDim2.new(1, 0, 0, 50)
Title.BackgroundColor3 = Color3.fromRGB(60, 0, 0)
Title.TextColor3 = Color3.fromRGB(255, 215, 0)
Title.TextSize = 20

local Box = Instance.new("TextBox", Login)
Box.PlaceholderText = "الباسورد: الهكر"
Box.Size = UDim2.new(0.8, 0, 0, 45)
Box.Position = UDim2.new(0.1, 0, 0.4, 0)
Box.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Box.TextColor3 = Color3.fromRGB(255, 255, 255)
Box.Text = ""

local Btn = Instance.new("TextButton", Login)
Btn.Text = "دخول | LOGIN"
Btn.Size = UDim2.new(0.8, 0, 0, 45)
Btn.Position = UDim2.new(0.1, 0, 0.7, 0)
Btn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
Btn.TextSize = 18

-- [ القائمة الرئيسية ]
local function OpenMenu()
    local Main = Instance.new("Frame", sg)
    Main.Size = UDim2.new(0, 300, 0, 250)
    Main.Position = UDim2.new(0.5, -150, 0.5, -125)
    Main.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
    Main.BorderSizePixel = 2
    Main.BorderColor3 = Color3.fromRGB(255, 0, 0)
    Main.Draggable = true

    local function Create(txt, pos, clr, func)
        local b = Instance.new("TextButton", Main)
        b.Text = txt; b.Size = UDim2.new(0.9, 0, 0, 50)
        b.Position = UDim2.new(0.05, 0, 0, pos)
        b.BackgroundColor3 = clr; b.TextColor3 = Color3.fromRGB(255, 255, 255)
        b.Font = Enum.Font.SourceSansBold
        b.MouseButton1Click:Connect(func)
    end

    Create("كشف الكوكيز 🍪", 60, Color3.fromRGB(150, 75, 0), function()
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

    Create("ضد الموجات 🛡️", 120, Color3.fromRGB(0, 100, 200), function()
        game:GetService("RunService").Stepped:Connect(function()
            for _, w in pairs(workspace:GetDescendants()) do
                if (w.Name == "Wave" or w.Name == "Water") and w:IsA("BasePart") then
                    w.CanTouch = false
                end
            end
        end)
    end)

    Create("YouTube: @STAYAMODYT 📺", 180, Color3.fromRGB(200, 0, 0), function()
        setclipboard("https://www.youtube.com/@STAYAMODYT")
    end)
end

Btn.MouseButton1Click:Connect(function()
    if Box.Text == "الهكر" or Box.Text == "1" then
        Login:Destroy()
        OpenMenu()
    end
end)
