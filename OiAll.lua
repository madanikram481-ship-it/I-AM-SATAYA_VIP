-- [[ ♛ SATAYA VIP - PROFESSIONAL ON/OFF PANEL ♛ ]] --
local player = game.Players.LocalPlayer
local core = game:GetService("CoreGui")
local root = player.Character:WaitForChild("HumanoidRootPart")

if core:FindFirstChild("SatayaTogglePanel") then core.SatayaTogglePanel:Destroy() end

local sg = Instance.new("ScreenGui", core)
sg.Name = "SatayaTogglePanel"

-- [ اللوحة الرئيسية ]
local Main = Instance.new("Frame", sg)
Main.Size = UDim2.new(0, 220, 0, 350)
Main.Position = UDim2.new(0.05, 0, 0.2, 0)
Main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Main.BorderSizePixel = 2
Main.BorderColor3 = Color3.fromRGB(0, 255, 0)
Main.Active = true; Main.Draggable = true

local Title = Instance.new("TextLabel", Main)
Title.Text = "♛ لوحة التحكم ON/OFF ♛"
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundColor3 = Color3.fromRGB(0, 100, 0)
Title.TextColor3 = Color3.fromRGB(255, 255, 255)

-- وظيفة إنشاء أزرار ON/OFF
local function CreateToggle(name, pos, callback)
    local enabled = false
    local btn = Instance.new("TextButton", Main)
    btn.Text = name .. ": OFF"
    btn.Size = UDim2.new(0.9, 0, 0, 45)
    btn.Position = UDim2.new(0.05, 0, 0, pos)
    btn.BackgroundColor3 = Color3.fromRGB(150, 0, 0) -- أحمر (إيقاف)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.SourceSansBold

    btn.MouseButton1Click:Connect(function()
        enabled = not enabled
        if enabled then
            btn.Text = name .. ": ON"
            btn.BackgroundColor3 = Color3.fromRGB(0, 150, 0) -- أخضر (تشغيل)
        else
