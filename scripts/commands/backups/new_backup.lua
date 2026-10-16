function c_create_backup(args)
	if not has_args(args) then return end

	local filepath = args[2]
	if not file_exists(filepath) then 
		print("File '" .. filepath .. "' does not exist") 
	return end

	local filename = get_filename(filepath)
	filename = remove_extention(filename)

	local backup_path = get_backupfolder(args) .. "/container/"..filename
	print("before loop")	
	for line in io.lines(filepath) do
		for word in string.gmatch(line, "[^%s]+") do
			print(word)
			if word == "FOLDER" or word == "FILE" then 
				goto continue	
			end

			-- making backup directory
			local mkdir_cmd = "mkdir -p " .. backup_path

			-- Copying contents to directory
			local copy_cmd = "yes | cp -rf ".. word .. " " .. backup_path .. "/"
			print("running backup..")
			os.execute(mkdir_cmd)
			os.execute(copy_cmd)

			print("created backup at '"..backup_path.."'")
			
			::continue::
		end
	end
end

