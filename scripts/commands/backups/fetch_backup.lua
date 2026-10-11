function c_create_backup(args)
	if args[1] == nil then
		print("Error: no arguments given")
		return
	end

	local file = io.open(args[2], "r")
	if not file then
		print("File '" .. args[2] .. "' does not exist")
	end

	io.input(file)	
	
	local backup_folder = string.gsub(args[2], ".back", "")
	for line in io.lines() do
		for word in string.gmatch(line, "[^%s]+") do
			if word == "FOLDER" or word == "FILE" then 
				goto continue	
			end



		end
	end


end
