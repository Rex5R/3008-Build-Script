local Lplayers = game.Players.LocalPlayer

local mouse = Lplayers:GetMouse()

local model = Instance.new("Model", workspace)
model.Name = "w"

local function createP(size, cframe, color)
	local part = Instance.new("Part")
	part.Size = size
	part.CFrame = cframe
	part.Color = color or Color3.new(0.8, 0.556863, 0.411765)
	part.Material = Enum.Material.Wood
	part.Anchored = true
	part.CanCollide = false
	part.Parent = model
	return part
end

createP(Vector3.new(10.55, 0.25, 1.45), CFrame.new(-4.825, 5.975, -25.575, 1, 0, 0, 0, 1, 0, 0, 0, 1))
createP(Vector3.new(10.55, 0.25, 1.45), CFrame.new(-4.825, 5.975, -31.175, 1, 0, 0, 0, 1, 0, 0, 0, 1))
createP(Vector3.new(10.55, 0.25, 1.45), CFrame.new(-4.825, 5.975, -36.675, 1, 0, 0, 0, 1, 0, 0, 0, 1))
createP(Vector3.new(4.05, 0.25, 1.45), CFrame.new(-9.375, 5.975, -33.925, 0, 0, -1, 0, 1, 0, 1, 0, 0))
createP(Vector3.new(4.15, 0.25, 1.45), CFrame.new(-9.375, 5.975, -28.375, 0, 0, -1, 0, 1, 0, 1, 0, 0))
createP(Vector3.new(4.05, 0.25, 1.45), CFrame.new(-0.275, 5.975, -33.925, 0, 0, -1, 0, 1, 0, 1, 0, 0))
createP(Vector3.new(4.15, 0.25, 1.45), CFrame.new(-0.275, 5.975, -28.375, 0, 0, -1, 0, 1, 0, 1, 0, 0))
createP(Vector3.new(10.55, 0.45, 1.3), CFrame.new(-4.825, 6.75, -25.075, 1, 0, 0, 0, 0, -1, 0, 1, 0))
createP(Vector3.new(10.55, 0.45, 1.3), CFrame.new(-4.825, 6.75, -31.125, 1, 0, 0, 0, 0, -1, 0, 1, 0))
local tPart = createP(Vector3.new(10.55, 0.45, 1.3), CFrame.new(-4.825, 6.75, -37.175, 1, 0, 0, 0, 0, -1, 0, 1, 0))
createP(Vector3.new(12.55, 0.25, 1.55), CFrame.new(-0.325, 7.525, -31.125, 0, 0, -1, 0, 1, 0, 1, 0, 0))
createP(Vector3.new(12.55, 0.25, 1.6), CFrame.new(-2.1, 7.525, -31.125, 0, 0, -1, 0, 1, 0, 1, 0, 0))
createP(Vector3.new(12.55, 0.25, 1.6), CFrame.new(-3.9, 7.525, -31.125, 0, 0, -1, 0, 1, 0, 1, 0, 0))
createP(Vector3.new(12.55, 0.25, 1.6), CFrame.new(-5.7, 7.525, -31.125, 0, 0, -1, 0, 1, 0, 1, 0, 0))
createP(Vector3.new(12.55, 0.25, 1.6), CFrame.new(-7.5, 7.525, -31.125, 0, 0, -1, 0, 1, 0, 1, 0, 0))
createP(Vector3.new(12.55, 0.25, 1.6), CFrame.new(-9.3, 7.525, -31.125, 0, 0, -1, 0, 1, 0, 1, 0, 0))

local surface = Instance.new("SurfaceGui", tPart)
surface.SizingMode = Enum.SurfaceGuiSizingMode.FixedSize
surface.Face = Enum.NormalId.Bottom
surface.Brightness = 7
local frame = Instance.new("TextLabel", surface)
frame.Size = UDim2.new(1,0,1,0)

local bool = false

model.PrimaryPart = model.Part

local cln = model:Clone()
cln.Parent = workspace
cln:PivotTo(CFrame.Angles(math.rad(40), 0, 0))

task.spawn(function()
	while wait() do
		cln:MoveTo(model.PrimaryPart.Position + Vector3.new(0, 1, -12))
		
		if bool == true then
			break
		end
	end
end)

wait(2)

while wait() do
	print(mouse.Target)
	if mouse.Target ~= nil or mouse.Target ~= model:GetChildren() then
		model:MoveTo(mouse.Target.Position)
		mouse.Button1Down:Connect(function()
			local get = model:GetChildren()
			for _, get in pairs(model:GetChildren()) do get.CanCollide = true end
			for _, get0 in pairs(cln:GetChildren()) do get0.CanCollide = true end
			
			bool = true
		end)
	end
	if bool == true then
		break
	end
end
