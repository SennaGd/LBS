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

if command_list[command] then
-- func disabled currently
	func(arguments)
else 
	print("Unknown command: " .. command .. 
				"\nTry 'help' for more information.")
end
