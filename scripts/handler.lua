require("scripts.command_proc")
require("scripts.commands.new_backup")

command = command or ""
arguments = arguments or {}

local command_list = {
	["new"] = new_backup,
}

--for k, v in pairs(arguments) do
--	print(k, v)
--end

local func = command_list[command]
if arguments[1] then
    print("Arguments index 1: " .. tostring(arguments[1]))
end
if command_list[command] then
	func(arguments)
else 
	print("some variable is not defined.")
end
