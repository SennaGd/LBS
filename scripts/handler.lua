require("scripts.commands.init")

command = command or ""
arguments = arguments or {}

local command_list = {
	["help"] = c_help,
	["new"] = c_new,
	["read"] = c_read,
	["delete"] = c_remove,
}

local func = command_list[command]

if command_list[command] then
-- func disabled currently
	func(arguments)
else 
	print("Unknown command: " .. command .. 
				"\nTry 'help' for more information.")
end
