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

	if not file_exists(filepath) then 
	return end
	
	local filename = get_filename(filepath)
	filename = remove_extention(filename)

	local backup_path = get_backupfolder(args) .. "/container/"..filename
	for line in io.lines(filepath) do
		local destination, dir_name = get_destination(line)

		-- creating copy command for file/dir
		local copy_cmd = get_copy_cmd(backup_path.."/"..dir_name, destination)

		os.execute(copy_cmd)

		print("Retrieved: "..destination)
	end
end


