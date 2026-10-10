require("scripts.commands.init")


command = command or ""
arguments = arguments or {}
backups = os.getenv("HOME") .. "/Backups/"

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
	func(arguments, backups)
else 
	print("Unknown command: " .. command .. 
				"\nTry 'help' for more information.")
end
