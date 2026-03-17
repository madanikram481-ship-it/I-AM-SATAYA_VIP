-- [[ SATAYA_VIP COOKIE DETECTOR ]] --
local CorrectPassword = "SATAYA_VIP"

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game:GetService("CoreGui")

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 260, 0, 160)
MainFrame.Position = UDim2.new(0.5, -130, 0.5, -80)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15) -- أسود ملكي
MainFrame.BorderSizePixel = 2
MainFrame.BorderColor3 = Color3.fromRGB(255, 215, 0) -- إطار ذهبي للفخامة
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local Title = Instance.new("TextLabel")
Title.Text = "♛ SATAYA VIP PREMIUM ♛" -- إضافة تيجان للفخامة
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Title.TextColor3 = Color3.fromRGB(255, 215, 0) -- لون ذهبي
Title.Font = Enum.Font.SpecialElite -- خط فخم
Title.Parent = MainFrame

-- [ بقية كود الباسورد والكوكيز هنا ]
