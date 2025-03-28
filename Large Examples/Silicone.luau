--[[

  ! Version 1.0 !

  > This just includes the notification system. In the future, I plan to write more for this little script.
  > Just a fun little project, so don't expect it to update too quickly!

]]

-- Services

local Players = game:GetService("Players")
local Tween = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")


-- Imports

local roflex = loadstring(game:HttpGet("https://github.com/Some-Cool-Stuffs/Roflex/blob/main/roflex.luau?raw=true"))()
if not roflex_ran then
    roflex.launch()
end


-- Variables

local localPlayer = Players.LocalPlayer
local playerGui = localPlayer.PlayerGui

local liveNotifs = 0
local launchTime = tick()

local project, build = "Silicone", "final"


-- Local functions

local function isInstance(object: any)
    return object and typeof(object) == "Instance"
end

local function tween(instance: Instance, replay: UDim2, duration: number)
    if isInstance(instance) then
        local info = TweenInfo.new(duration, Enum.EasingStyle.Back)
        local animation = Tween:Create(instance, info, replay)

        animation:Play()
    end
end

local function applyDropshadow(parent: Instance, shadowSize: number)
    if isInstance(parent) then
        roflex.add(parent, "corner", "UICorner",   {CornerRadius = UDim.new(0, 12)})
        roflex.add(parent, "lines", "UIStroke",    {Transparency = 0.5, Color = Color3.fromRGB(60, 60, 60)})
        roflex.add(parent, "shadow", "ImageLabel", {
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.new(1, shadowSize, 1, 35),
            ImageColor3 = Color3.fromRGB(0, 0, 0),
            Image = "rbxassetid://8992230677",
            ImageTransparency = 0.7,
            ScaleType = Enum.ScaleType.Slice,
            SliceCenter = Rect.new(99, 99, 99, 99)
        })

        local wallpaper_1 = roflex.add(parent, "_1", "ImageLabel", {
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 1),
            Image = "rbxassetid://9968344227",
            ScaleType = Enum.ScaleType.Tile,
            TileSize = UDim2.fromOffset(128, 128),
            ImageTransparency = 0.94
        }) do
            roflex.add(wallpaper_1, "corner", "UICorner", {
                CornerRadius = UDim.new(0, 8)
            })
        end

        local wallpaper_2 = roflex.add(parent, "_2", "ImageLabel", {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 1),
            Image = "rbxassetid://9968344105",
            ScaleType = Enum.ScaleType.Tile,
            TileSize = UDim2.fromOffset(128, 128),
            ImageTransparency = 0.98
        }) do
            roflex.add(wallpaper_2, "corner", "UICorner", {
                CornerRadius = UDim.new(0, 8)
            })
        end
    end
end


-- Interface

for _, ui in playerGui:GetChildren() do
    if ui:IsA("ScreenGui") and ui.Name == `{project}-{build}` then
        roflex.remove(ui, 0)
    end
end

local screenGui = roflex.add(playerGui, `{project}-{build}`, "ScreenGui", {
    ResetOnSpawn = false
})

local backbone = roflex.add(screenGui, "backbone", "Frame", {
    AnchorPoint = Vector2.new(0.5, 0.5),
    Position = UDim2.fromScale(0.5, 0.5),
    Size = UDim2.fromScale(0.9, 0.9),
    BackgroundTransparency = 1,
})

roflex.add(backbone, "notifies", "Folder")


-- Library functions

local function notify(text: string, emoji: string, duration: number)
    if not duration then
        duration = 3
    end

    if isInstance(backbone) then
        local folder = backbone:FindFirstChild("notifies")
        if folder then
            liveNotifs += 1

            local background = roflex.add(folder, `_{liveNotifs + 1}`, "Frame", {
                AnchorPoint = Vector2.new(0.5, 0),
                BackgroundTransparency = 0.2,
                Position = UDim2.new(0.5, 0, 0, -200),
                Size = UDim2.fromOffset(0, 15),
                AutomaticSize = Enum.AutomaticSize.X,
                BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            })

            roflex.add(background, "padding", "UIPadding", {PaddingLeft = UDim.new(0, 25), PaddingRight = UDim.new(0, 25)})
            applyDropshadow(background, 90)

            roflex.add(background, "message", "TextLabel", {
                AutomaticSize = Enum.AutomaticSize.X,
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(0, 1),
                ZIndex = 2,
                Text = `{text}  {emoji}`,
                TextColor3 = Color3.fromRGB(225, 225, 225),
                TextSize = 16,
                RichText = true,
                FontFace = Font.new("rbxassetid://12187365364")
            })

            tween(background, {Position = UDim2.new(0.5, 0, 0, liveNotifs * 57)}, 0.45)
            tween(background, {Size = UDim2.fromOffset(0, 50)}, 0.65)

            task.delay(duration, function()
                tween(background, {Position = UDim2.new(0.5, 0, 0, -180)}, 0.35)
                tween(background, {Size = UDim2.fromOffset(0, 30)}, 0)

                liveNotifs -= 1
            end)

            roflex.remove(background, duration + 1)
        end
    end
end

return {
    notify = notify
}
