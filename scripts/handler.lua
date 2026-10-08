require("scripts.commands.init")

command = command or ""
arguments = arguments or {}

local command_list = {
	["help"] = c_help,
	["version"] = c_version,	
	-- Creating, Deleting and Reading Backupfiles
	["new"] = c_new,
	["read"] = c_read,
	["delete"] = c_delete,

	-- Manipulating Backupfiles Contents
	["add"] = c_add, 
	["remove"] = c_remove,
}

local func = command_list[command]

if command_list[command] then
-- func disabled currently
	func(arguments)
else 
	print("Unknown command: " .. command .. 
				"\nTry 'help' for more information.")
end
