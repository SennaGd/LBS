function c_fetch_backup(args)
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
			-- check if it's folder/file
			if word == "FILE" then
				is_file = true 
				goto continue	
			elseif word == "FOLDER" then 
				is_file = false
				goto continue	
			end

			-- fetch the last word in filepath string | file/dir name
			for s_word in word:gmatch"[^/,\r\n]+" do
				if s_word ~= nil then
					dir_name = s_word
				end
			end
			
			word_cpy_ = string.gsub(word, dir_name, ""):sub(1, -2)

			-- creating copy command for file/dir
			copy_cmd = "yes | cp  -rf ".. backup_folder.."/"..dir_name .. " " .. word_cpy_ 
			if is_file == true then
				copy_cmd = string.gsub(copy_cmd, " --rf", "")
			end

			os.execute(copy_cmd)

			::continue::
		end
	end
end
