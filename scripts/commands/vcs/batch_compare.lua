require("scripts.commands.vcs.myers_diff")


local function get_vcs_filepath(version_folder, path)
	local filename = get_filename(path)
	local idx = filename:match(".*()%.") -- dot index
	filename = filename:sub(1, idx-1)

	return version_folder..filename..".ver"
end

local function get_version_folder(args)
	local backup_folder = get_backupfolder(args)
	local backup_name = remove_extention(get_filename(args[2]))

	return backup_folder.."/vcs/"..backup_name.."/"

end


local function read_vcs_file(filepath)
	local line_count = 1
	local version = 1
	local new_ver_line = 1

	for line in io.lines(filepath) do
		if string.find(line,'%[') then
			version = version + 1 
			new_ver_line = line_count

			print(version, new_ver_line)
		end
		
		line_count = line_count + 1
	end

	if version == 0 then version = version + 1 end

	print("version",version)

return version end

-- compares all files inside backupfile to new
function compare_all_files(args) 
	if not has_args(args) then return end
	
	local filepaths = extract_filepaths(args)
	local backup_folder = get_backupfolder(args)
	local backup_name = remove_extention(get_filename(args[2]))
	
	local backup_path = backup_folder.."/container/"..backup_name.."/"

	local version_folder = get_version_folder(args)

	for _, file in pairs(filepaths) do
		if file:find("." ,1 ,true) ~= nil then
			vcs_filepath = get_vcs_filepath(version_folder, file)

			local version = read_vcs_file(vcs_filepath)

			write_line(vcs_filepath, {"["..version.."]"}, "a")
			local filename = get_filename(file)

			local seq_A = get_contents(backup_path..filename)
			local seq_B = get_contents(file)
			local changes = diff(seq_A, seq_B)

			print(string.format("file in: %s", backup_name),filename)
			
			local v_type = "="
			for _, v in pairs(changes) do	
				if v["type"] == "keep" then v_type = "=" end
				if v["type"] == "delete" then v_type = "-" end
				if v["type"] == "insert" then v_type = "+" end
				if v_type ~= "=" then
					write_line(vcs_filepath, {v_type.." ".. v["val"]}, "a")
					print(string.format("%s %s",v_type, v["val"]))
				end
				

			end


		end
	end
end



