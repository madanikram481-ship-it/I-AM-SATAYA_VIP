-- [[ ♛ SATAYA VIP - THE ONLY WORKING VERSION ♛ ]] --

local player = game.Players.LocalPlayer
local sg = Instance.new("ScreenGui", game:GetService("CoreGui"))
sg.ResetOnSpawn = false

-- [ نافذة تسجيل الدخول ]
local LoginFrame = Instance.new("Frame", sg)
LoginFrame.Size = UDim2.new(0, 300, 0, 350)
LoginFrame.Position = UDim2.new(0.5, -150, 0.5, -175)
LoginFrame.BackgroundColor3 = Color3.fromRGB(20, 0, 0)
LoginFrame.Active = true
LoginFrame.Draggable = true

local Title = Instance.new("TextLabel", LoginFrame)
Title.Text = "♛ SATAYA VIP LOGIN ♛"
Title.Size = UDim2.new(1, 0, 0, 50)
Title.TextColor3 = Color3.fromRGB(255, 215, 0)
Title.BackgroundColor3 = Color3.fromRGB(40, 0, 0)

local PassBox = Instance.new("TextBox", LoginFrame)
PassBox.PlaceholderText = "Password: الهكر"
PassBox.Size = UDim2.new(0.8, 0, 0, 45)
PassBox.Position = UDim2.new(0.1, 0, 0.4, 0)
PassBox.Text = ""

local EnterBtn = Instance.new("TextButton", LoginFrame)
EnterBtn.Text = "LOGIN | دخول"
EnterBtn.Size = UDim2.new(0.8, 0, 0, 45)
EnterBtn.Position = UDim2.new(0.1, 0, 0.7, 0)
EnterBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)

-- [ القائمة الرئيسية ]
local function StartScript()
    local Main = Instance.new("Frame", sg)
    Main.Size = UDim2.new(0, 320, 0, 300)
    Main.Position = UDim2.new(0.5, -160, 0.5, -150)
    Main.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Main.Active = true
    Main.Draggable = true

    local T = Instance.new("TextLabel", Main)
    T.Text = "♛ SATAYA VIP MENU ♛"
    T.Size = UDim2.new(1, 0, 0, 50)
    T.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
    T.TextColor3 = Color3.fromRGB(255, 255, 255)

    -- زر 1: كشف الكوكيز (طريقة الدوائر البسيطة)
    local btn1 = Instance.new("TextButton", Main)
    btn1.Text = "كشف الكوكيز 🍪"
    btn1.Size = UDim2.new(0.9, 0, 0, 50)
    btn1.Position = UDim2.new(0.05, 0, 0.25, 0)
    btn1.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    btn1.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn1.MouseButton1Click:Connect(function()
        while task.wait(1) do
            for _, v in pairs(workspace:GetDescendants()) do
                if v.Name == "Cookie" and v:IsA("BasePart") then
                    if not v:FindFirstChild("SatayaMark") then
                        local e = Instance.new("BillboardGui", v)
                        e.Name = "SatayaMark"
                        e.Size = UDim2.
