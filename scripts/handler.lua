require("scripts.commands.init")


command = command or ""
arguments = arguments or {}

if arguments[1] ~= nil then 
	-- insert home if args given
	table.insert(arguments, 1, os.getenv("HOME") .. "/Backups/")

	-- args[2] == full .back filepath
	arguments[2] = arguments[1] .. arguments[2] .. ".back" 
else
	-- insert nil at pos 1
	table.insert(arguments, 1, nil) 
	arguments[2] = nil
end


for k,v in pairs(arguments) do 
	print(k, v)
end


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
	func(arguments, backups)
else 
	print("Unknown command: " .. command .. 
				"\nTry 'help' for more information.")
end
