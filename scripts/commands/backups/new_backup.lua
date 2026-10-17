function c_create_backup(args)
	if not has_args(args) then return end

	local filepath = args[2]

	if not file_exists(filepath) then 
	return end

	local filename = get_filename(filepath)
	filename = remove_extention(filename)

	local backup_path = get_backupfolder(args) .. "/container/"..filename

	for line in io.lines(filepath) do
		local mkdir_cmd = "mkdir -p " .. backup_path

		-- Copying contents to directory
		local copy_cmd = "yes | cp -rf ".. line .. " " .. backup_path .. "/"
		os.execute(mkdir_cmd)
		os.execute(copy_cmd)

		print("Created backup at '"..backup_path.."'")
		
	end
end

