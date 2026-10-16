function c_fetch_backup(args)
	if not has_args(args) then return end

	local filepath = args[2]
	if not file_exists(filepath) then 
		print("File '" .. filepath .. "' does not exist") 
	return end

	
	local filename = get_filename(filepath)
	filename = remove_extention(filename)

	local backup_path = get_backupfolder(args) .. "/container/"..filename
	
	for line in io.lines(filepath) do
		for word in string.gmatch(line, "[^%s]+") do
			-- check if word is a folder or file
			if word == "FILE" then
				is_file = true 
				goto continue	
			elseif word == "FOLDER" then 
				is_file = false
				goto continue	
			end

			-- fetch the last word in filepath string | file/dir name
			dir_name = get_filename(word)	

			word_cpy_ = string.gsub(word, dir_name, ""):sub(1, -2)
			print(word_cpy_)
			-- creating copy command for file/dir
			copy_cmd = "yes | cp  -rf ".. backup_path .."/"..dir_name .. " " .. word_cpy_ 
			if is_file == true then
				copy_cmd = string.gsub(copy_cmd, " --rf", "")
			end
			
			os.execute(copy_cmd)

			::continue::
		end
	end
end
