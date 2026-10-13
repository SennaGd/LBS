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
			
			if word == "FOLDER" then 
				is_file = false
				goto continue	
			end
			
			if word == "FILE" then
				is_file = true 
				goto continue	
			end

			-- fetching last word in directory string
			for s_word in word:gmatch"[^/,\r\n]+" do
				if s_word ~= nil then
					folder_name = s_word
				end
			end

			print("folder_name:",backup_folder.."/"..folder_name)
			-- making backup directory
			local mkdir_cmd = "mkdir -p " .. backup_folder 

			-- Copying contents to directory
			local copy_cmd = "yes | cp -rf ".. word .. " " .. backup_folder .. "/" 
			

			
			os.execute(mkdir_cmd)
			local copy = os.execute(copy_cmd)
			print(copy)

			::continue::
		end
	end
end

-- hello, this was added whilst the program was running!
-- hurm
-- Hello
