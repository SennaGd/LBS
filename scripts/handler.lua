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


-- checks if args is true
function c_args() 
	if arguments == nil then
		print("No arguments given")
		return nil
	else 
		return true
	end
end

if command_list[command] then
-- func disabled currently
	func(arguments)
else 
	print("Unknown command: " .. command .. 
				"\nTry 'help' for more information.")
end
