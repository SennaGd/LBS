-- gets destination from backupfile(path)
local function get_destination(line) 
	local dir_name = get_filename(line)

	if is_dir(line) then
		line = line:gsub(dir_name, "")
	end

	return line, dir_name
end

-- takes any path and copies it's contents to given destination
local function get_copy_cmd(origin, destination) 
	local copy_cmd = "sudo cp -rf "..origin.." "..destination
	if not is_dir(origin) then
		copy_cmd = string.gsub(copy_cmd, " --rf", "")
	end

	return copy_cmd
end

function c_fetch_backup(args)
	if not has_args(args) then return end

	local filepath = args[2]
	local old_ver = false
	local backup_folder 
	local version_folder
	-- parsing if "-o" argument is given
	if args[2]:sub(-7, -6):lower() == "-o" then
		old_ver = true
		backup_folder = args[1]
		version_folder = backup_folder.."vcs/"..args[3].."/"


		if args[4] == nil then
			print("No version given")
			return 
		end
		filepath = args[2]:sub(1,-8)..args[3]..".back"
	end


	if not file_exists(filepath) then 
	return end
	
	local filename = get_filename(filepath)
	filename = remove_extention(filename)


	if not check_if_filebackup(filepath) and old_ver then
		print("Cannot fetch versions for backups containing folders")
	return end
	
	
	print("verisonfolder",version_folder)
	if old_ver then
		for file in io.lines(filepath) do
			local vcs_filepath = get_vcs_filepath(version_folder, file)
			create_vcs_file(vcs_filepath)
			local version = get_versions(vcs_filepath)

			--> new parsed contents | old version
			local n_contents = fetch_version(vcs_filepath, tonumber( version ))
			if tonumber(version) < tonumber(args[4]) then
				n_contents = fetch_version(vcs_filepath, tonumber(args[4]))
			end

			print(file)
			write_line(file, n_contents, "w")
			print(string.format( "fetched version: %s from file: %s", args[4], file ))
		end
	return end --> exit function if old_ver == true
	
	local backup_path = get_backupfolder(args) .. "/container/"..filename
	for line in io.lines(filepath) do
		local destination, dir_name = get_destination(line)

		-- creating copy command for file/dir
		local copy_cmd = get_copy_cmd(backup_path.."/"..dir_name, destination)

		os.execute(copy_cmd)
		print("Retrieved: "..destination)
	end
end

function create_vcs_file(vcs_filepath)
	os.execute("touch "..vcs_filepath)
end
