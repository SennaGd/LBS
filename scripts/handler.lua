require("scripts.commands.init")
require("scripts.commands.import_utils")


command = command or ""
arguments = arguments or {}

if arguments[1] ~= nil then 
	-- insert home if args given
	table.insert(arguments, 1, os.getenv("HOME") .. "/Backups/")

	-- args[2] == full .back filepath
	if string.len(arguments[2]) ~= 0 then
		arguments[2] = arguments[1] .."backupfiles/".. arguments[2] .. ".back" 
	else
		arguments[1] = nil
		arguments[2] = nil
	end
else
	-- insert nil at pos 1
	table.insert(arguments, 1, nil) 
	arguments[2] = nil
end


local command_list = {
	["help"]	= c_help,
	["version"] = c_version,	
	-- Creating, Deleting and Reading Backupfiles
	["new"]		= c_new,
	["read"]	= c_read,
	["delete"]	= c_delete,
	["path"]	= c_path,
	["list"]	= c_list,

	-- Manipulating Backupfiles Contents
	["add"]		= c_add, 
	["remove"]	= c_remove,

	["backup"]	= c_create_backup,
	["fetch"]	= c_fetch_backup,

	-- test 
	["t"] = version_control,
}

local func = command_list[command]


if command_list[command] then
	func(arguments, backups)
else 
	print("Unknown command: " .. command .. 
				"\nTry 'help' for more information.")
end
