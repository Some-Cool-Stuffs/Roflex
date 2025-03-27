# Roflex 💪
A simplified and easy to use UI library for Roblox I made **in less than 30 minutes**! ⏲️


Very easy and practical for **small and simplistic UIs** that you're too lazy to **use an _actual_ framework**, or even open Roblox Studio to make!
- **Practical and importable** for executors/game development in just 1 line of code! 💻

> This was originally **designed and created** in Roblox using exploits, it's **100% portable** to Roblox Studio and capable for true game development. 🔗

## Real Project samples 🔍
1. **[Silicone](https://github.com/Some-Cool-Stuffs/Roflex/blob/main/Large%20Examples/Silicone.luau)** - Basic Admin Commands project fulfilled w/ a **modern** & **beautiful** interface. ✨

## Code examples 🤓
```lua
local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer
local playerGui = localPlayer.PlayerGui

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

local label: TextLabel = roflex.add(frame, "Label", "TextLabel", { -- Generalize a basic message, hello there!
  TextSize = 15,
  Text = "Hello!",
  AnchorPoint = Vector2.new(0.5, 0.5),
  Position = UDim2.fromScale(0.5, 0.5)
})
```
