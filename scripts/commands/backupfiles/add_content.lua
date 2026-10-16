-- Adds content (i.e. files/folders) to .back file
function c_add(args)
	if not has_args(args) then return end

	-- check if backupfile exists
	local filepath = args[2]
	if not file_exists(filepath) then 
		print("File '" .. filepath .. "' does not exist") 
	return end

	for i = 3, #args do -- start from index 3 | i.e. 1,2 are paths
		-- handle delimiters
		path = parse_delimiters(args[i])

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
		local backup_file = io.open(filepath, "a")
		if backup_file then
			io.input(backup_file)
			backup_file:write(path)
			backup_file:close()

			print("Added '".. args[i] .. "' to '" .. filepath .. "'")
		else
			print("Couldn't open args[2] '" .. filepath .. "' exiting")
		end
	end
end
