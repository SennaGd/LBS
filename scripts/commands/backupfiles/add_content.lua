-- Adds content (i.e. files/folders) to .back file
function c_add(args)
	if not has_args(args) then return end

	-- check if backupfile exists
	if not file_exists(args[2]) then 
		print("File '" .. args[2] .. "' does not exist") 
	return end

	for i = 3, #args do -- start from index 3 | i.e. 1,2 are paths
		-- handle delimiters
		path = c_path_delimiters(args[i])

		-- check if folder/file exists
		if not file_exists(path) then
			print("Given path '"..args[i].."' does not exist")
		return end

		-- check if path is a path
		if is_dir(path) then
			path = "FOLDER "..path.."\n"
		else
			path = "FILE "..path.."\n"
		end
		
		-- open backupfile in append mode
		local file = io.open(args[2], "a")
		if file then
			io.input(file)
			file:write(path)
			file:close()

			print("Added '".. args[i] .. "' to '" .. args[2] .. "'")
		else
			print("Couldn't open args[2] '" .. args[2].. "' exiting")
		end
	end
end
