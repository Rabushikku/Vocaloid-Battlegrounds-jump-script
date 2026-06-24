local v1 = game.Players.LocalPlayer
local v2 = game:GetService("UserInputService")
local v_u_3 = 70
local v_u_4 = (v1.Character or v1.CharacterAdded:Wait()):WaitForChild("Humanoid")
local function v6(p5)
	v_u_4 = p5:WaitForChild("Humanoid")
	v_u_4.JumpPower = 70
end
local v_u_7 = {
	"Stunned",
	"Attacking",
	"CantJump",
	"Blocking",
	"BackDash",
	"Casting"
}
local function v_u_12()
	local v8 = tick()
	for _, v9 in v_u_7 do
		if game.CollectionService:HasTag(game.Players.LocalPlayer.Character, v9) then
			v_u_4:SetStateEnabled(Enum.HumanoidStateType.Jumping, false)
			v_u_4.JumpPower = 70
			repeat
				task.wait()
			until not game.CollectionService:HasTag(game.Players.LocalPlayer.Character, v9)
			v_u_4:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
			v_u_4.JumpPower = 70
		end
	end
	if v8 - v_u_3 < 1 then
		local v10 = v_u_4
		local v11 = v_u_4.JumpPower - 15.5
		v10.JumpPower = math.max(v11, 70)
	else
		v_u_4.JumpPower = 70
	end
	v_u_3 = v8
end
if v1.Character then
	v_u_4 = v1.Character:WaitForChild("Humanoid")
	v_u_4.JumpPower = 70
end
v1.CharacterAdded:Connect(v6)
local v_u_13 = nil
v2.JumpRequest:Connect(function()
	if v_u_13 ~= true then
		v_u_13 = true
		v_u_12()
		wait()
		v_u_13 = false
	end
end)
