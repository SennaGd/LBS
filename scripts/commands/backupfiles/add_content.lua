-- checks if file exists | parses tilda/home paths
require("scripts.commands.command_parser.check_path")
require("scripts.commands.command_parser.dir_type")

-- Adds content (i.e. files/folders) to .back file
function c_add(arguments, backups)
	local backupfile = backups .. arguments[1] .. ".back"

	-- check for backupfile
	local check = io.open(backupfile, "r")
	if not check then
		print("File '" .. backupfile .. "' does not exist")
		return 	
	end

	for i = 2, #arguments do
		-- handle delimiters
		path = c_path_delimiters(arguments[i])

		-- check if folder/file exists
		if t_check(path) == nil then
			print("Given path '"..arguments[i].."' does not exist")
			return
		end

		-- check if path is a path
		if is_dir(path) then
			path = "FOLDER "..path.."\n"
		else
			path = "FILE "..path.."\n"
		end
		
		-- open backupfile in append mode
		local file = io.open(backupfile,"a")
		if file then
			io.input(file)
			file:write(path)
			file:close()

			print("Added '".. arguments[i] .. "' to '" .. backupfile .. "'")
		else
			print("Couldn't open backupfile '" .. backupfile .. "' exiting")
		end
	end
end
