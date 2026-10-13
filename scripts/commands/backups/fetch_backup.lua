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
			if word == "FOLDER" then 
				is_file = false
				goto continue	
			end
			
			if word == "FILE" then
				is_file = true 
				goto continue	
			end


			for s_word in word:gmatch"[^/,\r\n]+" do
				if s_word ~= nil then
					folder_name = s_word
				end
			end
			
			w_c_ = word	
			w_c_ = string.gsub(w_c_, folder_name, "")
			w_c_ = w_c_:sub(1, -2)

			print("parsed:\n",w_c_)
			print("foldername:", folder_name)
			print("source:", backup_folder.."/"..folder_name)
			print("destination:", word)
			

			-- command should be
			-- yes | cp -rf /home/dev/Backups/b/tstypes/ /home/dev/Projects/
			-- todo: remove /tstypes from the destination

			if is_file == true then
				copy_cmd = "yes | cp ".. backup_folder.."/"..folder_name .. " " .. w_c_
			elseif is_file == false then
				

				copy_cmd = "yes | cp -rf ".. backup_folder.."/"..folder_name .. "/ " .. w_c_
			end

			print(is_file)
			print("copy_cmd", copy_cmd)

			os.execute(copy_cmd)

			::continue::
		end
	end


end
