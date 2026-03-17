-- [[ ♛ SATAYA VIP - COOKIE & GUARD EDITION ♛ ]] --

local p = game.Players.LocalPlayer
local sg = Instance.new("ScreenGui", game:GetService("CoreGui"))
sg.Name = "SatayaSpecialV12"
sg.ResetOnSpawn = false

-- [ واجهة تسجيل الدخول ]
local LoginFrame = Instance.new("Frame", sg)
LoginFrame.Size = UDim2.new(0, 300, 0, 380)
LoginFrame.Position = UDim2.new(0.5, -150, 0.5, -190)
LoginFrame.BackgroundColor3 = Color3.fromRGB(15, 0, 0)
LoginFrame.BorderSizePixel = 2
LoginFrame.BorderColor3 = Color3.fromRGB(255, 0, 0)
LoginFrame.Active = true
LoginFrame.Draggable = true

local Itachi = Instance.new("ImageLabel", LoginFrame)
Itachi.Size = UDim2.new(1, 0, 0.5, 0)
Itachi.Image = "rbxassetid://12921506541"
Itachi.BackgroundTransparency = 1

local PassBox = Instance.new("TextBox", LoginFrame)
PassBox.PlaceholderText = "الباسورد: الهكر أو SATAYA_VIP"
PassBox.Size = UDim2.new(0.8, 0, 0, 40)
PassBox.Position = UDim2.new(0.1, 0, 0.55, 0)
PassBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
PassBox.TextColor3 = Color3.fromRGB(255, 255, 255)
PassBox.Text = ""

local EnterBtn = Instance.new("TextButton", LoginFrame)
EnterBtn.Text = "دخول الهكر | LOGIN"
EnterBtn.Size = UDim2.new(0.8, 0, 0, 45)
EnterBtn.Position = UDim2.new(0.1, 0, 0.75, 0)
EnterBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
EnterBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

-- [ اللوحة الرئيسية المخصصة ]
local function MainHub()
    local Main = Instance.new("Frame", sg)
    Main.Size = UDim2.new(0, 350, 0, 350)
    Main.Position
