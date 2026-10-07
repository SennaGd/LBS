require("scripts.commands.new_backup")
require("scripts.commands.help")
require("scripts.commands.read_backup")

command = command or ""
arguments = arguments or {}

local command_list = {
	["new"] = c_new,
	["help"] = c_help,
	["read"] = c_read,
}

--for k, v in pairs(arguments) do
--	print(k, v)
--end

local func = command_list[command]

if command_list[command] then
-- func disabled currently
	func(arguments)
else 
	print("Unknown command: " .. command .. 
				"\nTry 'help' for more information.")
end
