-- extracts filepaths from backupfile
function extract_filepaths(args)
	local backup_folder = string.gsub(args[2], ".back", "")
	
	local file = io.open(args[2], "r")
	if not file then
		print("File '" .. args[2] .. "' does not exist")
		return
	end

	io.input(file)
	
	local filepaths = {}
	for line in io.lines() do
		-- insert parsed line into filepaths
		local p_line = string.gsub(line, "FILE", ""):gsub("FOLDER", "") 
		table.insert(filepaths, p_line)
	end
	
	return filepaths
end

