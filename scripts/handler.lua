---@diagnostic disable: undefined-global

require("scripts.command_proc")
local command_list = {
	["hello"] = "This is the hello command",
}

print(arguments[1])

for k, v in pairs(arguments) do
	print(k, v)
	
end

print("Current command:".. command_list[command])
