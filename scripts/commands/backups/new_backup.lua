function c_create_backup(args)
	if not has_args(args) then return end

	local version_control = false
	local backup_name = remove_extention(get_filename(args[2]))

	local version_folder = args[1].."vcs/"..backup_name.."/"
	print("version folder",version_folder)

	local filepath = args[2]
	if not file_exists(filepath) then 
	return end

	local filename = get_filename(filepath)
	filename = remove_extention(filename)

	local backup_path = get_backupfolder(args) .. "/container/"..filename


	if check_if_filebackup(filepath) == true then
		version_control = true 
	end
	
	
	local counter = 0
	local highest_ver = 1
	if version_control == true then
		for file in io.lines(filepath) do
			local vcs_filepath = get_vcs_filepath(version_folder, file)

			local version = get_versions(vcs_filepath)
			if counter == 0 then 
				highest_ver = version 
				counter = 1
			end

			--> write version to VCS file <--
			write_line(vcs_filepath, { "["..tostring(version+1).."]" }, "a")

			local seq_A = fetch_version(vcs_filepath, tonumber(version))
			local seq_B = get_contents(file)

			local changes = diff(seq_A, seq_B)
			if changes == nil then break end

			for _, v in pairs(changes) do
				local v_type = "(=)"

				if v["type"] == "insert" then v_type = "(+)" end
				if v["type"] == "delete" then v_type = "(-)" end

				print(v_type, v["val"])

				--> writing changes to VCS file <--
				if v_type ~= "(=)" then
					write_line(vcs_filepath, {v_type.." "..v["val"]}, "a")
				else
					write_line(vcs_filepath, {v_type}, "a")
				end
			end	

			
		end
	end


	for line in io.lines(filepath) do
		local mkdir_cmd = "mkdir -p " .. backup_path

		-- Copying contents to directory
		local copy_cmd = "yes | cp -rf ".. line .. " " .. backup_path .. "/"
		-- os.execute(mkdir_cmd)
		-- os.execute(copy_cmd)

		print("Created backup at '"..backup_path.."'")
		
	end
end


function check_if_filebackup(filepath)
	local is_filebackup

	for line in io.lines(filepath) do
		if not string.find(line, "%.") then
			return false
		else
			is_filebackup = true
		end
	end

return is_filebackup end

