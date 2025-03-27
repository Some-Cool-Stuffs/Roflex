-- A squishy box! 
-- HINT: Press the funny little button... Or don't.

local Players = game:GetService("Players")
local Tween = game:GetService("TweenService")

local localPlayer = Players.LocalPlayer
local playerGui = localPlayer.PlayerGui
local playing = false

local roflex = loadstring(game:HttpGet("https://github.com/Some-Cool-Stuffs/Roflex/blob/main/roflex.luau?raw=true"))()
if not roflex_ran then
    roflex.launch()
end

local screenGui: ScreenGui = roflex.add(playerGui, "GUI Name", "ScreenGui", { -- Make a ScreenGui with `ResetOnSpawn` disabled.
    ResetOnSpawn = false
})

local frame: Frame = roflex.add(screenGui, "Mainframe", "Frame", { -- Make a Frame inside of the `screenGui` w/ properties.
    AnchorPoint = Vector2.new(0.5, 0.5),
    Size = UDim2.fromOffset(250, 250),
    Position = UDim2.fromScale(0.5, 0.5),
    BackgroundTransparency = 0.1,
    BorderSizePixel = 0,
    BackgroundColor3 = Color3.fromRGB(185, 185, 185)
})

local corner: UICorner = roflex.add(frame, "Corner", "UICorner", {
    CornerRadius = UDim.new(0, 35)
})

local stroke: UIStroke = roflex.add(frame, "Stroke", "UIStroke", {
    Thickness = 2,
    Color = Color3.fromRGB(75, 75, 75)
})

local button: TextButton = roflex.add(frame, "Label", "TextButton", {
    TextSize = 15,
    Text = "Press me!",
    Size = UDim2.fromScale(1, 1),
    BackgroundTransparency = 1,
    Callback = function()
        if not playing then
            playing = true

            Tween:Create(frame, TweenInfo.new(0.1, Enum.EasingStyle.Sine), {
                Size = UDim2.fromOffset(250, 220)
            }):Play()

            task.delay(0.1, function()
                Tween:Create(frame, TweenInfo.new(0.1, Enum.EasingStyle.Sine), {
                    Size = UDim2.fromOffset(250, 250)
                }):Play()
            end)

            playing = false
        end
    end
})
